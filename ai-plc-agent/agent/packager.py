"""
packager.py
Copies the template project, injects POU files (Variables.var, Code.nold,
Metadata.meta, VersionHistory.usermeta), patches Core.xml and PROJECT.proj,
then zips everything into a .pcwex archive.
"""

import os
import shutil
import uuid
import zipfile
import re


# Paths relative to this file (agent/)
_AGENT_DIR    = os.path.dirname(os.path.abspath(__file__))
_TEMPLATE_DIR = os.path.join(_AGENT_DIR, "template")
_GENERATED_DIR = os.path.join(_AGENT_DIR, "generated")


def _u() -> str:
    """Return a fresh UUID string."""
    return str(uuid.uuid4())


def _write(path: str, content: str) -> None:
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        f.write(content)


def _read(path: str) -> str:
    with open(path, "r", encoding="utf-8") as f:
        return f.read()


def _metadata_xml(project_name: str) -> str:
    return (
        '<?xml version="1.0" encoding="utf-8"?>\n'
        '<Metadata>\n'
        '  <FolderType>PouFolder</FolderType>\n'
        '  <ContentType>Program</ContentType>\n'
        '  <Kind>Program</Kind>\n'
        '  <Usings></Usings>\n'
        f'  <Id>{_u()}</Id>\n'
        '  <ItemGroup>\n'
        '    <VariableWorksheet>\n'
        f'      <Id>{_u()}</Id>\n'
        '    </VariableWorksheet>\n'
        f'    <CodeWorksheet Include="Code.nold">\n'
        f'      <Id>{_u()}</Id>\n'
        '      <Extension>.nold</Extension>\n'
        '      <Type>.nold</Type>\n'
        '      <ParentIndex>0</ParentIndex>\n'
        '    </CodeWorksheet>\n'
        '  </ItemGroup>\n'
        '</Metadata>'
    )


def _version_history_xml() -> str:
    return '<?xml version="1.0" encoding="utf-8"?>\n<VersionHistory/>'


def _patch_core_xml(core_path: str, project_name: str) -> None:
    if not os.path.exists(core_path):
        print(f"  [warn] Core.xml not found at {core_path}, skipping")
        return

    content = _read(core_path)
    content = re.sub(r'<dc:title>[^<]*</dc:title>',
                     f'<dc:title>{project_name}</dc:title>', content)
    content = re.sub(r'<dc:identifier>[^<]*</dc:identifier>',
                     f'<dc:identifier>{_u()}</dc:identifier>', content)
    _write(core_path, content)
    print("  Core.xml patched")


def _strip_safety(dest_root: str) -> None:
    """Remove Safety area references so restricted PLCnext Engineer can open the project."""
    # 1. SubFileSystems.xml — remove the Safety entry
    sub_path = os.path.join(dest_root, "_properties", "SubFileSystems.xml")
    if os.path.exists(sub_path):
        content = _read(sub_path)
        content = re.sub(r'\s*<SubFileSystem[^/]*/>', '', content)
        content = re.sub(r'\s*<SubFileSystem[^>]*>.*?</SubFileSystem>', '', content, flags=re.DOTALL)
        _write(sub_path, content)

    # 2. Extended.xml — remove Requirements block (Areas = Safety requirement)
    ext_path = os.path.join(dest_root, "_properties", "Extended.xml")
    if os.path.exists(ext_path):
        content = _read(ext_path)
        content = re.sub(r'\s*<Requirements>.*?</Requirements>', '', content, flags=re.DOTALL)
        _write(ext_path, content)

    # 3. Safety folder — remove entirely
    safety_dir = os.path.join(dest_root, "Safety")
    if os.path.exists(safety_dir):
        shutil.rmtree(safety_dir)

    print("  Safety area stripped")


def _patch_proj_file(proj_path: str, project_name: str) -> None:
    if not os.path.exists(proj_path):
        print(f"  [warn] PROJECT.proj not found at {proj_path}, skipping")
        return

    content = _read(proj_path)

    pou = f'Logical Elements\\{project_name}.pou'

    # ── 2. Folder entry (correct element type: <Folder> with FolderType) ─────
    folder_entry = (
        f'       <Folder Include="{pou}">\n'
        f'          <Id>{_u()}</Id>\n'
        f'          <FolderType>PouFolder</FolderType>\n'
        f'          <ParentIndex>1</ParentIndex>\n'
        f'       </Folder>\n'
    )
    # Insert after the first existing PouFolder <Folder> entry
    m = re.search(r'(<Folder[^>]*>\s*<Id>[^<]*</Id>\s*<FolderType>PouFolder</FolderType>.*?</Folder>)',
                  content, re.DOTALL)
    if m:
        content = content[:m.end()] + '\n' + folder_entry + content[m.end():]

    # ── 3. CodeWorksheet entry ────────────────────────────────────────────────
    code_entry = (
        f'       <CodeWorksheet Include="{pou}\\Code.nold">\n'
        f'          <Id>{_u()}</Id>\n'
        f'          <Type>.nold</Type>\n'
        f'          <Extension>.nold</Extension>\n'
        f'          <ParentIndex>1</ParentIndex>\n'
        f'       </CodeWorksheet>\n'
    )
    # Insert after the first CodeWorksheet entry
    m = re.search(r'(<CodeWorksheet\s[^>]*>.*?</CodeWorksheet>)', content, re.DOTALL)
    if m:
        content = content[:m.end()] + '\n' + code_entry + content[m.end():]

    # ── 4. MetadataDocument entry ─────────────────────────────────────────────
    meta_entry = (
        f'       <MetadataDocument Include="{pou}\\Metadata.meta">\n'
        f'          <Id>{_u()}</Id>\n'
        f'          <ParentIndex>2</ParentIndex>\n'
        f'       </MetadataDocument>\n'
    )
    m = re.search(r'(<MetadataDocument\s[^>]*>.*?</MetadataDocument>)', content, re.DOTALL)
    if m:
        content = content[:m.end()] + '\n' + meta_entry + content[m.end():]

    # ── 5. VariableWorksheet entry ────────────────────────────────────────────
    var_entry = (
        f'       <VariableWorksheet Include="{pou}\\Variables.var">\n'
        f'          <Id>{_u()}</Id>\n'
        f'          <Type>.var</Type>\n'
        f'          <Extension>.var</Extension>\n'
        f'          <ParentIndex>0</ParentIndex>\n'
        f'       </VariableWorksheet>\n'
    )
    m = re.search(r'(<VariableWorksheet\s[^>]*>.*?</VariableWorksheet>)', content, re.DOTALL)
    if m:
        content = content[:m.end()] + '\n' + var_entry + content[m.end():]

    _write(proj_path, content)
    print("  PROJECT.proj patched")


def build(ast: dict, var_content: str, ld_content: str) -> str:
    project_name = ast["projectName"]

    # ── 1. Copy template → generated/<project_name>/ ─────────────────────────
    dest_root = os.path.join(_GENERATED_DIR, project_name)

    if os.path.exists(dest_root):
        shutil.rmtree(dest_root)

    if os.path.exists(_TEMPLATE_DIR) and os.listdir(_TEMPLATE_DIR):
        # Filter out .gitkeep when copying
        def ignore_gitkeep(src, names):
            return [n for n in names if n == ".gitkeep"]

        shutil.copytree(_TEMPLATE_DIR, dest_root, ignore=ignore_gitkeep)
        print(f"  Template copied to {dest_root}")
    else:
        os.makedirs(dest_root, exist_ok=True)
        print(f"  No template found — created empty project root at {dest_root}")

    # ── 2. Create POU folder ──────────────────────────────────────────────────
    pou_dir = os.path.join(
        dest_root, "PROJECT", "Logical Elements", f"{project_name}.pou"
    )
    os.makedirs(pou_dir, exist_ok=True)
    print(f"  POU folder created: {pou_dir}")

    # ── 3. Write Variables.var ────────────────────────────────────────────────
    _write(os.path.join(pou_dir, "Variables.var"), var_content)
    print("  Variables.var written")

    # ── 4. Write Code.nold ───────────────────────────────────────────────────
    _write(os.path.join(pou_dir, "Code.nold"), ld_content)
    print("  Code.nold written")

    # ── 5. Write Metadata.meta ────────────────────────────────────────────────
    _write(os.path.join(pou_dir, "Metadata.meta"), _metadata_xml(project_name))
    print("  Metadata.meta written")

    # ── 6. Write VersionHistory.usermeta ─────────────────────────────────────
    _write(os.path.join(pou_dir, "VersionHistory.usermeta"), _version_history_xml())
    print("  VersionHistory.usermeta written")

    # ── 7. Patch Core.xml ────────────────────────────────────────────────────
    core_xml_path = os.path.join(dest_root, "_properties", "Core.xml")
    _patch_core_xml(core_xml_path, project_name)

    # ── 9. Patch PROJECT.proj ─────────────────────────────────────────────────
    proj_path = os.path.join(dest_root, "PROJECT", "PROJECT.proj")
    _patch_proj_file(proj_path, project_name)

    # ── 10. ZIP as .pcwex (URL-encode spaces to match PLCnext Engineer format) ──
    os.makedirs(_GENERATED_DIR, exist_ok=True)
    pcwex_path = os.path.join(_GENERATED_DIR, f"{project_name}.pcwex")

    with zipfile.ZipFile(pcwex_path, "w", zipfile.ZIP_DEFLATED) as zf:
        for dirpath, dirnames, filenames in os.walk(dest_root):
            # Exclude hidden / system folders
            dirnames[:] = [d for d in dirnames if not d.startswith(".")]
            for filename in filenames:
                abs_file = os.path.join(dirpath, filename)
                rel_file = os.path.relpath(abs_file, dest_root)
                # Normalise to forward slashes, URL-encode spaces to match PLCnext format
                arc_name = rel_file.replace(os.sep, "/").replace(" ", "%20")
                zf.write(abs_file, arc_name)

    print(f"  .pcwex archive created: {pcwex_path}")
    return os.path.abspath(pcwex_path)

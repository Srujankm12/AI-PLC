"""
var_generator.py
Generates Variables.var content (PLCnext ST variable declaration format)
from the JSON AST produced by the Claude AI service.

Format verified against real PLCnext Engineer project (LadderSample.pou):
- CustomGroupDefinitions on ONE line with no separators
- ALL tags in ONE VAR block (not separate blocks per direction)
- INTERNAL tags use VAR (no AT address) at end of file
"""

import uuid


def generate(ast: dict) -> str:
    tags = ast.get("tags", [])

    input_group_uuid  = str(uuid.uuid4())
    output_group_uuid = str(uuid.uuid4())

    inputs    = [t for t in tags if t.get("io", "").upper() == "INPUT"]
    outputs   = [t for t in tags if t.get("io", "").upper() == "OUTPUT"]
    internals = [t for t in tags if t.get("io", "").upper() == "INTERNAL"]

    # ── Header: all three CustomGroupDefinitions on one line (exact PLCnext format)
    header = (
        f"{{CustomGroupDefinition('{input_group_uuid}', 'Inputs')}}"
        f"{{CustomGroupDefinition('{output_group_uuid}', 'Outputs')}}"
        f"{{CustomGroupDefinition('00000000-0000-0000-0000-000000000000', '')}}"
    )

    var_lines = []

    # Inputs and outputs in one VAR block (matches real template)
    io_tags = inputs + outputs
    if io_tags:
        var_lines.append("VAR")
        for tag in io_tags:
            tag_uuid = str(uuid.uuid4())
            name     = tag["name"]
            dtype    = tag.get("type", "BOOL")
            io       = tag.get("io", "INPUT").upper()
            addr     = "%I*" if io == "INPUT" else "%Q*"
            group    = input_group_uuid if io == "INPUT" else output_group_uuid
            var_lines.append(
                f"    {name} AT {addr} : {dtype} "
                f"{{CustomGroupReference('{group}')}} "
                f"{{Id('{tag_uuid}')}};"
            )
        var_lines.append("END_VAR")

    # Internal / memory variables in a separate VAR block (no AT address)
    if internals:
        var_lines.append("")
        var_lines.append("VAR")
        for tag in internals:
            tag_uuid = str(uuid.uuid4())
            name     = tag["name"]
            dtype    = tag.get("type", "BOOL")
            var_lines.append(
                f"    {name} : {dtype} "
                f"{{Id('{tag_uuid}')}};"
            )
        var_lines.append("END_VAR")

    return header + "\n\n" + "\n".join(var_lines) + "\n"

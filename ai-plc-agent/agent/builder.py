"""
builder.py
Main entry point for the AI PLC Agent.

Usage:
  python builder.py '<json_ast_string>'

The JSON AST is produced by the NestJS backend (plc.service.ts) via Claude AI.
Outputs:
  SUCCESS:<absolute_path_to_pcwex>
  ERROR:<message>
"""

import sys
import json
import os
import subprocess

# Import sibling modules (same directory)
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from var_generator import generate as gen_vars
from ld_generator  import generate as gen_ld
from packager      import build    as build_pcwex


def main():
    try:
        if len(sys.argv) < 2:
            print("ERROR:No AST JSON argument provided")
            sys.exit(1)

        ast_json = sys.argv[1]
        ast      = json.loads(ast_json)

        project_name = ast.get("projectName", "UnknownProject")
        print(f"Building project: {project_name}")

        # ── Step 1: Generate Variables.var ────────────────────────────────────
        var_content = gen_vars(ast)
        print("Variables.var generated")

        # ── Step 2: Generate Code.nold ────────────────────────────────────────
        ld_content = gen_ld(ast)
        print("Code.nold generated")

        # ── Step 3: Package as .pcwex ─────────────────────────────────────────
        pcwex_path = build_pcwex(ast, var_content, ld_content)
        print(f"Package created: {pcwex_path}")

        # ── Step 4: Launch PLCnext Engineer (optional) ────────────────────────
        plcnext_exe = os.getenv(
            "PLCNEXT_EXE",
            r"C:\Program Files\PHOENIX CONTACT\PLCnext Engineer 2026.0\bin\PLCnEng.exe",
        )

        if os.path.exists(plcnext_exe):
            subprocess.Popen([plcnext_exe, pcwex_path])
            print(f"PLCnext Engineer launched with: {pcwex_path}")
        else:
            print(f"PLCnext Engineer not found at: {plcnext_exe}")
            print("(Set PLCNEXT_EXE env var to your installation path)")

        print(f"SUCCESS:{pcwex_path}")

    except json.JSONDecodeError as e:
        print(f"ERROR:Invalid JSON AST — {e}")
        sys.exit(1)
    except Exception as e:
        print(f"ERROR:{e}")
        sys.exit(1)


if __name__ == "__main__":
    main()

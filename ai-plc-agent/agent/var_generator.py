"""
var_generator.py
Generates Variables.var content (PLCnext ST variable declaration format)
from the JSON AST produced by the Claude AI service.
"""

import uuid


def generate(ast: dict) -> str:
    tags = ast.get("tags", [])

    input_group_uuid  = str(uuid.uuid4())
    output_group_uuid = str(uuid.uuid4())

    inputs    = [t for t in tags if t.get("io", "").upper() == "INPUT"]
    outputs   = [t for t in tags if t.get("io", "").upper() == "OUTPUT"]
    internals = [t for t in tags if t.get("io", "").upper() == "INTERNAL"]

    lines = []

    # Custom group definitions
    lines.append(f"{{CustomGroupDefinition('{input_group_uuid}', 'Inputs')}}")
    lines.append(f"{{CustomGroupDefinition('{output_group_uuid}', 'Outputs')}}")
    lines.append(f"{{CustomGroupDefinition('00000000-0000-0000-0000-000000000000', '')}}")
    lines.append("")

    # INPUT variables
    if inputs:
        lines.append("VAR")
        for tag in inputs:
            tag_uuid = str(uuid.uuid4())
            name  = tag["name"]
            dtype = tag.get("type", "BOOL")
            lines.append(
                f"    {name} AT %I* : {dtype} "
                f"{{CustomGroupReference('{input_group_uuid}')}} "
                f"{{Id('{tag_uuid}')}};"
            )
        lines.append("END_VAR")
        lines.append("")

    # OUTPUT variables
    if outputs:
        lines.append("VAR")
        for tag in outputs:
            tag_uuid = str(uuid.uuid4())
            name  = tag["name"]
            dtype = tag.get("type", "BOOL")
            lines.append(
                f"    {name} AT %Q* : {dtype} "
                f"{{CustomGroupReference('{output_group_uuid}')}} "
                f"{{Id('{tag_uuid}')}};"
            )
        lines.append("END_VAR")
        lines.append("")

    # INTERNAL / memory variables
    if internals:
        lines.append("VAR")
        for tag in internals:
            tag_uuid = str(uuid.uuid4())
            name  = tag["name"]
            dtype = tag.get("type", "BOOL")
            lines.append(
                f"    {name} AT %M* : {dtype} "
                f"{{CustomGroupReference('00000000-0000-0000-0000-000000000000')}} "
                f"{{Id('{tag_uuid}')}};"
            )
        lines.append("END_VAR")
        lines.append("")

    return "\n".join(lines)

"""
ld_generator.py
Generates Code.nold XML (PLCnext Ladder Diagram) from the JSON AST.

Uses a stage-based model:
  Stage  = one column of contacts.
  Single contact  → series step.
  Multiple contacts → OR (parallel) group drawn at the same X, different Y.

Example: '(StartButton OR Motor) AND NOT(StopButton) AND NOT(EmergencyStop)'
  stages = [
    [Contact(StartButton), Contact(Motor)],   ← parallel (OR) at x=16
    [Contact(StopButton, negated=True)],      ← series at x=36
    [Contact(EmergencyStop, negated=True)],   ← series at x=56
  ]
"""

import re
from xml.sax.saxutils import escape


# ── Data model ────────────────────────────────────────────────────────────────

class Contact:
    def __init__(self, name: str, negated: bool = False):
        self.name    = name
        self.negated = negated


# ── Expression parser ─────────────────────────────────────────────────────────

def _split_top_level(expr: str, operator: str) -> list:
    """Split expr on `operator` keyword only at top nesting level."""
    parts   = []
    depth   = 0
    current = ""
    op      = f" {operator} "
    i       = 0
    while i < len(expr):
        ch = expr[i]
        if ch == '(':
            depth += 1
            current += ch
            i += 1
        elif ch == ')':
            depth -= 1
            current += ch
            i += 1
        elif depth == 0 and expr[i:].upper().startswith(op.upper()):
            if current.strip():
                parts.append(current.strip())
            current = ""
            i += len(op)
        else:
            current += ch
            i += 1
    if current.strip():
        parts.append(current.strip())
    return parts if parts else [expr]


def _strip_outer_parens(s: str) -> str:
    """Remove wrapping parentheses only when they span the whole string."""
    s = s.strip()
    if not (s.startswith('(') and s.endswith(')')):
        return s
    depth = 0
    for i, ch in enumerate(s):
        if ch == '(':
            depth += 1
        elif ch == ')':
            depth -= 1
            if depth == 0 and i < len(s) - 1:
                return s   # outer ( closed before end → not fully wrapping
    return s[1:-1].strip()


def _parse_token(token: str) -> Contact:
    """Parse one leaf token into a Contact, handling NOT(…)."""
    token = token.strip()
    m = re.match(r'^NOT\((.+)\)$', token, re.IGNORECASE)
    if m:
        return Contact(m.group(1).strip(), negated=True)
    return Contact(token)


def parse_expression_to_stages(expr: str) -> list:
    """
    Returns list[list[Contact]].

    Algorithm:
      1. Top-level AND split → each part becomes a stage.
      2. If a part is fully wrapped in parens and contains top-level OR
         → parallel stage (multiple contacts, same X).
      3. Otherwise → series stage (single contact).
    """
    expr = expr.strip()
    and_parts = _split_top_level(expr, 'AND')

    stages = []
    for part in and_parts:
        part     = part.strip()
        stripped = _strip_outer_parens(part)
        if stripped != part:
            # Was parenthesised — check for top-level OR inside
            or_parts = _split_top_level(stripped, 'OR')
            if len(or_parts) > 1:
                stages.append([_parse_token(t) for t in or_parts])
                continue
        # Check for top-level OR without outer parens (e.g. pure-OR expression)
        or_parts = _split_top_level(part, 'OR')
        if len(or_parts) > 1:
            stages.append([_parse_token(t) for t in or_parts])
            continue
        # Single token (possibly NOT(…))
        stages.append([_parse_token(part)])

    return stages if stages else [[Contact("Output")]]


# ── XML helpers ───────────────────────────────────────────────────────────────

def _connection_info() -> str:
    return (
        '<addData><data name="connectionInformation" handleUnknown="preserve">'
        '<connectionInformation useAutoConnector="false" useUserConnector="false" '
        'invisible="false" wasExplicitFeedback="false"/></data></addData>'
    )


def _object_info(network_id: int) -> str:
    return (
        f'<addData><data name="objectInformation" handleUnknown="preserve">'
        f'<objectInformation networkId="{network_id}"/></data></addData>'
    )


# ── Main generator ────────────────────────────────────────────────────────────

def generate(ast: dict) -> str:
    rungs_ast    = ast.get("rungs", [])
    id_counter   = [0]
    exec_counter = [0]

    def next_id() -> int:
        id_counter[0] += 1
        return id_counter[0]

    def next_exec() -> int:
        exec_counter[0] += 1
        return exec_counter[0]

    networks_xml = []
    current_y    = 4    # running vertical position shared across rungs

    for rung_index, rung_ast in enumerate(rungs_ast):
        network_id  = rung_index + 1
        rung_y      = current_y
        elements_y  = rung_y + 4   # contacts/coil row

        comment     = escape(rung_ast.get("comment", f"Network {network_id}"))
        output_name = escape(rung_ast.get("output", "Output"))
        coil_type   = rung_ast.get("type", "coil").lower()
        expr        = rung_ast.get("expression", output_name)

        stages           = parse_expression_to_stages(expr)
        num_first_branches = len(stages[0])

        # Reserve vertical space: max branches × 12, minimum 24, plus 8 padding
        rung_height  = max(24, num_first_branches * 12 + 8)
        current_y   += rung_height

        # ── Pre-assign IDs ────────────────────────────────────────────────────
        label_id   = next_id()
        label_exec = next_exec()
        lpr_id     = next_id()
        lpr_exec   = next_exec()

        # stage_ids[i][j] = localId for stage i, branch j
        stage_ids   = [[next_id() for _ in stage] for stage in stages]
        stage_execs = [[next_exec() for _ in stage] for stage in stages]

        coil_id   = next_id()
        coil_exec = next_exec()
        rpr_id    = next_id()
        rpr_exec  = next_exec()

        # ── Geometry ──────────────────────────────────────────────────────────
        # Each stage column is 20 units wide; contacts are 18 wide, gap=2
        stage_x = [16 + i * 20 for i in range(len(stages))]
        coil_x  = 16 + len(stages) * 20
        rpr_x   = coil_x + 20

        def contact_y(stage_i: int, branch_j: int) -> int:
            # Stage-0 branches fan out vertically; later stages align to top branch
            if stage_i == 0:
                return elements_y + branch_j * 12
            return elements_y   # series contacts always at top-branch row

        lpr_height = 4 + max(0, num_first_branches - 1) * 12

        # ── Label ─────────────────────────────────────────────────────────────
        inner_net = label_id + 1
        label_xml = (
            f'<label localId="{label_id}" height="4" width="160" '
            f'label="Network{network_id}" executionOrderId="{label_exec}">'
            f'<position x="5" y="{rung_y}"/>'
            f'<addData>'
            f'<data name="objectInformation" handleUnknown="preserve">'
            f'<objectInformation networkId="{inner_net}"/></data>'
            f'<data name="labelInformation" handleUnknown="preserve">'
            f'<labelInformation parentNetworkId="{label_id}" comment="{comment}"/>'
            f'</data></addData></label>'
        )

        # ── Left power rail ───────────────────────────────────────────────────
        # One connectionPointOut per branch in stage 0
        lpr_conn_outs = ""
        for j in range(num_first_branches):
            rel_y     = 2 + j * 12   # relative y from top of LPR
            target_id = stage_ids[0][j]
            lpr_conn_outs += (
                f'<connectionPointOut formalParameter="{j + 1}">'
                f'<relPosition x="3" y="{rel_y}"/>'
                f'<addData><data name="linkInformation" handleUnknown="preserve">'
                f'<linkInformation executionOrder="{lpr_exec + 1}" localId="{target_id}"/>'
                f'</data></addData></connectionPointOut>'
            )

        lpr_xml = (
            f'<leftPowerRail localId="{lpr_id}" height="{lpr_height}" width="3" '
            f'executionOrderId="{lpr_exec}">'
            f'<position x="10" y="{elements_y - 2}"/>'
            f'{lpr_conn_outs}'
            f'{_object_info(network_id)}</leftPowerRail>'
        )

        # ── Contacts ──────────────────────────────────────────────────────────
        contact_xmls = []

        for si, (stage, s_ids, s_execs) in enumerate(
            zip(stages, stage_ids, stage_execs)
        ):
            for j, (contact, c_id, c_exec) in enumerate(
                zip(stage, s_ids, s_execs)
            ):
                c_x       = stage_x[si]
                c_y       = contact_y(si, j)
                neg_attr  = ' negated="true"' if contact.negated else ""

                if si == 0:
                    # First stage: connect from LPR via formalParameter
                    conn_in = (
                        f'<connectionPointIn><relPosition x="0" y="2"/>'
                        f'<connection refLocalId="{lpr_id}" formalParameter="{j + 1}">'
                        f'<position x="{c_x}" y="{c_y + 2}"/>'
                        f'<position x="13" y="{c_y + 2}"/>'
                        f'{_connection_info()}</connection></connectionPointIn>'
                    )
                else:
                    # Later stages: merge from ALL contacts of the previous stage
                    connections = ""
                    for pi, prev_id in enumerate(stage_ids[si - 1]):
                        prev_x = stage_x[si - 1] + 18
                        prev_y = contact_y(si - 1, pi)
                        connections += (
                            f'<connection refLocalId="{prev_id}">'
                            f'<position x="{c_x}" y="{c_y + 2}"/>'
                            f'<position x="{prev_x}" y="{prev_y + 2}"/>'
                            f'{_connection_info()}</connection>'
                        )
                    conn_in = (
                        f'<connectionPointIn><relPosition x="0" y="2"/>'
                        f'{connections}</connectionPointIn>'
                    )

                contact_xmls.append(
                    f'<contact localId="{c_id}" height="4" width="18"{neg_attr} '
                    f'executionOrderId="{c_exec}">'
                    f'<position x="{c_x}" y="{c_y}"/>'
                    f'{conn_in}'
                    f'<connectionPointOut><relPosition x="18" y="2"/></connectionPointOut>'
                    f'<variable>{escape(contact.name)}</variable>'
                    f'{_object_info(network_id)}</contact>'
                )

        # ── Coil ──────────────────────────────────────────────────────────────
        coil_y       = elements_y
        storage_attr = ""
        if coil_type == "set":
            storage_attr = ' storage="set"'
        elif coil_type == "reset":
            storage_attr = ' storage="reset"'

        # Connect from ALL contacts of the last stage
        coil_connections = ""
        last_si = len(stages) - 1
        for pi, prev_id in enumerate(stage_ids[last_si]):
            prev_x = stage_x[last_si] + 18
            prev_y = contact_y(last_si, pi)
            coil_connections += (
                f'<connection refLocalId="{prev_id}">'
                f'<position x="{coil_x}" y="{coil_y + 2}"/>'
                f'<position x="{prev_x}" y="{prev_y + 2}"/>'
                f'{_connection_info()}</connection>'
            )

        coil_xml = (
            f'<coil localId="{coil_id}" height="4" width="18"{storage_attr} '
            f'executionOrderId="{coil_exec}">'
            f'<position x="{coil_x}" y="{coil_y}"/>'
            f'<connectionPointIn><relPosition x="0" y="2"/>'
            f'{coil_connections}</connectionPointIn>'
            f'<connectionPointOut><relPosition x="18" y="2"/></connectionPointOut>'
            f'<variable>{escape(output_name)}</variable>'
            f'{_object_info(network_id)}</coil>'
        )

        # ── Right power rail ──────────────────────────────────────────────────
        rpr_xml = (
            f'<rightPowerRail localId="{rpr_id}" height="12" width="3" '
            f'executionOrderId="{rpr_exec}">'
            f'<position x="{rpr_x}" y="{elements_y - 2}"/>'
            f'<connectionPointIn><relPosition x="0" y="2"/>'
            f'<connection refLocalId="{coil_id}">'
            f'<position x="{rpr_x}" y="{coil_y + 2}"/>'
            f'<position x="{rpr_x - 2}" y="{coil_y + 2}"/>'
            f'{_connection_info()}</connection></connectionPointIn>'
            f'{_object_info(network_id)}</rightPowerRail>'
        )

        rung_block = "\n".join(
            [label_xml, lpr_xml] + contact_xmls + [coil_xml, rpr_xml]
        )
        networks_xml.append(rung_block)

    body_content = "\n\n".join(networks_xml)

    return (
        '<?xml version="1.0" encoding="utf-8"?>\n'
        '<body xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" '
        'xmlns:xsd="http://www.w3.org/2001/XMLSchema">\n'
        '<LD>\n\n'
        f'{body_content}\n\n'
        '</LD>\n'
        '<addData>\n'
        '  <data name="docInformation" handleUnknown="preserve">\n'
        '    <docInformation gridActive="true" pageWidth="165">\n'
        '      <version>2.999.999.999.999</version>\n'
        '      <multilineOptions maximumContactWidth="18" minimumContactWidth="18" '
        'maximumContactLines="3" contactEllipse="true"/>\n'
        '    </docInformation>\n'
        '  </data>\n'
        '</addData>\n'
        '</body>'
    )

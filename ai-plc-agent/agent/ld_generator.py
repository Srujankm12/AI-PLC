"""
ld_generator.py
Generates Code.nold XML (PLCnext Ladder Diagram) from the JSON AST.
Handles AND (series), OR (parallel), NOT (negated contacts), and
multiple rungs with auto-incrementing localIds and execution order.
"""

import re
from xml.sax.saxutils import escape


# ── Expression parser ────────────────────────────────────────────────────────

class Contact:
    """Represents a single ladder contact."""
    def __init__(self, name: str, negated: bool = False):
        self.name    = name
        self.negated = negated


class Rung:
    """Parsed representation of one rung's logic."""
    def __init__(self, contacts: list, parallel_groups: list, output: str, coil_type: str, comment: str):
        # contacts: list of Contact for series (AND) path
        # parallel_groups: list of list-of-Contact for OR branches
        self.contacts        = contacts
        self.parallel_groups = parallel_groups
        self.output          = output
        self.coil_type       = coil_type
        self.comment         = comment


def _parse_token(token: str) -> Contact:
    """Parse a single token into a Contact, handling NOT()."""
    token = token.strip()
    m = re.match(r'^NOT\((.+)\)$', token, re.IGNORECASE)
    if m:
        return Contact(m.group(1).strip(), negated=True)
    return Contact(token)


def _parse_expression(expr: str) -> tuple:
    """
    Returns (series_contacts, parallel_groups).

    Strategy:
      1. Top-level OR  → parallel branches, each branch parsed for AND
      2. Top-level AND → series contacts
      3. Mixed: evaluate left-to-right respecting parentheses

    Returns:
      series   – list[Contact]  (for a pure AND path)
      parallel – list[list[Contact]]  (for OR branches; empty if no OR)
    """
    expr = expr.strip()

    # Split on top-level OR (respecting parentheses)
    or_parts = _split_top_level(expr, 'OR')

    if len(or_parts) > 1:
        # OR logic → parallel groups
        parallel_groups = []
        for part in or_parts:
            and_parts = _split_top_level(part.strip(), 'AND')
            branch = [_parse_token(t) for t in and_parts]
            parallel_groups.append(branch)
        return [], parallel_groups
    else:
        # No top-level OR → may be AND chain or single token
        and_parts = _split_top_level(expr, 'AND')
        series = [_parse_token(t) for t in and_parts]
        return series, []


def _split_top_level(expr: str, operator: str) -> list:
    """Split expr on `operator` only at the top nesting level."""
    parts  = []
    depth  = 0
    current = ""
    op     = f" {operator} "
    i      = 0
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
            parts.append(current.strip())
            current = ""
            i += len(op)
        else:
            current += ch
            i += 1
    if current.strip():
        parts.append(current.strip())
    return parts


# ── XML helpers ──────────────────────────────────────────────────────────────

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
    rungs_ast = ast.get("rungs", [])

    id_counter   = [0]   # mutable counter shared across helpers
    exec_counter = [0]

    def next_id() -> int:
        id_counter[0] += 1
        return id_counter[0]

    def next_exec() -> int:
        exec_counter[0] += 1
        return exec_counter[0]

    networks_xml = []
    base_y       = 4   # y for label row; actual elements at base_y + 4

    for rung_index, rung_ast in enumerate(rungs_ast):
        network_id  = rung_index + 1
        rung_y      = base_y + rung_index * 24   # separate rungs vertically
        elements_y  = rung_y + 4

        comment     = escape(rung_ast.get("comment", f"Network {network_id}"))
        output_name = escape(rung_ast.get("output", "Output"))
        coil_type   = rung_ast.get("type", "coil").lower()
        expr        = rung_ast.get("expression", output_name)

        series, parallel = _parse_expression(expr)

        # ── Label ────────────────────────────────────────────────────────────
        label_id   = next_id()
        label_exec = next_exec()
        inner_net  = label_id + 1   # network localId = label + 1 by convention

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
        lpr_id   = next_id()
        lpr_exec = next_exec()
        lpr_x    = 10

        # Determine what the LPR connects to (first contact or coil if no contacts)
        # We'll wire it after building the chain; placeholder, patched below.

        # ── Build contact chain ───────────────────────────────────────────────
        contact_xmls  = []
        contact_ids   = []
        contact_x_map = {}   # contact_id → x

        if parallel:
            # OR logic: parallel branches stacked vertically
            # Each branch is a list of series contacts
            # All branches start at x=16, offset y by branch index
            branch_start_x = 16
            max_width      = max(len(b) for b in parallel)
            coil_x         = branch_start_x + max_width * 20

            first_ids_per_branch = []
            last_ids_per_branch  = []

            for bi, branch in enumerate(parallel):
                branch_y      = elements_y + bi * 6
                prev_id_local = None
                branch_ids    = []

                for ci, contact in enumerate(branch):
                    c_id   = next_id()
                    c_exec = next_exec()
                    c_x    = branch_start_x + ci * 20
                    c_negated = ' negated="true"' if contact.negated else ""

                    if prev_id_local is None:
                        # Will connect to LPR — placeholder ref
                        conn_in = (
                            f'<connectionPointIn><relPosition x="0" y="2"/>'
                            f'<connection refLocalId="__LPR__" formalParameter="{ci + 1}">'
                            f'<position x="{c_x}" y="{branch_y + 2}"/>'
                            f'<position x="{lpr_x + 3}" y="{branch_y + 2}"/>'
                            f'{_connection_info()}</connection></connectionPointIn>'
                        )
                    else:
                        conn_in = (
                            f'<connectionPointIn><relPosition x="0" y="2"/>'
                            f'<connection refLocalId="{prev_id_local}">'
                            f'<position x="{c_x}" y="{branch_y + 2}"/>'
                            f'<position x="{c_x - 2}" y="{branch_y + 2}"/>'
                            f'{_connection_info()}</connection></connectionPointIn>'
                        )

                    c_xml = (
                        f'<contact localId="{c_id}" height="4" width="18"{c_negated} '
                        f'executionOrderId="{c_exec}">'
                        f'<position x="{c_x}" y="{branch_y}"/>'
                        f'{conn_in}'
                        f'<connectionPointOut><relPosition x="18" y="2"/></connectionPointOut>'
                        f'<variable>{escape(contact.name)}</variable>'
                        f'{_object_info(network_id)}</contact>'
                    )
                    contact_xmls.append(c_xml)
                    branch_ids.append(c_id)
                    contact_x_map[c_id] = c_x + 18
                    prev_id_local = c_id

                first_ids_per_branch.append(branch_ids[0] if branch_ids else None)
                last_ids_per_branch.append(branch_ids[-1] if branch_ids else None)

            # LPR: wire connectionPointOut to first branch only (others via formalParameter)
            lpr_first_conn = first_ids_per_branch[0] if first_ids_per_branch else None
            coil_ref_ids   = [i for i in last_ids_per_branch if i is not None]

        else:
            # AND logic: series chain
            contact_x = 16
            prev_id_local = None
            last_id = None

            for ci, contact in enumerate(series):
                c_id   = next_id()
                c_exec = next_exec()
                c_x    = contact_x + ci * 20
                c_negated = ' negated="true"' if contact.negated else ""

                if prev_id_local is None:
                    conn_in = (
                        f'<connectionPointIn><relPosition x="0" y="2"/>'
                        f'<connection refLocalId="__LPR__" formalParameter="1">'
                        f'<position x="{c_x}" y="{elements_y + 2}"/>'
                        f'<position x="{lpr_x + 3}" y="{elements_y + 2}"/>'
                        f'{_connection_info()}</connection></connectionPointIn>'
                    )
                else:
                    conn_in = (
                        f'<connectionPointIn><relPosition x="0" y="2"/>'
                        f'<connection refLocalId="{prev_id_local}">'
                        f'<position x="{c_x}" y="{elements_y + 2}"/>'
                        f'<position x="{c_x - 2}" y="{elements_y + 2}"/>'
                        f'{_connection_info()}</connection></connectionPointIn>'
                    )

                c_xml = (
                    f'<contact localId="{c_id}" height="4" width="18"{c_negated} '
                    f'executionOrderId="{c_exec}">'
                    f'<position x="{c_x}" y="{elements_y}"/>'
                    f'{conn_in}'
                    f'<connectionPointOut><relPosition x="18" y="2"/></connectionPointOut>'
                    f'<variable>{escape(contact.name)}</variable>'
                    f'{_object_info(network_id)}</contact>'
                )
                contact_xmls.append(c_xml)
                contact_ids.append(c_id)
                contact_x_map[c_id] = c_x + 18
                prev_id_local = c_id
                last_id = c_id

            coil_x         = 16 + len(series) * 20 if series else 36
            lpr_first_conn = contact_ids[0] if contact_ids else None
            coil_ref_ids   = [last_id] if last_id else []

        # ── Left power rail (now we know first contact id) ────────────────────
        lpr_conn_id  = lpr_first_conn if lpr_first_conn else "__COIL__"
        lpr_xml = (
            f'<leftPowerRail localId="{lpr_id}" height="12" width="3" '
            f'executionOrderId="{lpr_exec}">'
            f'<position x="{lpr_x}" y="{elements_y - 2}"/>'
            f'<connectionPointOut formalParameter="1">'
            f'<relPosition x="3" y="2"/>'
            f'<addData><data name="linkInformation" handleUnknown="preserve">'
            f'<linkInformation executionOrder="{lpr_exec + 1}" localId="{lpr_conn_id}"/>'
            f'</data></addData></connectionPointOut>'
            f'{_object_info(network_id)}</leftPowerRail>'
        )

        # ── Coil ──────────────────────────────────────────────────────────────
        coil_id   = next_id()
        coil_exec = next_exec()
        coil_y    = elements_y

        storage_attr = ""
        if coil_type == "set":
            storage_attr = ' storage="set"'
        elif coil_type == "reset":
            storage_attr = ' storage="reset"'

        # Build coil connectionPointIn — connect from all last contacts (OR merge)
        coil_connections = ""
        for ref_id in coil_ref_ids:
            ref_x = contact_x_map.get(ref_id, coil_x)
            coil_connections += (
                f'<connection refLocalId="{ref_id}">'
                f'<position x="{coil_x}" y="{coil_y + 2}"/>'
                f'<position x="{ref_x}" y="{coil_y + 2}"/>'
                f'{_connection_info()}</connection>'
            )

        coil_xml = (
            f'<coil localId="{coil_id}" height="4" width="18"{storage_attr} '
            f'executionOrderId="{coil_exec}">'
            f'<position x="{coil_x}" y="{coil_y}"/>'
            f'<connectionPointIn><relPosition x="0" y="2"/>{coil_connections}</connectionPointIn>'
            f'<connectionPointOut><relPosition x="18" y="2"/></connectionPointOut>'
            f'<variable>{escape(output_name)}</variable>'
            f'{_object_info(network_id)}</coil>'
        )

        # ── Right power rail ──────────────────────────────────────────────────
        rpr_id   = next_id()
        rpr_exec = next_exec()
        rpr_x    = coil_x + 20

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

        # ── Patch __LPR__ placeholder ─────────────────────────────────────────
        rung_block = "\n".join(
            [label_xml, lpr_xml] + contact_xmls + [coil_xml, rpr_xml]
        ).replace("__LPR__", str(lpr_id)).replace("__COIL__", str(coil_id))

        networks_xml.append(rung_block)

    body_content = "\n\n".join(networks_xml)

    xml = (
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

    return xml

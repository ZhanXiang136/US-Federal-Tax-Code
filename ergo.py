import sys, os
# Prefer the local ErgoAI Python bindings over any pip-installed package.
ERGO_PY_PATH = os.path.abspath("../ERGOAI_3.0/ErgoAI/python")
if ERGO_PY_PATH not in sys.path:
    sys.path.insert(0, ERGO_PY_PATH)

try:
    from pyergo import \
        pyergo_start_session, pyergo_end_session,       \
        pyergo_command, pyergo_query,                   \
        HILOGFunctor, PROLOGFunctor,                    \
        ERGOVariable, ERGOString, ERGOIRI, ERGOSymbol,  \
        ERGOIRI, ERGOCharlist, ERGODatetime,            \
        ERGODuration, ERGOUserDatatype,                 \
        pyxsb_query, pyxsb_command,                     \
        XSBFunctor, XSBVariable, XSBAtom, XSBString,    \
        PYERGOException, PYXSBException
except Exception as e:
    raise ImportError(
        f"Failed to import ErgoAI Python bindings from "
        f"{ERGO_PY_PATH}. If you're using a virtualenv, "
        "install missing dependencies (e.g., `pip install six`) "
        "or ensure ERGOAI_3.0 is present at the expected path."
    ) from e

ERGOROOT = "/Users/z/Desktop/Coherent/ERGOAI_3.0/ErgoAI"
XSBARCHDIR = "/Users/z/Desktop/Coherent/ERGOAI_3.0/XSB/config/aarch64-apple-darwin24.5.0"
MODULE = "tax1040"

def main():
    # Initialize connection to Ergo/XSB
    pyergo_start_session(XSBARCHDIR, ERGOROOT)
    try:
        base_dir = os.path.dirname(os.path.abspath(__file__))
        # Load the ruleset and basic examples
        rule_files = [
            os.path.join(base_dir, "rules/1040/config.ergo"),
            os.path.join(base_dir, "rules/1040/agi.ergo"),
            os.path.join(base_dir, "rules/1040/2025/standard_deduction.ergo"),
            os.path.join(base_dir, "rules/1040/2025/itemized_deductions.ergo"),
            os.path.join(base_dir, "rules/1040/2025/tax_brackets.ergo"),
            os.path.join(base_dir, "rules/1040/taxable_income.ergo"),
            os.path.join(base_dir, "rules/1040/summary_and_explanations.ergo"),
            os.path.join(base_dir, "tests/examples_2025_basic.ergo"),
            os.path.join(base_dir, "tests/examples_2025_agi.ergo"),
        ]
        try:
            # Concatenate rules into a single file to avoid module reload behavior
            combined_path = os.path.join(base_dir, "tmp_combined_rules.ergo")
            with open(combined_path, "w", encoding="utf-8") as out:
                for path in rule_files:
                    out.write(f"// ---- {path} ----\n")
                    with open(path, "r", encoding="utf-8") as src:
                        out.write(src.read())
                    out.write("\n\n")

            res = pyergo_command(f"['{combined_path}'].")
            print(f"Loaded combined rules file (result: {res})")
        except Exception as e:
            print(f"Load failed: {e}")

        # Running Queries: list of queries to execute
        queries = [
            "tax_summary_det(dana, ?Year, ?Status, ?AGI, ?SD, ?TI, ?Tax).",
            "wage_income(dana, ?W).",
            "wage_income_or_zero(dana, ?W0).",
            "income_sum(dana, ?Income).",
            "adjustment_sum(dana, ?Adj).",
            "agi(dana, ?AGI).",
        ]

        for query in queries:
            answers = pyergo_query(query)
            if not answers:
                print("No solutions found for:", query)
                continue

            for i, ans in enumerate(answers, start=1):
                bindings = {name: val for (name, val) in ans[0]}
                print(f"{query} Solution {i}: {bindings}")
    finally:
        pyergo_end_session()


if __name__ == "__main__":
    main()

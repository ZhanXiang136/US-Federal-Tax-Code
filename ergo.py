import argparse
import os
import sys
import tempfile
from pathlib import Path

try:
    import readline  # noqa: F401  # pyright: ignore[reportUnusedImport]
except ImportError:
    pass


BASE_DIR = Path(__file__).resolve().parent
DEFAULT_ERGO_HOME = BASE_DIR.parent / "ERGOAI_3.0" / "ErgoAI"
DEFAULT_XSB_ARCH_DIR = (
    BASE_DIR.parent / "ERGOAI_3.0" / "XSB" / "config" / "aarch64-apple-darwin24.5.0"
)


def load_env_file(env_path: Path) -> None:
    if not env_path.exists():
        return

    for raw_line in env_path.read_text(encoding="utf-8").splitlines():
        line = raw_line.strip()
        if not line or line.startswith("#") or "=" not in line:
            continue

        key, value = line.split("=", 1)
        key = key.strip()
        value = value.strip().strip('"').strip("'")
        os.environ.setdefault(key, value)


load_env_file(BASE_DIR / ".env")

ERGO_PY_PATH = Path(
    os.environ.get("ERGO_PY_PATH", str(DEFAULT_ERGO_HOME / "python"))
).expanduser()
ERGOROOT = Path(os.environ.get("ERGOROOT", str(DEFAULT_ERGO_HOME))).expanduser()
XSBARCHDIR = Path(
    os.environ.get("XSBARCHDIR", str(DEFAULT_XSB_ARCH_DIR))
).expanduser()

if ERGO_PY_PATH.exists():
    sys.path.insert(0, str(ERGO_PY_PATH))

try:
    from pyergo import pyergo_command, pyergo_end_session, pyergo_query, pyergo_start_session
except Exception as exc:
    raise ImportError(
        "Failed to import ErgoAI Python bindings. Set ERGO_PY_PATH, ERGOROOT, and "
        "XSBARCHDIR in .env or your shell environment so they point to your local "
        f"ErgoAI install. Attempted ERGO_PY_PATH: {ERGO_PY_PATH}"
    ) from exc


RULE_FILES = [
    BASE_DIR / "rules/1040/config.ergo",
    BASE_DIR / "rules/1040/agi.ergo",
    BASE_DIR / "rules/1040/2025/standard_deduction.ergo",
    BASE_DIR / "rules/1040/2025/itemized_deductions.ergo",
    BASE_DIR / "rules/1040/2025/tax_brackets.ergo",
    BASE_DIR / "rules/1040/taxable_income.ergo",
    BASE_DIR / "rules/1040/summary_and_explanations.ergo",
    BASE_DIR / "tests/examples_2025_basic.ergo",
    BASE_DIR / "tests/examples_2025_agi.ergo",
    BASE_DIR / "tests/examples_2025_itemized_and_explanations.ergo",
]

DEFAULT_QUERIES = [
    "case_ok(?T).",
    "itemized_case_ok(?T).",
    "explainability_case_ok(erin).",
    "tax_summary_full_det(dana, ?Year, ?Status, ?AGI, ?SD, ?ID, ?Ded, ?TI, ?Tax).",
    "tax_summary_full_det(erin, ?Year, ?Status, ?AGI, ?SD, ?ID, ?Ded, ?TI, ?Tax).",
]

KNOWN_TAXPAYERS = ["alice", "bob", "dana", "erin", "joan"]

USEFUL_PREDICATES = [
    ("agi(Taxpayer, AGI)", "adjusted gross income"),
    ("standard_deduction(Taxpayer, Year, Amount)", "standard deduction"),
    ("itemized_deduction(Taxpayer, Year, Amount)", "itemized deduction"),
    ("deduction_used(Taxpayer, Year, Amount)", "larger of standard vs. itemized"),
    ("taxable_income(Taxpayer, Year, Amount)", "taxable income"),
    ("tax_liability(Year, Status, TaxableIncome, Tax)", "tax from bracket rules"),
    ("tax_summary_det(Taxpayer, Year, Status, AGI, SD, TI, Tax)", "compact summary"),
    (
        "tax_summary_full_det(Taxpayer, Year, Status, AGI, SD, ID, Ded, TI, Tax)",
        "full deterministic summary",
    ),
    ("line_value(Taxpayer, Label, Value)", "computed value for a named line"),
    ("line_explanation(Taxpayer, Label, Explanation)", "explanation for that line"),
]

EXPLANATION_LABELS = [
    "tax_year",
    "filing_status",
    "agi",
    "total_income",
    "adjustments_total",
    "itemized_deduction",
    "deduction_used",
    "standard_deduction",
    "taxable_income",
    "tax_liability",
]


def require_runtime_paths() -> None:
    missing = []
    if not ERGOROOT.exists():
        missing.append(f"ERGOROOT={ERGOROOT}")
    if not XSBARCHDIR.exists():
        missing.append(f"XSBARCHDIR={XSBARCHDIR}")

    if missing:
        missing_block = "\n".join(f"- {entry}" for entry in missing)
        raise FileNotFoundError(
            "ErgoAI runtime paths were not found:\n"
            f"{missing_block}\n"
            "Set these in .env or your shell before running ergo.py."
        )


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Run the ErgoAI 1040 prototype queries against the combined ruleset."
    )
    parser.add_argument(
        "--query",
        action="append",
        dest="queries",
        help="Ergo query to run. Repeat --query to run multiple queries. "
             "If supplied, runs non-interactively and exits.",
    )
    parser.add_argument(
        "--list-default-queries",
        action="store_true",
        help="Print the default queries and exit.",
    )
    parser.add_argument(
        "--demo",
        action="store_true",
        help="Run the built-in default demo queries and exit.",
    )
    parser.add_argument(
        "--no-interactive",
        action="store_true",
        help="Disable the interactive REPL even when no --query is supplied.",
    )
    return parser.parse_args()


def build_combined_rules(rule_files: list[Path]) -> Path:
    with tempfile.NamedTemporaryFile(
        mode="w", suffix=".ergo", encoding="utf-8", delete=False
    ) as handle:
        for path in rule_files:
            handle.write(f"// ---- {path} ----\n")
            handle.write(path.read_text(encoding="utf-8"))
            handle.write("\n\n")
        return Path(handle.name)


def run_query(query: str) -> None:
    try:
        answers = pyergo_query(query)
    except Exception as exc:
        print(f"  [error] {exc}")
        return

    if not answers:
        print(f"  No solutions found for: {query}")
        return

    for index, answer in enumerate(answers, start=1):
        bindings = {name: value for (name, value) in answer[0]}
        if bindings:
            print(f"  Solution {index}: {bindings}")
        else:
            print(f"  Solution {index}: (true)")


def run_queries(queries: list[str]) -> None:
    for query in queries:
        print(f"\n?- {query}")
        run_query(query)


def normalize_query(text: str) -> str:
    text = text.strip()
    if text and not text.endswith("."):
        text = text + "."
    return text


# ---------- REPL ----------

BANNER = r"""
==========================================================
  ErgoAI 1040 — Interactive Query Console
  Type a query and press Enter (the trailing '.' is optional)
  Type :help for commands, :quit to exit
==========================================================
"""

HELP_TEXT = """
Available commands:
  :help, ?              Show this help
  :quit, :exit, :q      Exit the console
  :demo                 Run the built-in default demo queries
  :defaults             List the default queries
  :run N                Run default query number N (see :defaults)
  :predicates           List the most useful predicates
  :labels               List explanation labels (for line_value / line_explanation)
  :taxpayers            List loaded example taxpayers
  :history              Show the queries you've run in this session
  :reload               Rebuild and reload the combined rules file
  :clear                Clear the screen

Query tips:
  - End queries with a period (auto-appended if you forget)
  - Variables start with '?', e.g. ?AGI, ?Tax
  - Use single quotes for explanation labels, e.g. 'taxable_income'
  - Example: agi(dana, ?AGI)
"""


def print_help() -> None:
    print(HELP_TEXT)


def print_defaults() -> None:
    print("\nDefault queries:")
    for i, q in enumerate(DEFAULT_QUERIES, start=1):
        print(f"  [{i}] {q}")
    print()


def print_predicates() -> None:
    print("\nUseful predicates:")
    for sig, desc in USEFUL_PREDICATES:
        print(f"  {sig}")
        print(f"      {desc}")
    print()


def print_labels() -> None:
    print("\nExplanation labels (use with line_value / line_explanation):")
    for label in EXPLANATION_LABELS:
        print(f"  '{label}'")
    print()


def print_taxpayers() -> None:
    print("\nLoaded example taxpayers:")
    for t in KNOWN_TAXPAYERS:
        print(f"  {t}")
    print()


def clear_screen() -> None:
    os.system("clear" if os.name == "posix" else "cls")


def reload_rules(current_path: Path) -> Path:
    current_path.unlink(missing_ok=True)
    new_path = build_combined_rules(RULE_FILES)
    result = pyergo_command(f"['{new_path}'].")
    print(f"  Reloaded combined rules (result: {result})")
    return new_path


def repl(combined_path: Path) -> Path:
    print(BANNER)
    history: list[str] = []
    active_path = combined_path

    while True:
        try:
            raw = input("ergo> ")
        except EOFError:
            print()
            break
        except KeyboardInterrupt:
            print("\n  (use :quit to exit)")
            continue

        line = raw.strip()
        if not line:
            continue

        # Slash-style commands also accepted for convenience
        cmd = line.lstrip(":/").strip() if line.startswith((":", "/")) else None
        is_command = line.startswith((":", "/")) or line == "?"

        if line == "?":
            print_help()
            continue

        if is_command:
            head, *rest = (cmd or "").split(maxsplit=1)
            head = head.lower()
            arg = rest[0] if rest else ""

            if head in ("quit", "exit", "q"):
                break
            elif head in ("help", "h"):
                print_help()
            elif head == "demo":
                run_queries(DEFAULT_QUERIES)
                history.extend(DEFAULT_QUERIES)
            elif head in ("defaults", "default", "list"):
                print_defaults()
            elif head == "run":
                try:
                    n = int(arg)
                    if 1 <= n <= len(DEFAULT_QUERIES):
                        q = DEFAULT_QUERIES[n - 1]
                        print(f"\n?- {q}")
                        run_query(q)
                        history.append(q)
                    else:
                        print(f"  No default query #{n}. See :defaults")
                except ValueError:
                    print("  Usage: :run N   (N is a number; see :defaults)")
            elif head in ("predicates", "preds"):
                print_predicates()
            elif head == "labels":
                print_labels()
            elif head in ("taxpayers", "people"):
                print_taxpayers()
            elif head == "history":
                if not history:
                    print("  (no queries yet)")
                else:
                    print()
                    for i, q in enumerate(history, start=1):
                        print(f"  [{i}] {q}")
                    print()
            elif head == "reload":
                active_path = reload_rules(active_path)
            elif head == "clear":
                clear_screen()
            else:
                print(f"  Unknown command: :{head}  (try :help)")
            continue

        # Treat as an Ergo query
        query = normalize_query(line)
        print(f"?- {query}")
        run_query(query)
        history.append(query)

    return active_path


def main() -> None:
    args = parse_args()
    if args.list_default_queries:
        for query in DEFAULT_QUERIES:
            print(query)
        return

    require_runtime_paths()
    combined_path = build_combined_rules(RULE_FILES)

    pyergo_start_session(str(XSBARCHDIR), str(ERGOROOT))
    try:
        result = pyergo_command(f"['{combined_path}'].")
        print(f"Loaded combined rules file (result: {result})")

        if args.demo:
            run_queries(DEFAULT_QUERIES)
        elif args.queries:
            run_queries(args.queries)
        elif args.no_interactive:
            run_queries(DEFAULT_QUERIES)
        else:
            combined_path = repl(combined_path)
    finally:
        pyergo_end_session()
        combined_path.unlink(missing_ok=True)


if __name__ == "__main__":
    main()

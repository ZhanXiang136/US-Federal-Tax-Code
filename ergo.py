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


CORE_RULE_FILES = [
    BASE_DIR / "rules/1040/config.ergo",
    BASE_DIR / "rules/1040/agi.ergo",
    BASE_DIR / "rules/1040/2025/standard_deduction.ergo",
    BASE_DIR / "rules/1040/2025/itemized_deductions.ergo",
    BASE_DIR / "rules/1040/2025/tax_brackets.ergo",
    BASE_DIR / "rules/1040/taxable_income.ergo",
    BASE_DIR / "rules/1040/summary_and_explanations.ergo",
    BASE_DIR / "rules/1040/traces.ergo",
]


def discover_test_files() -> list[Path]:
    return sorted((BASE_DIR / "tests").glob("*.ergo"))


RULE_FILES = CORE_RULE_FILES + discover_test_files()

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
        "--test",
        action="store_true",
        help="Run the validation suite and exit non-zero if any case fails.",
    )
    parser.add_argument(
        "--trace",
        nargs=2,
        metavar=("TAXPAYER", "LABEL"),
        action="append",
        help="Print the structured derivation trace for a taxpayer line. "
             "Repeatable. Example: --trace erin tax_liability",
    )
    parser.add_argument(
        "--show-zeros",
        action="store_true",
        help="With --trace, include zero-valued component leaves (off by default).",
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


def _collect(query: str) -> list[dict]:
    try:
        answers = pyergo_query(query)
    except Exception as exc:
        print(f"  [error] {query}: {exc}")
        return []
    return [{name: value for (name, value) in answer[0]} for answer in (answers or [])]


def _atom(value) -> str:
    return getattr(value, "value", value)


def _value(value):
    """Unwrap an ErgoSymbol to its underlying value if present."""
    return getattr(value, "value", value)


def _functor_name(term) -> str | None:
    """Return the functor name of a HILOG compound term, or None."""
    name = getattr(term, "name", None)
    if name is None:
        return None
    return str(_atom(name))


def _format_number(value) -> str:
    if isinstance(value, float) and value.is_integer():
        return f"{int(value)}"
    return f"{value}"


def render_trace(trace, indent: int = 0, hide_zero: bool = True) -> None:
    pad = "  " * indent
    functor = _functor_name(trace)

    if functor == "node":
        args = trace.args
        label = _atom(args[0])
        value = args[1]
        children = args[2]
        print(f"{pad}{label} = {_format_number(value)}")
        if isinstance(children, list):
            for child in children:
                render_trace(child, indent + 1, hide_zero)
        return

    if functor == "comp":
        name = _atom(trace.args[0])
        value = trace.args[1]
        if hide_zero and value == 0:
            return
        print(f"{pad}- {name}: {_format_number(value)}")
        return

    if functor == "fact":
        name = _atom(trace.args[0])
        value = trace.args[1]
        print(f"{pad}- {name}: {_format_number(value)}")
        return

    if functor == "formula":
        text = _atom(trace.args[0])
        print(f"{pad}# {text}")
        return

    if isinstance(trace, list):
        for item in trace:
            render_trace(item, indent, hide_zero)
        return

    # Empty list comes back as ERGOSymbol(value=[]); other atoms render as-is.
    text = _atom(trace)
    if text == "[]":
        return
    print(f"{pad}{text}")


def print_line_trace(taxpayer: str, label: str, hide_zero: bool = True) -> int:
    rows = _collect(f"line_trace({taxpayer}, '{label}', ?Trace).")
    if not rows:
        print(f"  No trace available for {taxpayer}.{label}")
        return 1
    print(f"\nTrace: {taxpayer}.{label}")
    render_trace(rows[0]["?Trace"], hide_zero=hide_zero)
    return 0


SCHEDULE_A_KEYS = [
    "medical_expenses",
    "state_local_income_taxes",
    "state_local_sales_taxes",
    "real_estate_taxes",
    "personal_property_taxes",
    "mortgage_interest",
    "charitable_cash",
    "charitable_noncash",
    "casualty_losses",
    "other_itemized",
]


def _collect_facts(keys: list[str], taxpayer: str) -> dict[str, float]:
    """For each fact name in `keys`, query <name>(taxpayer, ?V) and collect bindings."""
    facts: dict[str, float] = {}
    for key in keys:
        rows = _collect(f"{key}({taxpayer}, ?V).")
        if rows:
            facts[key] = rows[0]["?V"]
    return facts


def run_differential_tests() -> tuple[int, int, list[tuple[str, str, float, float]]]:
    """Run every taxpayer through both the Ergo rules and reference_tax.py.

    Returns (pass_count, diff_count, divergence_records). Each divergence is
    (taxpayer, field_name, ergo_value, reference_value).
    """
    from reference_tax import TaxpayerInputs, INCOME_KEYS, ADJUSTMENT_KEYS, compute

    taxpayer_rows = _collect("taxpayer(?T).")
    names = sorted({str(_atom(b["?T"])) for b in taxpayer_rows})

    passes = 0
    divergences: list[tuple[str, str, float, float]] = []

    for name in names:
        status_rows = _collect(f"filing_status({name}, ?S).")
        if not status_rows:
            continue
        status = str(_atom(status_rows[0]["?S"]))

        def flag(key: str) -> int:
            rows = _collect(f"{key}({name}, ?V).")
            return int(rows[0]["?V"]) if rows else 0

        inputs = TaxpayerInputs(
            filing_status=status,
            age_65_or_over=flag("age_65_or_over_flag"),
            blind=flag("blind_flag"),
            spouse_age_65_or_over=flag("spouse_age_65_or_over_flag"),
            spouse_blind=flag("spouse_blind_flag"),
            income=_collect_facts(INCOME_KEYS, name),
            adjustments=_collect_facts(ADJUSTMENT_KEYS, name),
            schedule_a=_collect_facts(SCHEDULE_A_KEYS, name),
        )
        ref = compute(inputs)

        agi_rows = _collect(f"agi({name}, ?A).")
        ergo_agi = agi_rows[0]["?A"] if agi_rows else None
        sd_rows = _collect(f"standard_deduction({name}, 2025, ?V).")
        ergo_sd = sd_rows[0]["?V"] if sd_rows else None
        id_rows = _collect(f"itemized_deduction({name}, 2025, ?V).")
        ergo_id = id_rows[0]["?V"] if id_rows else None
        ded_rows = _collect(f"deduction_used({name}, 2025, ?V).")
        ergo_ded = ded_rows[0]["?V"] if ded_rows else None
        ti_rows = _collect(f"taxable_income({name}, 2025, ?V).")
        ergo_ti = ti_rows[0]["?V"] if ti_rows else None
        tax_rows = _collect(f"tax_liability(2025, {status}, {ergo_ti}, ?V).") if ergo_ti is not None else []
        ergo_tax = tax_rows[0]["?V"] if tax_rows else None

        comparisons = [
            ("agi", ergo_agi, ref.agi),
            ("standard_deduction", ergo_sd, ref.standard_deduction),
            ("itemized_deduction", ergo_id, ref.itemized_deduction),
            ("deduction_used", ergo_ded, ref.deduction_used),
            ("taxable_income", ergo_ti, ref.taxable_income),
            ("tax_liability", ergo_tax, ref.tax),
        ]

        taxpayer_ok = True
        for field_name, ergo_val, ref_val in comparisons:
            if ergo_val is None:
                continue
            if abs(float(ergo_val) - float(ref_val)) > 1e-6:
                divergences.append((name, field_name, float(ergo_val), float(ref_val)))
                taxpayer_ok = False
        if taxpayer_ok:
            passes += 1

    return passes, len(divergences), divergences


def run_tests() -> int:
    """Run the validation suite. Returns a process exit code (0 = all pass)."""
    print("\n=== Validation suite ===")

    passes = _collect("validation_pass(?T).")
    fails = _collect("validation_fail(?T, ?ExpTI, ?TI, ?ExpTax, ?Tax).")
    agi_passes = _collect("agi_pass(?T).")
    agi_fails = _collect("agi_fail(?T, ?ExpAGI, ?AGI).")
    itemized_passes = _collect("itemized_pass(?T).")
    itemized_fails = _collect("itemized_fail(?T).")
    invariant_passes = _collect("invariant_pass(?T, ?Name).")
    invariant_violations = _collect("invariant_violation(?T, ?Name).")

    pass_names = sorted({str(_atom(b["?T"])) for b in passes})
    fail_records = sorted(
        {(str(_atom(b["?T"])), b["?ExpTI"], b["?TI"], b["?ExpTax"], b["?Tax"]) for b in fails}
    )
    agi_pass_names = sorted({str(_atom(b["?T"])) for b in agi_passes})
    agi_fail_records = sorted(
        {(str(_atom(b["?T"])), b["?ExpAGI"], b["?AGI"]) for b in agi_fails}
    )
    itemized_pass_names = sorted({str(_atom(b["?T"])) for b in itemized_passes})
    itemized_fail_names = sorted({str(_atom(b["?T"])) for b in itemized_fails})

    print(f"\nTaxable income + tax: {len(pass_names)} pass, {len(fail_records)} fail")
    for name in pass_names:
        print(f"  PASS  {name}")
    for name, exp_ti, ti, exp_tax, tax in fail_records:
        print(f"  FAIL  {name}: TI expected={exp_ti} got={ti}; Tax expected={exp_tax} got={tax}")

    print(f"\nAGI checks: {len(agi_pass_names)} pass, {len(agi_fail_records)} fail")
    for name in agi_pass_names:
        print(f"  PASS  {name}")
    for name, exp_agi, agi_val in agi_fail_records:
        print(f"  FAIL  {name}: AGI expected={exp_agi} got={agi_val}")

    print(
        f"\nItemized checks: {len(itemized_pass_names)} pass, "
        f"{len(itemized_fail_names)} fail"
    )
    for name in itemized_pass_names:
        print(f"  PASS  {name}")
    for name in itemized_fail_names:
        print(f"  FAIL  {name}")

    inv_pass_pairs = sorted(
        {(str(_atom(b["?T"])), str(_atom(b["?Name"]))) for b in invariant_passes}
    )
    inv_violation_pairs = sorted(
        {(str(_atom(b["?T"])), str(_atom(b["?Name"]))) for b in invariant_violations}
    )
    print(
        f"\nInvariant checks: {len(inv_pass_pairs)} pass, "
        f"{len(inv_violation_pairs)} violation"
    )
    if inv_violation_pairs:
        for taxpayer, name in inv_violation_pairs:
            print(f"  VIOLATION  {taxpayer}: {name}")
    else:
        by_invariant: dict[str, int] = {}
        for _, name in inv_pass_pairs:
            by_invariant[name] = by_invariant.get(name, 0) + 1
        for name in sorted(by_invariant):
            print(f"  PASS  {name}: {by_invariant[name]} taxpayers")

    diff_pass, diff_count, divergences = run_differential_tests()
    print(f"\nDifferential vs reference_tax.py: {diff_pass} pass, {diff_count} divergence")
    for taxpayer, field_name, ergo_val, ref_val in divergences:
        print(f"  DIVERGE  {taxpayer}.{field_name}: ergo={ergo_val} ref={ref_val}")

    total_fail = (
        len(fail_records)
        + len(agi_fail_records)
        + len(itemized_fail_names)
        + len(inv_violation_pairs)
        + diff_count
    )
    total_pass = (
        len(pass_names)
        + len(agi_pass_names)
        + len(itemized_pass_names)
        + len(inv_pass_pairs)
        + diff_pass
    )
    print(f"\n=== {total_pass} checks passed, {total_fail} failed ===")
    return 0 if total_fail == 0 else 1


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

    exit_code = 0
    pyergo_start_session(str(XSBARCHDIR), str(ERGOROOT))
    try:
        result = pyergo_command(f"['{combined_path}'].")
        print(f"Loaded combined rules file (result: {result})")

        if args.test:
            exit_code = run_tests()
        elif args.trace:
            for taxpayer, label in args.trace:
                print_line_trace(taxpayer, label, hide_zero=not args.show_zeros)
        elif args.demo:
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

    if args.test:
        sys.exit(exit_code)


if __name__ == "__main__":
    main()

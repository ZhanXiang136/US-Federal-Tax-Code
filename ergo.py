import argparse
import os
import sys
import tempfile
from pathlib import Path


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
        help="Ergo query to run. Repeat --query to run multiple queries.",
    )
    parser.add_argument(
        "--list-default-queries",
        action="store_true",
        help="Print the default queries and exit.",
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


def run_queries(queries: list[str]) -> None:
    for query in queries:
        answers = pyergo_query(query)
        if not answers:
            print(f"No solutions found for: {query}")
            continue

        for index, answer in enumerate(answers, start=1):
            bindings = {name: value for (name, value) in answer[0]}
            print(f"{query} Solution {index}: {bindings}")


def main() -> None:
    args = parse_args()
    if args.list_default_queries:
        for query in DEFAULT_QUERIES:
            print(query)
        return

    require_runtime_paths()
    queries = args.queries or DEFAULT_QUERIES
    combined_path = build_combined_rules(RULE_FILES)

    pyergo_start_session(str(XSBARCHDIR), str(ERGOROOT))
    try:
        result = pyergo_command(f"['{combined_path}'].")
        print(f"Loaded combined rules file (result: {result})")
        run_queries(queries)
    finally:
        pyergo_end_session()
        combined_path.unlink(missing_ok=True)


if __name__ == "__main__":
    main()

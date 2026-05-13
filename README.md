ErgoAI 1040 Ruleset (Prototype)

What this is
- A rule-based, explainable prototype of the Form 1040 pipeline using ErgoAI.
- Current scope: filing status, multi-source AGI, standard vs. itemized deductions, taxable income, 2025 ordinary income tax brackets, and line-level explanations.
- Not yet implemented: credits, withholding/payments, refunds or amount due, and full Form 1040 coverage.

Proposal materials
- Project Proposal_ ErgoAI on the US Tax Code.pdf: original proposal snapshot.
- Project Proposal_ ErgoAI on the US Tax Code.md: revised editable source aligned to the current repo state.

Repository layout
- rules/1040/config.ergo: global tax-year switch (currently 2025)
- rules/1040/agi.ergo: AGI computation across income sources and adjustments
- rules/1040/2025/standard_deduction.ergo: 2025 standard deduction rules
- rules/1040/2025/itemized_deductions.ergo: 2025 itemized deduction rules (Schedule A subset)
- rules/1040/2025/tax_brackets.ergo: 2025 ordinary income tax brackets
- rules/1040/taxable_income.ergo: taxable income logic
- rules/1040/summary_and_explanations.ergo: summary predicates and explanation predicates
- tests/examples_2025_basic.ergo: baseline tax and taxable-income examples
- tests/examples_2025_agi.ergo: AGI-specific examples
- tests/examples_2025_itemized_and_explanations.ergo: itemized-deduction and explainability examples
- tests/validation_filing_statuses.ergo: low/mid income across all five filing statuses
- tests/validation_brackets_single.ergo: 2025 bracket boundaries for single filers
- tests/validation_brackets_mfj.ergo: 2025 bracket boundaries for MFJ and QSS
- tests/validation_brackets_hoh_mfs.ergo: 2025 bracket boundaries for HoH and MFS
- tests/validation_age_blind.ergo: 1–4 age/blind qualifier scenarios
- tests/validation_income_sources.ergo: multi-source income, retirement, adjustments, AGI floor
- tests/validation_itemized_edges.ergo: medical floor, SALT cap, casualty, charitable noncash
- tests/validation_runner.ergo: pass/fail predicates used by `python ergo.py --test`
- tax_1040_2024.ergo and examples_1040_2024.ergo: legacy standalone prototype files kept for reference only

Quick start (ErgoAI Python bridge)
1. Add `ERGOROOT` and `XSBARCHDIR` to `.env`, or export them in your shell.
2. Optionally set `ERGO_PY_PATH` if the ErgoAI Python bindings are not in the default sibling install location.
3. Run `python ergo.py`.
4. To run custom queries, use `python ergo.py --query "tax_summary_full_det(alice, ?Year, ?Status, ?AGI, ?SD, ?ID, ?Ded, ?TI, ?Tax)."`

How to use the model
1. The model is queried through `ergo.py`.
2. Each query is an Ergo predicate call ending with a period.
3. Variables start with `?`, for example `?AGI` or `?Tax`.
4. Example taxpayers already loaded in the repo are `alice`, `bob`, `joan`, `dana`, and `erin`.

Query syntax
- End each query with a period: `agi(dana, ?AGI).`
- Use lowercase atoms for taxpayer names and statuses: `dana`, `single`
- Use single quotes for explanation labels: `'taxable_income'`
- Use shell double quotes around the full query string

Useful commands
- Run the full validation suite (per-case + invariants + differential vs reference_tax.py; exits non-zero on any failure):
  `python ergo.py --test`
- Print a structured derivation trace for one taxpayer/line:
  `python ergo.py --trace erin tax_liability`
  Available labels: `tax_year`, `filing_status`, `total_income`, `adjustments_total`, `agi`, `standard_deduction`, `itemized_deduction`, `deduction_used`, `taxable_income`, `tax_liability`. Add `--show-zeros` to include zero-valued component leaves.
- List the default demo queries:
  `python ergo.py --list-default-queries`
- Run one query:
  `python ergo.py --query "agi(dana, ?AGI)."`
- Run multiple queries in one command:
  `python ergo.py --query "income_sum(dana, ?Income)." --query "adjustment_sum(dana, ?Adj)." --query "agi(dana, ?AGI)."`

Most useful predicates
- `agi(Taxpayer, AGI)`: adjusted gross income
- `standard_deduction(Taxpayer, Year, Amount)`: standard deduction
- `itemized_deduction(Taxpayer, Year, Amount)`: itemized deduction
- `deduction_used(Taxpayer, Year, Amount)`: larger of standard vs. itemized deduction
- `taxable_income(Taxpayer, Year, Amount)`: taxable income
- `tax_liability(Year, Status, TaxableIncome, Tax)`: tax from the bracket rules
- `tax_summary_det(Taxpayer, Year, Status, AGI, StdDed, TaxableIncome, Tax)`: compact summary
- `tax_summary_full_det(Taxpayer, Year, Status, AGI, StdDed, ItemizedDed, DeductionUsed, TaxableIncome, Tax)`: full deterministic summary

Recommended example queries
- Dana's AGI:
  `python ergo.py --query "agi(dana, ?AGI)."`
- Erin's full tax summary:
  `python ergo.py --query "tax_summary_full_det(erin, ?Year, ?Status, ?AGI, ?SD, ?ID, ?Ded, ?TI, ?Tax)."`
- All loaded taxpayers and their filing statuses:
  `python ergo.py --query "filing_status(?T, ?Status)."`
- Built-in validation checks:
  `python ergo.py --query "case_ok(?T)." --query "itemized_case_ok(?T)." --query "explainability_case_ok(erin)."`

How to gather explanations
- `line_value(Taxpayer, Label, Value)` returns the computed value for a named line
- `line_explanation(Taxpayer, Label, Explanation)` returns the explanation text for that line

Available explanation labels
- `'tax_year'`
- `'filing_status'`
- `'agi'`
- `'total_income'`
- `'adjustments_total'`
- `'itemized_deduction'`
- `'deduction_used'`
- `'standard_deduction'`
- `'taxable_income'`
- `'tax_liability'`

Explanation examples
- Get Erin's taxable income:
  `python ergo.py --query "line_value(erin, 'taxable_income', ?TI)."`
- Get the explanation for that line:
  `python ergo.py --query "line_explanation(erin, 'taxable_income', ?E)."`
- Get both in one command:
  `python ergo.py --query "line_value(erin, 'taxable_income', ?TI)." --query "line_explanation(erin, 'taxable_income', ?E)."`

How to read the output
- Query answers are returned as variable bindings, for example `{'?AGI': 79000}`
- Some atoms appear as `ERGOSymbol(value=single)`; this just means the atom `single`
- For demos and scripts, prefer the `_det` summary predicates so you get one clean answer instead of backtracking over alternatives

Notes
- `ergo.py` now reads `.env` directly and builds a temporary combined rules file at runtime.
- The rules are intentionally modular so additional tax years, schedules, and credits can be added incrementally.
- To add a new tax year, create a new `rules/1040/<YEAR>/` folder and update `tax_year/1` in `rules/1040/config.ergo`.

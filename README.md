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
- tax_1040_2024.ergo and examples_1040_2024.ergo: legacy standalone prototype files kept for reference only

Quick start (ErgoAI Python bridge)
1. Add `ERGOROOT` and `XSBARCHDIR` to `.env`, or export them in your shell.
2. Optionally set `ERGO_PY_PATH` if the ErgoAI Python bindings are not in the default sibling install location.
3. Run `python ergo.py`.
4. To run custom queries, use `python ergo.py --query "tax_summary_full_det(alice, ?Year, ?Status, ?AGI, ?SD, ?ID, ?Ded, ?TI, ?Tax)."`

Notes
- `ergo.py` now reads `.env` directly and builds a temporary combined rules file at runtime.
- The rules are intentionally modular so additional tax years, schedules, and credits can be added incrementally.
- To add a new tax year, create a new `rules/1040/<YEAR>/` folder and update `tax_year/1` in `rules/1040/config.ergo`.

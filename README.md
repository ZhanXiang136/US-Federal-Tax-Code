ErgoAI 1040 Ruleset (Prototype)

What this is
- A rule-based, explainable prototype of the Form 1040 pipeline using ErgoAI.
- Current scope: filing status, multi-source AGI (income + adjustments), standard vs. itemized deductions, taxable income, and 2025 tax brackets.

Repository layout
- rules/1040/config.ergo: global tax-year switch (currently 2025)
- rules/1040/agi.ergo: AGI computation (income + adjustments)
- rules/1040/2025/standard_deduction.ergo: 2025 standard deduction rules
- rules/1040/2025/itemized_deductions.ergo: 2025 itemized deduction rules (Schedule A)
- rules/1040/2025/tax_brackets.ergo: 2025 tax brackets
- rules/1040/taxable_income.ergo: taxable income logic
- rules/1040/summary_and_explanations.ergo: summary view + explanations
- tests/examples_2025_basic.ergo: basic correctness checks
- tests/examples_2025_agi.ergo: AGI-specific examples

Quick start (ErgoAI Python bridge)
1) Add ERGOROOT and XSBARCHDIR to .env to match your local ErgoAI install.
2) Run: python ergo.py
   - ergo.py supports a list of queries (edit the `queries = [...]` list).
   - ergo.py loads a combined rules file (`tmp_combined_rules.ergo`) to avoid module reload issues.

Notes
- The rules are intentionally modular to support additional income sources, deductions, credits, and schedules.
- To add a new tax year, create a new rules/1040/<YEAR>/ folder and update tax_year/1 in rules/1040/config.ergo.

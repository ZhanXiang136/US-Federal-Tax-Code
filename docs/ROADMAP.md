ErgoAI 1040 Roadmap

Current state (implemented)
- Filing status represented as input facts
- Multi-source AGI with adjustments to income
- 2025 standard deduction logic, including age/blind add-ons
- 2025 itemized deductions for medical, SALT, mortgage interest, charitable giving, casualty losses, and other itemized inputs
- Taxable income using the larger of standard vs. itemized deduction
- 2025 ordinary income tax brackets for all filing statuses
- Summary predicates and line-by-line explanations
- Example-based tests for baseline, AGI, itemized-deduction, and explainability scenarios

Next priorities
- Credits: Child Tax Credit, Earned Income Tax Credit, and education credits
- Payments and settlement: withholding, estimated tax payments, refund, and amount due
- Broader schedule coverage and more explicit source tracing for each rule
- Cleaner multi-year support so adding a new year does not require editing the Python loader

Stretch priorities
- Counterfactual explanations such as "Why did I not qualify?"
- Additional schedules and exception-heavy subdomains
- Comparative evaluation against other rule-based or logic-based systems

Evaluation plan
- Build 50-100 test cases from IRS worked examples and edge cases
- Check expected vs. computed line values and explanation availability
- Track coverage by major 1040 computation stage
- Document assumptions, omissions, and unsupported rules explicitly

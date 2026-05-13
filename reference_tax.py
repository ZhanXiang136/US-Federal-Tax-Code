"""Procedural reference implementation of the 2025 Form 1040 pipeline.

The Ergo rules under rules/1040/ are the system under test. This file is an
independent encoding of the same arithmetic using only Python. Differential
testing in ergo.py runs every loaded taxpayer through both and reports any
divergence.

The reference deliberately does not import anything project-specific so it
cannot accidentally reuse the same source of truth.
"""

from __future__ import annotations

from dataclasses import dataclass, field

# ---------- Constants for tax year 2025 ----------

STANDARD_DEDUCTION_2025 = {
    "single": 15750,
    "married_filing_separately": 15750,
    "married_filing_jointly": 31500,
    "qualifying_surviving_spouse": 31500,
    "head_of_household": 23625,
}

PER_QUALIFIER_2025 = {
    "single": 2000,
    "head_of_household": 2000,
    "married_filing_jointly": 1600,
    "married_filing_separately": 1600,
    "qualifying_surviving_spouse": 1600,
}

MEDICAL_FLOOR_PCT_2025 = 0.075
SALT_FULL_CAP_2025 = 40000
SALT_FULL_FLOOR_2025 = 10000
SALT_PHASEOUT_RATE_2025 = 0.30
SALT_PHASEOUT_THRESHOLD_2025 = {
    "single": 500000,
    "married_filing_jointly": 500000,
    "qualifying_surviving_spouse": 500000,
    "head_of_household": 500000,
    "married_filing_separately": 250000,
}
SALT_CAP_DIVISOR_2025 = {
    "single": 1,
    "married_filing_jointly": 1,
    "qualifying_surviving_spouse": 1,
    "head_of_household": 1,
    "married_filing_separately": 2,
}

# (lower_inclusive, upper_exclusive_or_None, rate)
BRACKETS_2025: dict[str, list[tuple[int, int | None, float]]] = {
    "single": [
        (0, 11925, 0.10),
        (11925, 48475, 0.12),
        (48475, 103350, 0.22),
        (103350, 197300, 0.24),
        (197300, 250525, 0.32),
        (250525, 626350, 0.35),
        (626350, None, 0.37),
    ],
    "married_filing_jointly": [
        (0, 23850, 0.10),
        (23850, 96950, 0.12),
        (96950, 206700, 0.22),
        (206700, 394600, 0.24),
        (394600, 501050, 0.32),
        (501050, 751600, 0.35),
        (751600, None, 0.37),
    ],
    "married_filing_separately": [
        (0, 11925, 0.10),
        (11925, 48475, 0.12),
        (48475, 103350, 0.22),
        (103350, 197300, 0.24),
        (197300, 250525, 0.32),
        (250525, 375800, 0.35),
        (375800, None, 0.37),
    ],
    "head_of_household": [
        (0, 17000, 0.10),
        (17000, 64850, 0.12),
        (64850, 103350, 0.22),
        (103350, 197300, 0.24),
        (197300, 250500, 0.32),
        (250500, 626350, 0.35),
        (626350, None, 0.37),
    ],
}
BRACKETS_2025["qualifying_surviving_spouse"] = BRACKETS_2025["married_filing_jointly"]


# ---------- Inputs ----------

INCOME_KEYS = [
    "wage_income",
    "taxable_interest_income",
    "ordinary_dividends",
    "qualified_dividends",
    "capital_gains",
    "business_income",
    "rental_income",
    "royalty_income",
    "farm_income",
    "taxable_refunds",
    "alimony_received_pre2019",
    "social_security_taxable",
    "unemployment_comp",
    "other_income",
]

ADJUSTMENT_KEYS = [
    "educator_expenses",
    "ira_deduction",
    "student_loan_interest",
    "hsa_deduction",
    "self_employment_tax_deduction",
    "self_employed_health_insurance",
    "penalty_on_early_withdrawal",
    "sep_simple_qualified_plans",
    "self_employed_retirement",
    "moving_expenses_active_duty",
    "alimony_paid_pre2019",
    "other_adjustments",
]

SALT_MAGI_ADDITION_KEYS = [
    "puerto_rico_excluded_income",
    "foreign_earned_income_exclusion",
    "foreign_housing_exclusion",
    "american_samoa_excluded_income",
]


@dataclass
class TaxpayerInputs:
    filing_status: str
    age_65_or_over: int = 0
    blind: int = 0
    spouse_age_65_or_over: int = 0
    spouse_blind: int = 0
    salt_tax_election: str | None = None
    income: dict[str, float] = field(default_factory=dict)
    adjustments: dict[str, float] = field(default_factory=dict)
    schedule_a: dict[str, float] = field(default_factory=dict)


@dataclass
class TaxpayerResult:
    total_income: float
    adjustments_total: float
    agi: float
    standard_deduction: float
    itemized_deduction: float
    deduction_used: float
    taxable_income: float
    tax: float


# ---------- Reference computation ----------

def compute_agi(inputs: TaxpayerInputs) -> tuple[float, float, float]:
    total_income = sum(inputs.income.get(k, 0) for k in INCOME_KEYS)
    adjustments_total = sum(inputs.adjustments.get(k, 0) for k in ADJUSTMENT_KEYS)
    agi = max(total_income - adjustments_total, 0)
    return total_income, adjustments_total, agi


def compute_standard_deduction(inputs: TaxpayerInputs) -> float:
    base = STANDARD_DEDUCTION_2025[inputs.filing_status]
    qualifiers = inputs.age_65_or_over + inputs.blind
    if inputs.filing_status in (
        "married_filing_jointly",
        "married_filing_separately",
        "qualifying_surviving_spouse",
    ):
        qualifiers += inputs.spouse_age_65_or_over + inputs.spouse_blind
    additional = PER_QUALIFIER_2025[inputs.filing_status] * qualifiers
    return base + additional


def compute_itemized_deduction(inputs: TaxpayerInputs, agi: float) -> float:
    a = inputs.schedule_a

    medical_raw = a.get("medical_expenses", 0)
    if medical_raw > 0:
        medical = max(medical_raw - agi * MEDICAL_FLOOR_PCT_2025, 0)
    else:
        medical = 0

    income_tax = a.get("state_local_income_taxes", 0)
    sales_tax = a.get("state_local_sales_taxes", 0)
    if inputs.salt_tax_election == "income":
        income_or_sales = income_tax
    elif inputs.salt_tax_election == "sales":
        income_or_sales = sales_tax
    else:
        income_or_sales = max(income_tax, sales_tax)
    salt_components = (
        income_or_sales
        + a.get("real_estate_taxes", 0)
        + a.get("personal_property_taxes", 0)
    )
    salt_modified_agi = agi + sum(a.get(k, 0) for k in SALT_MAGI_ADDITION_KEYS)
    threshold = SALT_PHASEOUT_THRESHOLD_2025[inputs.filing_status]
    reduction = max(salt_modified_agi - threshold, 0) * SALT_PHASEOUT_RATE_2025
    worksheet_cap = max(SALT_FULL_CAP_2025 - reduction, SALT_FULL_FLOOR_2025)
    effective_cap = worksheet_cap / SALT_CAP_DIVISOR_2025[inputs.filing_status]
    salt = min(salt_components, effective_cap)

    other = (
        a.get("mortgage_interest", 0)
        + a.get("charitable_cash", 0)
        + a.get("charitable_noncash", 0)
        + a.get("casualty_losses", 0)
        + a.get("other_itemized", 0)
    )
    return medical + salt + other


def compute_tax(filing_status: str, taxable_income: float) -> float:
    if taxable_income <= 0:
        return 0.0
    tax = 0.0
    for lower, upper, rate in BRACKETS_2025[filing_status]:
        if upper is not None and taxable_income > upper:
            tax += (upper - lower) * rate
        else:
            tax += (taxable_income - lower) * rate
            break
    return tax


def compute(inputs: TaxpayerInputs) -> TaxpayerResult:
    total_income, adjustments_total, agi = compute_agi(inputs)
    sd = compute_standard_deduction(inputs)
    itemized = compute_itemized_deduction(inputs, agi)
    deduction_used = max(sd, itemized)
    taxable_income = max(agi - deduction_used, 0)
    tax = compute_tax(inputs.filing_status, taxable_income)
    return TaxpayerResult(
        total_income=total_income,
        adjustments_total=adjustments_total,
        agi=agi,
        standard_deduction=sd,
        itemized_deduction=itemized,
        deduction_used=deduction_used,
        taxable_income=taxable_income,
        tax=tax,
    )

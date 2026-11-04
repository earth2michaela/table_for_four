# I320 Data Engineering - Final Project Dataset
## Healthcare | Team: Table for Four

### The assignment brief
> This will be based on patients attending a hospital for treatment and will have additional appointments scheduled.

**Stakeholders you are building for:** Hospital operations leadership, department chairs, patient-access/scheduling managers, and finance (revenue cycle).

**Data window:** Treatment visits from 2026-01-01 to 2026-10-31; appointments from 2026-01-01 to 2026-12-31.

**"Today" for this project:** treat **2026-10-31** as the current date for any as-of logic.

### Analytical requirements (restate these in your own words in Section 2 of your report)
1. Treatment activity and cost: How many patients were treated, and what were the charges, insurance payments, and patient payments by facility, department, diagnosis category, and month?
2. Appointment follow-through: Of the additional appointments scheduled around treatment, what share were completed, missed (no-show), cancelled, or are still upcoming - by provider, department, and appointment type?
3. Care gaps: Which patients being treated for chronic conditions have no upcoming scheduled appointment?
4. Payer mix: How do insurance plan types compare on charges, insurer-paid amounts, and patient responsibility?

### What is in this package
```
healthcare_table_for_four/
  README.md                         <- this file
  data/                             <- 9 CSV files (UTF-8, comma-delimited, header row)
  starter/
    01_create_staging_starter.sql   <- example staging DDL (ONE table)
    02_load_starter.psql            <- example psql \copy load (ONE table)
    03_verify_starter.sql           <- verification / profiling queries
    04_dbt_sources_starter.yml      <- example dbt source declaration
```

| File | What it contains |
|---|---|
| `data/appointments.csv` | Scheduled appointments, some tied to a treatment visit and some stand-alone. |
| `data/departments.csv` | Clinical departments and their cost centers. |
| `data/diagnosis_codes.csv` | Diagnosis reference list with category and chronic-condition flag. |
| `data/encounters.csv` | Hospital treatment visits: who, where, what, when, and the money. |
| `data/facilities.csv` | Hospital and clinic locations. |
| `data/insurance_plans.csv` | Insurance payers and plan characteristics. |
| `data/patients.csv` | People who received care: demographics, contact info, and a reference to their insurance plan. |
| `data/procedure_codes.csv` | Procedure reference list with standard base cost. |
| `data/providers.csv` | Physicians and clinicians with specialty and hire date. |

### Read this before you start
* **All data is synthetic.** Names, e-mails, phone numbers and identifiers are invented. E-mails use the reserved `example.com` domain.
* **Nothing is labelled for you.** The files are not marked as "fact" or "dimension". Deciding what the **grain** is, which file(s) are fact tables, which are dimensions, which are bridges or lookups, and how the files relate is **your job** - and a core part of your grade. Start by reading headers, sampling rows, and testing which columns the files have in common.
* **The files share identifiers.** Columns with the same name/format across files are how the files connect. Verify every join: check cardinality (1:1, 1:many, many:many) before you trust a count.
* **The data is realistic, not pristine.** Expect nulls, inconsistent text values, and repeated rows. Detect them with queries, decide how to handle them, and document your decisions in your report (Sections 3 and 7). Do not silently delete rows - show your evidence.
* Some NULLs are *meaningful* (they describe a real business situation) and some are *defects*. Part of the work is telling them apart.

### Quick start
```bash
# 1. create your GitHub repo, then copy this folder's /data and /starter into it
# 2. from the project root:
psql -h <HOST> -U <YOUR_ROLE> -d dataeng -f starter/01_create_staging_starter.sql
psql -h <HOST> -U <YOUR_ROLE> -d dataeng -f starter/02_load_starter.psql
psql -h <HOST> -U <YOUR_ROLE> -d dataeng -f starter/03_verify_starter.sql
```
Then extend the snippets to cover **all** files, build your own dbt models (staging -> star schema -> data products), and visualize in Superset.

### Repository hygiene (from the project guide)
* Do **not** commit passwords, tokens, or `profiles.yml`. Add them to `.gitignore`.
* Commit the data only if your instructor allows it; otherwise document how to place it locally.

### Report checklist reminder
Introduction + restated requirements -> source documentation (conceptual & physical ER) -> staging DDL & `\copy` script with verification -> grain/facts/dimensions + lineage diagram -> star schema evidence -> your own dbt models -> data products -> Superset dashboard + interpretation -> reflection -> repo link.

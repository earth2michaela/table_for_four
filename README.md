# Table for Four — Healthcare Data Engineering Project

**Course:** I 320D  
**Team:** Table for Four  
**Repository:** https://github.com/earth2michaela/table_for_four

## Project overview

This project analyzes healthcare operations to help administrators, department managers, providers, and scheduling staff understand patient volumes, appointment patterns, insurance coverage, demographics, and staffing needs. The pipeline uses PostgreSQL for data storage, dbt for transformations and reporting models, and Apache Superset for visualizations.

## Team and analytical questions

| Team member | Analytical questions |
|---|---|
| Henry | (1) Patients treated by facility, department, diagnosis category, and month; (2) follow-up appointments for patients with chronic conditions |
| Neha | (3) Appointment type and status by patient generation; (4) association of copays and deductibles with appointment status and no-shows |
| Michaela | (5) Appointment type and status by insurance plan; (6) patient demographics by insurance plan |
| Angela | (7) Provider staffing by specialty relative to patient visits; (8) appointment scheduling trends and peak months, including diagnoses |

## Data sources

The project uses nine supplied healthcare CSV files: appointments, patients, insurance plans, providers, facilities, departments, diagnosis codes, encounters, and procedure codes. Source files and ingestion materials are organized in the repository. Use the course-provided data where files cannot be redistributed.

## Repository organization

| Path | Contents |
|---|---|
| `data/` | Healthcare source data or data-loading resources |
| `starter/` | Starter materials |
| `t4f_staging/` | Staging models |
| `t4f_star_schema/` | Fact and dimension models |
| `t4f_data_products/` | Models supporting analytical questions |
| `table_for_four/` | Additional project/configuration files |
| `t4f_ingest_transform.ipynb` | Data ingestion/transformation notebook |

## Pipeline and tools

**CSV sources → PostgreSQL staging → dbt staging and star schema → reporting data products → Apache Superset dashboard.**

Tools: PostgreSQL, SQL, dbt, Python/JupyterLab, Apache Superset, and Git/GitHub.

## Reproducing the project

1. Clone this repository: `git clone https://github.com/earth2michaela/table_for_four.git`.
2. Set up PostgreSQL and configure a local dbt PostgreSQL connection. Do not commit passwords or connection credentials.
3. Use the repository's ingestion notebook and loading scripts to load the supplied CSVs into staging tables.
4. From the directory containing `dbt_project.yml`, run `dbt deps` if packages are required, followed by `dbt run` and `dbt test`.
5. Inspect the resulting fact, dimension, and reporting models in PostgreSQL.
6. Connect Apache Superset to the reporting models to explore the visualizations.

**Environment-specific setup:** PostgreSQL connection details, dataset locations, and any course-hosted services must be configured by the person reproducing the project. Consult the notebook and project configuration for the exact paths and loading sequence.

## Validation

Validate ingestion with source-versus-staging row counts and sample rows; inspect missing values and join cardinality; check dbt run/test results; and compare reporting aggregates with their source records. Patient demographic comparisons should use distinct patient counts, while appointment analyses should count appointments. The final report contains the project's validation evidence and limitations.

## Dashboard

[View the complete healthcare analytics dashboard in Apache Superset](https://i320d-superset.ischool.utexas.edu/superset/dashboard/p/mVxKll3K2Ma/)


## Project materials and collaboration

The repository tracks the team's ingestion, transformation, and reporting work. The final report documents the data model, SQL data products, validation, diagrams, visualizations, and conclusions. Team members collaborate through GitHub commits and shared project files.

**Data and security:** Do not commit secrets, credentials, private environment files, or data that the course does not permit redistributing.

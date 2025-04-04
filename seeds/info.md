# dbt Seeds Reference

## Overview
- **dbt seeds** are CSV files within your dbt project used to load static, unchanging data into your data warehouse.
- Ideal for small reference datasets like product categories, country codes, or configuration settings.

## How It Works
1. **Prepare CSV Files:** Create CSV files with your static data.
2. **Organize:** Place these files in the `seeds/` directory of your dbt project.
3. **Configure:** (Optional) Define seed settings in `dbt_project.yml` (e.g., column types).
4. **Load:** Run `dbt seed` to import the CSV data as tables.
5. **Use:** Reference the loaded tables in your dbt models and analyses.

## Benefits
- **Version Control:** Manage seed files with Git alongside your code.
- **Consistency:** Ensure uniform static data across all environments.
- **Simplicity:** Easy to create, update, and integrate into your workflows.

## Considerations
- Best for small, rarely changing datasets.
- Not suited for large or frequently updated data; use proper ETL tools in those cases.

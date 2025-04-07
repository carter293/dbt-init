# Enriched Layer Models

This directory contains enriched models derived from the clean layer. It showcases different dbt materialization strategies.

## Materialization Types

dbt supports several materialization types, which define how a model's SQL query is persisted in the data warehouse.

### 1. Incremental (`incremental`)

*   **Description:** Incremental models allow dbt to insert or update records into a table since the last time that table was run. This is efficient for large tables where recomputing the entire table is costly.
*   **Configuration:** `{{ config(materialized='incremental', unique_key='...') }}`
*   **Example:** [`INCREMENTAL_INTERSTATE_JOBS.sql`](./INCREMENTAL_INTERSTATE_JOBS.sql)
    *   This model builds incrementally based on the `LAST_EDIT` timestamp. It uses `JOB_NO` as the `unique_key` to handle updates to existing jobs. Only records modified since the last run are processed.

### 2. Table (`table`)

*   **Description:** Table models rebuild the entire table on every run. This is the default materialization if none is specified. It's suitable for smaller datasets or when the transformation logic changes frequently.
*   **Configuration:** `{{ config(materialized='table') }}`
*   **Example:** [`TABLE_REVENUE_MONTH_YEAR.sql`](./TABLE_REVENUE_MONTH_YEAR.sql)
    *   This model creates a table containing details only for jobs with the status 'Completed'. The entire table is dropped and recreated on each `dbt run`.

### 3. Ephemeral (`ephemeral`)

*   **Description:** Ephemeral models are not directly built in the database. Instead, they are treated as Common Table Expressions (CTEs) and interpolated into the code of downstream models. They are useful for breaking down complex logic without creating intermediate tables or views.
*   **Configuration:** `{{ config(materialized='ephemeral') }}`
*   **Example:** [`EMPHEMERAL_REVENUE_MONTH_YEAR.sql`](./EMPHEMERAL_REVENUE_MONTH_YEAR.sql)
    *   This model selects jobs with a profit greater than 100. It doesn't create a physical table or view; its logic will be incorporated directly into any model that references `ref('ephemeral_example')`.

### 4. View (`view`)

*   **Description:** View models create a database view based on the model's SQL query. Views do not store data themselves but execute the underlying query each time they are accessed. They are useful for transformations that don't require significant computation or when you always need the freshest data.
*   **Configuration:** `{{ config(materialized='view') }}`
*   **Example:** [`VIEW_REVENUE_MONTH_YEAR.sql`](./VIEW_REVENUE_MONTH_YEAR.sql)
    *   This model creates a view showing jobs currently 'In Progress'. Querying this view will always execute the underlying SELECT statement against the `INTERSTATE_JOBS` source model.

### Existing Model

*   [`DEFAULT_REVENUE_MONTH_YEAR.sql`](./DEFAULT_REVENUE_MONTH_YEAR.sql): This model aggregates revenue by month and year. By default (as no materialization is specified), it will be materialized as a table.
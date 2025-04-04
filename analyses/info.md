# dbt Analysis Use Case

dbt analyses let you perform ad hoc or exploratory SQL queries within your version-controlled dbt project without cluttering your production schema.

## Key Benefits

- **Version Controlled:** Keep exploratory SQL queries alongside your models.
- **Collaborative:** Work with your team on one-off or deep-dive analyses.
- **Environment-Agnostic:** Use `{{ ref(...) }}` to reference models consistently across environments.
- **Non-Materialized:** Compile to SQL without creating persistent database objects.

## Workflow

1. Place your SQL file in the `analyses/` directory.
2. Run `dbt compile` to generate runnable SQL.
3. Execute the compiled SQL in your BI or SQL tool.

This approach streamlines your analytical workflow while keeping it integrated with your overall data transformation strategy.

# dbt Models and Tests Reference

## dbt Models

### Overview
- **dbt models** are SQL files that define your transformation logic.
- They live in the `models/` directory and compile into tables or views in your data warehouse.
- They turn raw data into analysis-ready datasets.

### How It Works
1. **Create a Model:**  
   Write a SQL file with a SELECT statement to transform your data.
2. **Configure Materializations:**  
   Set materializations (table, view, incremental, or ephemeral) either in the model or via `dbt_project.yml`.
3. **Run Models:**  
   Execute `dbt run` to compile and deploy your models.
4. **Version Control:**  
   Models are managed with Git, ensuring transparency and collaboration.

### Benefits & Best Practices
- **Modularity & Reusability:** Break down complex logic into manageable, reusable pieces.
- **Maintainability:** Write clean SQL with comments and documentation.
- **Flexibility:** Choose materializations that suit your performance and storage needs.
- **Encouragement:** Keep iterating and refactoring—modern data stacks are built on continuous improvement.

### Example Model File
|||sql
-- Example: models/customers.sql
SELECT 
    id,
    name,
    email
FROM {{ ref('raw_customers') }}
|||


# dbt Macros Reference

## Overview
- **dbt macros** are reusable Jinja functions written in SQL.
- They reside in the `macros/` directory.
- They help you abstract repetitive logic and keep your code DRY.

## How It Works
1. **Define a Macro:**  
   Write a macro using Jinja syntax in a file within the `macros/` directory.
2. **Call a Macro:**  
   Invoke your macro in models, tests, or snapshots using the syntax `{{ macro_name() }}`.
3. **Parameterize:**  
   Pass arguments to your macro to create dynamic and flexible SQL code.
4. **Version Control:**  
   Manage macros with Git alongside your project for transparency and collaboration.`

## Benefits & Best Practices
- **Reusability:**  
  Write common logic once and use it everywhere to reduce errors.
- **Maintainability:**  
  Update your macro in one place and have changes propagate across your project.
- **Efficiency:**  
  Simplify complex SQL by encapsulating it in easy-to-read functions.
- **Encouragement:**  
  Continually refine your macros to stay ahead in modern data transformations.

## Example Macro
```sql
-- Example: macros/calculate_percentage.sql
{% macro calculate_percentage(part, whole) %}
    CASE 
        WHEN {{ whole }} = 0 THEN 0 
        ELSE ({{ part }}::float / {{ whole }}) * 100 
    END
{% endmacro %}
```

Remember: dbt macros empower you to write flexible, maintainable, and dynamic SQL. Leverage them to streamline your data transformation workflows and drive innovation.

-- this will use the materialisation defined in the dbt_project.yml file

SELECT 
      CONCAT(YEAR(DATE), '-', MONTH(DATE)) AS YEAR_MONTH
    , SUM(PRICE_NETT) as TOTAL_REVENUE
FROM 
    {{ ref('INTERSTATE_JOBS') }}
GROUP BY 
    CONCAT(YEAR(DATE), '-', MONTH(DATE))
{{ config(materialized='table') }}

SELECT 
      CONCAT(YEAR(DATE), '-', MONTH(DATE)) AS YEAR_MONTH
    , SUM(PRICE_NETT) as TOTAL_REVENUE
FROM 
    {{ ref('INTERSTATE_JOBS') }}
GROUP BY 
    CONCAT(YEAR(DATE), '-', MONTH(DATE))
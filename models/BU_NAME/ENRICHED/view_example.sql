{{ config(materialized='view') }}

SELECT
      JOB_NO
    , BOOK_DATE
    , STATUS
    , CUS_CODE
    , DRV_CODE
    , DEPOT
    , REVENUE
FROM
    {{ ref('INTERSTATE_JOBS') }}
WHERE
    STATUS = 'In Progress' -- Example filter for view materialization
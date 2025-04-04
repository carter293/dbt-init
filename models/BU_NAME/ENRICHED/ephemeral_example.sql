{{ config(materialized='ephemeral') }}

SELECT
      JOB_NO
    , BOOK_DATE
    , STATUS
    , CUS_CODE
    , DRV_CODE
    , DEPOT
    , REVENUE
    , COST_NETT
    , PROFIT
FROM
    {{ ref('INTERSTATE_JOBS') }}
WHERE
    PROFIT > 100 -- Example filter for ephemeral model
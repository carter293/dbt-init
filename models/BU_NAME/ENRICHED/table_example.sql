{{ config(materialized='table') }}

SELECT
      JOB_NO
    , BOOK_DATE
    , STATUS
    , CUS_CODE
    , COL_NAME
    , COL_LOC
    , DEL_NAME
    , DEL_LOC
    , ITEMS
    , WEIGHT
    , CUBIC
    , REVENUE
FROM
    {{ ref('INTERSTATE_JOBS') }}
WHERE
    STATUS = 'Completed' -- Example filter for table materialization
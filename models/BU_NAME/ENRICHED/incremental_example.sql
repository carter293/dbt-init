{{ config(materialized='incremental', unique_key='JOB_NO') }}

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
    , LAST_EDIT
FROM
    {{ ref('INTERSTATE_JOBS') }}

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  WHERE LAST_EDIT > (SELECT max(LAST_EDIT) FROM {{ this }})

{% endif %}
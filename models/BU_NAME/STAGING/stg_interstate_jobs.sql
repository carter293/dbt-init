-- models/BU_NAME/STAGING/stg_interstate_jobs.sql

-- Selects and renames columns from the raw interstate jobs source.
-- Applies basic casting. Standardizes column names.

with source as (

    select * from {{ source('RAW_TP_TLX_INST', 'INTERSTATE_JOBS') }}

),

renamed_casted as (

    select
        -- Renaming columns to snake_case and casting types
        "TYPE"::varchar as job_type,
        "MAS_TYPE"::varchar as mas_type,
        "MAN_TYPE"::varchar as man_type,
        "LONG_NO"::varchar as long_no,
        "JOB_NO"::varchar as job_no,
        "MAS_NO"::varchar as mas_no,
        "MAN_NO"::varchar as man_no,
        "REVERSE_NO"::varchar as reverse_no,
        "MAN_ITEM"::integer as man_item,
        "MAN_COUNT"::integer as man_count,
        "LEG_ITEM"::integer as leg_item,
        "LEG_COUNT"::integer as leg_count,
        "BOOK_DATE"::timestamp as book_datetime,
        "DATE"::timestamp as job_datetime, -- Renamed to avoid conflict with DATE keyword
        "DATETIME"::timestamp as entry_datetime, -- Assuming this is entry time
        "STATUS"::varchar as job_status,
        "CUS_CODE"::varchar as customer_code,
        "DRV_CODE"::varchar as driver_code,
        "SRV_CODE"::varchar as service_code,
        "DEPOT"::varchar as depot,
        "WORK_CODE"::varchar as work_code,
        "CLASS"::varchar as job_class,
        "INS_CODE"::varchar as ins_code,
        "COL_CODE"::varchar as collection_code,
        "DEL_CODE"::varchar as delivery_code,
        "USER"::varchar as user_id,
        "BOOKED_BY"::varchar as booked_by_user,
        "CUS_REF"::varchar as customer_reference,
        "DRV_REF"::varchar as driver_reference,
        "JOB_REF"::varchar as job_reference,
        "DIARY_REF"::varchar as diary_reference,
        "INS_REF"::varchar as ins_reference,
        "INSTRUCTIONS"::varchar as instructions,
        "COMMENT"::varchar as job_comment,
        "MESSAGE"::varchar as message,
        "DROPS"::integer as drops,
        "ITEMS"::numeric(18, 2) as items, -- Assuming numeric
        "QUANTITY"::numeric(18, 2) as quantity, -- Assuming numeric
        "PALLET"::numeric(18, 2) as pallet_count, -- Assuming numeric
        "CUBIC"::numeric(18, 4) as cubic_metres, -- Assuming numeric
        "WEIGHT"::numeric(18, 4) as weight_kg, -- Assuming numeric
        "SPACE"::numeric(18, 4) as space, -- Assuming numeric
        "DISTANCE"::numeric(18, 2) as distance_km, -- Assuming numeric
        "CHG_KG"::numeric(18, 4) as charge_kg, -- Assuming numeric
        "PAY_KG"::numeric(18, 4) as pay_kg, -- Assuming numeric
        "QTY1"::numeric(18, 2) as qty1,
        "QTY2"::numeric(18, 2) as qty2,
        "PAL1"::numeric(18, 2) as pal1,
        "PAL2"::numeric(18, 2) as pal2,
        "PRICE_TYPE"::varchar as price_type,
        "PRICE_METHOD"::varchar as price_method,
        "PRICE_CARD"::varchar as price_card,
        "PRICE_NETT"::numeric(18, 2) as price_nett,
        "PRICE_GST"::numeric(18, 2) as price_gst,
        "PRICE_GROSS"::numeric(18, 2) as price_gross,
        "PRICE_QUOTE"::numeric(18, 2) as price_quote,
        "PRICE_COMMENT"::varchar as price_comment,
        "INV_TYPE"::varchar as invoice_type,
        "INV_NO"::varchar as invoice_no,
        "INV_STATUS"::varchar as invoice_status,
        "INV_DATE"::timestamp as invoice_datetime,
        "INV_COMMENT"::varchar as invoice_comment,
        "REVENUE"::numeric(18, 2) as revenue,
        "REV_PERC"::numeric(5, 2) as revenue_percentage, -- Assuming percentage
        "COST_TYPE"::varchar as cost_type,
        "COST_CARD"::varchar as cost_card,
        "COST_NETT"::numeric(18, 2) as cost_nett,
        "COST_GST"::numeric(18, 2) as cost_gst,
        "COST_GROSS"::numeric(18, 2) as cost_gross,
        "COST_COMMENT"::varchar as cost_comment,
        "SPA_COMMENT"::varchar as spa_comment,
        "SPA_TYPE"::varchar as spa_type,
        "SPA_STATUS"::varchar as spa_status,
        "EXPENSE"::numeric(18, 2) as expense,
        "EXP_PERC"::numeric(5, 2) as expense_percentage, -- Assuming percentage
        "PROFIT"::numeric(18, 2) as profit,
        "MARGIN"::numeric(5, 2) as margin_percentage, -- Assuming percentage
        "POD_NO"::varchar as pod_no,
        "POD_STATUS"::varchar as pod_status,
        "POD_DATE"::timestamp as pod_datetime,
        "VEH_CODE"::varchar as vehicle_code,
        "TRL_CODE1"::varchar as trailer_code_1,
        "TRL_CODE2"::varchar as trailer_code_2,
        "CONTAINER"::varchar as container,
        "EQUIPMENT"::varchar as equipment,
        "PROFILE"::varchar as profile,
        "LEGCARD"::varchar as legcard,
        "TRIP_STATUS"::varchar as trip_status,
        "COL_NAME"::varchar as collection_name,
        "COL_ADD1"::varchar as collection_address_1,
        "COL_ADD2"::varchar as collection_address_2,
        "COL_LOC"::varchar as collection_location,
        "COL_STATE"::varchar as collection_state,
        "COL_POST"::varchar as collection_postcode,
        "COL_ZONE"::varchar as collection_zone,
        "COL_SUBZ"::varchar as collection_subzone,
        "COL_COMMENT"::varchar as collection_comment,
        "COL_REF"::varchar as collection_reference,
        "COL_ORDER"::varchar as collection_order,
        "DEL_NAME"::varchar as delivery_name,
        "DEL_ADD1"::varchar as delivery_address_1,
        "DEL_ADD2"::varchar as delivery_address_2,
        "DEL_LOC"::varchar as delivery_location,
        "DEL_STATE"::varchar as delivery_state,
        "DEL_POST"::varchar as delivery_postcode,
        "DEL_ZONE"::varchar as delivery_zone,
        "DEL_SUBZ"::varchar as delivery_subzone,
        "DEL_COMMENT"::varchar as delivery_comment,
        "DEL_REF"::varchar as delivery_reference,
        "DEL_ORDER"::varchar as delivery_order,
        "LAST_EDIT"::timestamp as last_edit_datetime,
        "LAST_USER"::varchar as last_edit_user,
        "EXPL_FORM"::varchar as expl_form,
        "LAST_DATE"::timestamp as last_date,
        "WH_FLAG"::boolean as wh_flag, -- Assuming boolean
        "AR_FLAG"::boolean as ar_flag, -- Assuming boolean
        "ARCHIVE"::varchar as archive_status, -- Or boolean?
        "PALLETOPTIONS"::varchar as pallet_options

        -- Note: Verify data types and adjust casting as necessary based on actual source data.
        -- Add comments explaining non-obvious transformations or business logic.

    from source

)

select * from renamed_casted
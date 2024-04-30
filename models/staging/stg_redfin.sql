-- models/staging/stg_redfin_data.sql

WITH stg_redfin_data AS (
    SELECT
       period_begin,
       period_end,
       period_duration,
       region_type,
       region_type_id,
       table_id,
       is_seasonally_adjusted,
       city,
       state,
       state_code,
       property_type,
       property_type_id,
       median_sale_price,
       median_list_price,
       median_ppsf,
       median_list_ppsf,
       homes_sold,
       inventory,
       months_of_supply,
       median_dom,
       avg_sale_to_list,
       sold_above_list,
       parent_metro_region_metro_code,
       last_updated,
       period_begin_in_years,
       period_end_in_years,
       period_begin_in_months,
       period_end_in_months
    FROM {{ source('redfincountry', 'REDFIN_MAINTABLE') }}
)


SELECT
    *
FROM stg_redfin_data
LIMIT 100

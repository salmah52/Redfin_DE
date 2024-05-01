-- models/facts/fct_redfin_sales.sql

WITH fct_redfin_sales AS (
    SELECT
        period_begin,
        city,
        state,
        property_type,
        SUM(median_sale_price) AS total_sales_amount,
        COUNT(*) AS total_sales_count
    FROM {{ source('redfincountry', 'REDFINMAINDATA') }}
    GROUP BY    
        period_begin,
        city,
        state,
        property_type
)


SELECT
    *
FROM fct_redfin_sales


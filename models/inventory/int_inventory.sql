{{ config(materialized='table') }}

SELECT
    PRODUCT_ID,
    PRODUCT,
    CATEGORY,
    STOCK_QTY,
    WAREHOUSE,
    {{total_price('QUANTITY','UNIT_PRICE')}} as total_spend,

    CASE
        WHEN STOCK_QTY < 50 THEN 'LOW_STOCK'
        ELSE 'AVAILABLE'
    END AS STOCK_STATUS

FROM {{ref('Inventory')}}
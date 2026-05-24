{{ config(materialized='ephemeral') }}

SELECT
    PRODUCT_ID,
    PRODUCT,
    CATEGORY,
    STOCK_QTY,
    WAREHOUSE,

    CASE
        WHEN STOCK_QTY < 50 THEN 'LOW_STOCK'
        ELSE 'AVAILABLE'
    END AS STOCK_STATUS

FROM {{ source('curated', 'inventory') }}
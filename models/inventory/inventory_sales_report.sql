SELECT
    s.ORDER_ID,
    s.ORDER_DATE,
    s.PRODUCT_ID,

    i.PRODUCT,
    i.CATEGORY,
    i.WAREHOUSE,
    i.STOCK_STATUS,

    s.QUANTITY,
    s.TOTAL_SALES

FROM {{ source('curated', 'sales') }} s

LEFT JOIN {{ ref('int_inventory') }} i
    ON s.PRODUCT_ID = i.PRODUCT_ID
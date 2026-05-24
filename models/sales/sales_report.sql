SELECT
    s.ORDER_ID,
    s.ORDER_DATE,
    s.CUSTOMER_ID,
    c.CUSTOMER_NAME,
    c.CITY,
    c.LOYALTY_STATUS,
    s.PRODUCT,
    s.TOTAL_SALES
FROM {{ source('curated', 'sales') }} s
LEFT JOIN {{ source('curated', 'customer') }} c
    ON s.CUSTOMER_ID = c.CUSTOMER_ID
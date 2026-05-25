SELECT
    c.CUSTOMER_ID,
    c.CUSTOMER_NAME,
    c.CITY,
    c.LOYALTY_STATUS,

    {{ sales_metrics() }}

FROM {{ source('curated', 'customer') }} c

LEFT JOIN {{ source('curated', 'sales') }} s
    ON c.CUSTOMER_ID = s.CUSTOMER_ID

GROUP BY
    c.CUSTOMER_ID,
    c.CUSTOMER_NAME,
    c.CITY,
    c.LOYALTY_STATUS
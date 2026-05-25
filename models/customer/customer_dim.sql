{{
    config(
        materialized='incremental',
        unique_key='CUSTOMER_ID',
        incremental_strategy='merge'
    )
}}

SELECT
    CUSTOMER_ID,
    CUSTOMER_NAME,
    CITY,
    LOYALTY_STATUS,
    CURRENT_TIMESTAMP AS CREATED_AT

FROM {{ source('curated', 'customer') }}

{% if is_incremental() %}

WHERE CUSTOMER_ID NOT IN
(
    SELECT CUSTOMER_ID
    FROM {{ this }}
)

{% endif %}


-- INSERT INTO TEST_DB.CURATED.CUSTOMER
-- (
--     CUSTOMER_ID,
--     CUSTOMER_NAME,
--     CITY,
--     LOYALTY_STATUS
-- )
-- VALUES
-- (
--     1009,
--     'David Miller',
--     'Phoenix',
--     'Gold'
-- ),
-- (
--     1010,
--     'Charlotte Moore',
--     'Austin',
--     'Silver'
-- );

-- select * from TEST_DB.CURATED.CUSTOMER;

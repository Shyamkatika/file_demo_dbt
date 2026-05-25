{{
    config(

        materialized='table',

        pre_hook=[

            "

            INSERT INTO TEST_DB.RAW_DATA.SALES_AUDIT
            (
                MODEL_NAME,
                LOAD_DATE,
                PRE_TOTAL_RECORDS,
                PRE_TOTAL_SALES,
                STATUS
            )

            SELECT
                'sales_inventory_summary',
                CURRENT_TIMESTAMP,
                COUNT(*),
                COALESCE(SUM(TOTAL_SALES),0),
                'STARTED'

            FROM TEST_DB.CURATED.SALES

            "
        ],

        post_hook=[

            "

            UPDATE TEST_DB.RAW_DATA.SALES_AUDIT 

            SET
                POST_TOTAL_RECORDS = src.POST_TOTAL_RECORDS,
                POST_TOTAL_SALES   = src.POST_TOTAL_SALES,
                STATUS             = 'SUCCESS'

            FROM
            (
                SELECT
                    COUNT(*) AS POST_TOTAL_RECORDS,
                    COALESCE(SUM(TOTAL_SALES),0) AS POST_TOTAL_SALES
                FROM {{ this }}
            ) src

            WHERE MODEL_NAME = 'sales_inventory_summary'
              AND STATUS = 'STARTED'

            "

        ]
    )
}}

SELECT
    s.ORDER_ID,
    s.ORDER_DATE,
    s.CUSTOMER_ID,
    s.PRODUCT_ID,

    i.PRODUCT,
    i.CATEGORY,
    i.WAREHOUSE,

    s.REGION,
    s.SALESPERSON,
    s.QUANTITY,
    s.UNIT_PRICE,
    s.TOTAL_SALES,

    i.STOCK_QTY

FROM {{ source('curated', 'sales') }} s

LEFT JOIN {{ source('curated', 'inventory') }} i
    ON s.PRODUCT_ID = i.PRODUCT_ID



--     CREATE OR REPLACE TABLE SALES_DB.CURATED_SALES_SCHEMA.SALES_AUDIT
-- (
--     AUDIT_ID NUMBER AUTOINCREMENT START 1 INCREMENT 1,

--     MODEL_NAME STRING,

--     LOAD_DATE TIMESTAMP,

--     PRE_TOTAL_RECORDS NUMBER,

--     PRE_TOTAL_SALES NUMBER(18,2),

--     POST_TOTAL_RECORDS NUMBER,

--     POST_TOTAL_SALES NUMBER(18,2),

--     STATUS STRING,
-- CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );
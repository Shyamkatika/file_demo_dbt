{{ config(materialized='view') }}

select
    CUSTOMER_ID,
    CUSTOMER_NAME,
    CITY,
    LOYALTY_STATUS
from {{ ref('customer') }}
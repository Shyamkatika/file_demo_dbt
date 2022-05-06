
{{config(
        materialized="table"
    )
}}

with sales_test as (
    select * from {{ ref('stage_sales')}}
),

product_test as (
    select * from {{ ref('stage_product')}}
)

select * from product_test



with sales_test as (
    select * from {{ ref('stage_sales')}}
),

product_test as (
    select * from {{ ref('stage_product')}}
)

select p.batch,s.id,s.product,s.cost,s.delivery from sales_test s,product_test p









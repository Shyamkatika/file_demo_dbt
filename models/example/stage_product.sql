with product_dbt as(
    select id,product,cost,rating,batch 
    from product
)

select * from product_dbt
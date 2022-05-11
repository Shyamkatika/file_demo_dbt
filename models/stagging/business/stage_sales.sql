with sales_dbt as(
    select id,product,cost,LOCATION,status,delivery from sales
)

select * from sales_dbt
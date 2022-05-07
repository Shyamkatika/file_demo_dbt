
select * from sowflake_dbt.db_dbt.stage_product

select * from {{source('db_dbt','stage_product')}}
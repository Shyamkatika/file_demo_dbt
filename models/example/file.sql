
{{config(
        materialized="table"
    )
}}



select id,product from snowflake_dbt.public.sales
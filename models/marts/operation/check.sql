{{config(
    materialize="incremental") }}


select * from stage_sales;

{{ % if is_incremental() %}}
    where cost > (select max(cost) from {{this}} )

{% endif %}
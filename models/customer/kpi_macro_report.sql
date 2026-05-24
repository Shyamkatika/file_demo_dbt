{{ sales_kpi_metrics(
        source('curated', 'sales'),
        'ORDER_DATE'
) }}

-- {{ sales_kpi_metrics(
--         source('curated', 'sales'),
--         'REGION'
-- ) }}


-- {{ sales_kpi_metrics(
--         source('curated', 'sales'),
--         'SALESPERSON'
-- ) }}
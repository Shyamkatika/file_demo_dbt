{% macro sales_kpi_metrics(table_name, group_by_column) %}

SELECT
    {{ group_by_column }},

    COUNT(*)                    AS TOTAL_ORDERS,
    SUM(TOTAL_SALES)            AS TOTAL_SALES,
    AVG(TOTAL_SALES)            AS AVG_SALES,
    MAX(TOTAL_SALES)            AS MAX_SALES,

    SUM(QUANTITY)               AS TOTAL_QUANTITY,
    AVG(QUANTITY)               AS AVG_QUANTITY

FROM {{ table_name }}

GROUP BY {{ group_by_column }}

ORDER BY {{ group_by_column }}

{% endmacro %}
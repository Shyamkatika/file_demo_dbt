{% macro total_price(unit_price,quantity)%}
    {{unit_price}}*{{quantity}}
{% endmacro %}


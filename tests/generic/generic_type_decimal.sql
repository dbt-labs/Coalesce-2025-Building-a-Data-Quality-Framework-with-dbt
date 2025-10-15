{%- test generic_type_decimal(model, column_name) %}
    select
        {{ column_name }}
    From {{ model }}
    Where typeof({{ column_name }}) != 'DECIMAL'
{%- endtest %}
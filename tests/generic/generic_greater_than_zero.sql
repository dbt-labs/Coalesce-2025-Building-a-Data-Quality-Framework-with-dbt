{%- test generic_greater_than_zero(model, column_name) %}
    select
        {{ column_name }}
    From {{ model }}
    Where {{ column_name }} <= 0
{%- endtest %}
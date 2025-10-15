{% test generic_is_type_decimal(model, column_name) %}
select
    {{column_name}}
from {{ model }}
where typeof({{column_name}})='decimal'
{% endtest %}

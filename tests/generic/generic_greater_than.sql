{% test generic_greater_than(model, column_name, threshold=0) %}
    select
        *
    from
        {{ model }}
    where
        {{ column_name }} <= {{threshold}}
{% endtest %}
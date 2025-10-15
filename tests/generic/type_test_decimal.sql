{% test type_test_decimal(model, column_name) %}

    select 
    top 1
    from {{  model }}
    where typeof({{ column_name }}) != 'DECIMAL'

{% endtest %}

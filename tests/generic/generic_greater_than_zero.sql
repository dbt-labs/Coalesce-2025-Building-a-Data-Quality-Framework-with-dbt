-- column name is not required, model is
{% test generic_greater_than_zero(model, column_name) %} 

select
    {{ column_name }} ,
from {{ model }}
where {{ column_name }} <= 0

{% endtest %}
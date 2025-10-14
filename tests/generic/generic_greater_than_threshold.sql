{% test generic_greater_than_threshold(model,column_name,threshold=0) %} 
select {{column_name}}
from {{model}}
where {{column_name}} <= {{threshold}}
{% endtest %}
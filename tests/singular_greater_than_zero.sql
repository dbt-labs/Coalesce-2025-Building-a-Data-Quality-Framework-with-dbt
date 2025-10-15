Select
    order_total
From {{ ref('fct_orders') }}
Where order_total <= 0
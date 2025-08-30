with 

orders as (
    select * from {{ ref('fct_orders') }}
),

customers as (
    select * from {{ ref('dim_customers') }}
),

last_orders as (
    select
        customer_id,
        max_by(
            order_id,
            ordered_at
        ) as last_order_id,
        max(ordered_at) AS last_order_date
    from orders
    group by 1
),

final as (
    select
        customers.customer_id,
        last_orders.last_order_date,
        last_orders.last_order_id,

        {%- set current_date = "'2025-08-30'::date" %} 

        datediff(day,
            {{ current_date }}, 
            last_orders.last_order_date 
        ) as days_since_last_order,

        case 
            when datediff(day, 
                {{ current_date }},
                last_orders.last_order_date
            ) > 90 then 'churned'

            when datediff(day,
                {{ current_date }}, 
                last_orders.last_order_date
            ) between 31 and 90 then 'at_risk'

            else 'active'
        end as churn_status
    from last_orders
    left join customers
        ON customers.customer_id = last_orders.customer_id
)

select * from final
order by days_since_last_order desc
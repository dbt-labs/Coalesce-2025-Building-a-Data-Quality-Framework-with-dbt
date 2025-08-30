with

product_orders as (
    select * from {{ ref('fct_product_orders') }}
    where employee is not null
),

final as (
    select
        employee,
        employee_email,
        count(distinct order_id) as total_orders_taken,

        sum(case 
            when product_category = 'jaffle' 
            then quantity 
        end) as jaffles_sold,

        sum(case 
            when product_category = 'drink' 
            then quantity 
        end) as drinks_sold,

        sum(case 
            when product_category = 'side' 
            then quantity 
        end) as sides_sold
    from product_orders
    group by 1, 2
)

select * from final
order by jaffles_sold desc
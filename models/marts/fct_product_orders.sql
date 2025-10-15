with

    orders as (select * from {{ ref("fct_orders") }}),

    product_orders as (select * from {{ ref("int_product_orders") }}),

    joined as (
        select
            product_orders.*,
            orders.employee,
            orders.employee_email,
            orders.store_id,
            orders.store_name,
            orders.store_manager,
            orders.store_manager_email,
            orders.regional_manager,
            orders.regional_manager_email
        from product_orders
        left join orders on product_orders.order_id = orders.order_id
    )

select *
from joined

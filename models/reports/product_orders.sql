with products as (select * from {{ ref("stg_jaffle_world__products") }}),
, order_items as (select * from {{ ref("stg_jaffle_world__order_line_items") }})
,joined as (select
products.product_id,
products.product_name,
sum(distinct order_items.quantity) as total_orders
from products left join order_items on products.product_id = order_items.product_id
group by 1, 2)

select *
from joined
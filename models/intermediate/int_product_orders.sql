with

order_items as (
    select * from {{ ref('stg_jaffle_world__order_line_items') }}
),

products as (
    select * from {{ ref('stg_jaffle_world__products') }}
),

joined as (
    select
        order_items.* exclude (product_id),
        products.product_id,
        products.product_name,
        products.sku as product_sku,
        products.category as product_category
    from order_items
    left join products
        on order_items.product_id = products.product_id
)

select * from joined
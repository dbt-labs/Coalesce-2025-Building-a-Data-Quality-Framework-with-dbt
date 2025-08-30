with 

source as (
    select * from {{ source('jaffle_world', 'order_line_items') }}
),

renamed as (
    select
        id as line_item_id,
        order_id,
        product_id,
        quantity,
        unitprice as unit_price,
        subtotal as line_subtotal,
        created as created_at,
        updated as updated_at
    from source
)

select * from renamed

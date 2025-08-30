with 

source as (
    select * from {{ source('jaffle_world', 'warehouse_supplies') }}
),

renamed as (
    select
        warehouse_id,
        product_id,
        quantityonhand as quantity_on_hand,
        lastupdated as last_updated_at,
        lastupdatedby as last_updated_by
    from source
)

select * from renamed

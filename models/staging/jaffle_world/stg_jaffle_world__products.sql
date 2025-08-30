with 

source as (
    select * from {{ source('jaffle_world', 'products') }}
),

renamed as (
    select
        id as product_id,
        sku,
        name as product_name,
        type as category,
        unitprice as unit_price,
        active as is_active,
        created as created_at,
        updated as updated_at
    from source
)

select * from renamed

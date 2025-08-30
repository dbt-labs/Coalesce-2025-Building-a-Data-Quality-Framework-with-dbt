with 

source as (
    select * from {{ source('jaffle_world', 'warehouses') }}
),

renamed as (
    select
        id as warehouse_id,
        address_id,
        region_id,
        name as warehouse_name,
        opened as opened_at
    from source
)

select * from renamed

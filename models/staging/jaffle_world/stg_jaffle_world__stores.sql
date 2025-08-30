with 

source as (
    select * from {{ source('jaffle_world', 'stores') }}
),

renamed as (
    select
        id as store_id,
        name as store_name,
        address_id,
        region_id,
        manager_id as store_manager_id,
        opened as opened_at,
        taxrate as tax_rate
    from source
)

select * from renamed

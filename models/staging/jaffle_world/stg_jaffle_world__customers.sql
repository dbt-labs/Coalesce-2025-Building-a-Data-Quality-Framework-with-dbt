with 

source as (
    select * from {{ source('jaffle_world', 'customers') }}
),

renamed as (
    select
        id as customer_id,
        address_id,
        firstname as first_name,
        lastname as last_name,
        first_name || ' ' || last_name as full_name,
        email,
        phone,
        created as created_at,
        updated as updated_at
    from source
)

select * from renamed

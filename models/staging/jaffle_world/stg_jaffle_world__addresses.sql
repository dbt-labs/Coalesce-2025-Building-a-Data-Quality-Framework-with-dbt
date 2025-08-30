with 

source as (
    select * from {{ source('jaffle_world', 'addresses') }}
),

renamed as (
    select
        id as address_id,
        street,
        city,
        state,
        postal_code,
        country,
        created as created_at
    from source
)

select * from renamed

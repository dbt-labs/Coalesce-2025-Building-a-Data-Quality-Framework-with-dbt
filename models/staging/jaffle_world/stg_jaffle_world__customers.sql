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
        email,
        phone,
        created as created_at,
        updated as updated_at,
        first_name || ' ' || last_name as full_name,
        regexp_like(
            email,
            '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$'
        ) as is_valid_email
    from source
)

select * from renamed

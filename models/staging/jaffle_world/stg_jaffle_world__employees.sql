with 

source as (
    select * from {{ source('jaffle_world', 'employees') }}
),

renamed as (
    select
        id as employee_id,
        store_id,
        warehouse_id,
        region_id,
        firstname as first_name,
        lastname as last_name,
        first_name || ' ' || last_name as full_name,
        role,
        email,
        phone,
        hired as hired_at,
        terminated as terminated_at
    from source
)

select * from renamed

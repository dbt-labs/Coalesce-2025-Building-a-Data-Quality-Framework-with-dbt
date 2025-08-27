with 

source as (
    select * from {{ source('jaffle', 'customers') }}
),

renamed as (
    select
        id,
        customertypeid as customer_type_id,
        _profile_id_ as profile_id,
        firstname as first_name,
        last_name,
        email,
        ip_address,
        created as created_at
    from source
)

select * from renamed

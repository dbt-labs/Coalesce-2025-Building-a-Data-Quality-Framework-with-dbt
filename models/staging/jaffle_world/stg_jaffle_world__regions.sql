with 

source as (
    select * from {{ source('jaffle_world', 'regions') }}
),

renamed as (
    select
        id as region_id,
        manager_id as regional_manager_id,
        name as region_name
    from source
)

select * from renamed

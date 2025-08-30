with 

stores as (
    select * from {{ ref('stg_jaffle_world__stores') }}
),

addresses as (
    select * from {{ ref('stg_jaffle_world__addresses') }}
),

regions as (
    select * from {{ ref('stg_jaffle_world__regions') }}
),

employees as (
    select * from {{ ref('stg_jaffle_world__employees') }}
),

joined as (
    select 
        stores.* exclude (
            address_id,
            region_id,
            store_manager_id
        ),
        addresses.address_id,
        addresses.street as address,
        addresses.city as city,
        addresses.state as state,
        addresses.postal_code as zip,
        addresses.country as country,
        store_managers.employee_id as store_manager_id,
        store_managers.full_name as store_manager_name,
        store_managers.email as store_manager_email,
        regions.region_id,
        regions.region_name as region,
        regional_managers.employee_id as regional_manager_id,
        regional_managers.full_name as regional_manager_name,
        regional_managers.email as regional_manager_email
    from stores
    left join addresses
        on stores.address_id = addresses.address_id
    left join regions
        on stores.region_id = regions.region_id
    left join employees as store_managers
        on stores.store_manager_id = store_managers.employee_id
    left join employees as regional_managers
        on regions.regional_manager_id = regional_managers.employee_id
)

select * from joined
with

employees as (
    select * from {{ ref('stg_jaffle_world__employees') }}
),

stores as (
    select * from {{ ref('int_stores') }}
),

warehouses as (
    select * from {{ ref('stg_jaffle_world__warehouses') }}
),

regional_manager_stores as (
    select
        regional_manager_id,
        listagg(store_id, ', ') as store_ids,
        listagg(store_name, ', ') as store_names
    from stores
    group by 1
),

joined as (
    select
        employees.* exclude (
            store_id,
            warehouse_id,
            region_id,
            role
        ),
        case
            when employees.role = 'store_staff'
            and stores.store_manager_id = employees.employee_id
            then 'store_manager'
            else employees.role
        end as role,
        case
            when employees.role like 'store_%'
            then 'store' 
            when employees.role like 'warehouse_%'
            then 'warehouse'
            when employees.role like 'regional_%'
            then 'corporate'
            when employees.role = 'founder'
            then 'executive' 
        end as employee_type,
        coalesce(
            stores.store_id::string,
            warehouses.warehouse_id::string,
            regional_manager_stores.store_ids,
            '0'
        ) as location_ids,
        coalesce(
            stores.store_name,
            warehouses.warehouse_name,
            regional_manager_stores.store_names,
            'None'
        ) as location_names
    from employees
    left join stores
        on employees.store_id = stores.store_id
    left join warehouses
        on employees.warehouse_id = warehouses.warehouse_id
    left join regional_manager_stores
        on employees.employee_id = regional_manager_stores.regional_manager_id
)

select * from joined
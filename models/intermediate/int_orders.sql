with

orders as (
    select * from {{ ref('stg_jaffle_world__orders') }}
),

employees as (
    select * from {{ ref('int_employees') }}
),

stores as (
    select * from {{ ref('int_stores') }}
),

joined as (
    select
        orders.* exclude (
            employee_id,
            store_id
        ),
        employees.employee_id,
        employees.full_name as employee,
        employees.email as employee_email,
        stores.store_id,
        stores.store_name,
        stores.store_manager_name as store_manager,
        stores.store_manager_email,
        stores.region,
        stores.regional_manager_name as regional_manager,
        stores.regional_manager_email
    from orders
    left join employees
        on orders.employee_id = employees.employee_id
    left join stores
        on orders.store_id = stores.store_id
)

select * from joined
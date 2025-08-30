with 

source as (
    select * from {{ source('jaffle_world', 'orders') }}
),

renamed as (
    select
        id as order_id,
        customer_id,
        employee_id,
        store_id,
        order_ts as ordered_at,
        status,
        paymethod as payment_method,
        subtotal as order_subtotal,
        tax,
        total as order_total
    from source
)

select * from renamed

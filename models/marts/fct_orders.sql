with

orders as (
    select * from {{ ref('int_orders') }}
    where status = 'completed'
)

select * from orders
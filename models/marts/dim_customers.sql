with

customers as (
    select * from {{ ref('int_customers') }}
)

select * from customers

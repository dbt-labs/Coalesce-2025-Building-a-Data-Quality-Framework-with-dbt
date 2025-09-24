with

customers as (
    select * from {{ ref('int_customers') }}
),

selection as (
    select
        customer_id,
        first_name,
        last_name,
        full_name,
        email,
        is_valid_email,
        phone,
        created_at,
        updated_at,
        address_id,
        street,
        city,
        state,
        zip,
        country
    from customers
)

select * 
from selection

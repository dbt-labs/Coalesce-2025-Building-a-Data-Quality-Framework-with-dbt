with

customers as (
    select * from {{ ref('stg_jaffle_world__customers') }}
),

addresses as (
    select * from {{ ref('stg_jaffle_world__addresses') }}
),

joined as (
    select
        customers.* exclude (address_id),
        addresses.address_id,
        addresses.street,
        addresses.city,
        addresses.state,
        addresses.postal_code as zip,
        addresses.country
    from customers
    left join addresses
        on customers.address_id = addresses.address_id
)

select * from joined
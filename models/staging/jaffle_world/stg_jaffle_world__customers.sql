WITH 

source AS (
    SELECT * FROM {{ source('jaffle_world', 'customers') }}
)

, renamed AS (
    SELECT
        id AS customer_id
        , address_id
        , firstname AS first_name
        , lastname AS last_name
        , first_name || ' ' || last_name AS full_name
        , email
        , regexp_like(
            email
            , '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$'
        ) AS is_valid_email
        , phone
        , created AS created_at
        , updated AS updated_at
    FROM source
)

SELECT * FROM renamed

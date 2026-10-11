with source as (
    select * from {{ source('stripe', 'payment') }}
),

renamed as (
    select
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status as payment_status,
        -- Convert cents to dollars and explicitly cast
        cast(amount as numeric) / 100.0 as amount_usd
    from source
)

select * from renamed
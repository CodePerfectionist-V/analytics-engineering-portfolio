with orders as (
    select * from {{ ref('int_orders') }}
),

final as (
    select
        order_id,
        customer_id,
        order_date,
        order_status,
        total_amount_usd
    from orders
)

select * from final
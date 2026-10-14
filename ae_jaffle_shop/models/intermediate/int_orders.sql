{{
    config(
        materialized='view',
        schema='intermediate'
    )
}}

with orders as (
    select * from {{ ref('stg_jaffle_shop__orders') }}
),

payments as (
    select * from {{ ref('stg_jaffle_shop__payments') }}
),

order_payments as (
    select
        order_id,
        sum(case when payment_status = 'success' then amount_usd else 0 end) as total_amount_usd,
        sum(case when payment_status = 'success' then 1 else 0 end) as successful_payments_count
    from payments
    group by 1
),

final as (
    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        orders.order_status,
        coalesce(order_payments.total_amount_usd, 0) as total_amount_usd
    from orders
    left join order_payments on orders.order_id = order_payments.order_id
)

select * from final


  create or replace view `ae-portfolio-project`.`jaffle_shop_staging`.`stg_jaffle_shop__payments`
  OPTIONS()
  as with source as (
    select * from `dbt-tutorial`.`stripe`.`payment`
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

select * from renamed;


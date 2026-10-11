

  create or replace view `ae-portfolio-project`.`jaffle_shop_staging`.`stg_jaffle_shop__orders`
  OPTIONS()
  as with source as (
    select * from `dbt-tutorial`.`jaffle_shop`.`orders`
),

renamed as (
    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status as order_status
    from source
)

select * from renamed;


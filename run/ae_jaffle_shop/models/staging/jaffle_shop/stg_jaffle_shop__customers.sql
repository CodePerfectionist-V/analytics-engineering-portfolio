

  create or replace view `ae-portfolio-project`.`jaffle_shop_staging`.`stg_jaffle_shop__customers`
  OPTIONS()
  as with source as (
    select * from `dbt-tutorial`.`jaffle_shop`.`customers`
),

renamed as (
    select
        id as customer_id,
        first_name,
        last_name
    from source
)

select * from renamed;


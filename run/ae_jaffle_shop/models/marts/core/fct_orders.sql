
  
    

    create or replace table `ae-portfolio-project`.`jaffle_shop_marts`.`fct_orders`
      
    
    

    
    OPTIONS()
    as (
      with orders as (
    select * from `ae-portfolio-project`.`jaffle_shop_intermediate`.`int_orders`
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
    );
  
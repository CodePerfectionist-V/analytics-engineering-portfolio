
    
    

with dbt_test__target as (

  select payment_id as unique_field
  from `ae-portfolio-project`.`jaffle_shop_staging`.`stg_jaffle_shop__payments`
  where payment_id is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1



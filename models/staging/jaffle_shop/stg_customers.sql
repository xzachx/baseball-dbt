with customers as (
    select
        id as customer_id,
        first_name,
        last_name
    from dbt_zbrown.customers
)
select * from customers
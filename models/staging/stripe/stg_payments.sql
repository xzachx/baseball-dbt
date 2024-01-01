with payments as (
    select 
        id as payment_id,
        order_id,
        payment_method,
        {{ cents_to_dollars('amount') }} as amount
    from {{ source('stripe', 'payments')}}
)
select * from payments
{%- set payment_methods = ['bank_transfer', 'coupon', 'credit_card', 'gift_card'] -%}
with payments as (
    select * from {{ ref('stg_payments') }}
),
orders as (
    select * from {{ ref('stg_orders') }}
),
joined as (
    select payment_id, order_id, payment_method, status, amount
    from payments
    left join orders using (order_id)
),
pivoted as (
    select order_id,
        {% for payment_method in payment_methods %}
            sum(case when payment_method = '{{ payment_method }}' then amount else 0 end) as {{ payment_method }}_amount
            {%- if not loop.last -%}
                ,
            {%- endif -%}
        {% endfor %}    
    from joined
    where status = 'completed'
    group by 1
)
select * from pivoted
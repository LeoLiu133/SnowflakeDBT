with payments as ( 
    select * from {{ref("stg_payment")}}
)
select
    order_id,
    sum(payment_amount) as total_amount
from payments
group by 1
having total_amount < 0
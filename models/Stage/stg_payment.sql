select 
    Payment.id as payment_id,
    Payment.orderid as order_id,
    Customer.customer_id,
    Payment.paymentmethod as payment_method,
    Payment.status as payment_status,
    Payment.amount/100 as payment_amount,
    Payment.created as payment_created_at,
    Payment._batched_at as payment_batached_at
from {{source("stripe","payment")}} as Payment
LEFT JOIN {{ref("stg_orders")}} as Orders
ON Payment.orderid = Orders.order_id
LEFT JOIN {{ref("stg_customers")}} as Customer
ON Orders.customer_id = Customer.customer_id
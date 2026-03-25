with orders as (
    select * from {{ ref('stg_orders') }}
),

order_items as (
    select * from {{ ref('stg_order_items') }}
),

payments as (
    select
        order_id,
        sum(payment_value)        as total_payment_value,
        max(payment_type)         as payment_type,
        max(payment_installments) as payment_installments
    from {{ ref('stg_payments') }}
    group by order_id
),

products as (
    select * from {{ ref('dim_product') }}
)

select
    oi.order_id,
    oi.order_item_id,
    oi.product_id,
    oi.seller_id,
    o.customer_id,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,
    oi.price,
    oi.freight_value,
    oi.price + oi.freight_value     as total_item_value,
    p.total_payment_value,
    p.payment_type,
    p.payment_installments,
    pr.product_category_name_english
from order_items oi
left join orders o         on oi.order_id = o.order_id
left join payments p       on oi.order_id = p.order_id
left join products pr      on oi.product_id = pr.product_id
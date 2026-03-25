with source as (
    select * from {{ source('raw', 'raw_orders') }}
),

renamed as (
    select
        order_id,
        customer_id,
        order_status,
        TIMESTAMP(order_purchase_timestamp)     as order_purchase_timestamp,
        TIMESTAMP(order_approved_at)            as order_approved_at,
        TIMESTAMP(order_delivered_carrier_date) as order_delivered_carrier_date,
        TIMESTAMP(order_delivered_customer_date)as order_delivered_customer_date,
        TIMESTAMP(order_estimated_delivery_date)as order_estimated_delivery_date
    from source
    where order_id is not null
)

select * from renamed
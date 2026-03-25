with source as (
    select * from {{ source('raw', 'raw_order_items') }}
),

renamed as (
    select
        order_id,
        CAST(order_item_id as INT64)      as order_item_id,
        product_id,
        seller_id,
        TIMESTAMP(shipping_limit_date)    as shipping_limit_date,
        CAST(price as FLOAT64)            as price,
        CAST(freight_value as FLOAT64)    as freight_value
    from source
    where order_id is not null
)

select * from renamed
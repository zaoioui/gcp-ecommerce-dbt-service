with orders as (
    select * from {{ ref('stg_orders') }}
)

select
    order_purchase_timestamp                                    as date_id,
    DATE(order_purchase_timestamp)                              as date,
    EXTRACT(YEAR from order_purchase_timestamp)                 as year,
    EXTRACT(MONTH from order_purchase_timestamp)                as month,
    EXTRACT(DAY from order_purchase_timestamp)                  as day,
    EXTRACT(DAYOFWEEK from order_purchase_timestamp)            as day_of_week,
    EXTRACT(QUARTER from order_purchase_timestamp)              as quarter,
    FORMAT_TIMESTAMP('%A', order_purchase_timestamp)            as day_name,
    FORMAT_TIMESTAMP('%B', order_purchase_timestamp)            as month_name
from orders
where order_purchase_timestamp is not null
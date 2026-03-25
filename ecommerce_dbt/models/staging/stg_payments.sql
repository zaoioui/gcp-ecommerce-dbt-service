with source as (
    select * from {{ source('raw', 'raw_payments') }}
),

renamed as (
    select
        order_id,
        CAST(payment_sequential as INT64)    as payment_sequential,
        payment_type,
        CAST(payment_installments as INT64)  as payment_installments,
        CAST(payment_value as FLOAT64)       as payment_value
    from source
    where order_id is not null
)

select * from renamed
with source as (
    select * from {{ source('raw', 'raw_products') }}
),

renamed as (
    select
        product_id,
        product_category_name,
        CAST(product_name_lenght as INT64)        as product_name_length,
        CAST(product_description_lenght as INT64) as product_description_length,
        CAST(product_photos_qty as INT64)         as product_photos_qty,
        CAST(product_weight_g as FLOAT64)         as product_weight_g,
        CAST(product_length_cm as FLOAT64)        as product_length_cm,
        CAST(product_height_cm as FLOAT64)        as product_height_cm,
        CAST(product_width_cm as FLOAT64)         as product_width_cm
    from source
    where product_id is not null
)

select * from renamed
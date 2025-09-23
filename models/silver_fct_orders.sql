{{ 
    config(
        materialized = "table"
    )
}}

select
    *
from {{ ref('fct_orders') }} as fct


select
    *
from {{ source('stg', 'orders') }}
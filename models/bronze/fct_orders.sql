select 
    * 
from {{ source('stg', 'orders') }}

limit 100
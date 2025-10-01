select *

from {{ ref('silver_orders') }}

where {{ last_n_days('orderdate', 90) }}
select *

from {{ ref('silver_orders') }}

where {{ recent_days_filter('orderdate', 90) }}
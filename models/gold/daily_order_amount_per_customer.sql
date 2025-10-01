{{ config(
    materialized="incremental",
    unique_key="custkey",
    incremental_strategy="merge"
) }}

select
orderdate,
custkey,
sum(totalprice) as daily_amount

from {{ ref('silver_orders') }}

{% if is_incremental() %}
    where orderdate > (select max(orderdate) from {{ this }})
{% endif %}

group by orderdate, custkey
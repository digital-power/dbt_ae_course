{{ config(
    materialized="incremental",
    unique_key="custkey",
    incremental_stratege="merge"
) }}

select
orderdate,
custkey,
sum(totalprice) as daily_amount

from {{ ref('silver_orders') }}

group by orderdatem custkey

{% if is_incremental() %}
    where orderdate > (select max(orderdate) from {{ this }})
{% endif %}
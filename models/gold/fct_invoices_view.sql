{{ config(
    materialized='view'
) }}

select
orders.*,
customer.name as customer_name,
customer.acctbal as account_balance

from {{ ref('silver_orders') }} as orders

left join {{ ref('silver_customer') }} as customer
on orders.custkey = customer.custkey
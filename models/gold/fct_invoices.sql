select
orders.*,
{{ hashed_primary_key(['customer.custkey', 'orders.orderkey']) }} as customer_order_key,
customer.name as customer_name,
customer.acctbal as account_balance

from {{ ref('silver_orders') }} as orders

left join {{ ref('silver_customer') }} as customer
on orders.custkey = customer.custkey
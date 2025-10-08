{% macro generate_surrogate_key(columns) %}
    -- columns: a list of column names, e.g. ['customer_id', 'order_date']
    {% set concat_expr = [] %}

    {% for col in columns %}
        {% do concat_expr.append("coalesce(cast(" ~ col ~ " as string), '')") %}
    {% endfor %}

    {{ adapter.dispatch('hash', 'dbt')('concat(' ~ concat_expr | join(", ") ~ ')') }}
{% endmacro %}
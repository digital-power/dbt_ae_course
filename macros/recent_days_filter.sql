{% macro last_n_days(date_field, n_days=90) %}

    {{ date_field }} >= {{ dbt.dateadd('day', -1 * n_days, 'current_date') }}
    
{% endmacro %}

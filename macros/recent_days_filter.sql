{% macro recent_days_filter(date_field, n_days=90) %}

    {{ date_field }} >= current_date - interval '{{ days_back }} day'

{% endmacro %}

{% macro recent_days_filter(date_field, days_back=90) %}

    {{ date_field }} >= current_date - interval '{{ days_back }} day'

{% endmacro %}
git
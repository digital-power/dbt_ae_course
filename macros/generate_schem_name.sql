{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- if target.schema == 'databricks_scheduled_job' or target.name == 'databricks_cluster' -%}

        {{ custom_schema_name | trim }}

    {%- elif custom_schema_name is none -%}

        {{ target.schema }}

    {%- else -%}

        {{ target.schema }}_{{ custom_schema_name | trim }}

    {%- endif -%}
{%- endmacro %}
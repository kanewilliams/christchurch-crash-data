{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name is none -%}

        {{ default_schema }}

    {%- else -%}

        -- Will output to "dbt_traffic_data"
        -- Warned NOT to use this code... But if solo developer is OK.
        -- Read more: https://docs.getdbt.com/docs/build/custom-schemas#how-does-dbt-generate-a-models-schema-name
        
        -- TODO: Still does not work? Must change developer credentials. Not optimal...
        {{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}
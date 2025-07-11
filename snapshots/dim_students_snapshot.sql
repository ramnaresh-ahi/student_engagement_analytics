
{% snapshot dim_students_snapshot %}
{{
    config(
      target_schema='snapshots',
      unique_key='student_id',
      strategy='check',
      check_cols=['country']
    )
}}

SELECT * FROM {{ ref('stg_students') }}

{% endsnapshot %}

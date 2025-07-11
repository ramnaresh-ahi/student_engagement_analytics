
{{ 
  config(
    materialized='incremental',
    unique_key='learning_id'
  ) 
}}

WITH learnings AS(
    SELECT
        learning_id,
        student_id,
        course_id,
        minutes_watched,
        watched_date,
        watching_by,
        avg_watching_time_per_student_in_minutes
    FROM
        {{ ref('int_learnings')}}
     WHERE
        {% if not is_incremental() %}
            1 = 1
        {% else %}
            watched_date >= (SELECT MAX(watched_date) FROM {{ this }})
        {% endif %}
)

SELECT
    *
FROM
    learnings
ORDER BY
    watching_by DESC
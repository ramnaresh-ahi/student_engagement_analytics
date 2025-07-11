{{ 
  config(
    materialized='incremental',
    unique_key='course_rating_id'
  ) 
}}

WITH courses_ratings AS (
    SELECT
        course_rating_id,
        student_id,
        course_id,
        course_rating,
        rated_date,
        rated_by,
        avg_rating
    FROM
        {{ ref('int_course_ratings') }}
    WHERE
        {% if not is_incremental() %}
            1=1
        {% else %}
            rated_date >= (SELECT MAX(rated_date) FROM {{ this }})
        {% endif %}
)

SELECT
    *
FROM
    courses_ratings
ORDER BY
    rated_by DESC

{{ 
  config(
    materialized='incremental',
    unique_key='exam_attempt_id'
  ) 
}}


WITH exams AS(
    SELECT
        exam_attempt_id,
        exam_id,
        exam_duration_in_min,
        student_id,
        exam_result,
        completion_time,
        completed_date
    FROM
        {{ ref('int_exams')}}
    WHERE
        {% if not is_incremental() %}
            1 = 1
        {% else %}
            completed_date >= (SELECT MAX(completed_date) FROM {{ this }})
        {% endif %}
)

SELECT
    *
FROM
    exams


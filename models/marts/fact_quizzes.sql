{{ 
  config(
    materialized='incremental',
    unique_key='quiz_id'
  ) 
}}

WITH quizzes_base AS (
    SELECT
        quiz_id,
        student_id,
        question_id,
        CAST(CASE 
            WHEN answer_correct = 'y' THEN TRUE 
            WHEN answer_correct = 'n' THEN FALSE
            ELSE NULL
        END AS BOOLEAN) AS correct_answer,
        total_attempts,
        total_correct_answers,
        result_overview
    FROM {{ ref('int_quizzes') }}
),

quizzes AS (
    SELECT *
    FROM quizzes_base
    --{% if is_incremental() %}
    --WHERE quiz_id NOT IN (
       -- SELECT quiz_id FROM {{ this }}
    --)
    --{% endif %}
)

SELECT 
    *
FROM 
    quizzes
ORDER BY 
    total_correct_answers DESC

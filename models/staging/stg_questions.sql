
WITH questions AS(
    SELECT
        hub_question_id as question_id,
        student_id,
        CAST(date_question_asked as DATE) as asked_date
    FROM
        {{ source('raw', 'student_questions')}}
)

SELECT
    *
FROM
    questions
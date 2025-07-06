
WITH student_engagement AS(
    SELECT
        engagement_id,
        student_id,
        engagement_quizzes,
        engagement_exams,
        engagement_lessons,
        CAST(date_engaged as DATE) as engaged_date
    FROM
        {{ source('raw', 'student_engagement')}}
)

SELECT
    *
FROM
    student_engagement

WITH student_exams AS(
    SELECT
        exam_attempt_id,
        student_id,
        exam_id,
        exam_result,
        exam_completion_time as completion_time,
        CAST(date_exam_completed as DATE) as completed_date
    FROM
        {{ source('raw', 'student_exams')}}
)

SELECT
    *
FROM
    student_exams
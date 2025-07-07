
WITH exams AS(
    SELECT
        s.exam_attempt_id,
        s.exam_id,
        e.exam_category,
        e.exam_duration_in_min,
        s.student_id,
        s.exam_result,
        s.completion_time,
        s.completed_date
    FROM
        {{ ref('stg_student_exams')}} s 
        JOIN
        {{ ref('stg_exams')}} e USING(exam_id)

)

SELECT
    *
FROM
    exams
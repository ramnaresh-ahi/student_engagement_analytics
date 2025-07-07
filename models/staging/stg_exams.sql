
WITH exams AS(
    SELECT 
        exam_id,
        exam_category,
        exam_duration as exam_duration_in_min
    FROM
        {{ source('raw', 'exam_info')}}
)

SELECT 
    *
FROM
    exams
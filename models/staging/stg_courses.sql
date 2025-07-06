
WITH courses AS(
    SELECT 
        course_id,
        course_title
    FROM
        {{ source('raw', 'course_info')}}
)

SELECT
    *
FROM
    courses
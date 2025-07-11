
WITH courses AS(
    SELECT DISTINCT
        course_id,
        course_title
    FROM
        {{ ref('int_course_ratings')}}
)

SELECT
    *
FROM
    courses
ORDER BY   
    course_id ASC    
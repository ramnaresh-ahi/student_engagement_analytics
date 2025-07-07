
WITH course_ratings AS(
    SELECT
        r.course_rating_id,
        r.course_id,
        c.course_title,
        r.student_id,
        r.course_rating,
        rated_date
    FROM
        {{ ref('stg_course_ratings')}} r 
        JOIN
        {{ ref('stg_courses')}} c USING(course_id)  

)

SELECT 
    *
FROM
    course
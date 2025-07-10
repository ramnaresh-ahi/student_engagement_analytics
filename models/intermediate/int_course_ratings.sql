
WITH course_ratings AS(
    SELECT
        r.course_rating_id,
        r.course_id,
        c.course_title,
        r.student_id,
        r.course_rating,
        r.rated_date
    FROM
        {{ ref('stg_course_ratings')}} r 
        JOIN
        {{ ref('stg_courses')}} c USING(course_id)  

),

rating AS(
    SELECT
        course_id,
        COUNT(course_rating) as rated_by,
        ROUND(AVG(course_rating), 2) as avg_rating
    FROM
        {{ref('stg_course_ratings')}}
    GROUP BY 
        course_id
),

final AS(
    SELECT
        cr.course_rating_id,
        cr.student_id,
        cr.course_id,
        cr.course_title,
        cr.course_rating,
        cr.rated_date,
        r.rated_by,
        r.avg_rating
    FROM
        course_ratings cr 
        JOIN
        rating r USING(course_id)

)

SELECT
    *
FROM
    final
ORDER BY
    rated_by DESC


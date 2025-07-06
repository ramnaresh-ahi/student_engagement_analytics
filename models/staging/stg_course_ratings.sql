
WITH course_ratings AS(
    SELECT
        {{dbt_utils.generate_surrogate_key(['course_id','student_id'])}} as course_rating_id,
        course_id,
        student_id,
        course_rating,
        CAST(date_rated as DATE) as rated_date
    FROM 
        {{ source('raw', 'course_ratings')}}
)

SELECT
    *
FROM
    course_ratings
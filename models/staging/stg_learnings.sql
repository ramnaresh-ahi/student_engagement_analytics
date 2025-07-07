
WITH learnings AS(
    SELECT
        {{ dbt_utils.generate_surrogate_key(['student_id', 'course_id','date_watched']) }} as learning_id,
        student_id,
        course_id,
        minutes_watched,
        CAST(date_watched as DATE) as watched_date
    FROM
        {{ source('raw', 'student_learnings')}}
          
)

SELECT
    *
FROM
    learnings
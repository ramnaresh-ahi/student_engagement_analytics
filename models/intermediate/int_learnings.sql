
WITH learnings AS(
    SELECT
        l.learning_id,
        l.student_id,
        l.course_id,
        c.course_title,
        l.minutes_watched,
        l.watched_date
    FROM
        {{ ref('stg_learnings')}} l 
        JOIN
        {{ ref('stg_courses')}} c USING(course_id)
)

SELECT
    *
FROM
    learnings

WITH learnings AS (
        SELECT
            l.learning_id,
            l.student_id,
            l.course_id,
            c.course_title,
            l.minutes_watched,
            l.watched_date
        FROM {{ ref("stg_learnings") }} l
            JOIN
            {{ ref("stg_courses") }} c USING (course_id)
),

watching_by AS(
    SELECT 
        course_id,
        COUNT(DISTINCT(student_id)) as watching_by
    FROM
        {{ ref('stg_learnings')}}
    GROUP BY
        course_id
),

avg_watching_time AS(
    SELECT
        student_id,
        ROUND(AVG(minutes_watched)) as avg_watching_time_per_student_in_minutes
    FROM
        {{ ref('stg_learnings')}}
    GROUP BY
        student_id
),

final AS(
    SELECT
        l.learning_id,
        l.student_id,
        l.course_id,
        l.course_title,
        l.minutes_watched,
        l.watched_date,
        wb.watching_by,
        wt.avg_watching_time_per_student_in_minutes
    FROM
        learnings l 
        JOIN
        watching_by wb USING(course_id)
        JOIN
        avg_watching_time wt USING(student_id)

)

SELECT
    *
FROM
    final
ORDER BY
    watching_by DESC

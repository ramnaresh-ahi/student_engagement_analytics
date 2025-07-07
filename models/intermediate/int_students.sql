
WITH students AS(
    SELECT
       student_id,
       student_country as country,
       registered_date
    FROM
        {{ ref('stg_students')}} 
)

SELECT
    *
FROM
    students
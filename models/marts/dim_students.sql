
WITH students AS(
    SELECT
        student_id,
        student_country as country,
        registered_date
    FROM
        {{ ref('dim_students_snapshot') }}
    WHERE
        dbt_valid_to IS NULL
)

SELECT
    student_id,
    country,
    registered_date
FROM
    students
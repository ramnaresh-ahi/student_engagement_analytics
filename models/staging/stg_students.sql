
WITH students AS(
    SELECT
        student_id,
        student_country,
        CAST(date_registered as DATE) as registered_date
    FROM
        {{ source('raw', 'student_info')}}
)

SELECT
    *
FROM
    students
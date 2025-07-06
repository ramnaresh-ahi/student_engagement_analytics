
WITH purchases AS(
    SELECT
        purchase_id,
        student_id,
        purchase_type,
        CAST(date_purchased as DATE) as purchased_date
    FROM
        {{ source('raw', 'student_purchases')}}
        
)

SELECT
    *
FROM
    purchases
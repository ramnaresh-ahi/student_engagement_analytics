
WITH student_quizzes AS(
    SELECT
        {{ dbt_utils.generate_surrogate_key(['student_id', 'quiz_id']) }} as student_quiz_id,
        student_id,
        quiz_id,
        question_id,
        answer_id
    FROM
        {{ source('raw', 'student_quizzes')}}

)

SELECT
    *
FROM
    student_quizzes
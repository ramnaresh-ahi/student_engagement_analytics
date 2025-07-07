
WITH quizzes AS(
    SELECT
        {{ dbt_utils.generate_surrogate_key(['student_quiz_id','id']) }} as quiz_id,
        s.student_quiz_id,
        q.id,
        s.student_id,
        s.question_id,
        q.answer_id,
        q.answer_correct 
    FROM
        {{ ref('stg_student_quizzes')}} s 
        JOIN
        {{ ref('stg_quizzes')}} q USING(answer_id)

)

SELECT 
    quiz_id,
    student_id,
    question_id,
    answer_correct
FROM
    quizzes
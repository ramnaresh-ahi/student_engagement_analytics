
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

),

attempts AS(
    SELECT 
        student_id,
        COUNT(question_id) as total_attempts
    FROM 
        {{ ref('stg_student_quizzes')}}
    GROUP BY
        student_id
),

answers AS(
    SELECT
        s.student_id,
        COUNT(q.answer_id) as total_correct_answers
    FROM
        {{ ref('stg_quizzes')}} q
        JOIN
        {{ ref('stg_student_quizzes')}} s USING(answer_id)
    WHERE
        q.answer_correct = 'y'
    GROUP BY
        s.student_id
),

final AS(
    SELECT
        q.quiz_id,
        q.student_id,
        q.question_id,
        q.answer_correct,
        att.total_attempts,
        an.total_correct_answers,
        CONCAT(an.total_correct_answers,'/',att.total_attempts) as result_overview
    FROM
        attempts att
        JOIN
        quizzes q USING(student_id)
        JOIN
        answers an USING(student_id)
)

SELECT
    *
FROM
    final
ORDER BY
    total_correct_answers DESC
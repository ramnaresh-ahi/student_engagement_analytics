
WITH quizzes AS(
    SELECT
        quiz_id,
        question_id,
        answer_id,
        answer_correct
    FROM
        {{ source('raw', 'quiz_info')}}
)

SELECT
    *
FROM
    quizzes
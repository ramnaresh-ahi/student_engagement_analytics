
WITH quizzes AS(
    SELECT
        {{ dbt_utils.generate_surrogate_key(['quiz_id','question_id','answer_id'])}} as id,
        quiz_id,
        question_id,
        answer_id,
        answer_correct
    FROM
        {{ source('raw', 'quiz_info')}}
)

SELECT
    id,
    question_id,
    answer_id,
    answer_correct
FROM
    quizzes
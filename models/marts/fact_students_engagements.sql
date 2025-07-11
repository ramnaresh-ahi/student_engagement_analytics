
WITH all_students AS (
    SELECT DISTINCT student_id FROM {{ ref('int_learnings') }}
    UNION
    SELECT DISTINCT student_id FROM {{ ref('int_exams') }}
    UNION
    SELECT DISTINCT student_id FROM {{ ref('int_quizzes') }}
),

learnings AS (
    SELECT DISTINCT student_id, TRUE AS did_learn
    FROM {{ ref('int_learnings') }}
),

exams AS (
    SELECT DISTINCT student_id, TRUE AS did_exam
    FROM {{ ref('int_exams') }}
),

quizzes AS (
    SELECT DISTINCT student_id, TRUE AS did_quiz
    FROM {{ ref('int_quizzes') }}
)

SELECT
    se.student_id,
    COALESCE(l.did_learn, FALSE) AS participated_learning,
    COALESCE(e.did_exam, FALSE) AS participated_exam,
    COALESCE(q.did_quiz, FALSE) AS participated_quiz,
    CASE
        WHEN COALESCE(l.did_learn, FALSE)
          AND COALESCE(e.did_exam, FALSE)
          AND COALESCE(q.did_quiz, FALSE)
        THEN TRUE
        ELSE FALSE
    END AS most_engaged
FROM
    (SELECT DISTINCT student_id FROM {{ ref('int_students') }}) se
LEFT JOIN
    (SELECT DISTINCT student_id, TRUE AS did_learn FROM {{ ref('int_learnings') }}) l
    ON se.student_id = l.student_id
LEFT JOIN
    (SELECT DISTINCT student_id, TRUE AS did_exam FROM {{ ref('int_exams') }}) e
    ON se.student_id = e.student_id
LEFT JOIN
    (SELECT DISTINCT student_id, TRUE AS did_quiz FROM {{ ref('int_quizzes') }}) q
    ON se.student_id = q.student_id

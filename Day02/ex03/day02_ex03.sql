WITH CTE_TABLE AS (
SELECT missing_date::date
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS missing_date
)

SELECT missing_date FROM CTE_TABLE
LEFT JOIN (SELECT visit_date FROM person_visits WHERE person_id = 1 OR person_id = 2) AS person_date ON missing_date = person_date.visit_date
WHERE person_date IS NULL
ORDER BY missing_date;
SELECT missing_date::date
FROM (SELECT visit_date FROM person_visits WHERE person_id = 1 OR person_id = 2) AS person_dates
RIGHT JOIN generate_series('2022-01-01', '2022-01-10', interval '1 day') AS missing_date ON person_dates.visit_date = missing_date
WHERE person_dates.visit_date IS NULL
ORDER BY missing_date;
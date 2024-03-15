SELECT generated_date AS missing_date FROM v_generated_dates
    LEFT JOIN person_visits ON generated_date = visit_date
    WHERE visit_date IS NULL
    AND generated_date BETWEEN '2022-01-01' AND '2022-01-31';
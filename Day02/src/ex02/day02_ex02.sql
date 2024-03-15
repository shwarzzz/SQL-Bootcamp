SELECT COALESCE(p.name, '-') as person_name, visit_date, COALESCE(pz.name, '-') as pizzeria_name
FROM person p
FULL JOIN (SELECT visit_date, person_id, pizzeria_id FROM person_visits
RIGHT JOIN generate_series('2022-01-01', '2022-01-03', interval '1 day') AS date_interval
    ON visit_date = date_interval) as new_dates ON p.id = new_dates.person_id
FULL JOIN pizzeria pz ON new_dates.pizzeria_id = pz.id
ORDER BY  person_name, visit_date, pizzeria_name;
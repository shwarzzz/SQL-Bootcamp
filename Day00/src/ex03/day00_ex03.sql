SELECT DISTINCT p.id FROM person AS p, person_visits AS pv
WHERE p.id = pv.person_id
AND ((pv.visit_date BETWEEN '2022-01-06' AND '2022-01-09')
OR pv.pizzeria_id = 2)
ORDER BY p.id DESC;
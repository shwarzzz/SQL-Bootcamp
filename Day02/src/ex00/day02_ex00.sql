SELECT name, rating FROM pizzeria
LEFT JOIN person_visits pv ON pizzeria.id = pv.pizzeria_id
WHERE pv.person_id IS NULL;
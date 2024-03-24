WITH KateDates AS (
    SELECT visit_date, pizzeria_id, person_id FROM (SELECT visit_date, person_id, pizzeria_id FROM person_visits
    JOIN person ON person_visits.person_id = person.id
    WHERE name = 'Kate') as OnlyDate
),
FullMenu AS (
    SELECT menu.id, pizza_name, price, pizzeria_id, pizzeria.name AS pizzeria_name FROM menu
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    WHERE price BETWEEN 800 AND 1000
)

SELECT pizza_name, price, pizzeria_name, visit_date FROM FullMenu fm
JOIN KateDates kd ON fm.pizzeria_id = kd.pizzeria_id
ORDER BY 1, 2, 3;
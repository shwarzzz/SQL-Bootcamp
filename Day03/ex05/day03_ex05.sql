WITH AndreyPizzeria AS (
    SELECT pizzeria_id, person_id FROM person_visits
    JOIN person ON person_visits.person_id = person.id
    WHERE name = 'Andrey'
),
NoOrder AS (
    SELECT DISTINCT menu_id FROM person_order po
    LEFT JOIN AndreyPizzeria ap ON ap.person_id = po.person_id
    WHERE ap.person_id IS NULL
)

(SELECT name AS pizzeria_name FROM pizzeria
JOIN (SELECT * FROM menu, NoOrder WHERE menu.id = NoOrder.menu_id) as CorrectMenu
ON pizzeria.id = CorrectMenu.pizzeria_id
JOIN AndreyPizzeria ap ON ap.pizzeria_id = pizzeria.id)
    EXCEPT
(SELECT pz.name AS pizzeria_name FROM pizzeria pz
JOIN (SELECT m.id, m.pizzeria_id FROM menu m
    JOIN person_order ON m.id = person_order.menu_id
    JOIN person ON person_order.person_id = person.id
    WHERE person.name = 'Andrey') as tmp ON tmp.pizzeria_id = pz.id);
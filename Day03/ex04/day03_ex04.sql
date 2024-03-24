WITH FemalePizzeria AS (
    (SELECT DISTINCT menu.pizzeria_id FROM person_order
    LEFT JOIN person ON person_order.person_id = person.id
    RIGHT JOIN menu ON person_order.menu_id = menu.id
    WHERE menu.pizzeria_id IS NOT NULL
    AND gender = 'female')
        EXCEPT
    (SELECT DISTINCT menu.pizzeria_id FROM person_order
    LEFT JOIN person ON person_order.person_id = person.id
    RIGHT JOIN menu ON person_order.menu_id = menu.id
    WHERE menu.pizzeria_id IS NOT NULL
    AND gender = 'male')
),
MalePizzeria AS (
    (SELECT DISTINCT menu.pizzeria_id FROM person_order
    LEFT JOIN person ON person_order.person_id = person.id
    RIGHT JOIN menu ON person_order.menu_id = menu.id
    WHERE menu.pizzeria_id IS NOT NULL
    AND gender = 'male')
        EXCEPT
    (SELECT DISTINCT menu.pizzeria_id FROM person_order
    LEFT JOIN person ON person_order.person_id = person.id
    RIGHT JOIN menu ON person_order.menu_id = menu.id
    WHERE menu.pizzeria_id IS NOT NULL
    AND gender = 'female')
)

(SELECT name AS pizzeria_name FROM FemalePizzeria, pizzeria
WHERE pizzeria_id = id)
    UNION
(SELECT name FROM MalePizzeria, pizzeria
WHERE pizzeria_id = id)
ORDER BY pizzeria_name;
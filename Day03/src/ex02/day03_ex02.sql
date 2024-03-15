WITH NotOrdered AS (
(SELECT id AS menu_id FROM menu)
    EXCEPT
(SELECT menu_id FROM person_order)
)

SELECT pizza_name, price, pz.name AS pizzeria_name FROM menu
JOIN NotOrdered no ON no.menu_id = menu.id
JOIN pizzeria pz ON menu.pizzeria_id = pz.id
ORDER BY 1, 2;
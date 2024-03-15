SELECT p.name AS person_name, pizza_name, pizzeria.name AS pizzeria_name
FROM person p JOIN person_order ON person_id = p.id
JOIN menu ON menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY person_name ASC, pizza_name ASC, pizza_name ASC;
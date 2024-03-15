SELECT address,
       pizzeria.name,
       COUNT (po.id) count_of_orders
FROM person_order po
JOIN person ON po.person_id = person.id
JOIN menu ON po.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY address, pizzeria.name
ORDER BY 1, 2;
SELECT pizza_name, pz.name AS pizzeria_name, price FROM menu m, pizzeria pz
WHERE pizzeria_id = pz.id
AND pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY  pizza_name, pizzeria_name;
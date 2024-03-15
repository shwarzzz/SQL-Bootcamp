WITH PersonsIDTable AS (
SELECT menu_id FROM person_order
RIGHT JOIN (SELECT id FROM person WHERE name IN ('Denis', 'Anna')) as PersonID ON PersonID.id = person_id
WHERE person_id IS NOT NULL
)

SELECT pizza_name, pz.name AS pizzeria_name FROM menu, pizzeria pz, PersonsIDTable
WHERE menu.pizzeria_id = pz.id
AND menu.id = PersonsIDTable.menu_id
ORDER BY  pizza_name, pz.name;
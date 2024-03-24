WITH MalePerson AS (
    SELECT name, person.id, menu_id, person_order.id AS order_id FROM person
    RIGHT JOIN person_order ON person.id = person_order.person_id
    AND gender = 'male'
    AND address IN ('Moscow', 'Samara')
    WHERE person.id IS NOT NULL
)

SELECT name FROM MalePerson
RIGHT JOIN (SELECT * FROM menu WHERE pizza_name IN ('pepperoni pizza', 'mushroom pizza')) as pm
ON pm.id = menu_id
WHERE MalePerson.id IS NOT NULL
ORDER BY 1 DESC;
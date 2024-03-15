WITH FemalePerson AS (
    SELECT name, person.id, menu_id, person_order.id AS order_id FROM person
    RIGHT JOIN person_order ON person.id = person_order.person_id
    AND gender = 'female'
    WHERE person.id IS NOT NULL
)

(SELECT name FROM FemalePerson
LEFT JOIN (SELECT * FROM menu WHERE pizza_name = 'pepperoni pizza') AS pm
ON menu_id = pm.id WHERE pm IS NOT NULL)
    INTERSECT
(SELECT name FROM FemalePerson
LEFT JOIN (SELECT * FROM menu WHERE pizza_name = 'cheese pizza') AS cm
ON menu_id = cm.id WHERE cm IS NOT NULL)
ORDER BY name;
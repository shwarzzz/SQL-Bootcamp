WITH personNameOrder AS (
    SELECT
        person.name,
        pizza_name,
        price,
        pizzeria_id,
        person_id,
        pizzeria.name AS pizzeria_name
    FROM person_order po
    JOIN menu ON menu.id = po.menu_id
    JOIN person ON po.person_id = person.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
)

SELECT pno.name,
       pizza_name,
       price,
       (price * ((100 - discount) / 100)) AS discount_price,
       pizzeria_name
FROM personNameOrder pno
JOIN person_discounts pd
    ON
        pno.pizzeria_id = pd.pizzeria_id
            AND
        pno.person_id = pd.person_id
ORDER BY 1, 2;
WITH getPersonInfo AS (
    SELECT
        ROW_NUMBER() OVER () AS id,
        person_id,
        pizzeria_id,
        COUNT(person_order.id) AS orders_amount
    FROM person_order
    JOIN menu ON menu_id = menu.id
    GROUP BY person_id, pizzeria_id
)

INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT id,
       person_id,
       pizzeria_id,
       CAST (CASE WHEN gpi.orders_amount = 1
                        THEN 10.5
                    WHEN gpi.orders_amount = 2
                        THEN 22
                    ELSE 30 END AS NUMERIC) AS discount
FROM getPersonInfo gpi;
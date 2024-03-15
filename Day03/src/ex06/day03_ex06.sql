WITH PizzaID AS (
    SELECT ft.pizza_name, ft.pizzeria_id AS pif, st.pizzeria_id AS pis, ft.price
    FROM (SELECT pizzeria_id, pizza_name, price FROM menu) AS ft
    CROSS JOIN (SELECT pizzeria_id, pizza_name, price FROM menu) AS st
    WHERE ft.price = st.price
    AND ft.pizza_name = st.pizza_name
    AND ft.pizzeria_id > st.pizzeria_id
)

SELECT pizza_name, pz1.name AS pizzeria_name_1, pz2.name AS pizzeria_name_2, price
FROM PizzaID
LEFT JOIN pizzeria pz1 ON pz1.id = pif
LEFT JOIN pizzeria pz2 ON pz2.id = pis
ORDER BY pizza_name;
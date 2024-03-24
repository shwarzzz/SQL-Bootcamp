WITH topOrders AS (
    SELECT name,
           COALESCE(COUNT(person_id), 0) AS oc,
           'order' AS action_type
    FROM person_order
    JOIN menu ON menu_id = menu.id
    RIGHT JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    GROUP BY name
),
    topVisits AS (
    SELECT name,
           COALESCE(COUNT(person_id), 0) AS vc,
           'visit' as action_type
    FROM person_visits
    RIGHT JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    GROUP BY name
)

SELECT tto.name,
       SUM(oc + vc) AS total_count
FROM topOrders tto
JOIN topVisits ttv ON tto.name = ttv.name
GROUP BY tto.name
ORDER BY 2 DESC, 1;
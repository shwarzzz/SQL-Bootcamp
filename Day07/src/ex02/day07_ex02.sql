WITH topOrders AS (
    SELECT name,
           COUNT(person_id),
           'order' AS action_type
    FROM person_order
    JOIN menu ON menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    GROUP BY name
),
    topVisits AS (
    SELECT name,
           count(person_id),
           'visit' as action_type
    FROM person_visits
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    GROUP BY name
)

(SELECT *
 FROM topOrders
 ORDER BY 2 DESC
 LIMIT 3)
    UNION ALL
(SELECT *
 FROM topVisits
 ORDER BY 2 DESC
 LIMIT 3)
ORDER BY action_type;
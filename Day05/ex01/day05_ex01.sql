SET ENABLE_SEQSCAN = OFF;

EXPLAIN ANALYSE
    SELECT pizza_name, name AS pizzeria_name FROM menu
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id;

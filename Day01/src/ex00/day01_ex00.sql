SELECT m.id AS object_id, m.pizza_name AS object_name FROM menu m
UNION SELECT p.id, p.name FROM person p
ORDER BY object_id, object_name;
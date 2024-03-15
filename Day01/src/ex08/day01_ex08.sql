SELECT order_date, name || ' (age:' || age || ')' as person_information
FROM person_order NATURAL JOIN (SELECT id as person_id, name, age FROM person) as person
ORDER BY order_date ASC, person_information ASC;
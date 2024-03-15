SELECT order_date, name || ' (age:' || age || ')' as person_information
FROM person_order INNER JOIN person ON person_order.person_id = person.id
ORDER BY order_date ASC, person_information ASC;
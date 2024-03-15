WITH FemaleCount AS (
    SELECT pv.pizzeria_id, COUNT(person.id) AS FemaleCount FROM person
    JOIN person_visits pv ON person.id = pv.person_id
    WHERE gender = 'female'
    GROUP BY pizzeria_id
),
MaleCount AS (
    SELECT pv.pizzeria_id, COUNT(person.id) AS MaleCount FROM person
    JOIN person_visits pv ON person.id = pv.person_id
    WHERE gender = 'male'
    GROUP BY pizzeria_id
)

(SELECT name AS pizzeria_name FROM pizzeria pz
JOIN FemaleCount fc ON fc.pizzeria_id = pz.id
JOIN MaleCount mc ON mc.pizzeria_id = pz.id
WHERE FemaleCount > MaleCount)
    UNION ALL
(SELECT name AS pizzeria_name FROM pizzeria pz
JOIN FemaleCount fc ON fc.pizzeria_id = pz.id
JOIN MaleCount mc ON mc.pizzeria_id = pz.id
WHERE FemaleCount < MaleCount)
ORDER BY pizzeria_name;
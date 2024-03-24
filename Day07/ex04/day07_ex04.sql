WITH visitsCount AS (
    SELECT name,
           COUNT(person_visits.id) AS count_of_visits
    FROM person_visits
    JOIN person ON person_visits.person_id = person.id
    GROUP BY name
    HAVING COUNT(person_visits.id) > 3
)

SELECT * FROM visitsCount;
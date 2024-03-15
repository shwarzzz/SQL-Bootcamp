INSERT INTO person_visits VALUES
((SELECT MAX(id) + 1 FROM person_visits), (SELECT id FROM person WHERE name = 'Dmitriy'), 5, '2022-01-08');
SELECT * FROM person_visits;

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
SELECT * FROM mv_dmitriy_visits_and_eats;
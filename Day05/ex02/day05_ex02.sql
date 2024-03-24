CREATE INDEX idx_person_name ON person (UPPER(name));

SET ENABLE_SEQSCAN = OFF;

EXPLAIN ANALYSE
    SELECT p.name, pz.name AS pizzeria_name FROM person p
    JOIN person_visits ON p.id = person_visits.person_id
    JOIN pizzeria pz ON person_visits.pizzeria_id = pz.id
    WHERE UPPER(p.name) = 'PETER';
CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
    WITH DmitriyPizzeria AS (
        SELECT pz.id, pz.name FROM pizzeria pz, person p, person_visits
        WHERE person_id = p.id
        AND p.name = 'Dmitriy'
        AND visit_date = '2022-01-08'
        AND pizzeria_id = pz.id
    )
    SELECT name FROM DmitriyPizzeria
    LEFT JOIN (SELECT pizzeria_id, pizza_name, price FROM menu
    WHERE price < 800) AS OnlyPrice ON DmitriyPizzeria.id = OnlyPrice.pizzeria_id
    WHERE OnlyPrice.pizzeria_id IS NOT NULL;

SELECT * FROM mv_dmitriy_visits_and_eats;

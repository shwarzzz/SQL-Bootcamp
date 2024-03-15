CREATE FUNCTION fnc_person_visits_and_eats_on_date
    (IN pperson varchar DEFAULT 'Dmitriy',
    IN pprice numeric DEFAULT 500,
    IN pdate date DEFAULT '2022-01-08')
    RETURNS TABLE (
    pizzeria_name varchar
    ) AS $$
    BEGIN
        RETURN QUERY SELECT DISTINCT
            pizzeria.name
        FROM
            person_visits
        JOIN person ON person_visits.person_id = person.id
        JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
        JOIN menu ON pizzeria.id = menu.pizzeria_id
        WHERE
            person.name = pperson
        AND
            price < pprice
        AND
            visit_date = pdate;
    END;
$$ LANGUAGE plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
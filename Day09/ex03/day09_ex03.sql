DROP TRIGGER IF EXISTS trg_person_delete_audit ON person;
DROP TRIGGER IF EXISTS trg_person_insert_audit ON person;
DROP TRIGGER IF EXISTS trg_person_update_audit ON person;

DROP FUNCTION IF EXISTS fnc_trg_person_delete_audit();
DROP FUNCTION IF EXISTS fnc_trg_person_insert_audit();
DROP FUNCTION IF EXISTS fnc_trg_person_update_audit();

TRUNCATE person_audit;

CREATE FUNCTION fnc_trg_person_audit()
    RETURNS TRIGGER AS $trg_person_audit$
    BEGIN
        IF (TG_OP = 'INSERT') THEN
            INSERT INTO person_audit
            VALUES (DEFAULT, DEFAULT, new.id, new.name, new.age, new.gender, new.address);
            RETURN new;
        ELSEIF (TG_OP = 'UPDATE') THEN
            INSERT INTO person_audit
            VALUES (DEFAULT, 'U', old.id, old.name, old.age, old.gender, old.address);
            RETURN new;
        ELSEIF (TG_OP = 'DELETE') THEN
            INSERT INTO person_audit
            VALUES (DEFAULT, 'D', old.id, old.name, old.age, old.gender, old.address);
            RETURN old;
        END IF;
    END;
$trg_person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_audit AFTER INSERT OR DELETE OR UPDATE
    ON person
    FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;

SELECT * FROM person;
SELECT * FROM person_audit;
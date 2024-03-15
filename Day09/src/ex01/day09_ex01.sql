CREATE FUNCTION fnc_trg_person_update_audit()
    RETURNS TRIGGER AS $trg_person_update_audit$
    BEGIN
        INSERT INTO person_audit
        VALUES (DEFAULT, 'U', old.id, old.name, old.age, old.gender, old.address);
        RETURN new;
    END;
$trg_person_update_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_update_audit AFTER UPDATE
    ON person
    FOR EACH ROW
    EXECUTE FUNCTION fnc_trg_person_update_audit();

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;

SELECT * FROM person;
SELECT * FROM person_audit;
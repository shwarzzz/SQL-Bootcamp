CREATE FUNCTION fnc_trg_person_delete_audit()
    RETURNS TRIGGER AS $trg_person_delete_audit$
    BEGIN
        INSERT INTO person_audit
        VALUES (DEFAULT, 'D', old.id, old.name, old.age, old.gender, old.address);
        RETURN old;
    END;
$trg_person_delete_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_delete_audit AFTER DELETE
    ON person
    FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;

SELECT * FROM person;
SELECT * FROM person_audit;
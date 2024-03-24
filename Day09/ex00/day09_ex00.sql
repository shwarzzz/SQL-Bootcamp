CREATE TABLE IF NOT EXISTS person_audit
( created timestamptz DEFAULT current_timestamp NOT NULL,
  type_event char(1) DEFAULT 'I' NOT NULL,
  row_id bigint NOT NULL,
  name varchar,
  age integer,
  gender varchar,
  address varchar
);

ALTER TABLE person_audit ADD CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'D', 'U'));

CREATE FUNCTION fnc_trg_person_insert_audit() RETURNS trigger AS $trg_person_insert_audit$
    BEGIN
        INSERT INTO person_audit
        VALUES (DEFAULT, DEFAULT, new.id, new.name, new.age, new.gender, new.address);
        RETURN new;
    END;
$trg_person_insert_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit AFTER INSERT
    ON person
    FOR EACH ROW
    EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10,'Damir', 22, 'male', 'Irkutsk');

SELECT * FROM person;
SELECT * FROM person_audit;
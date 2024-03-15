CREATE SEQUENCE seq_person_discounts
    START WITH 1;

ALTER TABLE person_discounts ALTER COLUMN id SET DEFAULT NEXTVAL('seq_person_discounts');

SELECT SETVAL('seq_person_discounts', (SELECT COUNT(*) + 1 FROM person_discounts), false);
COMMENT ON TABLE person_discounts IS
    'This table is needed to store information about people''s discounts in different pizzerias they visited at least once.';
COMMENT ON COLUMN person_discounts.id IS
    'This attribute is a unique identifier for each row in the table';
COMMENT ON COLUMN person_discounts.person_id IS
    'This attribute contains information about the person''s ID';
COMMENT ON COLUMN person_discounts.pizzeria_id IS
    'This attribute contains information about the ID of the pizzeria the person visited.';
COMMENT ON COLUMN person_discounts.discount IS
    'This attribute stores the discount value for a specific user in a specific pizzeria (the discount is calculated using a special formula).';
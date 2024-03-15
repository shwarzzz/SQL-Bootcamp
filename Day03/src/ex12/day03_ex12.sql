WITH MaxOrderID AS (
    SELECT MAX(id) AS maxOrderID FROM person_order
),
MaxPersonID AS (
    SELECT MAX(id) AS maxPersonID FROM person
),
OrderIDTable AS (
    SELECT OrderID::bigint, p.id as person_id FROM generate_series((SELECT maxOrderID FROM MaxOrderID), (SELECT maxOrderID FROM MaxOrderID) + (SELECT MaxPersonID FROM MaxPersonID), 1) AS OrderID, person p
    WHERE p.id = (OrderID - (SELECT maxOrderID FROM MaxOrderID))
)
INSERT INTO person_order (id, person_id, menu_id, order_date)
       SELECT generate_series((SELECT maxOrderID FROM MaxOrderID) + 1, (SELECT maxOrderID FROM MaxOrderID) + (SELECT MaxPersonID FROM MaxPersonID), 1),
              generate_series(1, (SELECT MaxPersonID FROM MaxPersonID), 1),
              (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
              '2022-02-25';
SELECT * FROM person_order;


CREATE VIEW v_price_with_discount AS
       SELECT p.name, pizza_name, price, CAST ((price - price * 0.1) AS INT) AS discount_price  FROM person_order
        JOIN menu ON menu.id = menu_id
        JOIN person p ON p.id = person_id
        ORDER BY 1, 2;

SELECT * FROM v_price_with_discount;
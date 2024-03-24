SELECT (SELECT p.name FROM person p WHERE p.id = po.person_id) as NAME FROM person_order po
WHERE (po.menu_id = 13 OR po.menu_id = 14 OR po.menu_id = 18) AND po.order_date = '2022-01-07';
CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);

SET ENABLE_SEQSCAN = OFF;

EXPLAIN ANALYSE
    SELECT * FROM menu
    WHERE pizza_name LIKE 's%' AND pizzeria_id < 3;
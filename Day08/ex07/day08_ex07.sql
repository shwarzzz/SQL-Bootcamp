-- Session #1 --
SHOW TRANSACTION ISOLATION LEVEL;
BEGIN;
-- Session #2 --
SHOW TRANSACTION ISOLATION LEVEL;
BEGIN;
-- Session #1 --
UPDATE pizzeria SET rating = 2.5 WHERE id = 1;
-- Session #2 --
UPDATE pizzeria SET rating = 0.8 WHERE id = 2;
-- Session #1 --
UPDATE pizzeria SET rating = 1.6 WHERE id = 2;
-- Session #2 --
UPDATE pizzeria SET rating = 0.1 WHERE id = 1;
-- Session #1 --
COMMIT;
-- Session #2 --
COMMIT;
-- Session #1 --
SELECT * FROM pizzeria;
-- Session #2 --
SELECT * FROM pizzeria;
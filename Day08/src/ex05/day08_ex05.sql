-- Session #1 --
SHOW TRANSACTION ISOLATION LEVEL;
BEGIN;
-- Session #2 --
SHOW TRANSACTION ISOLATION LEVEL;
BEGIN;
-- Session #1 --
SELECT SUM(rating) FROM pizzeria WHERE name = 'Pizza Hut';
-- Session #2 --
UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut';
COMMIT;
-- Session #1 --
SELECT SUM(rating) FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT SUM(rating) FROM pizzeria WHERE name = 'Pizza Hut';
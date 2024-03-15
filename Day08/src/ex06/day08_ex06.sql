-- Session #1 --
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;
-- Session #2 --
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;
-- Session #1 --
SELECT SUM(rating) FROM pizzeria WHERE name = 'Pizza Hut';
-- Session #2 --
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
COMMIT;
-- Session #1 --
SELECT SUM(rating) FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT SUM(rating) FROM pizzeria WHERE name = 'Pizza Hut';
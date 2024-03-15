-- Session #1 --
SHOW TRANSACTION ISOLATION LEVEL;
-- Session #2 --
SHOW TRANSACTION ISOLATION LEVEL;
-- Session #1 --
BEGIN;
-- Session #2 --
BEGIN;
-- Session #1 --
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Session #2 --
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;
-- Session #1 --
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
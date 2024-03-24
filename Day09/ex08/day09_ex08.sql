CREATE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10)
    RETURNS TABLE (
    fib_numbers integer
    ) AS $$ (
        WITH RECURSIVE find_fib AS (
            SELECT
                0 AS f_numb,
                1 AS s_numb

            UNION

            SELECT s_numb, f_numb + s_numb FROM find_fib
            WHERE s_numb < pstop
        )
        SELECT f_numb FROM find_fib);
$$ LANGUAGE sql;

SELECT * FROM fnc_fibonacci();

select * from fnc_fibonacci(100);
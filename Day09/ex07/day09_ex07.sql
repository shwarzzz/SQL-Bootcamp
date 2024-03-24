CREATE FUNCTION func_minimum(VARIADIC arr numeric[]) RETURNS numeric AS
$$ SELECT MIN(arr[i]) FROM generate_subscripts(arr, 1) AS g(i)
$$ LANGUAGE sql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
WITH allInfo AS (
    SELECT address,
       ROUND(MAX(age) - (CAST(MIN(age) AS numeric) / MAX(age)), 2) AS formula,
       ROUND(AVG(age), 2) AS average
    FROM person
    GROUP BY address
)

SELECT address,
       formula,
       average,
       CAST (CASE WHEN formula > average
           THEN true
           ELSE false END AS bool) AS comparison
FROM allInfo
ORDER BY address;
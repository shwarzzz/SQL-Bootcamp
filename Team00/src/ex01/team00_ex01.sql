WITH RECURSIVE FindWays AS (
    SELECT
        1 AS index, cost AS total_cost, point1, point2, ARRAY[point1, point2]::varchar[] as data FROM TSP
    WHERE
        point1 = 'a'

    UNION

    SELECT (index + 1) AS current_index, (total_cost + t.cost) AS total_cost, t.point1, t.point2, data || t.point2
    FROM TSP t
    JOIN FindWays fw ON t.point1 = fw.point2
    WHERE t.point2 <> ALL(data)
),
addTail AS (
    SELECT fw.total_cost + (SELECT cost FROM TSP WHERE TSP.point1 = fw.point2 AND TSP.point2 = 'a') AS total_cost,
           data || data[1] AS tour FROM FindWays fw
    WHERE index = (SELECT MAX(index) FROM FindWays)
),
exFirst AS (
    (SELECT total_cost, tour FROM addTail
            WHERE total_cost = (SELECT MIN(total_cost) FROM addTail))
        UNION
    (SELECT total_cost, tour FROM addTail
            WHERE total_cost = (SELECT MAX(total_cost) FROM addTail))
    ORDER BY 1, 2
)

SELECT * FROM exFirst;
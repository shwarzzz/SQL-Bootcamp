CREATE TABLE IF NOT EXISTS TSP
( point1 varchar not null,
  point2 varchar not null,
  cost integer not null);

INSERT INTO TSP VALUES ('a', 'b', 10);
INSERT INTO TSP VALUES ('a', 'c', 15);
INSERT INTO TSP VALUES ('a', 'd', 20);

INSERT INTO TSP VALUES ('b', 'a', 10);
INSERT INTO TSP VALUES ('b', 'c', 35);
INSERT INTO TSP VALUES ('b', 'd', 25);

INSERT INTO TSP VALUES ('c', 'a', 15);
INSERT INTO TSP VALUES ('c', 'b', 35);
INSERT INTO TSP VALUES ('c', 'd', 30);

INSERT INTO TSP VALUES ('d', 'a', 20);
INSERT INTO TSP VALUES ('d', 'b', 25);
INSERT INTO TSP VALUES ('d', 'c', 30);

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
exZero AS (
    SELECT total_cost, tour FROM addTail
    WHERE total_cost = (SELECT MIN(total_cost) FROM addTail)
    ORDER BY 1, 2
)

SELECT * FROM exZero;
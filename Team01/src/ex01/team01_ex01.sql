insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH
allLess AS (
    SELECT currency_id, balance.updated AS bupd, currency.updated AS cupd, rate_to_usd
    FROM balance
    JOIN currency ON balance.currency_id = currency.id
    AND balance.updated >= currency.updated
),
allMore AS (
    SELECT currency_id, b.updated AS bupd, rate_to_usd, currency.updated AS cupd
    FROM balance b
    JOIN currency ON b.currency_id = currency.id
    AND b.updated < currency.updated
),
getNormalData AS (
    SELECT DISTINCT
           user_id,
           currency_id,
           money,
           COALESCE((SELECT rate_to_usd FROM allLess
                    WHERE balance.currency_id = allLess.currency_id
                    AND balance.updated = bupd
                    ORDER BY cupd DESC LIMIT 1), ((SELECT rate_to_usd FROM allMore
                    WHERE balance.currency_id = allMore.currency_id
                    AND balance.updated = bupd
                    ORDER BY cupd LIMIT 1))) AS rate,
                    name AS currency_name
    FROM balance
    JOIN currency ON balance.currency_id = currency.id
)

SELECT
    COALESCE("user".name, 'not defined') AS name,
    COALESCE(lastname, 'not defined') AS lastname,
    currency_name,
    (money * rate) AS currency_in_usd
FROM "user"
FULL JOIN getNormalData ON id = user_id
WHERE currency_id IS NOT NULL
ORDER BY 1 DESC , 2, 3;
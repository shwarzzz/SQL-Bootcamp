WITH balanceSum AS (
    SELECT
        user_id,
        type,
        currency_id,
        SUM(money) AS volume
    FROM
        balance
    GROUP BY
        user_id,
        type,
        currency_id
),
lastUpdateInfo AS (
    SELECT currency.id, name, rate_to_usd AS last_rate_to_usd FROM currency
    RIGHT JOIN (SELECT cc.id, MAX(cc.updated) AS lastDate
               FROM currency cc
               GROUP BY cc.id) tmp ON tmp.id = currency.id
                                   AND tmp.lastDate = updated
),
addCurency AS (
    SELECT user_id, type, currency_id, name, volume, last_rate_to_usd
    FROM balanceSum
    FULL JOIN lastUpdateInfo ON lastUpdateInfo.id = currency_id
)

SELECT COALESCE(u.name, 'not defined') AS name,
       COALESCE(lastname, 'not defined') AS lastname,
       type,
       volume,
       COALESCE(a.name, 'not defined') AS currency_name,
       COALESCE(last_rate_to_usd, 1) AS last_rate_to_usd,
       (volume * COALESCE(last_rate_to_usd, 1)) AS total_volume_in_usd
FROM
    "user" u
FULL JOIN addCurency a ON u.id = a.user_id
ORDER BY
    1 DESC, 2, 3;
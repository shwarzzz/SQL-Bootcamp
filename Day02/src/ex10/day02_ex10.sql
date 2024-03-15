SELECT p.name AS person_name1, pp.name AS person_name2, p.address AS common_address FROM person p
CROSS JOIN person pp
WHERE pp.name <> p.name
AND p.id > pp.id
AND p.address = pp.address
ORDER BY 1, 2, 3;
USE db;

-- semi-join (subquery inside WHERE clause)
SELECT *
FROM left
WHERE a IN (
    SELECT b
    FROM right
);

-- equivalent to the previous query using JOIN and WHERE
SELECT *
FROM left
LEFT JOIN right
ON left.a = right.b
WHERE right.b IS NOT NULL;


-- anti-join (subquery inside WHERE clause)
SELECT *
FROM left
WHERE a NOT IN (
    SELECT b
    FROM right
);

-- equivalent to the previous query using JOIN and WHERE
SELECT *
FROM left
LEFT JOIN right
ON left.a = right.b
WHERE right.b IS NULL;


-- subquery inside SELECT clause
SELECT DISTINCT a,
    (SELECT COUNT(*)
     FROM right
     WHERE left.a = right.a) AS cnt_a
FROM left;

-- equivalent to the previous query using JOIN and GROUP BY
SELECT DISTINCT a, COUNT(*) AS cnt_a
FROM left
LEFT JOIN right
ON left.a = right.a
GROUP BY a


-- subquery inside FROM clause
SELECT DISTINCT a, max_b
FROM left,
    (SELECT a, Max(b) AS max_b
     FROM right
     GROUP BY a) AS sub
WHERE left.a = sub.a;

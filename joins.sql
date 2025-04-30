USE db;

-- INNER JOIN (INNER can be omitted)

-- verbose
SELECT left.id, left.a, right.a, right.b
FROM left
INNER JOIN right
ON left.id = right.id;

-- with aliasing
SELECT l.id, l.a, r.a, r.b
FROM left AS l
INNER JOIN right AS r
ON l.id = r.id;

-- when the join key has the same name in both tables (USING)
SELECT id, l.a, r.a, b
FROM left AS l
INNER JOIN right AS r
USING(id);

-- multi-table join
SELECT l.id, l.a, r.a, r.b, r2.c
FROM left AS l
INNER JOIN right AS r
ON l.id = r.id
INNER JOIN right2 AS r2
ON r.id = r2.id;

-- joining on multiple fields
SELECT *
FROM left AS l
INNER JOIN right AS r
ON l.id = r.id
	AND l.date = r.date;


-- OUTER JOINs

-- LEFT (OUTER) JOIN
SELECT *
FROM left
LEFT JOIN right
USING(id);

-- RIGHT (OUTER) JOIN
SELECT *
FROM left
RIGHT JOIN right
USING(id);

-- the previous RIGHT JOIN is equivalent to the following LEFT JOIN
SELECT *
FROM right
LEFT JOIN left
USING(id);

-- FULL (OUTER) JOIN
SELECT *
FROM left
RIGHT JOIN right
USING(id);


-- CROSS JOIN

SELECT lv, rv
FROM left
CROSS JOIN right;


-- self JOIN
SELECT
	t1.a AS a1,
    t2.a AS a2,
    t1.b AS b1,
FROM my_table AS t1
INNER JOIN my_table AS t2
ON t1.id = t2.id  -- or any other join condition
WHERE t1.a > t2.a; -- filter as needed

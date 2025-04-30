USE db;

-- UNION
SELECT *
FROM left
UNION
SELECT *
FROM right;
-- column dtypes must match

SELECT a, b
FROM left
UNION
SELECT c, d
FROM right;
-- the result fields names are taken from the first SELECT statement


-- UNION ALL (includes duplicate records)
SELECT *
FROM left
UNION ALL
SELECT *
FROM right;


-- INTERSECT 
SELECT *
FROM left
INTERSECT
SELECT *
FROM right;


-- EXCEPT
SELECT *
FROM left
EXCEPT
SELECT *
FROM right;

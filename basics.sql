USE db;

-- SELECT
SELECT *
FROM t;

SELECT a, b
FROM t;


-- aliasing
SELECT a AS alias_a
FROM t;


-- DISTINCT
SELECT DISTINCT a AS uniq_a
FROM t;


-- CREATE VIEW
CREATE VIEW my_view AS
SELECT a, b, c
FROM t;

SELECT *
FROM my_view;


-- LIMIT
SELECT *
FROM t
LIMIT 10;


-- COUNT
SELECT COUNT(*) AS cnt  -- count all rows including nulls
FROM t;

SELECT COUNT(a) AS cnt_a  -- count all rows where "a" is not null
FROM t;

SELECT COUNT(DISTINCT a) AS cnt_uniq_a  -- count unique non-null values of "a"
FROM t;


-- WHERE (filtering)
SELECT *
FROM t
WHERE a > 2 
    AND b < 2
    AND c = 12
    AND d <> 0;

SELECT *
FROM t
WHERE a LIKE 'A&'
    OR b NOT LIKE "_DA";

SELECT *
FROM t
WHERE a BETWEEN 1 AND 10;

SELECT *
FROM t
WHERE a IN (1,2,3);

SELECT *
FROM t
WHERE a IS NULL
    AND b IS NOT NULL;


-- aggregate/summary functions
SELECT
    COUNT(a) AS cnt_a,
    SUM(b) AS total_b,
    ROUND(AVG(c),2) AS avg_c,
    MIN(d) AS min_d,
    MAX(e) AS max_e
FROM t;


-- operations between fields
SELECT (a + b) AS a_plus_b
FROM t;


-- ORDER BY (sorting)
SELECT *
FROM t
ORDER BY a ASC, b DESC;

SELECT a, b
FROM t
ORDER BY c;  -- can be done but not good practice


-- GROUP BY
SELECT a, COUNT(b) AS cnt_b
FROM t
GROUP BY a;

SELECT a, b, SUM(c) AS total_c
FROM t
GROUP BY a, b
ORDER BY total_c DESC;


-- HAVING (filtering after aggregation)
SELECT a, COUNT(b) AS cnt_b
FROM t
GROUP BY a
HAVING COUNT(b) > 10;


/* all 7 keywords (SELECT, FROM, WHERE, ORDER BY, HAVING, GROUP BY, LIMIT) in
one query */
SELECT a, b, SUM(c) AS total_c
FROM t
WHERE a > 0 AND b > 0
GROUP BY a, b
HAVING SUM(c) > 1000 
ORDER BY total_c DESC
LIMIT 5;


-- keywords order of writing
-- SELECT -> FROM -> WHERE -> ORDER BY -> HAVING -> GROUP BY -> LIMIT

-- keywords order of execusion
-- FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY -> LIMIT

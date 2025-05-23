-- PostgreSQL

SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_schema = 'public';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'my_table'
  AND table_schema = 'public'

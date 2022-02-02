SELECT * FROM authors;
SELECT * FROM publishers;
SELECT * FROM royalties;
SELECT * FROM title_authors;
SELECT * FROM titles;

SELECT Department, sum(salary) FROM worker GROUP BY department;

SELECT * FROM title_authors;
SELECT au_id, SUM(royalty_share) FROM title_authors GROUP BY au_id;
SELECT au_id,SUM(distinct royalty_share) FROM title_authors GROUP BY au_id
use bookdb;
--Contact number should be stirng - best practice, Integers are for those where math operations can be done
-- select - from -  where -  group by - having - order by
SELECT * FROM authors ORDER BY au_id DESC;
SELECT lower(address) AS 'Address.lower' FROM authors ORDER BY au_id DESC;
SELECT upper(address) AS 'Address.upper' FROM authors;
SELECT address, len(address) AS 'Address.length' FROM authors;
--lef & right
SELECT LEFT(address,3) FROM authors;
--count
SELECT COUNT(address) AS 'Address.count' FROM authors;
SELECT COUNT(*) AS 'Address.count' FROM authors;
SELECT COUNT(city) AS 'Address.count' FROM authors;
--Space counts as a character
SELECT COUNT(au_fname) AS 'Address.count' FROM authors;

--distinct
SELECT COUNT(distinct(city)) AS 'Address.count' FROM authors;
SELECT COUNT(distinct(state)) AS 'Address.count' FROM authors;

SELECT * FROM publishers;
--ltrim and rtrim - to remove extra spaces from  both sides
SELECT LTRIM(address) FROM publishers;

select * FROM royalties;

--total summary,min amd max
SELECT sum(advance) as 'SUm' FROM royalties;

-- sum should be numeric
SELECT sum(*) as 'SUm' FROM royalties;

SELECT min(royalty_rate) as 'Minimum',max(royalty_rate) AS 'Maximum',AVG(royalty_rate) AS 'Average' FROM royalties;
SELECT * FROM publishers;

SELECT city, 3+2 AS number FROM publishers;

SELECT * FROM titles;
-- >> sort by type, title_name
SELECT * FROM titles WHERE price < 12 ORDER by type;
--Msg 8121, Level 16, State 1, Line 1
--Column 'titles.price' is invalid in the HAVING clause because it is not contained in either an aggregate function or the GROUP BY clause.
SELECT * FROM titles where  price > 12 GROUP BY type HAVING price > 12 ORDER by type;


SELECT type FROM titles GROUP BY type HAVING max(price) < 12;   -- ORDER by title_name;
--homework- how groups work
SELECT type FROM titles GROUP BY type HAVING min(price) < 12;   -- ORDER by title_name;

-- find titles who published in calender year
SELECT title_id FROM royalties WHERE advance BETWEEN 15000 and 20000;

SELECT title_id,title_name ,pubdate FROM titles  WHERE pubdate BETWEEN '2000-01-01' AND '2000-12-31';

SELECT au_fname, state FROM authors  where [state] NOT IN ('NY','CA');
SELECT au_fname, state FROM authors  where [state] NOT IN ('NY','CA');

-------------Joins--------------
SELECT * FROM titles;
SELECT * from authors;
SELECT * from publishers;
SELECT * FROM publishers,authors;

SELECT au_fname, a.au_lname, a.city 
FROM authors as a
INNER JOIN publishers as p
on a.city = p.city

SELECT au_fname, a.au_lname, a.city 
FROM authors as a
LEFT OUTER JOIN publishers as p
on a.city = p.city

-- will take took much time
SELECT au_fname, a.au_lname, a.city 
FROM authors AS a, publishers AS p
WHERE a.city = p.city;

-- every sql querry has a cost calculation,
SELECT * FROM titles;
SELECT * FROM publishers; 
SELECT * FROM authors;
SELECT * FROM titles;
SELECT * FROM title_authors;

--find people, titles wh
SELECT a.title_id, a.title_name, p.pub_id,p.pub_name
FROM titles as a
INNER JOIN publishers as p
ON a.pub_id = p.pub_id;

SELECT a.au_id, a.phone, b.title_id
FROM title_authors as b
INNER JOIN authors as a
ON b.au_id = a.au_id
ORDER BY a.au_id DESC;
---authors who published book with > 500 pages

SELECT t.title_id, a.au_id 
FROM titles as t
INNER JOIN title_authors as a
on t.title_id = a.title_id
where t.pages > 500
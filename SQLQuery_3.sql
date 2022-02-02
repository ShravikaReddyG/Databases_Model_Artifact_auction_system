SELECT * FROM authors;
select au_lname,phone,zip From authors WHERE state = 'CA'
    GROUP BY au_lname,phone,zip
    HAVING count (au_lname) > 0;

select au_lname,phone,zip From authors 
    GROUP BY au_lname,phone,zip
    HAVING count (au_lname) > 0;

SELECT * FROM authors;

-- authors in different zip codes and if zip code > 8500, authors name start with b

select au_lname,phone,zip From authors WHERE zip > 8500 AND au_lname like 'B%'
    GROUP BY au_lname,phone,zip
    HAVING au_lname like ('B%')


select au_lname From authors 
    GROUP BY  au_lname
    HAVING count (au_lname) > 0;

-- authors name between a nd f
SELECT * FROM authors;
select au_lname,phone,zip From authors WHERE zip > 8500 
    GROUP BY au_lname,phone,zip
    HAVING au_lname < 'I';

select au_lname,phone,zip From authors WHERE zip > 8500 
    GROUP BY au_lname,phone,zip
    HAVING au_lname BETWEEN 'A' and 'F';

select au_lname,phone,zip From authors WHERE zip > 8500 
    GROUP BY au_lname,phone,zip
    HAVING au_lname > 'B';

-- books < 100 pages but expnesive is 10$
SELECT * FROM titles;
select title_name ,type,pages,price From titles  WHERE pages < 100
    GROUP BY title_name,type,pages,price
    HAVING price > 10;

select title_name ,type,pages,price From titles  
    GROUP BY title_name,type,pages,price
    HAVING price > 10 and pages < 100;

select title_name ,type,pages,price From titles  WHERE pages < 100
    GROUP BY title_name,type,pages,price
    HAVING price > (10) AND type = 'history';

SELECT * FROM titles ;
SELECT * FROM titles WHERE pages is null;
SELECT * FROM titles WHERE sales is null;

SELECT count(*) FROM titles WHERE pages is NOT null;
SELECT count(*) FROM titles WHERE pages is  null;

SELECT top 5 * FROM titles;
SELECT top 5 * FROM titles ;
SELECT  * FROM titles OFFset 5 ROWS;


SELECT * FROM titles order by price desc OFFset 5 rows FETCH NEXT 2 rows ONLY;
------------Joins--------
SELECT * FROM publishers UNION SELECT * FROM authors; /*error*/

SELECT * FROM publishers;
SELECT * FROM authors;
--- Sould have same num of paramenters in select and same order
---Union join- two lists just merge
SELECT pub_name,city,state FROM publishers 
UNION 
SELECT au_fname,state,city FROM authors; 

SELECT pub_name,state,city FROM publishers 
UNION 
SELECT au_fname,state,city FROM authors; 

--using oreder by
SELECT pub_name,state,city FROM publishers 
UNION 
SELECT au_fname,state,city FROM authors
ORDER by state;

SELECT au_fname +' ' + au_lname as author,state,city FROM authors
UNION 
SELECT pub_name,state,city FROM publishers;

--Full join  , first selecte inner join items, left over of first table and then left over of second table
SELECT * FROM titles;
SELECT * FROM publishers;

SELECT * FROM titles AS t
FULL JOIN publishers AS P
on t.pub_id = p.pub_id;

--all authors and their books
SELECT * FROM titles;
SELECT * FROM authors;
SELECT * FROM title_authors;

SELECT au_fname,title_id FROM authors as a 
FULL OUTER JOIN title_authors as ta
on a.au_id = ta.au_id;

--titles that already paid royalties
SELECT  *  FROM titles AS t 
FULL OUTER JOIN royalties AS r 
ON t.title_id = r.title_id
WHERE r.advance > 0;

----titles that already paid royalties with publisher name
SELECT  t.title_id,t.title_name,t.pub_id,r.advance,p.pub_name FROM titles AS t 
FULL OUTER JOIN royalties AS r 
ON t.title_id = r.title_id 
INNER JOIN publishers AS p 
ON t.pub_id = p.pub_id;


--authors name and titles
SELECT au_fname,t.title_id,t.title_name FROM authors as a 
FULL OUTER JOIN title_authors as ta
on a.au_id = ta.au_id
INNER JOIN titles as t 
on t.title_id = ta.title_id;

/** My SQL will not support SELECT * FROM publishers 
natural JOIN
titles; */

--publish books in ca or outised of 'NA'
SELECT t.title_name,p.pub_name,p.[state] FROM titles AS t 
INNER JOIN publishers AS p 
ON t.pub_id = p.pub_id
WHERE p.state = 'CA' OR p.state <> 'NA'
ORDER BY t.title_name;

--list book taht each author wrote
SELECT a.au_id,a.au_fname,a.au_lname,t.title_id,t.title_name FROM authors AS a 
INNER JOIN title_authors AS ta 
ON a.au_id = ta.au_id
INNER JOIN titles as t 
ON t.title_id = ta.title_id;

--count the number of books written by author
SELECT a.au_id,a.au_fname,a.au_lname,COUNT(a.au_id) AS 'Num of Books' FROM authors AS a 
INNER JOIN title_authors AS ta 
ON a.au_id = ta.au_id
GROUP BY a.au_id,a.au_fname,a.au_lname
HAVING COUNT(a.au_id)>0;

--list advance paid by biography type books
SELECT  t.title_id,t.title_name,t.type,r.advance FROM titles AS t 
FULL OUTER JOIN royalties AS r 
ON t.title_id = r.title_id
WHERE t.type = 'biography' AND
      r.advance IS NOT NULL
ORDER by title_name asc;
    
--list the count and total advance paid for each type of book
SELECT  t.type, count(t.type) as 'Count', sum(r.advance) AS 'Total' FROM titles AS t 
FULL OUTER JOIN royalties AS r 
ON t.title_id = r.title_id
WHERE r.advance IS NOT NULL
GROUP BY type
HAVING COUNT(t.type) > 0;

--LEFT Outer joins

--find   all authorss regardless of weather a publisher is located in same city or not
SELECT * FROM authors;
SELECT * FROM publishers;

SELECT a.au_id,a.au_fname,a.au_lname,p.pub_id,p.pub_name FROM authors AS a
LEFT OUTER JOIN publishers AS p
ON a.city = p.city;

SELECT a.au_id,a.au_fname,a.au_lname,p.pub_id,p.pub_name FROM publishers AS p
LEFT OUTER JOIN authors AS a
ON a.city = p.city;

--RIGHT outer join

SELECT a.au_id,a.au_fname,a.au_lname,p.pub_id,p.pub_name FROM publishers AS p
RIGHT OUTER JOIN authors AS a
ON a.city = p.city;

SELECT a.au_id,a.au_fname,a.au_lname,p.pub_id,p.pub_name FROM authors AS a
RIGHT OUTER JOIN publishers AS p
ON a.city = p.city;

/* Recursive join, inner join with same table
    select e1.employee_name as 'employee'
    FROM employee e1
    INNER JOIN employee e2
    on e1.boss_id = e2.boss_id
*/ 

--Find most expensive book in the data base
SELECT title_id,title_name,price FROM titles
WHERE price = (SELECT MAX(price) from titles);

--list the authors who haven't wrote any book
SELECT a.au_id,a.au_fname,a.au_lname,ta.title_id FROM authors AS a 
LEFT OUTER JOIN title_authors AS ta 
ON a.au_id = ta.au_id
where ta.title_id IS NULL;

--Find authors who lives in same city as A04
SELECT * FROM authors
WHERE city = (SELECT city from authors WHERE au_id = 'A04' );
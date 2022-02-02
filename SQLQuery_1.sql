--CREATE DATABASE bookdb;
USE bookdb;
SELECT * FROM authors;

SELECT au_fname, phone FROM authors;

SELECT au_fname, phone FROM authors WHERE zip = '80303';
/* authors eho dont have first name */

SELECT * FROM authors WHERE au_fname = '';
SELECT * FROM authors WHERE au_fname is null;

-- all title names and price
SELECT title_name,price FROM titles;

--increase price by 10%
SELECT title_name, price, 1.1 * price AS MSRP_price FROM titles;

-- find the books that are less than 10% and add up 30%
SELECT title_name, (1.3 * price) AS MSRP_price FROM titles WHERE price < 10;

--Books more than 500 pages
SELECT * FROM titles WHERE pages > 500;

-- Books belong to computer
SELECT * FROM titles WHERE pages > 500 and type = 'computer';

-- bookes for childre between 10 to 100
SELECT * FROM titles WHERE pages BETWEEN 10 and 100 and type = 'children';

SELECT * FROM publishers;
SELECT * FROM publishers WHERE city = 'New York';

-- PUBLISHER NOT IN USA
SELECT * FROM publishers WHERE country  != 'USA';
SELECT * FROM publishers WHERE country  <> 'USA';

SELECT * FROM title_Authors;
SELECT * FROM authors;
SELECT * FROM titles;
SELECT * FROM publishers;
SELECT * FROM royalties;
SELECT * FROM title_authors where au_order >1;

SELECT t.au_id, t.au_order, a.au_fname FROM title_authors as t inner join authors as a on t.au_id = a.au_id where t.au_order > 1;

-- sort by type in titles
SELECT * FROM titles ORDER BY type ASC;
SELECT * FROM titles ORDER BY type DESC;

SELECT * FROM titles ORDER BY type, title_id DESC;

--how many books i sold in last month
SELECT sum(sales) AS 'Total No of Books' FROM titles;

SELECT sum(sales * price) AS 'Total Revenue' FROM titles;

--publisher not living in canada
SELECT * FROM publishers where state <> 'CA';

SELECT * FROM publishers where pub_name startswith <> 'CA';

--name start with K
SELECT * FROM authors WHERE au_fname like 'K%';
SELECT * FROM authors WHERE au_lname like 'K_____y%';



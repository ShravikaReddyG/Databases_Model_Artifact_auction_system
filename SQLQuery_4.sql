/*delete - data manipulation
drop- data definition
rename - change the name in the database
truncate - there no data but is reusable
index- sorting,
view -  taking few columns from different tables and customising them together 
*/
CREATE database my1db;

use my1db;

CREATE TABLE food (
    cheese  VARCHAR(15),
    fruit   VARCHAR(15),
    veggie  VARCHAR(15),
    color   char(15)
)
-- We cannnot drop a databse when it is in use
drop DATABASE my1db;

create INDEX color_i1 ON color;

CREATE TABLE shelf (
    cooler      Integer,
    quantity    integer,
    vendor_Id   integer  IDENTITY not NULL,
    barcode     CHAR(22) NOT NULL,
    price       INTEGER  NOT NULL,
    PRIMARY KEY(vendor_id)
)

create INDEX v_id_idx ON  shelf(vendor_Id);
DROP INDEX  v_id_idx ON shelf;

--Insert values into table
INSERT  INto food(cheese,fruit,veggie,color)
        VALUES
        ('White','apple','lettuce','green'),
        ('White','cherry',' ','purple'), 
        ('American','apple',NULL,'brown'), 
        ('American','apple','tomatoes','yellow'),
        ('Feta','mulbery','eggplant','greeen') ;

INSERT  INto food
        VALUES
        ('White','banana','lettuce','green');

SELECT * FROM food;
--Alter and Truncate
TRUNCATE TABLE food; 
DROP TABLE food;

ALTER TABLE food
    ADD price integer;

ALTER TABLE food
    MODIFY price DECIMAL;

ALTER TABLE food
    ALTER COLUMN price varchar(22);

---- primary key, identity should be on before inserting the values
SET IDENTITY_INSERT shelf ON
go
INSERT into shelf (cooler,quantity,vendor_Id,barcode,price)
    VALUES 
    (1,30,101,'ad001',50),
    (2,35,102,'ad002',100),
    (3,40,103,'ad003',150),
    (2,45,104,'ad004',200);

SET IDENTITY_INSERT shelf OFF


insert into shelf VALUES(3,50,105,'ad004',222);
--- no sql drop nd create is better, for rdbms updating is better
UPDATE food 
SET cheese = 'Milk';

UPDATE food 
SET veggie = 'carrot'
WHERE veggie IS null ;
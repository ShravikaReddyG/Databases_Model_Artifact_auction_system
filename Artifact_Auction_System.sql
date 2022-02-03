
CREATE DATABASE ARTIST_DB;
USE ARTIST_DB ;

DROP TABLE [Auction] ;
DROP TABLE [Artist] ;
DROP TABLE [Artworks] ;
DROP TABLE [Type] ;
DROP TABLE [Payment] ;
DROP TABLE [Customer] ;
DROP TABLE [Order] ;
DROP TABLE [Status] ;


--artist

CREATE TABLE [Artist] 
(
[ArtistID] Char(20),
[FName] VarChar(50),
[LastName] VarChar(50),
[EmailID] VarChar(50),
[ContactNo] Char(50),
[Age] Char(10),
[Address] Varchar(80),
PRIMARY KEY ([ArtistID])
);

CREATE INDEX [Pk] ON [Artist] ([ArtistID]);

INSERT INTO Artist VALUES('A001', 'Bobby', 'Campbell', 'bobbycampbell@gmail.com', '337-266-6271', '34', '7272 Marvin D Love Fwy, Dallas, Texas(TX), 75237');
INSERT INTO Artist VALUES('A002', 'Lori', 'Jackson', 'lorijackson@gmail.com', '787-367-0895', '30', '7061 Chapelridge Dr, Dallas, Texas(TX), 75249');
INSERT INTO Artist VALUES('A003', 'Patty', 'Barber', 'pattybarber@gmail.com', '989-437-7000', '29', '7304 Little Canyon Rd, Dallas, Texas(TX), 75249');
INSERT INTO Artist VALUES('A004', 'Miranda', 'Hampton', 'mirandahampton@gmail.com', '810-593-4072', '41', '7418 Piedmont Dr, Dallas, Texas(TX), 75227');
INSERT INTO Artist VALUES('A005', 'George', 'Gibson', 'georgegibson@gmail.com', '901-319-7427', '32', '1636 Meadow Valley Ln, Dallas, Texas(TX), 75232');
INSERT INTO Artist VALUES('A006', 'Clinton', 'Mont', 'clintonmont@gmail.com', '207-354-7832', '27', '1143 Woodmeadow Pky #6, Dallas, Texas(TX), 75228');
INSERT INTO Artist VALUES('A007', 'Felix', 'Hogan', 'felixhogan@gmail.com', '612-559-3066', '29', '1001 Ross Ave, Dallas, Texas(TX), 75202');
INSERT INTO Artist VALUES('A008', 'Mona', 'Cole', 'monacole@gmail.com', '609-217-0856', '32', '10323 Woodlot Dr, Dallas, Texas(TX), 75217');
INSERT INTO Artist VALUES('A009', 'Sam', 'Kim', 'samkim@gmail.com', '972-291-1271', '25', '1234 Adelaide Dr, Dallas, Texas(TX), 75216');
INSERT INTO Artist VALUES('A010', 'John', 'Vaughn', 'johnvaughn@gmail.com', '413-759-0667', '35', '275 Market St, Dallas, Texas(TX), 75065');

SELECT * FROM Artist ;


---artworks

CREATE TABLE [Artworks] 
(

[ArtworkID] Char(20),

[AName] VarChar(50),

[Min _cost] Integer,

[ArtworkStatus] Char(50),

PRIMARY KEY ([ArtworkID])

);

INSERT INTO Artworks VALUES('ART1', 'Monalisa', $1000, 'Available');
INSERT INTO Artworks VALUES('ART2', 'Picasso', $1500, 'Sold-out');
INSERT INTO Artworks VALUES('ART3', 'Covid Theme', $2000, 'Available');
INSERT INTO Artworks VALUES('ART4', 'The Starry Night', $2500, 'Sold-out');
INSERT INTO Artworks VALUES('ART5', 'American Gothic', $500, 'Available');
INSERT INTO Artworks VALUES('ART6', 'Sunrise', $3500, 'Available');
INSERT INTO Artworks VALUES('ART7', 'Sunset', $3500, 'Available');
INSERT INTO Artworks VALUES('ART8', 'Greenery', $1000, 'Sold-out');
INSERT INTO Artworks VALUES('ART9', 'Ocean', $2000, 'Sold-out');
INSERT INTO Artworks VALUES('ART10', 'Calligraphy', $500, 'Sold-out');


SELECT * FROM Artworks ;


--type

CREATE TABLE [Type] (

[TypeID] Char(20),

[Type] Varchar(50),

PRIMARY KEY ([TypeID])

);

INSERT INTO Type VALUES('T001','Oil Painting')
INSERT INTO Type VALUES('T002','Canvas Painting')
INSERT INTO Type VALUES('T003','Pencil Sketch')
INSERT INTO Type VALUES('T004','Handloom')
INSERT INTO Type VALUES('T005','Water Painting')
INSERT INTO Type VALUES('T008','Pottery')

SELECT * FROM [Type];


---Payment


CREATE TABLE [Payment] 
(
 PaymentID Char(20),
 Method Varchar(25),
 CONSTRAINT pk_payid PRIMARY KEY (PaymentID)
);
 

 
INSERT INTO Payment VALUES('P001', 'Debit/Credit card');
INSERT INTO Payment VALUES('P002', 'Check');
INSERT INTO Payment VALUES('P003', 'Paypal');
INSERT INTO Payment VALUES('P004', 'Cash');
 
SELECT * FROM Payment;

---customer



CREATE TABLE [Customer] 
(
[CustomerID] Char(20),
[FName] VarChar(50),
[LastName] VarChar(50),
[EmailID] VarChar(50),
[ContactNo] Char(20),
[Age] Char(10),
[Address] Varchar(80),
CONSTRAINT pk_custid PRIMARY KEY (CustomerID)
);

INSERT INTO customer VALUES('C0001', 'Mellanie', 'Garcias', 'Mellanie@utd.com', '453-3467-7890', '25', '7122,Mimosa Road,Dallas,Texas(TX),75671')
INSERT INTO customer VALUES('C0002', 'Hector', 'Sharma', 'Hector@utd.com', '453-3467-7891', '29', '2345 Royal Ln, Irving, TX, 75068')
INSERT INTO customer VALUES('C0003', 'Zakhir', 'Hussain', 'Zakhir@utd.com', '453-3467-7892', '28', '2567 W campbell Rd, Dallas, TX, 75063')
INSERT INTO customer VALUES('C0004', 'Mathew', 'Rich', 'Mathew@cust.com', '453-3467-7893', '27', '56 E Dallas St, San Antonio, TX, 65789')
INSERT INTO customer VALUES('C0005', 'Bob', 'Brown', 'Bob@cust.com', '453-3467-7894', '26', '3456 Main Street, Houston, TX, 67489')
INSERT INTO customer VALUES('C0006', 'Thomas', 'Williams', 'Thomas@cust.com', '453-3467-7895', '25', '25 Rachin boulvd, Newark, NJ, 45939')
INSERT INTO customer VALUES('C0007', 'Mary', 'Miller', 'Oswald@cust.com', '453-3467-7896', '24', '4564 Bush Blvd, Edison, NJ, 45978')
INSERT INTO customer VALUES('C0008', 'Sarah', 'Hayden', 'Sarah@cust.com', '453-3467-7897', '23','30th Street, New York, NY, 35487');
INSERT INTO customer VALUES('C0009', 'Monty', 'Yadav', 'Monty@cust.com', '453-3467-7898', '22', '345 W Evans St, Las Vegas, NV, 64923')
INSERT INTO customer VALUES('C0010', 'Alex', 'Smith', 'Alex@@cust.com', '453-3467-7899', '25', '67th peir, OklohomaCity, OK, 56734')

SELECT * FROM Customer ;



---Order

CREATE TABLE [Order] 
(
 [OrderID] Char(10),
 [Status] Char(10),
 CONSTRAINT pk_order PRIMARY KEY(OrderID)
);
 
INSERT INTO [Order] VALUES('O001','Paid');
INSERT INTO [Order] VALUES('O002','Paid')
INSERT INTO [Order] VALUES('O003','Paid')
INSERT INTO [Order] VALUES('O004','UnPaid')
INSERT INTO [Order] VALUES('O005','Paid')
 
SELECT * FROM [Order];


--Status

CREATE TABLE [Status] 
(
 [AuctionStatusID] Char(20),
 [StatusDesc] Char(20),
 CONSTRAINT pk_status PRIMARY KEY (AuctionStatusID)
);


INSERT INTO [status] VALUES('AU001', 'Accepted');
INSERT INTO [status] VALUES('AU002', 'In-Progress');
INSERT INTO [status] VALUES('AU003', 'Rejected');
 
SELECT * FROM [status];

--Auction

DROP TABLE Auction ;

CREATE TABLE [Auction] (

[AuctionID] Char(20),

[CustomerID] Char(20),

[Min_cost] Integer,

[CustomerBid] Integer,

[Date] Date,

[Time] VARCHAR(50),

[AuctionStatusID] Char(20),

[ArtistID] Char(20),

[ArtworkID] Char(20),

[TypeID] Char(20),

[PaymentID] Char(20),

[OrderID] Char(10),
PRIMARY KEY (AuctionID),

CONSTRAINT artist_fk1
   FOREIGN KEY (ArtistID)
    REFERENCES Artist(ArtistID),
CONSTRAINT artwork_fk2
   FOREIGN KEY (ArtworkID)
    REFERENCES Artworks(ArtworkID),
CONSTRAINT type_fk3
   FOREIGN KEY (TypeID)
    REFERENCES Type(TypeID),
CONSTRAINT auctionstatus_fk6
   FOREIGN KEY (AuctionStatusID)
    REFERENCES [Status](AuctionStatusID),
CONSTRAINT cust_fk7
   FOREIGN KEY (CustomerID)
    REFERENCES Customer(CustomerID)

);

CREATE INDEX [Pk] ON [Auction] ([AuctionID]);

CREATE INDEX [Fk] ON [Auction] ([CustomerID], [AuctionStatusID], [ArtworkID], [TypeID], [PaymentID], [OrderID]);

SELECT * FROM Auction ;

INSERT INTO Auction VALUES('AUC01','C0001',$1000,$1500,'5-4-2020','11:00 AM','AU002','A001','ART1','T001', ' ', ' ')
INSERT INTO Auction VALUES('AUC02','C0001',$1500,$1800,'6-4-2020','23:00 PM','AU001','A001','ART2','T001','P001','O001')
INSERT INTO Auction VALUES('AUC03','C0002',$2000,$2500,'7-4-2020','10:00 AM','AU002','A002','ART3','T002',' ',' ')
INSERT INTO Auction VALUES('AUC04','C0003',$2500,$2700,'8-4-2020','00:00 AM','AU001','A007','ART4','T002','P001','O002')
INSERT INTO Auction VALUES('AUC05','C0004',$500,$700,'9-4-2020','18:00 PM','AU002','A008','ART5','T003',' ',' ')
INSERT INTO Auction VALUES('AUC06','C0004',$3500,$3600,'10-4-2020','19:00 PM','AU002','A003','ART6','T008',' ',' ')
INSERT INTO Auction VALUES('AUC07','C0005',$3500,$3700,'11-4-2020','17:00 PM','AU002','A004','ART7','T004',' ',' ')
INSERT INTO Auction VALUES('AUC08','C0005',$1000,$1500,'11-4-2020','14:00 PM','AU001','A005','ART8','T004','P003','O003')
INSERT INTO Auction VALUES('AUC09','C0006',$2500,$2600,'10-4-2020','21:00 PM','AU003','A007','ART4','T002',' ',' ')
INSERT INTO Auction VALUES('AUC10','C0006',$500,$800,'11-4-2020','7:00 AM','AU001','A006','ART10','T005','P004','O004')
INSERT INTO Auction VALUES('AUC11','C0007',$500,$800,'11-4-2020','7:00 AM','AU003','A006','ART10','T005',' ',' ')
INSERT INTO Auction VALUES('AUC12','C0007',$2000,$2500,'7-4-2020','20:00 PM','AU001','A007','ART9','T004','P002','O005')
INSERT INTO Auction VALUES('AUC13','C0008',$2000,$2500,'7-4-2020','08:00 AM','AU002','A002','ART3','T002',' ',' ')
INSERT INTO Auction VALUES('AUC14','C0008',$2500,$2600,'9-4-2020','21:00 PM','AU003','A007','ART4','T002',' ',' ')
INSERT INTO Auction VALUES('AUC15','C0008',$500,$800,'6-4-2020','9:00 AM','AU002','A008','ART5','T003',' ',' ')
INSERT INTO Auction VALUES('AUC16','C0009',$3500,$3600,'2-4-2020','7:00 AM','AU002','A003','ART6','T008',' ',' ')
INSERT INTO Auction VALUES('AUC17','C0009',$3500,$3550,'3-4-2020','16:00 PM','AU002','A004','ART7','T004',' ',' ')
INSERT INTO Auction VALUES('AUC18','C0010',$2000,$2100,'9-4-2020','3:00 AM','AU002','A002','ART3','T002',' ',' ')
INSERT INTO Auction VALUES('AUC19','C0010',$2500,$2600,'3-4-2020','15:00 PM','AU003','A007','ART4','T002',' ',' ')
INSERT INTO Auction VALUES('AUC20','C0010',$500,$600,'2-4-2020','14:00 PM','AU002','A008','ART5','T003',' ',' ')


SELECT * FROM Auction;


--Inner join


SELECT DISTINCT Artist.FName, Artist.LastName, Auction.ArtworkID, Artworks.AName
    From Artist INNER JOIN Auction
    ON Artist.ArtistID = Auction.ArtistID
    INNER JOIN Artworks 
    ON Artworks.ArtworkID = Auction.ArtworkID;




--Full join

SELECT Auction.AuctionID, [Status].StatusDesc, Auction.CustomerID
FROM Auction FULL OUTER JOIN [Status]
ON Auction.AuctionStatusID = [Status].AuctionStatusID ;




---Left outer join

SELECT Auction.AuctionID, Auction.ArtworkID, [Type].Type
FROM Auction LEFT OUTER JOIN [Type]
ON Auction.TypeID = [Type].TypeID ;

---Right outer join

SELECT Auction.ArtworkID, Artworks.AName, Artworks.[Min _cost], Auction.CustomerBid, Auction.CustomerID
FROM Auction RIGHT OUTER JOIN Artworks
ON Auction.ArtworkID = Artworks.ArtworkID ;

---intersect

SELECT Auction.CustomerID FROM Auction
WHERE Auction.CustomerBid > 3000
INTERSECT
SELECT Customer.CustomerID FROM Customer ;


----UNION


SELECT Artist.FName, Artist.LastName FROM Artist
WHERE Artist.FName LIKE 'S%'
UNION
SELECT Customer.FName, Customer.LastName from Customer 
WHERE Customer.FName LIKE 'S%';

---Except

SELECT Customer.CustomerID FROM Customer
EXCEPT
SELECT Auction.CustomerID FROM Auction
WHERE Auction.OrderID LIKE 'O00%' ;







 





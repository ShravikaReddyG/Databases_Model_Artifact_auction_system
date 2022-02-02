--Create and use database
--CREATE DATABASE chessdb;
USE chessdb;

--Create Address table
/**88CREATE TABLE address
    (
        zipcode INTEGER NOT NULL,
        city    VARCHAR(20),
        state   CHAR(20),
        CONSTRAINT  pk_zipcode PRIMARY KEY (zipcode)   
    );**/


--CREATE club table
DROP TABLE club;
CREATE TABLE club
    (
        clubid      CHAR(5) NOT NULL,
        name        VARCHAR(20) NOT NULL,
        clubaddr    VARCHAR(50),
        clubemail   VARCHAR(50) NOT NULL,
        TotalPlayers INTEGER NOT NULL,
        CONSTRAINT pk_clubid PRIMARY KEY (clubid),
    );

INSERT INTO club('C0001',	'Richardson Royal Club	2525 Raleigh Dr, Richardson, TX, 75080','Richardson@awc.com','3')

--create sponser table
CREATE TABLE sponser
  (
    sponserID     CHAR(10)  NOT NULL,
    fname         VARCHAR(20) NOT NULL,
    lastname      VARCHAR(20) NOT NULL,
    emailID       VARCHAR(50)         ,
    contactno     CHAR(12)     NOT NULL,    
    Address       VARCHAR(20),
    CONSTRAINT pk_sid PRIMARY KEY (sponserID),
  );

--create table mentioning which sponser gives amount to which club
DROP club_sponser;
CREATE TABLE club_sponser
    (
        sponserID   CHAR(10)  NOT NULL,
        clubid      CHAR(5)   NOT NULL,
        amount      INTEGER   NOT NULL,
        CONSTRAINT pk_scid PRIMARY KEY (sponserID,clubid),
        CONSTRAINT fk_sid_cs FOREIGN KEY (sponserID) REFERENCES sponser(sponserID),
        CONSTRAINT fk_cid_cs FOREIGN KEY (clubid) REFERENCES club(clubid)
    );

--create score table for every player
DROP TABLE score;
CREATE TABLE score
    (
        scoreID INTEGER not NULL,
        totalgames  INTEGER,
        gameswon    INTEGER,
        gamesdraw   INTEGER,
        totalscore  INTEGER,
        CONSTRAINT pk_score PRIMARY KEY (scoreID)
    )

--Create Player table
DROP TABLE player;
DROP TABLE player;
CREATE TABLE player
   (
        ParticipationID CHAR(10)  NOT NULL,
        Fname         VARCHAR(20) NOT NULL,
        lastname      VARCHAR(20) NOT NULL,
        EmailID       VARCHAR(50)         ,
        Contactno     CHAR(12)     NOT NULL,    
        MembershipID  CHAR(5)     NOT NULL,
        ClubID        CHAR(5)     NOT NULL,
        scoreID       INTEGER ,    
        Rank          INTEGER ,            
        CONSTRAINT pk_pid PRIMARY KEY (ParticipationID),
        CONSTRAINT fk_cid_p FOREIGN KEY (clubid) REFERENCES club(clubid),
        CONSTRAINT fk_score_p FOREIGN KEY (scoreID) REFERENCES score(scoreID)
   );

---game status
CREATE TABLE status
    (
        statusID INTEGER NOT NULL,
        statusname CHAR(20) NOT NULL,
        CONSTRAINT pk_status PRIMARY KEY (statusID)   
    );

---create rounds f it is first round or secound round
CREATE TABLE rounds
    (
        roundID INTEGER,
        roundname CHAR(20),
        CONSTRAINT pk_round PRIMARY KEY (roundID)
    );
---create referee table
CREATE TABLE referee
    (
        refereeID CHAR(10)  NOT NULL,
        Fname         VARCHAR(20) NOT NULL,
        lastname      VARCHAR(20) NOT NULL,
        EmailID       VARCHAR(50)         ,
        Contact       CHAR(12)     NOT NULL,
        totalgames    INTEGER,
        CONSTRAINT pk_referee PRIMARY KEY(refereeID)
    )
--create game details
create TABLE game_details
    (
        gameno INTEGER NOT NULL,
        roundID INTEGER,
        refereeID CHAR(10),
        CONSTRAINT pk_gameno PRIMARY KEY(gameno),
        CONSTRAINT fk_referee_gd FOREIGN KEY (refereeID) references referee(refereeID)
    );

--create games
CREATE TABLE games
    (
        ParticipationID CHAR(10)  NOT NULL,
        gameno INTEGER NOT NULL,
        statusID INTEGER NOT NULL,
        CONSTRAINT pk_g PRIMARY KEY (ParticipationID,gameno),
        CONSTRAINT fk_pid_g FOREIGN KEY (ParticipationID) REFERENCES player(ParticipationID),
        CONSTRAINT fk_gameno FOREIGN KEY (gameno)  REFERENCES game_details(gameno),
        CONSTRAINT fk_status_g FOREIGN KEY (statusID) REFERENCES Status(statusID),
    );

---customer
CREATE TABLE [Customer] 
(
  [CustomerID] Char(10),
  [FName]      VarChar(20),
  [LastName]   VarChar(20),
  [EmailID]    VarChar(20),
  [ContactNo]  Char(12),
  [Age]        Char(5),
  [Address]    Varchar(20),
  CONSTRAINT pk_custid PRIMARY KEY (CustomerID)
);

INSERT INTO customer VALUES('C0001',	'Mellanie',	'Garcias',	'Mellanie@utd.com',	'453-3467-7890',	'25	7122,Mimosa Road,Dallas,Texas(TX),75671')
INSERT INTO customer VALUES('C0002',    'Hector',	'Sharma',	'Hector@utd.com',	'453-3467-7891',	'29	2345 Royal Ln, Irving, TX, 75068')
INSERT INTO customer VALUES('C0003',	'Zakhir',	'Hussain',	'Zakhir@utd.com',	'453-3467-7892',	'28	2567 W campbell Rd, Dallas, TX, 75063')
INSERT INTO customer VALUES('C0004',	'Mathew',	'Rich',	    'Mathew@cust.com',	'453-3467-7893',	'27	56 E Dallas St, San Antonio, TX, 65789')
INSERT INTO customer VALUES('C0005',	'Bob',	    'Brown',	'Bob@cust.com',	    '453-3467-7894',	'26	3456 Main Street, Houston, TX, 67489')
INSERT INTO customer VALUES('C0006',	'Thomas',	'Williams',	'Thomas@cust.com',	'453-3467-7895',	'25	25 Rachin boulvd, Newark, NJ, 45939')
INSERT INTO customer VALUES('C0007',	'Mary',	    'Miller',	'Oswald@cust.com',	'453-3467-7896',	'24	4564 Bush Blvd, Edison, NJ, 45978')
INSERT INTO customer VALUES('C0009',	'Monty',	'Yadav',	'Monty@cust.com',	'453-3467-7898',	'22	345 W Evans St, Las Vegas, NV, 64923')
INSERT INTO customer VALUES('C0010',	'Alex', 	'Smith',	'Alex@@cust.com',	'453-3467-7899',	'25	67th peir, OklohomaCity, OK, 56734')

INSERT INTO customer VALUES('C0008,',	'Sarah',	'Hayden',	'Sarah@cust.com',	'453-3467-7897',	'23','30th Street, New York, NY, 35487');


--Status
CREATE TABLE [Status] 
(
  [AuctionStatusID] Char(10),
  [StatusDesc] Char(10),
  CONSTRAINT pk_status PRIMARY KEY (AuctionStatusID)
);
INSERT INTO [status] VALUES('AU001',	'Accepted');
INSERT INTO [status] VALUES('AU002',	'In-Progress');
INSERT INTO [status] VALUES('AU003',	'Rejected');

SELECT * FROM [status];

---Order
CREATE TABLE [Order] 
(
  [OrderID] Char(10),
  [Status] Char(10),
  CONSTRAINT pk_order PRIMARY KEY(OrderID)
);

INSERT  INTO [Order] VALUES('O001','Paid');
INSERT  INTO [Order] VALUES('O002','Paid')
INSERT  INTO [Order] VALUES('O003','Paid')
INSERT  INTO [Order] VALUES('O004','UnPaid')
INSERT  INTO [Order] VALUES('O005','Paid')

SELECT * FROM [Order];

CREATE TABLE Payment 
(
  PaymentID Char(10),
  Method Varchar(25),
  CONSTRAINT pk_payid  PRIMARY KEY (PaymentID)
);

INSERT INTO Payment VALUES('P001',	'Debit/Credit card')
INSERT INTO Payment VALUES('P002',	'Check')
INSERT INTO Payment VALUES('P003',	'Paypal')
INSERT INTO Payment VALUES('P004',	'Cash')

SELECT * FROM Payment;
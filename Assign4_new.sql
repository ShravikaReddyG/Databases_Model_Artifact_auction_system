CREATE DATABASE chessdb_2;
USE chessdb_2;

DROP TABLE club;

--CREATE club table
CREATE TABLE club
    (
        clubid      CHAR(5) NOT NULL,
        name        VARCHAR(50) NOT NULL,
        clubaddr    VARCHAR(80),
        clubemail   VARCHAR(50) NOT NULL,
        TotalPlayers INTEGER NOT NULL,
        CONSTRAINT pk_clubid PRIMARY KEY (clubid),
    );

INSERT INTO club values('C0001',	'Richardson Royal Club',	'2525 Raleigh Dr, Richardson, TX, 75080', 'Richardson@awc.com',3);
INSERT INTO club VALUES('C0002',	'Irving Platinum Club',	    '2345 Royal Ln, Irving, TX, 75068',	      'Irving@awc.com',	6);
INSERT INTO club VALUES('C0003',    'Dallas Silver Club',	    '2345 Royal Ln, Dallas, TX, 75068',         'Irving@awc.com', 6)
INSERT INTO club VALUES('C0004',	'San Antonio Titans Club', 	'56 E Dallas St, San Antonio, TX,65789','San.Antonio@awc.com',	8)
INSERT INTO club VALUES('C0005',    'Houston Lions Club',	    '3456 Main Street, Houston, TX, 67489',   'Houston@awc.com',	2);
INSERT INTO club VALUES('C0006',	'Newark Liiter Club',	    '25 Rachin boulvd, Newark, NJ, 45939',	  'Newark@awc.com',	4)


SELECT * FROM club;

--Create Sponser table
--Drop sponser table;
CREATE TABLE sponser
  (
    sponserID     CHAR(10)  NOT NULL,
    fname         VARCHAR(20) NOT NULL,
    lastname      VARCHAR(20) NOT NULL,
    emailID       VARCHAR(50)         ,
    contactno     CHAR(12)     NOT NULL,    
    Address       VARCHAR(50),
    CONSTRAINT pk_sid PRIMARY KEY (sponserID)
  );

INSERT INTO sponser VALUES('s0001', 'Akhila',' ','Akhila@ipm.com',	'459-357-7890',	'2525 Raleigh Dr, Richardson, TX, 75080');
INSERT INTO sponser VALUES('s0003',	'Ankit',	'M',	'Ankit@ipm.com',	'459-357-7892',	'2567 W campbell Rd, Dallas, TX, 75063');
INSERT INTO sponser VALUES('s0005',	'Aprajita',	'verma',	'Aprajita@ipm.com',	'459-357-7894',	'3456 Main Street, Houston, TX, 67489');
INSERT INTO sponser VALUES('s0002',	'Apoorva',	'Reddy',	'Apoorva@ipm.com',	'459-357-7891',	'2345 Royal Ln, Irving, TX, 75068');
INSERT INTO sponser VALUES('s0004',	'Sireesha',	'PP',	'Sireesha@ipm.com',	'459-357-7893',	'2346 Royal Ln, Irving, TX, 75068');
INSERT INTO sponser VALUES('s0009', 'Vikas',	'p',	'Vikas@ipm.com',	'459-357-7898',	'345 W Evans St, Las Vegas, NV, 64923');
INSERT INTO sponser VALUES('s0010',	'Sri','',	'Sri@ipm.com',	'459-357-7899',	'67th peir, OklohomaCity, OK, 56734');
INSERT INTO sponser VALUES('s0011',	'Srlakshmi','', 'Srlakshmi@ipm.com',	'459-357-7900',	'786 W Market Blvd, Kansas City, KS, 78650');
INSERT INTO sponser VALUES('s0012',	'Alan',	'das',	'Alan@ipm.com',	'459-357-7901',	'600 N Debrik Dr, Alexandria, AL, 98709');
INSERT INTO sponser VALUES('s0013',	'Pinky',	'reddy',	'Pinky@ipm.com',	'459-357-7902',	'90 Royal W Lane, San Deigo CA, 76543');
INSERT INTO sponser VALUES('s0014',	'satya',	'Dev',	'satya@ipm.com',	'459-357-7903',	'635 Erie Dr, Philadelphia, PA, 65489');
INSERT INTO sponser VALUES('s0015',	'Vishnu',	'Teja',	'Vishnu@ipm.com',	'459-357-7904',	'786 Royal Venkat St, Pittsburg, PA, 56789');

SELECT * FROM sponser;


---create referee table
drop TABLE referee;
CREATE TABLE referee
    (
        refereeID CHAR(10)  NOT NULL,
        Fname         VARCHAR(20) NOT NULL,
        lastname      VARCHAR(20) NOT NULL,
        EmailID       VARCHAR(50)         ,
        Contact       CHAR(12)     NOT NULL,
        totalgames    INTEGER,
        CONSTRAINT pk_referee PRIMARY KEY(refereeID)
    );
INSERT INTO referee VALUES('R0001',	'Hanna',	'PP',	'Hanna@rid.com',	'353-678-9876',	2);
INSERT INTO referee VALUES('R0002',	'Jules',	'verma',	'Jules@rid.com',	'353-678-9877',	2);
INSERT INTO referee VALUES('R0003',	'Sandy',	'Mittal',	'Sandy@rid.com',	'353-678-9878',	7);
INSERT INTO referee VALUES('R0004',	'rosy',	    'Vikram',	'rosy@rid.com',	'353-678-9879',	3);
INSERT INTO referee VALUES('R0005',	'pooja',	'Kumar',	'pooja@rid.com',	'353-678-9880',	4);
INSERT INTO referee VALUES('R0006',	'teja',	    'p',	'teja@rid.com',	'353-678-9881',	5);
INSERT INTO referee VALUES('R0007',	'Roy',	'Kumar',	'Roy@rid.com',	'353-678-9882',	2);
INSERT INTO referee VALUES('R0008',	'Ben',	'Mallela',	'Ben@rid.com',	'353-678-9883',	2);
INSERT INTO referee VALUES('R0009',	'Ross',	'Puli',	'Ross@rid.com',	'353-678-9884',	7);

SELECT * FROM referee;


--- status of the game
drop TABLE status;
CREATE TABLE status
    (
        statusID VARCHAR(10) NOT NULL,
        statusname CHAR(20) NOT NULL,
        CONSTRAINT pk_status PRIMARY KEY (statusID)   
    );

INSERT INTO status VALUES('St001',	'Won');
INSERT INTO status VALUES('St002',	'Lost');

SELECT * from [status];

--Gameno and referee
DROP TABLE game_details;
CREATE TABLE game_details
    (
        gameno INTEGER,
        refereeID   CHAR(10),
        CONSTRAINT pk_gameno PRIMARY KEY(gameno),
        CONSTRAINT fk_referee_g FOREIGN KEY (refereeID) references referee(refereeID)

    );

INSERT INTO game_details VALUES(1,'R0001');
INSERT INTO game_details VALUES(11,'R0001');
INSERT INTO game_details VALUES(17,'R0001');
INSERT INTO game_details VALUES(2,'R0002')
INSERT INTO game_details VALUES(9,'R0002')
INSERT INTO game_details VALUES(3,'R0003')
INSERT INTO game_details VALUES(8,'R0003')
INSERT INTO game_details VALUES(10,'R0003')
INSERT INTO game_details VALUES(4,'R0004')
INSERT INTO game_details VALUES(13,'R0004')
INSERT INTO game_details VALUES(14,'R0004')
INSERT INTO game_details VALUES(24,'R0005')
INSERT INTO game_details VALUES(5,'R0005')
INSERT INTO game_details VALUES(6,'R0006')
INSERT INTO game_details VALUES(7,'R0007')
INSERT INTO game_details VALUES(23,'R0002')
INSERT INTO game_details VALUES(34,'R0006')

SELECT * FROM game_details;



--create table player
DROP TABLE player;
CREATE TABLE [Player] 
    (
        [ParticipationID] Char(10),
        [FName]           VarChar(20),
        [LastName]      VarChar(20),
        [EmailID]       VarChar(20),
        [ContactNo]     Char(12),
        [MembershipID]  Char(5),
        [Rank]          Integer,
        [Totalgames]    Integer,
        [GamesWon]      Integer,
        [clubID]        CHAR(5),
        CONSTRAINT pk_pid PRIMARY KEY (ParticipationID),
        CONSTRAINT fk_cid_p FOREIGN KEY (clubid) REFERENCES club(clubid),
    );


INSERT INTO Player VALUES('P0001',	'Alisha',	'Das',	    'Alisha@gmail.com',	    '4693534249',	'M0001',	1,	12,	12,	'C0001');
INSERT INTO Player VALUES('P0002',	'Akhil',	'Reddy',	'Akhil@gmail.com',	    '4693534250',	'M0002',	2,	12,	11,	'C0001')
INSERT INTO Player VALUES('P0003',	'Cindy',	'Wen',	    'Cindy@gmail.com',	    '4693534251',	'M0003',	3,	12,	10,	'C0001')
INSERT INTO Player VALUES('P0004',	'Pavan',	'kalyan',	'Pavan@gmail.com',	    '4693534252',	'M0004',	4,	12,	9,	'C0001')
INSERT INTO Player VALUES('P0005',	'Mahesh',	'babu',	    'Mahesh@gmail.com',	    '4693534253',	'M0005',	5,	12,	8,	'C0002')
INSERT INTO Player VALUES('P0006',	'Ravi',	    'teja',	    'Ravi@gmail.com',	    '4693534254',	'M0006',	6,	12,	7,	'C0002')
INSERT INTO Player VALUES('P0007',	'Ram',	    'Charan',	'Ram@gmail.com',	    '4693534255',	'M0007',	7,	12,	6,	'C0002')
INSERT INTO Player VALUES('P0008',	'Allu',	    'Arjun',	'Allu@gmail.com',	    '4693534256',	'M0008',	8,	12,	6,	'C0002')
INSERT INTO Player VALUES('P0009',	'Guiseppe',	'Boticello','Guiseppe@gmail.com',	'4693534257',	'M0009',	9,	11,	5,	'C0003')
INSERT INTO Player VALUES('P0010',	'Mariana',	'ann',	    'Mariana@gmail.com',	'4693534258',	'M0010',	10,	11,	5,	'C0003')
INSERT INTO Player VALUES('P0011',	'Pavan',	'Kumar',	'Pavan@gmail.com',	    '4693534259',	'M0011',	11,	11,	5,	'C0003')
INSERT INTO Player VALUES('P0012',	'Madhuri',	'Mallela',	'Madhuri@gmail.com',	'4693534260',	'M0012',	12,	11,	4,	'C0004')
INSERT INTO Player VALUES('P0013',	'Praths',	'Puli',	    'Praths@gmail.com',	    '4693534261',	'M0013',	13,	11,	4,	'C0004')
INSERT INTO Player VALUES('P0014',	'kalyani',	'Mogali',	'kalyani@gmail.com',	'4693534262',	'M0014',	14,	11,	4,	'C0004')
INSERT INTO Player VALUES('P0015',	'Kavya',	'pakala',	'Kavya@gmail.com',	    '4693534263',	'M0015',	15,	11,	4,	'C0005')
INSERT INTO Player VALUES('P0016',	'Arthy',	'reddy',	'Arthy@gmail.com',	    '4693534264',	'M0016',	16,	10,	3,	'C0005')
INSERT INTO Player VALUES('P0017',	'Bobby',	'Reddy',	'Bobby@gmail.com',	    '4693534265',	'M0017',	17,	10,	2,	'C0005')
INSERT INTO Player VALUES('P0018',	'Pinky',	'singh',	'Pinky@gmail.com',	    '4693534266',	'M0018',	18,	10,	1,	'C0006')
INSERT INTO Player VALUES('P0019',	'Anusha',	'patil',	'Anusha@gmail.com',	    '4693534267',	'M0019',	19,	10,	1,	'C0006')
INSERT INTO Player VALUES('P0020',	'Prithvi', 	'raj',	    'Prithvi@gmail.com',	'4693534268',	'M0020',	20,	10,	1,	'C0006')

SELECT * FROM Player;


--create table mentioning which sponser gives amount to which club
--DROP TABLE club_sponser;
CREATE TABLE club_sponser
    (
        clubID      CHAR(5)   NOT NULL,
        sponserID   CHAR(10)  NOT NULL,
        amount      INTEGER   NOT NULL,
        CONSTRAINT pk_scid PRIMARY KEY (sponserID,clubid),
        CONSTRAINT fk_sid_cs FOREIGN KEY (sponserID) REFERENCES sponser(sponserID)
    );


INSERT INTO club_sponser VALUES('C0001',	's0001',	25000);
INSERT INTO club_sponser VALUES('C0002',	's0005',	10000);
INSERT INTO club_sponser VALUES('C0002',	's0001',	20005);
INSERT INTO club_sponser VALUES('C0002',	's0002',	20006);
INSERT INTO club_sponser VALUES('C0002',	's0004',	31000);
INSERT INTO club_sponser VALUES('C0003',	's0003',	31200);
INSERT INTO club_sponser VALUES('C0003',	's0002',	31400);
INSERT INTO club_sponser VALUES('C0003',	's0001',	31600);
INSERT INTO club_sponser VALUES('C0004',	's0003',	31800);
INSERT INTO club_sponser VALUES('C0004',	's0002',	32000);
INSERT INTO club_sponser VALUES('C0004',	's0009',	43000);
INSERT INTO club_sponser VALUES('C0005',	's0010',	42000);
INSERT INTO club_sponser VALUES('C0005',	's0011',	41000);
INSERT INTO club_sponser VALUES('C0005',	's0012',	40000);
INSERT INTO club_sponser VALUES('C0006',	's0013',	39000);
INSERT INTO club_sponser VALUES('C0006',    's0014',	38000);
INSERT INTO club_sponser VALUES('C0006',	's0015',	37000);

SELECT * FROM club_sponser;

DELETE club_sponser;
-- Games table
drop TABLE games;
CREATE TABLE [Games] (
    [ParticipationID] Char(10),
    [statusID] VARCHAR(10),
    [GameNo] Integer,
  CONSTRAINT pk_pid_games PRIMARY KEY (participationID,GameNo),
);


INSERT INTO Games VALUES('P0001',	'St001',	1)
INSERT INTO Games VALUES('P0001',	'St001',    11)
INSERT INTO Games VALUES('P0001',	'St001',	17)
INSERT INTO Games VALUES('P0002',	'St001',	2)
INSERT INTO Games VALUES('P0002',	'St001',	9)
INSERT INTO Games VALUES('P0003',	'St001',	3)
INSERT INTO Games VALUES('P0003',	'St001',	8)
INSERT INTO Games VALUES('P0003',	'St001',	10)
INSERT INTO Games VALUES('P0004',	'St001',	4)
INSERT INTO Games VALUES('P0004',	'St001',	13)
INSERT INTO Games VALUES('P0004',	'St001',	14)
INSERT INTO Games VALUES('P0005',	'St003',	5)
INSERT INTO Games VALUES('P0005',	'St001',	14)
INSERT INTO Games VALUES('P0005',	'St001',	24)
INSERT INTO Games VALUES('P0006',	'St001',	6)
INSERT INTO Games VALUES('P0007',	'St001',	7)
INSERT INTO Games VALUES('P0008',	'St003',	8)
INSERT INTO Games VALUES('P0009',	'St003',	9)
INSERT INTO Games VALUES('P0010',	'St003',	1)
INSERT INTO Games VALUES('P0011',	'St003',	2)
INSERT INTO Games VALUES('P0011',	'St001',    23)
INSERT INTO Games VALUES('P0012',	'St003',	3)
INSERT INTO Games VALUES('P0013',	'St003',	4)
INSERT INTO Games VALUES('P0014',	'St001',	5)
INSERT INTO Games VALUES('P0015',	'St003',	6)
INSERT INTO Games VALUES('P0015',	'St003',	34)
INSERT INTO Games VALUES('P0016',	'St003',	7)
INSERT INTO Games VALUES('P0017',	'St003',	8)
INSERT INTO Games VALUES('P0018',	'St003',	9)
INSERT INTO Games VALUES('P0019',	'St003',	10)
INSERT INTO Games VALUES('P0020',	'St003',	11)

Select * FROM Games;

---INNER JOIN----
-- to know the club to which the player belongs

SELECT * FROM Player;
SELECT * FROM club;
 
SELECT Player.ParticipationID, Player.FName, club.name
FROM Player
INNER JOIN club
ON Player.clubID = club.clubid;

---Full outer join
--to know who is the winner of atleast games recorded
SELECT games.GameNo,Games.ParticipationID,[status].statusname
FROM Games
FULL OUTER JOIN [status]
ON Games.statusID = [status].statusID
WHERE [status].statusID = 'st001';


--LEFT OUter join
--To find the referee details for all the games
SELECT * FROM game_details;
SELECT * FROM referee;

SELECT game_details.gameno, referee.refereeID,referee.Fname,referee.Contact
FROM game_details
LEFT OUTER JOIN referee
ON game_details.refereeID = referee.refereeID;

--Right Outer Join
--To find out the amount recieved by each club from different sponsers
SELECT * FROM club_sponser;
SELECT * FROM sponser;

SELECT club_sponser.clubID,sponser.fname,sponser.contactno,club_sponser.amount
FROM sponser
RIGHT OUTER JOIN club_sponser
ON sponser.sponserID = club_sponser.sponserID;

---Create intersect join
--To find the participant who belong to club 'C001' and won atleast one game
SELECT * FROM Player;
SELECT * FROM games;

SELECT player.ParticipationID
FROM Player WHERE Player.clubID = 'C0001'
INTERSECT 
SELECT Games.ParticipationID
FROM Games WHERE statusID = 'st001';

---create except join
-- to select sponsers who have sponsered more than 30000
SELECT sponser.sponserID FROM sponser
EXCEPT
SELECT club_sponser.sponserID FROM club_sponser 
WHERE club_sponser.amount < 30000;

---create union
--to find the participant who lost atleast one game or has rank greater than 5   
SELECT * from Player;
SELECT * FROM Games;
SELECT Player.ParticipationID 
FROM Player WHERE Player.Rank > 5
UNION
SELECT games.ParticipationID
FROM Games WHERE Games.statusID = 'st003';

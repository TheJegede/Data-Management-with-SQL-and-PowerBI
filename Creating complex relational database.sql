-- SQL for Normalized Relational Model for Theater Group
create database if not exists theater;
use theater;

-- drop old tables from initial model, if necessary
DROP TABLE IF EXISTS Member_Production;
DROP TABLE IF EXISTS Ticket;
DROP TABLE IF EXISTS Donation;
DROP TABLE IF EXISTS DuesPayment;
DROP TABLE IF EXISTS TicketSale;
DROP TABLE IF EXISTS Performance;
DROP TABLE IF EXISTS Production;
DROP TABLE IF EXISTS Play;
DROP TABLE IF EXISTS Subscriber;
DROP TABLE IF EXISTS Sponsor;
DROP TABLE IF EXISTS Member;

-- create the new tables

CREATE TABLE Zips (
  zip VARCHAR(5),
  city VARCHAR(15),
  state CHAR(2),
  PRIMARY KEY (zip)
);

CREATE TABLE Member (
  memId INT(6),
  dateJoined DATE,
  firstname VARCHAR(15),
  lastName VARCHAR(20),
  street VARCHAR(50),
  zip CHAR(5),
  areaCode CHAR(3),
  phoneNumber CHAR(7),
  currentOfficeHeld VARCHAR(20),
  PRIMARY KEY (memId),
  FOREIGN KEY (zip) REFERENCES Zips(zip)
);

CREATE TABLE Sponsor (
  sponID INT(6),
  name VARCHAR(20),
  street VARCHAR(50), 
  zip CHAR(5),
  areaCode CHAR(3),
  phoneNumber CHAR(7),
  PRIMARY KEY (sponId),
  FOREIGN KEY (zip) REFERENCES Zips(zip)
);

CREATE TABLE Subscriber (
  subID INT(6),
  firstname VARCHAR(15),
  lastName VARCHAR(20),
  street VARCHAR(50),
  zip CHAR(5), 
  areaCode CHAR(3),
  phoneNumber CHAR(7),
  PRIMARY KEY (subId),
  FOREIGN KEY (zip) REFERENCES Zips(zip)  
);

CREATE TABLE Play (
  title VARCHAR(100),
  author VARCHAR(35),
  numberOfActs INT(1),
  setChanges INT(2),
  PRIMARY KEY (title)
);

CREATE TABLE Production (
  year INT(4),
  seasonStartDate VARCHAR(7),
  seasonEndDate VARCHAR(7),
  title VARCHAR(100),
  PRIMARY KEY (year, seasonStartDate),
  FOREIGN KEY (title) REFERENCES Play(title)
);

CREATE TABLE Performance (
  datePerf VARCHAR(7),
  timePerf VARCHAR(10),
  year INT(4),
  seasonStartDate VARCHAR(7), 
  PRIMARY KEY (datePerf, year),
  FOREIGN KEY (year, seasonStartDate) REFERENCES Production(year, seasonStartDate)
);

CREATE TABLE TicketSale (
  saleID INT(6),
  saleDate DATE,
  totalAmount DECIMAL(6,2),
  perfDate VARCHAR(7),
  perfYear INT(4),
  subId INT(6),
  PRIMARY KEY (saleId),
  FOREIGN KEY (perfDate, perfYear) REFERENCES Performance(datePerf, year),
  FOREIGN KEY (subId) REFERENCES Subscriber(subId)
);

CREATE TABLE DuesPayment (
  memId INT(6),
  duesYear INT(4),
  amount DECIMAL(5,2),
  datePaid DATE,
  PRIMARY KEY (memId, duesYear),
  FOREIGN KEY (memId) REFERENCES Member(memId)
);

CREATE TABLE Donation (
  sponId INT(6),
  donationDate DATE,
  donationType VARCHAR(20),
  donationValue DECIMAL(8,2),
  year INT(4),
  seasonStartDate VARCHAR(7),
  PRIMARY KEY (sponId, donationDate), 
  FOREIGN KEY (sponId) REFERENCES Sponsor(sponId),
  FOREIGN KEY (year, seasonStartDate) REFERENCES Production(year, seasonStartDate)
);

CREATE TABLE Ticket (
  saleId INT(6),
  seatLocation VARCHAR(3),
  price DECIMAL(5,2),
  seatType VARCHAR(15),
  PRIMARY KEY (saleId, seatLocation),
  FOREIGN KEY (saleId) REFERENCES TicketSale(saleId)
);

CREATE TABLE Member_Production (
  memId INT(6),
  year INT(4),
  seasonStartDate VARCHAR(7),
  role VARCHAR(25),
  task VARCHAR(25),
  PRIMARY KEY (memId, year, seasonStartDate),
  FOREIGN KEY (memId) REFERENCES Member(memId),
  FOREIGN KEY (year, seasonStartDate) REFERENCES Production(year, seasonStartDate)
);

-- insert some records

INSERT INTO Zips VALUES ('10801','New Rochelle','NY');
INSERT INTO Zips VALUES ('10101','New York','NY'); 
INSERT INTO Zips VALUES ('92101', 'San Diego', 'CA');
INSERT INTO Zips VALUES ('33010', 'Miami', 'FL');
INSERT INTO Zips VALUES ('60601', 'Chicago', 'IL');

INSERT INTO Member VALUES (11111,'2013-02-01', 'Frances','Hughes','10 Hudson Avenue','10801','914','3216789','President');
INSERT INTO Member VALUES (22222,'2011-03-01', 'Irene','Jacobs','1 Windswept Place','10101','212','3216789','Vice-President');
INSERT INTO Member VALUES (33333,'2012-05-01', 'Winston', 'Lee','22 Amazon Street', '10101','212','3336789',NULL);
INSERT INTO Member VALUES (44444,'2013-02-01', 'Ryan','Hughes','10 Hudson Avenue','10801','914','5556789','Secretary');
INSERT INTO Member VALUES (55555,'2011-02-01', 'Samantha', 'Babson','22 Hudson Avenue','10801','914','6666789','Treasurer');
INSERT INTO Member VALUES (66666,'2014-02-01', 'Robert', 'Babson','22 Hudson Avenue','10801','914','6666789',NULL);

INSERT INTO Sponsor VALUES (1234, 'Zap Electrics', '125 Main Street', '10101', '212','3334444');
INSERT INTO Sponsor VALUES (1235, 'Elegant Interiors', '333 Main Street', '10101', '212','3334446');
INSERT INTO Sponsor VALUES (1236, 'Deli Delights', '111 South Street', '10801', '914','2224446');

INSERT INTO Subscriber VALUES (123456, 'John','Smith','10 Sapphire Row', '10801', '914','1234567'); 
INSERT INTO Subscriber VALUES (987654, 'Terrence','DeSimone','10 Emerald Lane', '10101','914','7676767');

INSERT INTO Play VALUES ('Macbeth','Wm. Shakespeare', 3,6);
INSERT INTO Play VALUES ('Our Town','T. Wilder', 3,4);
INSERT INTO Play VALUES ('Death of a Salesman','A. Miller', 3,5);

INSERT INTO Production VALUES (2015,'05-May', '14-May', 'Our Town');
INSERT INTO Production VALUES (2014,'14-Oct','23-Oct','Macbeth');


INSERT INTO Performance VALUES ('05-May','8pm',2015,'05-May');
INSERT INTO Performance VALUES ('06-May','8pm',2015,'05-May');
INSERT INTO Performance VALUES ('07-May','3pm',2015,'05-May');
INSERT INTO Performance VALUES ('12-May','8pm',2015,'05-May'); 
INSERT INTO Performance VALUES ('13-May','8pm',2015,'05-May');
INSERT INTO Performance VALUES ('14-May','3pm',2015,'05-May');
INSERT INTO Performance VALUES ('14-Oct','8pm',2014,'14-Oct');
INSERT INTO Performance VALUES ('15-Oct','8pm',2014,'14-Oct');
INSERT INTO Performance VALUES ('16-Oct','3pm',2014,'14-Oct');
INSERT INTO Performance VALUES ('21-Oct','8pm',2014,'14-Oct');
INSERT INTO Performance VALUES ('22-Oct','8pm',2014,'14-Oct');
INSERT INTO Performance VALUES ('23-Oct','3pm',2014,'14-Oct');

INSERT INTO TicketSale VALUES (123456,'2015-05-01',40.00,'05-May',2015,123456);
INSERT INTO Ticket VALUES (123456, 'A1',20.00,'orch front');
INSERT INTO Ticket VALUES (123456, 'A2',20.00,'orch front');
INSERT INTO Ticket VALUES (123456, 'A7',20.00,'orch front');

INSERT INTO TicketSale VALUES (123457,'2015-05-02',80.00,'05-May',2015,987654);
INSERT INTO Ticket VALUES (123457, 'A3',20.00,'orch front');
INSERT INTO Ticket VALUES (123457, 'A4',20.00,'orch front');
INSERT INTO Ticket VALUES (123457, 'A5',20.00,'orch front');
INSERT INTO Ticket VALUES (123457, 'A6',20.00,'orch front');

INSERT INTO TicketSale VALUES (000001,'2014-10-01',40.00,'14-Oct',2014, 987654);
INSERT INTO Ticket VALUES (000001, 'A1',20.00,'orch front');
INSERT INTO Ticket VALUES (000001, 'A2',20.00,'orch front');

INSERT INTO TicketSale VALUES (000002,'2014-10-09',60.00,'14-Oct',2014,123456);
INSERT INTO Ticket VALUES (000002, 'A1',20.00,'orch front'); 
INSERT INTO Ticket VALUES (000002, 'A2',20.00,'orch front');
INSERT INTO Ticket VALUES (000002, 'A3',20.00,'orch front');

INSERT INTO DuesPayment VALUES (11111, 2015, 50.00, '2015-01-01');
INSERT INTO DuesPayment VALUES (22222, 2015, 50.00, '2015-01-15');
INSERT INTO DuesPayment VALUES (33333, 2015, 50.00, '2015-02-01');
INSERT INTO DuesPayment VALUES (44444, 2015, 50.00, '2015-01-30');
INSERT INTO DuesPayment VALUES (55555, 2015, 50.00, '2015-01-28');

INSERT INTO Donation VALUES (1234, '2015-03-01','sound board',1250.00,2015,'05-May');
INSERT INTO Donation VALUES (1235, '2015-04-15','cash', 500.00,2015,'05-May');
INSERT INTO Donation VALUES (1236, '2015-05-05','food',500.00,2015,'05-May');
INSERT INTO Donation VALUES (1236, '2015-05-06','beverges',200.00,2015,'05-May');
INSERT INTO Donation VALUES (1236, '2015-05-07','snacks',100.00,2015,'05-May');

INSERT INTO Member_Production VALUES (11111,2015,'05-May','Emily','sets');
INSERT INTO Member_Production VALUES (22222,2015,'05-May','Mrs. Webb','costumes');

COMMIT;


--

SELECT COUNT(*) as donation FROM donation;
SELECT COUNT(*) as duespayment FROM duespayment;
SELECT COUNT(*) as member FROM member;
SELECT COUNT(*) as member_production FROM member_production;
SELECT COUNT(*) as performance FROM performance;
SELECT COUNT(*) as play FROM play;
SELECT COUNT(*) as production FROM production;
SELECT COUNT(*) as sponsor FROM sponsor;
SELECT COUNT(*) as subscriber FROM subscriber;
SELECT COUNT(*) as ticket FROM ticket;
SELECT COUNT(*) as ticketsale FROM ticketsale;

-- . Find the names and complete addresses of all the subscribers who 
-- bought tickets for any production.

select * from ticketsale;
SELECT distinct s.subid, firstname, lastname, street, zip
FROM subscriber as s
INNER JOIN Ticketsale as ts
on s.subid = ts.subid
inner join ticket as t;

-- . Find the total value of goods or services donated by "Deli Delights".
-- select * from donation;
-- select * from sponsor;
select name, SUM(donationValue) as TotalDonation
from sponsor as sp
inner join donation as d
on sp.sponID = d.sponID
where name = 'Deli Delights'
group by name;

SELECT SUM(donationValue) AS total_donation_value
FROM Donation
WHERE sponId = (
    SELECT sponID
    FROM Sponsor
    WHERE name = 'Deli Delights'
);


-- Find the names of any members who have not paid their dues for 2015.
select * from member;
select * from duespayment;

select firstname, lastname
from member m
inner join duespayment dues
on m.memid = dues.memid
where datepaid  < 2015;

SELECT m.firstname, m.lastName
FROM Member m
LEFT JOIN DuesPayment dp ON m.memId = dp.memId AND dp.duesYear = 2015
WHERE dp.memId IS NULL;


-- 

SELECT SUM(price) AS total_ticket_value
FROM TicketSale ts
JOIN Ticket t ON ts.saleId = t.saleId
JOIN Performance p ON ts.perfDate = p.datePerf AND ts.perfYear = p.year
JOIN Production pd ON p.year = pd.year AND p.seasonStartDate = pd.seasonStartDate
WHERE pd.seasonStartDate = '14-Oct' AND pd.year = 2014;

---

SELECT 
    ts.saleID,
    s.firstName,
    s.lastName,
    t.seatLocation
FROM 
    TicketSale ts
JOIN 
    Ticket t ON ts.saleID = t.saleID
JOIN 
    Subscriber s ON ts.subID = s.subID
JOIN 
    Performance p ON ts.perfDate = p.datePerf AND ts.perfYear = p.year
WHERE 
    p.datePerf = '05-May' 
    AND p.year = 2015 
    AND t.seatLocation IN ('A6', 'A7');

USE theater;

-- Checking the counts of the tables first
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

-- Question 3a
--  Finding the names and complete addresses of all the subscribers who bought tickets for any production.
SELECT DISTINCT firstname, lastname, street, city, state, z.zip
FROM subscriber AS s
INNER JOIN Ticketsale as ts
ON s.subid = ts.subid
INNER JOIN zips as z on z.zip = s.zip;


-- Question 3b
-- Finding the total value of goods or services donated by "Deli Delights".
-- select * from donation;
-- select * from sponsor;
SELECT SUM(donationValue) AS TotalDonationValue
FROM Donation
WHERE sponId = (SELECT sponID
    FROM Sponsor
    WHERE name = 'Deli Delights');


-- Question 3c
-- Finding the names of any members who have not paid their dues for 2015.
-- select * from member;
-- select * from duespayment;
SELECT firstname, lastname
FROM Member m
LEFT JOIN Duespayment dues
ON m.memid = dues.memid
WHERE dues.memid IS null;

-- Question 3d
-- SELECT * from performance;
-- select * from production;
SELECT SUM(price) AS Total_Tickets_Value
FROM TicketSale ts
JOIN Ticket t ON ts.saleId = t.saleId
JOIN Performance p ON ts.perfDate = p.datePerf AND ts.perfYear = p.year
JOIN Production pd ON p.year = pd.year AND p.seasonStartDate = pd.seasonStartDate
WHERE pd.seasonStartDate >= '14-Oct' AND pd.year >= 2014;
---


-- Question 3e
-- Determine whether seats A6 and A7 are both available for the performance on May 5, 2015. 
-- If not, show the name of the person or people occupying one or both of these seats.
SELECT s.firstName, s.lastName, t.seatLocation
FROM TicketSale ts
JOIN Ticket t 
ON ts.saleID = t.saleID
JOIN Subscriber s 
ON ts.subID = s.subID
JOIN Performance p 
ON ts.perfDate = p.datePerf AND ts.perfYear = p.year
WHERE p.datePerf = '05-May' AND p.year = 2015 AND t.seatLocation IN ('A6', 'A7');

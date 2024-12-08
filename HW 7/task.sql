-- Task 1
CREATE VIEW samsBills AS
SELECT 
    S.first_name, 
    S.surname, 
    B.bill_date, 
    B.cust_name, 
    B.bill_total
FROM 
    restStaff S
INNER JOIN 
    restBill B
ON 
    S.staff_no = B.waiter_no
WHERE 
    S.first_name = 'Sam' AND S.surname = 'Pitt';

-- Retrieve all records from samsBills
SELECT * FROM samsBills;

-- Task 2

SELECT * 
FROM samsBills 
WHERE bill_total > 400;

-- Task 3

CREATE VIEW roomTotals AS
SELECT 
    T.room_name, 
    SUM(B.bill_total) AS total_sum
FROM 
    restRest_table T
INNER JOIN 
    restBill B
ON 
    T.table_no = B.table_no
GROUP BY 
    T.room_name;

-- Retrieve all records from roomTotals
SELECT * FROM roomTotals;

-- Task 4

CREATE VIEW teamTotals AS
SELECT 
    CONCAT(S2.first_name, ' ', S2.surname) AS headwaiter_name,
    H.total_bill AS total_sum
FROM 
    restStaff S2
INNER JOIN
    (SELECT 
         S1.headwaiter, 
         SUM(W.bill_total) AS total_bill
     FROM 
         restStaff S1
     INNER JOIN 
         (SELECT 
              B.waiter_no, 
              SUM(B.bill_total) AS bill_total
          FROM 
              restBill B
          GROUP BY 
              B.waiter_no) W
     ON 
         S1.staff_no = W.waiter_no
     GROUP BY 
         S1.headwaiter) H
ON 
    S2.staff_no = H.headwaiter;

-- Retrieve all records from teamTotals
SELECT * FROM teamTotals;

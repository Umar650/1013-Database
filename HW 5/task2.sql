-- Task 1

SELECT SUM(bill_total) AS Income
FROM restBill;

-- Task 2

SELECT SUM(bill_total) AS "Feb Income"
FROM restBill
WHERE bill_date BETWEEN 160201 AND 160229;

-- Task 3

SELECT AVG(bill_total)
FROM restBill
WHERE table_no = 002;

-- Task 4


-- Task 5

SELECT COUNT(DISTINCT table_no)
FROM restBill
WHERE waiter_no IN (004,002);
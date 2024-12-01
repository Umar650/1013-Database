-- Task 1

SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
JOIN restBill b ON s.staff_no = b.waiter_no
WHERE b.cust_name = 'Tanya Singh';

-- Task 2

SELECT rm.room_date
FROM restRoom_management rm
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE s.first_name = 'Charles' AND rm.room_name = 'Green' 
  AND rm.room_date BETWEEN 160201 AND 160229;

-- Task 3

SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
WHERE s.headwaiter = (SELECT headwaiter 
                      FROM restStaff 
                      WHERE first_name = 'Zoe' AND surname = 'Ball');

-- Task 4

SELECT b.cust_name, b.bill_total, CONCAT(s.first_name, ' ', s.surname) AS waiter_name
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
ORDER BY b.bill_total DESC;

-- Task 5

SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
JOIN restBill b ON s.staff_no = b.waiter_no
WHERE b.table_no IN (SELECT DISTINCT table_no
                     FROM restBill
                     WHERE bill_no IN (00014, 00017));


-- Task 6 

SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no IN (
    SELECT DISTINCT waiter_no 
    FROM restBill
    WHERE table_no IN (
        SELECT table_no 
        FROM restRest_table 
        WHERE room_name = 'Blue'
    ) AND bill_date = 160312
)
OR s.staff_no = (
    SELECT headwaiter 
    FROM restRoom_management 
    WHERE room_name = 'Blue' AND room_date = 160312
);


                     
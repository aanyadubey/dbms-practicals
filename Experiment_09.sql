-- ============================================
-- EXPERIMENT 9: RAILWAY BOOKING QUERY PERFORMANCE
-- INDEXING AND QUERY EXECUTION PLAN
-- ============================================

CREATE DATABASE IF NOT EXISTS Experiment9;
USE Experiment9;

-- 1. CREATE RAILWAY BOOKING TABLE

DROP TABLE IF EXISTS Railway_Booking;

CREATE TABLE Railway_Booking (
    Booking_ID INT PRIMARY KEY,
    PNR VARCHAR(15) UNIQUE,
    Passenger_Name VARCHAR(60),
    Train_No INT,
    Train_Name VARCHAR(80),
    Journey_Date DATE,
    Source_Station VARCHAR(50),
    Destination_Station VARCHAR(50),
    Class_Type VARCHAR(20),
    Fare DECIMAL(10,2),
    Booking_Status VARCHAR(20)
) ENGINE=InnoDB;

-- 2. GENERATE 5000 SAMPLE RECORDS

SET SESSION cte_max_recursion_depth = 6000;

INSERT INTO Railway_Booking
(
    Booking_ID, PNR, Passenger_Name, Train_No,
    Train_Name, Journey_Date, Source_Station,
    Destination_Station, Class_Type, Fare,
    Booking_Status
)
WITH RECURSIVE seq AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM seq WHERE n < 5000
)
SELECT
    n,
    CONCAT('PNR', LPAD(n, 8, '0')),
    CONCAT('Passenger_', n),

    CASE MOD(n, 5)
        WHEN 0 THEN 12001
        WHEN 1 THEN 12002
        WHEN 2 THEN 12003
        WHEN 3 THEN 12004
        ELSE 12005
    END,

    CASE MOD(n, 5)
        WHEN 0 THEN 'Shatabdi Express'
        WHEN 1 THEN 'Rajdhani Express'
        WHEN 2 THEN 'Duronto Express'
        WHEN 3 THEN 'Gomti Express'
        ELSE 'Intercity Express'
    END,

    DATE_ADD('2026-11-01', INTERVAL MOD(n, 30) DAY),

    CASE MOD(n, 4)
        WHEN 0 THEN 'Delhi'
        WHEN 1 THEN 'Lucknow'
        WHEN 2 THEN 'Kanpur'
        ELSE 'Varanasi'
    END,

    CASE MOD(n, 4)
        WHEN 0 THEN 'Lucknow'
        WHEN 1 THEN 'Delhi'
        WHEN 2 THEN 'Varanasi'
        ELSE 'Prayagraj'
    END,

    CASE MOD(n, 3)
        WHEN 0 THEN 'AC 2 Tier'
        WHEN 1 THEN 'AC 3 Tier'
        ELSE 'Sleeper'
    END,

    500 + MOD(n, 20) * 75,

    CASE MOD(n, 4)
        WHEN 0 THEN 'CONFIRMED'
        WHEN 1 THEN 'WAITING'
        WHEN 2 THEN 'RAC'
        ELSE 'CANCELLED'
    END

FROM seq;

-- 3. VERIFY TOTAL RECORDS

SELECT COUNT(*) AS Total_Bookings
FROM Railway_Booking;

-- 4. QUERY PERFORMANCE BEFORE INDEXING

EXPLAIN
SELECT *
FROM Railway_Booking
WHERE Train_No = 12003;

EXPLAIN ANALYZE
SELECT *
FROM Railway_Booking
WHERE Train_No = 12003;

-- 5. CREATE SINGLE COLUMN INDEX

CREATE INDEX idx_train_no
ON Railway_Booking(Train_No);

-- DISPLAY INDEX

SHOW INDEX FROM Railway_Booking;

-- 6. QUERY PERFORMANCE AFTER INDEXING

EXPLAIN
SELECT *
FROM Railway_Booking
WHERE Train_No = 12003;

EXPLAIN ANALYZE
SELECT *
FROM Railway_Booking
WHERE Train_No = 12003;

-- 7. CREATE COMPOSITE INDEX

CREATE INDEX idx_train_date
ON Railway_Booking(Train_No, Journey_Date);

-- 8. QUERY USING COMPOSITE INDEX

EXPLAIN
SELECT *
FROM Railway_Booking
WHERE Train_No = 12003
AND Journey_Date BETWEEN '2026-11-05'
AND '2026-11-15';

EXPLAIN ANALYZE
SELECT *
FROM Railway_Booking
WHERE Train_No = 12003
AND Journey_Date BETWEEN '2026-11-05'
AND '2026-11-15';

-- 9. SELECT SPECIFIC BOOKING DETAILS

SELECT
    Booking_ID,
    Passenger_Name,
    Train_No,
    Journey_Date,
    Booking_Status
FROM Railway_Booking
WHERE Train_No = 12003;

-- 10. FINAL INDEX VERIFICATION

SHOW INDEX FROM Railway_Booking;

-- 11. FINAL DATA VERIFICATION

SELECT
    COUNT(*) AS Total_Records,
    COUNT(DISTINCT Train_No) AS Total_Trains,
    COUNT(DISTINCT Booking_Status) AS Booking_Status_Types
FROM Railway_Booking;

-- ============================================
-- END OF EXPERIMENT 9
-- ============================================

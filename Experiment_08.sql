-- ============================================
-- EXPERIMENT 8: TRANSACTIONS AND CONCURRENCY CONTROL
-- COMMIT, ROLLBACK, SAVEPOINT AND ISOLATION LEVELS
-- ============================================

CREATE DATABASE IF NOT EXISTS Experiment8;
USE Experiment8;

-- 1. CREATE BANK ACCOUNT TABLE

DROP TABLE IF EXISTS Transaction_Log;
DROP TABLE IF EXISTS Bank_Account;

CREATE TABLE Bank_Account (
    Account_ID INT PRIMARY KEY,
    Account_Holder VARCHAR(50),
    Balance DECIMAL(12,2) NOT NULL
) ENGINE=InnoDB;

-- 2. CREATE TRANSACTION LOG TABLE

CREATE TABLE Transaction_Log (
    Log_ID INT AUTO_INCREMENT PRIMARY KEY,
    From_Account INT,
    To_Account INT,
    Amount DECIMAL(12,2),
    Log_Time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 3. INSERT SAMPLE RECORDS

INSERT INTO Bank_Account VALUES
(101, 'Aarav Sharma', 50000),
(102, 'Riya Verma', 30000),
(103, 'Karan Mehta', 20000);

-- DISPLAY INITIAL BALANCES

SELECT * FROM Bank_Account;

-- ============================================
-- OUTPUT 1: COMMIT
-- TRANSFER 5000 FROM ACCOUNT 101 TO 102
-- ============================================

START TRANSACTION;

UPDATE Bank_Account
SET Balance = Balance - 5000
WHERE Account_ID = 101;

UPDATE Bank_Account
SET Balance = Balance + 5000
WHERE Account_ID = 102;

INSERT INTO Transaction_Log
(From_Account, To_Account, Amount)
VALUES (101, 102, 5000);

COMMIT;

SELECT * FROM Bank_Account;
SELECT * FROM Transaction_Log;

-- ============================================
-- OUTPUT 2: ROLLBACK
-- UNDO AN UNCOMMITTED TRANSACTION
-- ============================================

START TRANSACTION;

UPDATE Bank_Account
SET Balance = Balance - 7000
WHERE Account_ID = 101;

UPDATE Bank_Account
SET Balance = Balance + 7000
WHERE Account_ID = 999;

ROLLBACK;

SELECT * FROM Bank_Account;

-- ============================================
-- OUTPUT 3: SAVEPOINT
-- ============================================

START TRANSACTION;

UPDATE Bank_Account
SET Balance = Balance - 3000
WHERE Account_ID = 101;

SAVEPOINT after_debit;

UPDATE Bank_Account
SET Balance = Balance + 3000
WHERE Account_ID = 103;

SAVEPOINT after_credit;

UPDATE Bank_Account
SET Balance = Balance - 1000
WHERE Account_ID = 102;

ROLLBACK TO SAVEPOINT after_credit;

COMMIT;

SELECT * FROM Bank_Account;

-- ============================================
-- OUTPUT 4: TRANSACTION ISOLATION LEVELS
-- ============================================

SELECT @@transaction_isolation
AS Current_Isolation_Level;

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SELECT @@transaction_isolation;

SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT @@transaction_isolation;

SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SELECT @@transaction_isolation;

SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT @@transaction_isolation;

-- ============================================
-- OUTPUT 5: TRANSACTION LOG
-- ============================================

SELECT * FROM Transaction_Log;

-- ============================================
-- FINAL RESULT
-- ============================================

SELECT
    Account_ID,
    Account_Holder,
    Balance
FROM Bank_Account
ORDER BY Account_ID;

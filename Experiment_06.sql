-- Experiment 6: Stored procedure and triggers
-- Aim: Implement employee transfer validation, salary validation, audit logging and edge-case tests.
USE EmployeeDB;
CREATE TABLE IF NOT EXISTS Salary_Audit(Audit_ID INT AUTO_INCREMENT PRIMARY KEY,Emp_ID INT NOT NULL,Old_Salary DECIMAL(10,2),New_Salary DECIMAL(10,2),Changed_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
DROP PROCEDURE IF EXISTS transfer_employee;
DELIMITER //
CREATE PROCEDURE transfer_employee(IN p_emp_id INT,IN p_new_dept_id INT)
BEGIN
 IF NOT EXISTS(SELECT 1 FROM Employee WHERE Emp_ID=p_emp_id) THEN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Employee does not exist';
 ELSEIF NOT EXISTS(SELECT 1 FROM Department WHERE Dept_ID=p_new_dept_id) THEN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Department does not exist';
 ELSE
  UPDATE Employee SET Dept_ID=p_new_dept_id WHERE Emp_ID=p_emp_id;
 END IF;
END //
DELIMITER ;
CALL transfer_employee(1,2);
SELECT Emp_ID,Emp_Name,Dept_ID FROM Employee WHERE Emp_ID=1;
DROP TRIGGER IF EXISTS Before_Salary_Update;
DELIMITER //
CREATE TRIGGER Before_Salary_Update BEFORE UPDATE ON Employee FOR EACH ROW
BEGIN
 IF NEW.Salary<0 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Salary cannot be negative'; END IF;
END //
DELIMITER ;
DROP TRIGGER IF EXISTS After_Salary_Update;
DELIMITER //
CREATE TRIGGER After_Salary_Update AFTER UPDATE ON Employee FOR EACH ROW
BEGIN
 IF NOT(OLD.Salary <=> NEW.Salary) THEN
  INSERT INTO Salary_Audit(Emp_ID,Old_Salary,New_Salary) VALUES(OLD.Emp_ID,OLD.Salary,NEW.Salary);
 END IF;
END //
DELIMITER ;
UPDATE Employee SET Salary=66000 WHERE Emp_ID=1;
SELECT * FROM Salary_Audit;
-- Uncomment individually to test errors:
-- CALL transfer_employee(999,2);
-- CALL transfer_employee(1,999);
-- UPDATE Employee SET Salary=-5000 WHERE Emp_ID=1;

-- Output (expected; run the SQL to capture your actual result):
-- Expected result: A valid employee transfer updates the department. Invalid employee/department and negative salary tests are commented out; enable them individually to observe validation errors. Trigger and procedure behavior depends on the defined handlers.


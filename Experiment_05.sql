-- Experiment 5: Views and recursive CTE
-- Aim: Create department salary and employee hierarchy views, test updatability, and display reporting chains.
USE EmployeeDB;
CREATE OR REPLACE VIEW Department_Salary_Summary AS SELECT D.Dept_ID,D.Dept_Name,COUNT(E.Emp_ID) AS Total_Employees,AVG(E.Salary) AS Average_Salary,MAX(E.Salary) AS Maximum_Salary,MIN(E.Salary) AS Minimum_Salary FROM Department D LEFT JOIN Employee E ON D.Dept_ID=E.Dept_ID GROUP BY D.Dept_ID,D.Dept_Name;
SELECT * FROM Department_Salary_Summary;
ALTER TABLE Employee ADD COLUMN Manager_ID INT NULL;
ALTER TABLE Employee ADD CONSTRAINT FK_Employee_Manager FOREIGN KEY(Manager_ID) REFERENCES Employee(Emp_ID);
UPDATE Employee SET Manager_ID=1 WHERE Emp_ID IN(6,11,16,21,26);
UPDATE Employee SET Manager_ID=2 WHERE Emp_ID IN(7,12,17,22,27);
UPDATE Employee SET Manager_ID=3 WHERE Emp_ID IN(8,13,18,23,28);
UPDATE Employee SET Manager_ID=4 WHERE Emp_ID IN(9,14,19,24,29);
UPDATE Employee SET Manager_ID=5 WHERE Emp_ID IN(10,15,20,25,30);
CREATE OR REPLACE VIEW Employee_Hierarchy AS SELECT E.Emp_ID,E.Emp_Name,E.Job_Title,E.Salary,E.Manager_ID,M.Emp_Name AS Manager_Name FROM Employee E LEFT JOIN Employee M ON E.Manager_ID=M.Emp_ID;
SELECT * FROM Employee_Hierarchy;
UPDATE Employee_Hierarchy SET Salary=66000 WHERE Emp_ID=1;
SELECT Emp_ID,Emp_Name,Salary FROM Employee WHERE Emp_ID=1;
WITH RECURSIVE Employee_Chain AS (SELECT Emp_ID,Emp_Name,Manager_ID,1 AS Level FROM Employee WHERE Manager_ID IS NULL UNION ALL SELECT E.Emp_ID,E.Emp_Name,E.Manager_ID,EC.Level+1 FROM Employee E JOIN Employee_Chain EC ON E.Manager_ID=EC.Emp_ID) SELECT * FROM Employee_Chain ORDER BY Level,Emp_ID;

-- Output (expected; run the SQL to capture your actual result):
-- Expected result: Department_Salary_Summary displays employee counts and salary aggregates. The recursive CTE displays employee reporting levels. Run once after Experiment 3; re-running may fail at ALTER TABLE because Manager_ID already exists.


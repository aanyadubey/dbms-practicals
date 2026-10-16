-- Experiment 4: Joins subqueries and EXPLAIN
-- Aim: Demonstrate joins, correlated subqueries, EXISTS, set-style queries and EXPLAIN.
USE EmployeeDB;
SELECT E.Emp_Name,D.Dept_Name FROM Employee E INNER JOIN Department D ON E.Dept_ID=D.Dept_ID;
SELECT E.Emp_Name,D.Dept_Name FROM Department D LEFT JOIN Employee E ON E.Dept_ID=D.Dept_ID;
SELECT E.Emp_Name AS Employee,M.Emp_Name AS Colleague FROM Employee E JOIN Employee M ON E.Dept_ID=M.Dept_ID AND E.Emp_ID<M.Emp_ID;
SELECT E.Emp_Name,D.Dept_Name,EP.Project_ID FROM Employee E JOIN Department D ON E.Dept_ID=D.Dept_ID JOIN Employee_Project EP ON E.Emp_ID=EP.Emp_ID;
SELECT Emp_Name,Salary,Dept_ID FROM Employee E WHERE Salary>(SELECT AVG(Salary) FROM Employee WHERE Dept_ID=E.Dept_ID);
SELECT D.Dept_Name FROM Department D WHERE EXISTS(SELECT 1 FROM Employee E WHERE E.Dept_ID=D.Dept_ID);
SELECT Dept_ID FROM Employee WHERE Salary>=60000 UNION SELECT Dept_ID FROM Employee WHERE Job_Title='Developer';
SELECT E.Emp_ID,E.Emp_Name FROM Employee E WHERE NOT EXISTS(SELECT 1 FROM Employee_Project EP WHERE EP.Emp_ID=E.Emp_ID AND EP.Project_ID=101);
EXPLAIN SELECT * FROM Employee WHERE Dept_ID=1;
EXPLAIN SELECT E.Emp_Name,D.Dept_Name FROM Employee E JOIN Department D ON E.Dept_ID=D.Dept_ID;

-- Output (expected; run the SQL to capture your actual result):
-- Expected result: JOIN, subquery, EXISTS/set-style queries return matching employees/departments/projects. EXPLAIN displays the query plan; exact plan values vary by MySQL version and indexes.


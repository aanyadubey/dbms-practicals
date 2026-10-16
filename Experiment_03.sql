-- Experiment 3: Employee Department Project queries
-- Aim: Create an Employee–Department–Project schema with 30 employees, 5 departments and 8 projects, and demonstrate SQL queries.
CREATE DATABASE IF NOT EXISTS EmployeeDB;
USE EmployeeDB;
CREATE TABLE Department(Dept_ID INT PRIMARY KEY, Dept_Name VARCHAR(50) NOT NULL UNIQUE);
CREATE TABLE Employee(Emp_ID INT PRIMARY KEY, Emp_Name VARCHAR(60) NOT NULL, Job_Title VARCHAR(50), Salary DECIMAL(10,2), Dept_ID INT, FOREIGN KEY(Dept_ID) REFERENCES Department(Dept_ID));
CREATE TABLE Project(Project_ID INT PRIMARY KEY, Project_Name VARCHAR(80), Budget DECIMAL(12,2));
CREATE TABLE Employee_Project(Emp_ID INT, Project_ID INT, Hours_Worked INT DEFAULT 0, PRIMARY KEY(Emp_ID,Project_ID), FOREIGN KEY(Emp_ID) REFERENCES Employee(Emp_ID), FOREIGN KEY(Project_ID) REFERENCES Project(Project_ID));
INSERT INTO Department VALUES(1,'IT'),(2,'HR'),(3,'Finance'),(4,'Marketing'),(5,'Operations');
INSERT INTO Project VALUES(101,'Website',500000),(102,'Mobile App',400000),(103,'Payroll',150000),(104,'Recruitment',100000),(105,'Analytics',300000),(106,'Security',250000),(107,'Campaign',180000),(108,'Automation',220000);
INSERT INTO Employee VALUES
(1,'Aarav Sharma','Developer',65000,1),(2,'Diya Singh','Analyst',52000,3),(3,'Kabir Verma','HR Executive',42000,2),(4,'Anaya Gupta','Designer',48000,4),(5,'Vivaan Kumar','Operator',39000,5),
(6,'Ishita Mishra','Developer',70000,1),(7,'Aditya Singh','Accountant',51000,3),(8,'Saanvi Jain','Recruiter',44000,2),(9,'Reyansh Yadav','Marketer',46000,4),(10,'Myra Khan','Supervisor',50000,5),
(11,'Arjun Patel','Developer',62000,1),(12,'Aadhya Roy','Analyst',54000,3),(13,'Krishna Das','HR Executive',43000,2),(14,'Sara Ali','Designer',49000,4),(15,'Atharv Joshi','Operator',40000,5),
(16,'Rudra Mehta','Developer',68000,1),(17,'Pari Kapoor','Accountant',53000,3),(18,'Ayaan Bose','Recruiter',45000,2),(19,'Kiara Nair','Marketer',47000,4),(20,'Dhruv Sinha','Supervisor',51000,5),
(21,'Avni Tiwari','Developer',64000,1),(22,'Yuvaan Reddy','Analyst',55000,3),(23,'Navya Ghosh','HR Executive',41000,2),(24,'Shaurya Malik','Designer',50000,4),(25,'Prisha Sen','Operator',40500,5),
(26,'Vedant Rao','Developer',71000,1),(27,'Amaira Paul','Accountant',56000,3),(28,'Rohan Gill','Recruiter',46000,2),(29,'Tara Bhat','Marketer',48500,4),(30,'Neil Arora','Supervisor',52000,5);
INSERT INTO Employee_Project SELECT Emp_ID,101+MOD(Emp_ID-1,8),10+MOD(Emp_ID,30) FROM Employee;
SELECT Emp_ID,Emp_Name,Salary FROM Employee;
SELECT Dept_ID,COUNT(*) AS Total_Employees,AVG(Salary) AS Average_Salary FROM Employee GROUP BY Dept_ID;
SELECT Dept_ID,COUNT(*) FROM Employee GROUP BY Dept_ID HAVING COUNT(*)>=6;
SELECT Emp_Name,Salary,CASE WHEN Salary>=60000 THEN 'High' WHEN Salary>=45000 THEN 'Medium' ELSE 'Entry' END AS Salary_Band FROM Employee ORDER BY Salary DESC;
SELECT * FROM Project ORDER BY Budget DESC;

-- Output (expected; run the SQL to capture your actual result):
-- Expected result: 5 departments, 30 employees, 8 projects, and employee-project mappings are created. The department summary should show 6 employees per department.


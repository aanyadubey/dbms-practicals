# DBMS-Lab_File
FOR ALL DBMS EXPERIMENTS 

This repository contains Experiments 1–10 as individual SQL scripts and the Experiment 1 ER diagram. Each SQL file starts with its Aim, followed by the SQL statements and an Output (expected) note. Output notes are guidance, not screenshots or claims that the scripts were executed on your machine.

Requirements
MySQL 8.0+ (recommended) and MySQL Workbench or another MySQL client.
Run scripts in a practice database/server, not a production database.
Files
Experiment_01.sql — E-commerce ER model and relational tables
ER_Diagram.png — ER diagram for Experiment 1
Experiment_02.sql — Relational schema and integrity constraints
Experiment_03.sql — Employee–Department–Project schema and queries (30 employees, 5 departments, 8 projects)
Experiment_04.sql — Joins, subqueries, set-style queries, and EXPLAIN
Experiment_05.sql — Views and recursive CTE hierarchy
Experiment_06.sql — Stored procedure, triggers, and validation

Recommended run order
Run Experiments 1 and 2 independently.
Run Experiment 3 before Experiments 4, 5, and 6; these scripts share EmployeeDB. Experiment 5 alters the Employee table and is intended to be run once on a fresh setup. If re-running it, recreate EmployeeDB first or remove the already-added manager column/constraint carefully.
In Experiment 2, invalid INSERT examples are commented out intentionally; uncomment one at a time to observe constraint errors. In Experiment 8, concurrency steps are comments and must be tested in two separate client sessions.
GitHub upload
Create a repository named DBMS-Practical-Experiments, then upload all ten .sql files, README.md, and ER_Diagram.png (upload the extracted files, not just the ZIP). Suggested commit message: Add all DBMS practical experiments and ER diagram.

Important: EXPLAIN plans, supported constraints, and runtime depend on your MySQL version and environment. Review each script before running it. The output comments describe expected behavior; run the scripts and capture your own output for submission.

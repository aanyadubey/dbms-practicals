
# EXPERIMENT – 6

**AIM:** To create a stored procedure `transfer_employee(emp_id, new_dept_id)` with validation and error handling, implement triggers for salary validation and audit logging, and test edge cases.

## SOURCE CODE

### 1. Creating Department Table

Creates a Department table with department ID as the primary key, department name, and location.

### 2. Creating Project Table

Creates a Project table with project ID as the primary key, project name, and budget.

### 3. Creating Employee Table

Creates an Employee table containing employee ID, employee name, salary, job role, department ID, and project ID. Foreign key constraints reference the Department and Project tables.

### 4. Creating Employee Audit Table

Creates an `Employee_Audit` table to store audit records, including audit ID, employee ID, old salary, new salary, and action timestamp.

### 5. Inserting Department Records

Inserts five departments:

1. Human Resources — Delhi
2. Information Technology — Chandigarh
3. Finance — Mumbai
4. Marketing — Bangalore
5. Research and Development — Hyderabad

### 6. Inserting Project Records

Inserts eight projects: Website Development, Mobile Application, Cyber Security System, Data Analytics Platform, AI Chatbot, Cloud Migration, Payroll Management, and Market Research System.

### 7. Inserting Employee Records

Inserts 30 employee records containing employee ID, employee name, salary, job role, department ID, and project ID.

### 8. Stored Procedure: `transfer_employee`

Creates a stored procedure that transfers an employee to a new department.

The procedure validates whether the employee exists and whether the destination department exists. If the employee or department does not exist, it raises an SQL error with an appropriate message. Otherwise, it updates the employee's department ID.

### 9. Trigger: `validate_salary_before_insert`

Creates a trigger that executes before inserting an employee record.

If the new salary is less than or equal to zero, the trigger raises an SQL error with the message:

`Salary must be greater than zero`

### 10. Trigger: `validate_salary_before_update`

Creates a trigger that executes before updating an employee record.

If the new salary is less than or equal to zero, the trigger raises an SQL error with the message:

`Salary must be greater than zero`

### 11. Trigger: `salary_audit_after_update`

Creates a trigger that executes after updating an employee record.

If the employee's salary changes, the trigger inserts the employee ID, old salary, new salary, and timestamp into the `Employee_Audit` table.

### 12. Testing Employee Transfer

Calls the stored procedure to transfer employee ID 1 to department ID 2.

Then retrieves the employee's ID, name, and department ID to verify the transfer.

### 13. Testing Salary Update

Updates employee ID 1's salary to 50000 and retrieves the corresponding audit records.

**OUTPUT:** Displays the updated employee details and the salary audit information.

### 14. Testing Invalid Employee

Calls the stored procedure with employee ID 999 and department ID 2.

**OUTPUT:** Raises an error indicating that the employee does not exist.

### 15. Testing Invalid Department

Calls the stored procedure with employee ID 1 and department ID 999.

**OUTPUT:** Raises an error indicating that the department does not exist.

### 16. Testing Invalid Salary

Attempts to update employee ID 1's salary to -5000.

**OUTPUT:** The salary validation trigger raises an error because the salary must be greater than zero.

## RESULT

A stored procedure was created to transfer employees between departments with validation and error handling. Triggers were implemented to validate employee salaries and record salary changes in the audit table. Edge cases involving invalid employees, departments, and salaries were tested.

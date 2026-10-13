
# JForce Employee Management and Payroll System Using MySQL

## Project Overview

This project was developed as part of the **JForce Solutions – SQL Developer: Stored Procedure Interview Task**.

The project demonstrates how MySQL stored procedures can be used to generate employee salary reports, calculate salary components, assign salary grades, and generate department-wise salary summaries.

## Objectives

- Create an employee management database.
- Create an employees table and insert 10 sample employees.
- Use input parameters in stored procedures.
- Filter active employees based on department and minimum salary.
- Calculate HRA, DA, PF, and net salary.
- Assign salary grades using CASE statements.
- Generate department-wise salary statistics.
- Handle requests for departments that do not exist.

## Technologies Used

- MySQL
- MySQL Workbench
- SQL Stored Procedures

## Database Structure

**Database Name:** `JForce`

**Table Name:** `employees`

| Column | Data Type | Description |
|---|---|---|
| employee_id | INT | Unique employee ID and primary key |
| employee_name | VARCHAR(50) | Employee name |
| department | VARCHAR(30) | Department name |
| designation | VARCHAR(50) | Job designation |
| basic_salary | DECIMAL(10,2) | Employee basic salary |
| joining_date | DATE | Date of joining |
| status | VARCHAR(10) | Active or Inactive status |

The database contains 10 sample employees across IT, HR, Finance, Sales, and Marketing departments.

## Stored Procedures

### 1. GetEmployeeSalaryReport

**Purpose:** Retrieves active employees from a specified department whose basic salary is greater than or equal to the specified minimum salary.

**Input Parameters:**
- `dept` — Department name
- `min_salary` — Minimum basic salary

**Example:**

```sql
CALL GetEmployeeSalaryReport('IT', 50000);
```

**Output:**
- Employee ID
- Employee Name
- Department
- Designation
- Basic Salary
- Joining Date

### 2. CalculateEmployeeSalary

**Purpose:** Calculates salary components for a selected employee.

**Input Parameter:**
- `emp_id` — Employee ID

**Salary Calculation Rules:**

- HRA = Basic Salary × 20%
- DA = Basic Salary × 10%
- PF = Basic Salary × 12%
- Net Salary = Basic Salary + HRA + DA - PF

**Example:**

```sql
CALL CalculateEmployeeSalary(101);
```

For employee ID 101, whose basic salary is ₹55,000:

| Component | Amount |
|---|---:|
| Basic Salary | ₹55,000 |
| HRA | ₹11,000 |
| DA | ₹5,500 |
| PF | ₹6,600 |
| Net Salary | ₹64,900 |

### 3. EmployeeSalaryGrade

**Purpose:** Assigns a salary grade based on the employee's basic salary.

**Salary Grade Rules:**

| Basic Salary | Grade |
|---|---|
| Below ₹30,000 | C |
| ₹30,000 to ₹60,000 | B |
| Above ₹60,000 | A |

**Example:**

```sql
CALL EmployeeSalaryGrade(101);
```

Employee ID 101 has a basic salary of ₹55,000, so the assigned grade is **B**.

### 4. GetDepartmentSummary (Bonus Task)

**Purpose:** Generates salary statistics for a specified department.

**Output:**
- Total number of employees
- Average salary
- Highest salary
- Lowest salary
- Total salary expenditure

The procedure also checks whether the requested department exists. If it does not exist, it displays an appropriate message.

**Examples:**

```sql
CALL GetDepartmentSummary('HR');

CALL GetDepartmentSummary('Legal');
```

The second example tests department validation.

## SQL Concepts Demonstrated

- Database and table creation
- Primary keys
- INSERT and SELECT statements
- Stored procedures and input parameters
- WHERE and AND conditions
- CASE statements
- IF EXISTS
- Aggregate functions: COUNT, AVG, MAX, MIN, and SUM
- GROUP BY
- Basic validation

## Project Folder Structure

```text
JForce-SQL-Developer-Stored-Procedure-Task/
│
├── Database.sql
├── Procedures.sql
└── README.md
```

### File Descriptions

- **Database.sql:** Creates the JForce database, creates the employees table, and inserts sample employee records.
- **Procedures.sql:** Contains the four stored procedures and example execution statements.
- **README.md:** Provides the project overview, database structure, salary formulas, and execution instructions.

## How to Run the Project

1. Install MySQL Server and MySQL Workbench.
2. Open MySQL Workbench and connect to your MySQL server.
3. Open `Database.sql` and execute the script.
4. Verify the employee records:

   ```sql
   USE JForce;
   SELECT * FROM employees;
   ```

5. Open `Procedures.sql` and execute the stored procedure definitions.
6. Run the example procedure calls and verify their output.
7. Test the department validation using:

   ```sql
   CALL GetDepartmentSummary('Legal');
   ```

**Execution Order:** Run `Database.sql` first, followed by `Procedures.sql`.

## Testing Examples

```sql
-- Task 1: Employee Salary Report
CALL GetEmployeeSalaryReport('IT', 50000);

-- Task 2: Employee Salary Calculation
CALL CalculateEmployeeSalary(101);

-- Task 3: Employee Salary Grade
CALL EmployeeSalaryGrade(101);

-- Bonus Task: Department Summary
CALL GetDepartmentSummary('HR');

-- Test invalid department
CALL GetDepartmentSummary('Legal');
```

## Key Learning Outcomes

- Creating and executing stored procedures in MySQL
- Passing input parameters
- Filtering employee records
- Calculating salary components
- Applying conditional logic using CASE
- Using aggregate functions for salary analysis
- Grouping records by department
- Implementing basic validation
- Documenting a SQL project for GitHub



## Author

**Lokesh Narkhede**

Aspiring SQL Developer


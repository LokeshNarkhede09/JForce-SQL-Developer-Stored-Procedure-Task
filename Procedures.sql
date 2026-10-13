use JForce; 

select * from employees;

# Task 1 – Employee Salary Report Procedure

Delimiter //

Create Procedure GetEmployeeSalaryReport(
  In dept Varchar(30),
  In min_salary Decimal(10,2)
)
Begin
    Select  employee_id, employee_name, department,
           designation, basic_salary, joining_date
    From employees
    Where  department = dept
      And  basic_salary >= min_salary
      And status = 'Active';
End //

Delimiter ;

call GetEmployeeSalaryReport('IT',50000);

 #  Task 2 – Employee Salary Calculation Procedure
 
 
Delimiter //

Create Procedure CalculateEmployeeSalary(
  In emp_id Int
)
Begin
    Select
        employee_name,
        basic_salary,
        basic_salary * 0.20 As HRA,
        basic_salary * 0.10 As DA,
        basic_salary * 0.12 As PF,
        basic_salary
          + basic_salary * 0.20
          + basic_salary * 0.10
          - basic_salary * 0.12 As net_salary
    From employees
    Where employee_id = emp_id;
End //

Delimiter ;

call CalculateEmployeeSalary(101);


# Task 3 – Salary Grade Procedure


Delimiter //

Create Procedure EmployeeSalaryGrade(
    In emp_id Int
)
Begin
    Select
        employee_name,
        basic_salary,
        Case
            When basic_salary < 30000 Then 'C'
            When basic_salary <= 60000 Then 'B'
            Else 'A'
        End As salary_grade
    From employees
    Where employee_id = emp_id;
End //

Delimiter ;

call EmployeeSalaryGrade(101);


# Bonus Task – Department Summary


Delimiter //

Create Procedure GetDepartmentSummary(
    In dept Varchar(30)
)
Begin
    If Exists (
        Select * From employees
        Where department = dept
    ) Then

        Select
            department,
            Count(*) AS total_employees,
            Avg(basic_salary) AS average_salary,
            Max(basic_salary) AS highest_salary,
            Min(basic_salary) AS lowest_salary,
            Sum(basic_salary) AS total_salary
        From employees
        Where department = dept
        Group by department;

    Else
        Select 'Department does not exist' As message;
    End IF;
End //

Delimiter ;

call GetDepartmentSummary('HR')
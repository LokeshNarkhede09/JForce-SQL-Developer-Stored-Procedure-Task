Create Database JForce;

use JForce;

Create Table employees (
    employee_id int Primary Key,
    employee_name Varchar(50),
    department Varchar(30),
    designation Varchar(50),
    basic_salary Decimal(10,2),
    joining_date Date,
    status Varchar(10)
);

Insert into employees Values

(101, 'Rahul Patil ', 'IT', 'Developer', 55000, '2023-01-15', 'Active'),
(102, 'Priya Sharma', 'IT', 'Analyst', 65000, '2022-06-10', 'Active'),
(103, 'Amit Thakrey', 'IT', 'Tester', 28000, '2024-02-20', 'Active'),
(104, 'Sneha Sinha', 'HR', 'Executive', 35000, '2023-04-12', 'Active'),
(105, 'Karan Patel', 'HR', 'Manager', 72000, '2021-08-01', 'Active'),
(106, 'Pooja Sharma', 'Finance', 'Accountant', 45000, '2022-09-18', 'Active'),
(107, 'Rohit Pawar', 'Finance', 'Manager', 85000, '2020-03-25', 'Active'),
(108, 'Neha Koli', 'Sales', 'Executive', 25000, '2024-01-05', 'Active'),
(109, 'Vikas Patel', 'Sales', 'Manager', 62000, '2021-11-11', 'Inactive'),
(110, 'Anjali Deshmukh', 'Marketing', 'Executive', 40000, '2023-07-07', 'Active') ;

Select * from employees;




--create EXTERNAL TABLE IF NOT EXISTS  employees.departments(
--dept_no string,
--dept_name string)
--ROW FORMAT DELIMITED 
--FIELDS TERMINATED by '\t';
--load data inpath '/user/sqoop/employees/departments' into table employees.departments ;


/*create  TABLE IF NOT EXISTS  employees.dept_emp(
emp_no int,
dept_no string,
from_date Date,
to_date Date)
ROW FORMAT DELIMITED 
FIELDS TERMINATED by '\t';
load data inpath '/user/sqoop/employees/dept_emp' into table employees.dept_emp ;
*/
/*
create  TABLE IF NOT EXISTS  employees.dept_manager(
dept_no string,
emp_no int,
from_date Date,
to_date Date)
ROW FORMAT DELIMITED 
FIELDS TERMINATED by '\t';
load data inpath '/user/sqoop/employees/dept_manager' into table employees.dept_manager ;
*/
/*create  TABLE IF NOT EXISTS  employees.employees(
emp_no int,
birth_date Date,
first_name string,
last_name string,
gender string,
hire_date Date)
ROW FORMAT DELIMITED 
FIELDS TERMINATED by '\t';
load data inpath '/user/sqoop/employees/employees' into table employees.employees ;
*/
/*create  TABLE IF NOT EXISTS  employees.salaries(
emp_no int,
salary int,
from_date Date,
to_date Date)
ROW FORMAT DELIMITED 
FIELDS TERMINATED by '\t';
load data inpath '/user/sqoop/employees/salaries' into table employees.salaries ;
*/
create  TABLE IF NOT EXISTS  employees.titles(
emp_no int,
title string,
from_date Date,
to_date Date)
ROW FORMAT DELIMITED 
FIELDS TERMINATED by '\t';
load data inpath '/user/sqoop/employees/titles' into table employees.titles ;
/*create external table employees.dept_emp_partitioned_by_dept(
    emp_no int,
    from_date Date,
    to_date Date
)
PARTITIONED BY (dept_no STRING)
ROW FORMAT DELIMITED 
FIELDS TERMINATED by '\t'
;*/

insert overwrite table employees.dept_emp_partitioned_by_dept
partition(dept_no)
select d.emp_no,d.from_date,d.to_date,d.dept_no
from employees.dept_emp d;
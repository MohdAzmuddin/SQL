# Write your MySQL query statement below
select max(salary) as SecondHighestSalary
from Employee
# where salary not in (select max(salary) from Employee)
#or
 where salary < (select max(salary) from Employee)

#or
#select
#(select distinct Salary 
#from Employee 
#order by salary desc 
#limit 1 offset 1) 
#as SecondHighestSalary;


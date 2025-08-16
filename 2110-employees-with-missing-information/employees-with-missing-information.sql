# Write your MySQL query statement below
select e.employee_id 
from Employees as e
left join Salaries as s
on e.employee_id = s.employee_id
where s.salary is null
union
select s.employee_id 
from Salaries as s
left join  Employees as e
on s.employee_id = e.employee_id
where e.name is null

order by employee_id asc

or
# Write your MySQL query statement below
select employee_id from Employees where employee_id not in (select employee_id from Salaries)
union 
select employee_id from Salaries where employee_id not in (select employee_id from Employees)
order by employee_id asc

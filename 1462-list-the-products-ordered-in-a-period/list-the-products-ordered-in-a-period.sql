# Write your MySQL query statement below
select p.product_name,sum(u.unit) as unit
from Products as p
left join Orders as u
on p.product_id = u.product_id
where month(u.order_date) = 02 and year(u.order_date) = 2020
group by u.product_id
having sum(u.unit)>=100

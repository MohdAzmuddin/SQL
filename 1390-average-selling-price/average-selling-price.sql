# Write your MySQL query statement below
select p.product_id, ifnull(round(sum(p.price*uni.units)/sum(uni.units),2),0)as average_price
from Prices as p
left join UnitsSold as uni
on p.product_id = uni.product_id
and uni.purchase_date between p.start_date and p.end_date
group by p.product_id

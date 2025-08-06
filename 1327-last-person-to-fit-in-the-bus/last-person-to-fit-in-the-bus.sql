# Write your MySQL query statement below
select q1.person_name
from Queue as q1
left join Queue as q2
on q1.turn >= q2.turn
group by q1.turn
having sum(q2.weight)<=1000
order by q1.turn desc 
limit 1

#or
#SELECT person_name
#FROM (
 #   SELECT person_name, 
 #          SUM(weight) OVER (ORDER BY turn) AS total_weight
 #   FROM Queue
#) AS temp
#WHERE total_weight <= 1000
#ORDER BY total_weight DESC
#LIMIT 1;

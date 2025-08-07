# Write your MySQL query statement below
select id, count(id) as num
from
(
    select requester_id as id from RequestAccepted
    union all
    select accepter_id as id from RequestAccepted
) as temp
group by id
order by count(id) desc
limit 1

or
    
with AllIds as (
    select requester_id as id from RequestAccepted
    union all 
    select accepter_id as id from RequestAccepted
)
select id, count(*) as num from AllIds
group by id
order by num desc
limit 1;

# Write your MySQL query statement below
select round(sum(case when a.event_date = date_add(temp.min_date, interval 1 day) then 1 else 0 end)
/
count(distinct temp.player_id), 2) as fraction
from (select player_id, min(event_date) as min_date from activity group by player_id) as temp
join activity a
on temp.player_id = a.player_id
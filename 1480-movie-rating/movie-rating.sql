# Write your MySQL query statement below
(select u.name as results #count(m.user_id) as cou
from Users as u 
left join MovieRating as m
on u.user_id = m.user_id
group by u.user_id
order by count(m.user_id) desc,u.name asc #(if tie then small name)
limit 1
)
union all
(
select mov.title as results # avg(m.rating) as av
from Movies as mov
left join MovieRating as m
on mov.movie_id  = m.movie_id
where m.created_at between '2020-02-01' and '2020-02-29'
group by m.movie_id
order by avg(m.rating) desc,mov.title
limit 1
);
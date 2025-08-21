# Write your MySQL query statement below
select d.student_id , d.subject,f.score as first_score, l.score as latest_score
from (
    select student_id,subject,min(exam_date) as first_date, max(exam_date) as last_date
    from Scores
    group by student_id,subject
    having count(subject)>1
) as d
left join Scores as f
on d.student_id = f.student_id
and d.subject = f.subject
and d.first_date = f.exam_date
left join Scores as l
on d.student_id = l.student_id
and d.subject = l.subject
and d.last_date = l.exam_date
where f.score<l.score
order by d.student_id asc, d.subject asc;
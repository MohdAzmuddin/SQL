# Write your MySQL query statement below
WITH trial_avg AS (
    SELECT user_id, 
           ROUND(AVG(activity_duration), 2) AS trial_avg_duration
    FROM UserActivity
    WHERE activity_type = 'free_trial'
    GROUP BY user_id
),
paid_avg AS (
    SELECT user_id, 
           ROUND(AVG(activity_duration), 2) AS paid_avg_duration
    FROM UserActivity
    WHERE activity_type = 'paid'
    GROUP BY user_id
)
SELECT t.user_id, t.trial_avg_duration, p.paid_avg_duration
FROM trial_avg t
JOIN paid_avg p 
  ON t.user_id = p.user_id
ORDER BY t.user_id;


OR
# Write your MySQL query statement below

SELECT *
FROM (
    SELECT
        user_id
        , ROUND(AVG(CASE WHEN activity_type = 'free_trial' THEN activity_duration END), 2) AS trial_avg_duration
        , ROUND(AVG(CASE WHEN activity_type = 'Paid' THEN activity_duration END), 2) AS paid_avg_duration
    FROM useractivity
    GROUP BY user_id 
) AS temp
WHERE paid_avg_duration IS NOT NULL



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

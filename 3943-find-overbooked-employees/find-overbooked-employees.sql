# Write your MySQL query statement below
WITH weekly_meetings AS (
    SELECT 
        m.employee_id,
        YEAR(m.meeting_date) AS year,
        WEEK(m.meeting_date, 1) AS week_id,   -- ISO week, Monday start
        SUM(m.duration_hours) AS total_meeting_hours
    FROM meetings m
    GROUP BY m.employee_id, YEAR(m.meeting_date), WEEK(m.meeting_date, 1)
),
heavy_weeks AS (
    SELECT 
        employee_id,
        COUNT(*) AS meeting_heavy_weeks
    FROM weekly_meetings
    WHERE total_meeting_hours > 20
    GROUP BY employee_id
    HAVING COUNT(*) >= 2
)
SELECT 
    e.employee_id,
    e.employee_name,
    e.department,
    h.meeting_heavy_weeks
FROM heavy_weeks h
JOIN employees e
    ON e.employee_id = h.employee_id
ORDER BY h.meeting_heavy_weeks DESC, e.employee_name ASC;

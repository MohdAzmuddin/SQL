WITH trip_efficiency AS (
    SELECT
        t.driver_id,
        CASE 
            WHEN MONTH(t.trip_date) BETWEEN 1 AND 6 THEN 'first_half'
            ELSE 'second_half'
        END AS half,
        (t.distance_km / t.fuel_consumed) AS efficiency
    FROM trips t
),
driver_avg AS (
    SELECT
        driver_id,
        half,
        AVG(efficiency) AS avg_efficiency   -- keep precision
    FROM trip_efficiency
    GROUP BY driver_id, half
),
pivoted AS (
    SELECT
        d.driver_id,
        d.driver_name,
        MAX(CASE WHEN half = 'first_half' THEN avg_efficiency END) AS first_half_avg,
        MAX(CASE WHEN half = 'second_half' THEN avg_efficiency END) AS second_half_avg
    FROM drivers d
    JOIN driver_avg da ON d.driver_id = da.driver_id
    GROUP BY d.driver_id, d.driver_name
)
SELECT
    driver_id,
    driver_name,
    ROUND(first_half_avg, 2) AS first_half_avg,
    ROUND(second_half_avg, 2) AS second_half_avg,
    ROUND(second_half_avg - first_half_avg, 2) AS efficiency_improvement
FROM pivoted
WHERE first_half_avg IS NOT NULL 
  AND second_half_avg IS NOT NULL
  AND second_half_avg > first_half_avg   -- ✅ only improvements
ORDER BY efficiency_improvement DESC, driver_name ASC;

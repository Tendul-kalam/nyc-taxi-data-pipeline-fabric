SELECT
    day_name,
    pickup_day,
    SUM(total_trips) AS total_trips,
    ROUND(SUM(total_revenue), 2)  AS total_revenue,
    ROUND(AVG(avg_fare), 2) AS avg_fare,
    ROUND(AVG(avg_distance_miles),2) AS avg_distance,
    ROUND(SUM(total_tips), 2)  AS total_tips,
    CASE
        WHEN pickup_day IN (1, 7)
        THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type
FROM gold_daily_revenue
GROUP BY day_name, pickup_day
ORDER BY pickup_day;

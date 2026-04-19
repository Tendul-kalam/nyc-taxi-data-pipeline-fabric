SELECT
    pickup_hour,
    total_trips,
    total_revenue,
    avg_fare,
    avg_duration_mins,
    avg_tip,
    -- Rank hours by trip volume
    RANK() OVER (ORDER BY total_trips DESC) AS busiest_rank,
    -- % of daily revenue this hour contributes
    ROUND(
        total_revenue * 100.0 /
        SUM(total_revenue) OVER(),
    2) AS revenue_pct_of_day
FROM gold_hourly_demand
ORDER BY pickup_hour;

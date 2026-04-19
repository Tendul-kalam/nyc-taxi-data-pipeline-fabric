SELECT
    pickup_borough,
    dropoff_borough,
    total_trips,
    total_revenue,
    avg_fare,
    avg_tip,
    avg_distance_miles,
    RANK() OVER (
        ORDER BY total_revenue DESC
    ) AS revenue_rank,
    ROUND(
        total_trips * 100.0 /
        SUM(total_trips) OVER(), 2
    ) AS trip_share_pct
FROM gold_borough_performance
ORDER BY total_revenue DESC;

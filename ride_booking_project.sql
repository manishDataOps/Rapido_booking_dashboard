--- rapido booking cancellation analysis

-- ride booking overview KPI
SELECT 
COUNT(booking_id) AS total_booking,
SUM( CASE WHEN ride_status = 'completed' THEN 1 ELSE 0 END ) AS total_complete_ride,
SUM( CASE WHEN ride_status = 'cancelled' THEN 1 ELSE 0 END ) AS total_cancelled_rid,
CAST( SUM( CASE WHEN ride_status = 'cancelled' THEN 1 ELSE 0 END ) * 100.0 / COUNT(booking_id) AS DECIMAL(5,2)) AS cancellation_rate,
SUM( actual_fare) AS total_complete_ride_amount,
SUM( CASE WHEN ride_status = 'cancelled' THEN estimated_fare ELSE 0 END ) AS total_revenue_loss,
SUM( actual_fare) + SUM( CASE WHEN ride_status = 'cancelled' THEN estimated_fare ELSE 0 END ) AS potencial_amount
FROM booking_rawdata;


SELECT DISTINCT ride_name_day_of_week, member_casual
,PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ride_seconds)  
    OVER (PARTITION BY ride_name_day_of_week) AS MedianCont  
,PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY ride_seconds)  
    OVER (PARTITION BY ride_name_day_of_week) AS MedianDisc, 
AVG(ride_seconds) OVER (PARTITION BY ride_name_day_of_week) AS rs_avg,
MIN(ride_seconds) OVER (PARTITION BY ride_name_day_of_week) AS rs_min,
MAX(ride_seconds) OVER (PARTITION BY ride_name_day_of_week) AS rs_max,
SUM(ride_seconds)  OVER (PARTITION BY ride_name_day_of_week) AS rs_total_sec
FROM Bike_trips_class.dbo.divvytips_proj_all_data
WHERE member_casual = 0

UNION

SELECT DISTINCT ride_name_day_of_week, member_casual
,PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ride_seconds)  
    OVER (PARTITION BY ride_name_day_of_week) AS MedianCont  
,PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY ride_seconds)  
    OVER (PARTITION BY ride_name_day_of_week) AS MedianDisc, 
AVG(ride_seconds) OVER (PARTITION BY ride_name_day_of_week) AS rs_avg,
MIN(ride_seconds) OVER (PARTITION BY ride_name_day_of_week) AS rs_min,
MAX(ride_seconds) OVER (PARTITION BY ride_name_day_of_week) AS rs_max,
SUM(ride_seconds)  OVER (PARTITION BY ride_name_day_of_week) AS rs_total_sec
FROM Bike_trips_class.dbo.divvytips_proj_all_data
WHERE member_casual = 1
order by member_casual, ride_name_day_of_week








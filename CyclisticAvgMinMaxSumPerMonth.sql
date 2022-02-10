--Member

SELECT * INTO Bike_trips_class.dbo.divvytrips_proj_all

FROM(

  SELECT DISTINCT started_at_month_name, started_at_month_number, 'member' AS type
,PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ride_seconds)  
    OVER (PARTITION BY started_at_month_name) AS MedianCont  
,PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY ride_seconds)  
    OVER (PARTITION BY started_at_month_name) AS MedianDisc, 
AVG(ride_seconds) OVER (PARTITION BY started_at_month_name) AS rs_avg,
MIN(ride_seconds) OVER (PARTITION BY started_at_month_name) AS rs_min,
MAX(ride_seconds) OVER (PARTITION BY started_at_month_name) AS rs_max,
SUM(ride_seconds)  OVER (PARTITION BY started_at_month_name) AS rs_total_sec,
COUNT(*) OVER (PARTITION BY started_at_month_name) AS count_rides
FROM Bike_trips_class.dbo.['divvytips_ProjQ1$']
WHERE member_casual = 0


UNION

 SELECT DISTINCT started_at_month_name, started_at_month_number, 'member' AS type
,PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ride_seconds)  
    OVER (PARTITION BY started_at_month_name) AS MedianCont  
,PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY ride_seconds)  
    OVER (PARTITION BY started_at_month_name) AS MedianDisc, 
AVG(ride_seconds) OVER (PARTITION BY started_at_month_name) AS rs_avg,
MIN(ride_seconds) OVER (PARTITION BY started_at_month_name) AS rs_min,
MAX(ride_seconds) OVER (PARTITION BY started_at_month_name) AS rs_max,
SUM(ride_seconds)  OVER (PARTITION BY started_at_month_name) AS rs_total_sec,
COUNT(*) OVER (PARTITION BY started_at_month_name) AS count_rides
FROM Bike_trips_class.dbo.['divvytips_ProjQ2$']
WHERE member_casual = 0

UNION

SELECT DISTINCT started_at_month_name, started_at_month_number, 'member' AS type
,PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ride_seconds)  
    OVER (PARTITION BY started_at_month_name) AS MedianCont  
,PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY ride_seconds)  
    OVER (PARTITION BY started_at_month_name) AS MedianDisc, 
AVG(ride_seconds) OVER (PARTITION BY started_at_month_name) AS rs_avg,
MIN(ride_seconds) OVER (PARTITION BY started_at_month_name) AS rs_min,
MAX(ride_seconds) OVER (PARTITION BY started_at_month_name) AS rs_max,
SUM(ride_seconds)  OVER (PARTITION BY started_at_month_name) AS rs_total_sec,
COUNT(*) OVER (PARTITION BY started_at_month_name) AS count_rides
FROM Bike_trips_class.dbo.['divvytips_ProjQ3$']
WHERE member_casual = 0

UNION

SELECT DISTINCT started_at_month_name, started_at_month_number, 'member' AS type
,PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ride_seconds)  
    OVER (PARTITION BY started_at_month_name) AS MedianCont  
,PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY ride_seconds)  
    OVER (PARTITION BY started_at_month_name) AS MedianDisc, 
AVG(ride_seconds) OVER (PARTITION BY started_at_month_name) AS rs_avg,
MIN(ride_seconds) OVER (PARTITION BY started_at_month_name) AS rs_min,
MAX(ride_seconds) OVER (PARTITION BY started_at_month_name) AS rs_max,
SUM(ride_seconds)  OVER (PARTITION BY started_at_month_name) AS rs_total_sec,
COUNT(*) OVER (PARTITION BY started_at_month_name) AS count_rides
FROM Bike_trips_class.dbo.['divvytips_ProjQ4$']
WHERE member_casual = 0

--ORDER BY started_at_month_number, MedianCont, rs_avg

UNION

--Casual

  SELECT DISTINCT started_at_month_name, started_at_month_number, 'casual' AS type
,PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ride_seconds)  
    OVER (PARTITION BY started_at_month_name) AS MedianCont  
,PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY ride_seconds)  
    OVER (PARTITION BY started_at_month_name) AS MedianDisc, 
AVG(ride_seconds) OVER (PARTITION BY started_at_month_name) AS rs_avg,
MIN(ride_seconds) OVER (PARTITION BY started_at_month_name) AS rs_min,
MAX(ride_seconds) OVER (PARTITION BY started_at_month_name) AS rs_max,
SUM(ride_seconds)  OVER (PARTITION BY started_at_month_name) AS rs_total_sec,
COUNT(*) OVER (PARTITION BY started_at_month_name) AS count_rides
FROM Bike_trips_class.dbo.['divvytips_ProjQ1$']
WHERE member_casual = 1


UNION

 SELECT DISTINCT started_at_month_name, started_at_month_number, 'casual' AS type
,PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ride_seconds)  
    OVER (PARTITION BY started_at_month_name) AS MedianCont  
,PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY ride_seconds)  
    OVER (PARTITION BY started_at_month_name) AS MedianDisc, 
AVG(ride_seconds) OVER (PARTITION BY started_at_month_name) AS rs_avg,
MIN(ride_seconds) OVER (PARTITION BY started_at_month_name) AS rs_min,
MAX(ride_seconds) OVER (PARTITION BY started_at_month_name) AS rs_max,
SUM(ride_seconds)  OVER (PARTITION BY started_at_month_name) AS rs_total_sec,
COUNT(*) OVER (PARTITION BY started_at_month_name) AS count_rides
FROM Bike_trips_class.dbo.['divvytips_ProjQ2$']
WHERE member_casual = 1

UNION

SELECT DISTINCT started_at_month_name, started_at_month_number, 'casual' AS type
,PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ride_seconds)  
    OVER (PARTITION BY started_at_month_name) AS MedianCont  
,PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY ride_seconds)  
    OVER (PARTITION BY started_at_month_name) AS MedianDisc, 
AVG(ride_seconds) OVER (PARTITION BY started_at_month_name) AS rs_avg,
MIN(ride_seconds) OVER (PARTITION BY started_at_month_name) AS rs_min,
MAX(ride_seconds) OVER (PARTITION BY started_at_month_name) AS rs_max,
SUM(ride_seconds)  OVER (PARTITION BY started_at_month_name) AS rs_total_sec,
COUNT(*) OVER (PARTITION BY started_at_month_name) AS count_rides
FROM Bike_trips_class.dbo.['divvytips_ProjQ3$']
WHERE member_casual = 1

UNION

SELECT DISTINCT started_at_month_name, started_at_month_number, 'casual' AS type
,PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ride_seconds)  
    OVER (PARTITION BY started_at_month_name) AS MedianCont  
,PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY ride_seconds)  
    OVER (PARTITION BY started_at_month_name) AS MedianDisc, 
AVG(ride_seconds) OVER (PARTITION BY started_at_month_name) AS rs_avg,
MIN(ride_seconds) OVER (PARTITION BY started_at_month_name) AS rs_min,
MAX(ride_seconds) OVER (PARTITION BY started_at_month_name) AS rs_max,
SUM(ride_seconds)  OVER (PARTITION BY started_at_month_name) AS rs_total_sec,
COUNT(*) OVER (PARTITION BY started_at_month_name) AS count_rides
FROM Bike_trips_class.dbo.['divvytips_ProjQ4$']
WHERE member_casual = 1

ORDER BY  type desc, started_at_month_number,MedianCont, rs_avg

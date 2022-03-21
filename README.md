- 👋 Hi, I’m @MatijaMosunic
- 👀 I’m interested in employment as a Data Analyst
- 📫 How to reach me: matija@gmail.com
<hr>
<H1>Google Data Analytics: Capstone</H1>

<H2>Cyclistic Bike-Share Analysis</H2>

This analysis is an optional Capstone project from the <a href="https://www.coursera.org/professional-certificates/google-data-analytics">Google Data Analytics Professional Certificate</a> on Coursera.

<b>About The Company</b><br>

In 2016, Cyclistic launched a successful bike-share offering. The program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 
692 stations across Chicago. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes,
and annual memberships.

Lily Moreno, Cyclistic's Marketing Manager, believes that maximizing the number of annual members from the pool of casual users will be key to future growth.

<b>Business Task</b>

Analyze 12 months of Cyclistic trip data to gain insights into how members and casual riders are using the Cyclistic bikes differently. Use these insights to determine why a casual rider would buy an annual membership and how to market annual memberships to casual riders.

<b>Objectives</b>

<ul>
<li>What story does the data tell?</li>
<li>How do my findings relate to your original question?</li>
<li>Who is the audience? What is the best way to communicate with them?</li>
</ul>

<b>Data</b>

Motivate International, Inc., provided the license to be used by students in this program. The license is located <a href="https://ride.divvybikes.com/data-license-agreement">here</a>. The original data can be found here: <a href="https://www.kaggle.com/matijamosunic/cyclistic-data-12-months"> Kaggle </a>.

<b>Tools</b>

MS Excel and MS SQL 2019 for Data Cleaning.  Continued with MS SQL for Data Transformation and Data Analysis. Tableau for Data Visualization.

<hr>

<h2> Analysis </h2>

I transferred 12 months of .csv files from Motivate International. I created a database in MS SQL 2019 calling it Cyclistic. I used MS SQL's Server Import and Export Wizard to import flat files into tables to store in the database. 

I joined 12 tables into one table with a UNION ALL statement. This left me with over five million rows. I could see missing data in many important columns while quickly looking it over.

``` 
SELECT * INTO cyclistic_project
  FROM (
SELECT * FROM 202010_divvy_tripdata  
	UNION ALL 
	SELECT * FROM 202011_divvy_tripdata  
		UNION ALL 
	SELECT * FROM 202012_divvy_tripdata 
		UNION ALL 
	SELECT * FROM 202101_divvy_tripdata 
		UNION ALL 
	SELECT * FROM 202102_divvy_tripdata  
		UNION ALL 
	SELECT * FROM 202103_divvy_tripdata
		UNION ALL
	SELECT * FROM 202104_divvy_tripdata
		UNION ALL
	SELECT * FROM 202105_divvy_tripdata
		UNION ALL
	SELECT * FROM 202106_divvy_tripdata
		UNION ALL
	SELECT * FROM 202107_divvy_tripdata
		UNION ALL
	SELECT * FROM 202108_divvy_tripdata
		UNION ALL
	SELECT * FROM 202109_divvy_tripdata
		)a 
```

Next, I cleaned the data by deleting corrupt or dirty data: 

1) End datetimes which began before start datetimes, and start datetimes equal to end datetimes;

2) A bike trip with missing start or end station names, and incorrectly formatted latitudes. Correct latitude are comprised of 2 numbers and at least four numbers following the decimal point. Correct longtitudes start with a negative and have two numbers and at least four number following the decimal;

3) Bike trips which were test rides, those of one minute or less duration and those of greater than 24 hours do not represent usual customers per Cyclistic. Those are deleted from the database;

4) Searched for duplicate rides and found none.

```
DELETE FROM cyclistic_project
  WHERE started_at > ended_at;
DELETE FROM cyclistic_project
  WHERE start_station_name IS NULL 
    AND start_station_id IS NULL
    AND len(start_lat) IN (1, 2, 3, 4, 5) 
     OR len(start_lng) IN (1, 2, 3, 4, 5, 6)
     OR start_lat IS NULL
     OR start_lng IS NULL;
DELETE FROM cyclistic_project
  WHERE end_station_name IS NULL
     AND end_station_ID IS NULL
      AND len(end_lat) IN (1, 2, 3, 4, 5) 
      OR len(end_lng) IN (1, 2, 3, 4, 5, 6)
      OR end_lat IS NULL
      OR end_lng IS NULL;
DELETE FROM cyclistic_project
   WHERE start_station_name IS LIKE ('%test%') 
      OR end_station_name IS LIKE ('%test%');
DELETE T
FROM
(
SELECT *
, DupRank = ROW_NUMBER() OVER (
              PARTITION BY ride_id
              ORDER BY (SELECT NULL)
            )
FROM cyclistic_project
) AS T
WHERE DupRank > 1; 
```
The next step is analyzing our data to create the Tableau charts.
```
SELECT DISTINCT FORMAT(started_at, 'MMM-yy') AS ride_month_yr,  
    'member' AS ride_type, DATEPART(yy, started_at), DATEPART(m, started_at),
     SUM(DATEDIFF(hh, started_at, ended_at))  OVER (PARTITION BY FORMAT(started_at, 'MMM-yy')) AS total_hours,
      COUNT(*) OVER (PARTITION BY FORMAT(started_at, 'MMM-yy')) AS count_rides
FROM cyclistic_project
     WHERE member_casual = 'member'
     ORDER BY DATEPART(yy, started_at), DATEPART(m, started_at)
     
SELECT DISTINCT DATENAME(WEEKDAY, started_at), 'member' AS ride_type, DATEPART(WEEKDAY, started_at),
       SUM(DATEDIFF(hh, started_at, ended_at))  OVER (PARTITION BY DATENAME(WEEKDAY, started_at)) AS total_hours,
       COUNT(*) OVER (PARTITION BY DATENAME(WEEKDAY, started_at)) AS count_rides
FROM cyclistic_project
    WHERE member_casual ='member'
    ORDER BY DATEPART(WEEKDAY, started_at) 
```

![t_weekdays](https://user-images.githubusercontent.com/70773304/159269410-8d45fef0-6058-4040-a571-55e57fa464c4.png)

```
SELECT  start_time =
	CASE DATEPART(HH, started_at)
	WHEN 0 THEN '12 AM'
	WHEN 12 THEN '12 PM'
	WHEN 13 THEN '1 PM'
	WHEN 14 THEN '2 PM'
	WHEN 15 THEN '3 PM'
	WHEN 16 THEN '4 PM'
	WHEN 17 THEN '5 PM'
	WHEN 18 THEN '6 PM'
	WHEN 19 THEN '7 PM'
	WHEN 20 THEN '8 PM'
	WHEN 21 THEN '9 PM'
	WHEN 22 THEN '10 PM'
	WHEN 23 THEN '11 PM'
	ELSE '' +  CAST(DATEPART(HH, started_at) AS varchar(10))  +  ''  + ' AM'
	END,  
	DATEPART(HOUR,started_at) AS started_time_hr,
	Count(*) AS ride_cnt, 
	SUM(ride_seconds)/3600 AS time_cnt, ((SUM(ride_seconds))/Count(*)/60)  AS avg_duration, 
	member_casual, 'member' AS qtr_txt, '1' AS date_guide, started_at_month_name, 
```

![t_heatmap](https://user-images.githubusercontent.com/70773304/159270411-2b644536-373b-4e86-8b1a-3d2db1267a57.png)

```
SELECT DISTINCT member_casual,   
    convert(char(8),dateadd(s,   PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY DATEDIFF_BIG( ss, started_at, ended_at))  
    OVER (PARTITION BY member_casual)    ,'1900-1-1'),8) AS MedianCont,
 convert(char(8),dateadd(s,   AVG(DATEDIFF_BIG( ss, started_at, ended_at)) OVER (PARTITION BY member_casual)    ,'1900-1-1'),8)  AS rs_avg,
MIN(DATEDIFF_BIG( ss, started_at, ended_at)) OVER (PARTITION BY member_casual)  AS rs_min,
MAX(DATEDIFF_BIG( ss, started_at, ended_at)) OVER (PARTITION BY member_casual)AS rs_max,
SUM(DATEDIFF_BIG( ss, started_at, ended_at)) OVER (PARTITION BY member_casual) AS rs_total_min,
COUNT(*) OVER (PARTITION BY member_casual) AS count_rides
FROM cyclistic_project
WHERE member_casual = 'casual'

UNION

  SELECT DISTINCT member_casual,   
    convert(char(8),dateadd(s,   PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY DATEDIFF_BIG( ss, started_at, ended_at))  
    OVER (PARTITION BY member_casual)    ,'1900-1-1'),8) AS MedianCont ,
convert(char(8),dateadd(s,   AVG(DATEDIFF_BIG( ss, started_at, ended_at)) OVER (PARTITION BY member_casual)    ,'1900-1-1'),8)  AS rs_avg,
MIN(DATEDIFF_BIG( ss, started_at, ended_at)) OVER (PARTITION BY member_casual)  AS rs_min,
MAX(DATEDIFF_BIG( ss, started_at, ended_at)) OVER (PARTITION BY member_casual)AS rs_max,
SUM(DATEDIFF_BIG( ss, started_at, ended_at)) OVER (PARTITION BY member_casual) AS rs_total_min,
COUNT(*) OVER (PARTITION BY member_casual) AS count_rides
FROM cyclistic_project
WHERE member_casual = 'member'
ORDER BY   member_casual
```
![t_median](https://user-images.githubusercontent.com/70773304/159273090-c3675846-5c3d-4475-b943-1dff18c7af1d.png)

```
SELECT TOP 20 SUM(temp.no_rides) AS Number_of_rides, temp.station_name, temp.lat_station, temp.long_station, temp.user_type FROM

  (SELECT DISTINCT COUNT(a.start_station_name) AS no_rides, a.start_station_name AS station_name,  a.member_casual AS user_type, b.Latitude AS lat_station, b.Longitude AS long_station
  FROM dbo.cyclistic_project a LEFT JOIN dbo.cyclistic_lat_long b 
	ON a.start_station_name = b.full_address
  WHERE member_casual = 'casual'
  GROUP BY a.start_station_name, a.member_casual, b.Latitude, b.Longitude
 
  UNION ALL

  SELECT DISTINCT COUNT(a.end_station_name) AS no_rides, a.end_station_name AS station_name,  a.member_casual AS user_type, b.Latitude AS lat_station, b.Longitude AS long_station
  FROM dbo.cyclistic_project a LEFT JOIN dbo.cyclistic_lat_long b
  ON a.end_station_name = b.full_address
  WHERE member_casual = 'casual'
 
  GROUP BY  a.end_station_name, a.member_casual, b.Latitude, b.Longitude  
  ) AS  temp


  GROUP BY 
	temp.station_name, temp.lat_station, temp.long_station, temp.user_type
ORDER BY 
	SUM(temp.no_rides) DESC
```
![t_toptwenty_map](https://user-images.githubusercontent.com/70773304/159273638-1ead56a3-3145-474b-b20a-2612c859eee3.png)

<!---
MatijaMosunic/MatijaMosunic is a ✨ special ✨ repository because its `README.md` (this file) appears on your GitHub profile.
You can click the Preview link to take a look at your changes.
--->

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ride_id]
      ,[rideable_type]
      ,[started_at]
      ,[ended_at]
      ,[start_st]
      ,[end_st]
      ,[member_casual]
      ,[ride_seconds]
      ,[ride_day_of_week]
      ,[ride_name_day_of_week]
      ,[started_at_month_name]
      ,[started_at_month_number]
  FROM [Bike_trips_class].[dbo].['divvytips_ProjQ1$']



  INSERT INTO
 [Bike_trips_class].[dbo].['divvytips_ProjQ1$']



INSERT INTO [Bike_trips_class].[dbo].['divvytips_ProjQ1$'](started_at_lat, started_at_lng) -- ended_at_lat, ended_at_lng)
SELECT t1.Latitude, t1.Longitude 
FROM [Bike_trips_class].[dbo].divvy_long_lat$ t1
INNER JOIN [Bike_trips_class].[dbo].['divvytips_ProjQ1$'] t2 ON t2.start_st = t1.full_address 
INNER JOIN  [Bike_trips_class].[dbo].['divvytips_ProjQ1$'] t3 ON t3.end_st = t1.full_address 
ORDER BY full_address

SELECT * FROM [Bike_trips_class].[dbo].['divvytips_ProjQ1$']

--INNER JOIN [Bike_trips_class].[dbo].['divvytips_ProjQ1$']t3 ON t3.end_st = t1.full_address


 

SELECT t1.start_st AS main_start, t1.end_st AS main_end, t2.full_address, t2.Latitude, t2.Longitude, t3.full_address, t3.Latitude, t3.Longitude
FROM Bike_trips_class.dbo.['divvytips_ProjQ1$'] t1
INNER JOIN Bike_trips_class.dbo.divvy_long_lat$ t2 ON t1.start_st = t2.full_address
INNER JOIN Bike_trips_class.dbo.divvy_long_lat$ t3 ON t1.end_st = t3.full_address

UNION ALL

SELECT t1.start_st AS main_start, t1.end_st AS main_end, t2.full_address, t2.Latitude, t2.Longitude, t3.full_address
FROM Bike_trips_class.dbo.['divvytips_ProjQ2$'] t1
INNER JOIN Bike_trips_class.dbo.divvy_long_lat$ t2 ON t1.start_st = t2.full_address
INNER JOIN Bike_trips_class.dbo.divvy_long_lat$ t3 ON t1.end_st = t3.full_address


UNION ALL


SELECT t1.start_st AS main_start, t1.end_st AS main_end, t2.full_address, t2.Latitude, t2.Longitude, t3.full_address
FROM Bike_trips_class.dbo.['divvytips_ProjQ3$'] t1
INNER JOIN Bike_trips_class.dbo.divvy_long_lat$ t2 ON t1.start_st = t2.full_address
INNER JOIN Bike_trips_class.dbo.divvy_long_lat$ t3 ON t1.end_st = t3.full_address


UNION ALL

SELECT t1.start_st AS main_start, t1.end_st AS main_end, t2.full_address, t2.Latitude, t2.Longitude, t3.full_address
FROM Bike_trips_class.dbo.['divvytips_ProjQ4$'] t1
INNER JOIN Bike_trips_class.dbo.divvy_long_lat$ t2 ON t1.start_st = t2.full_address
INNER JOIN Bike_trips_class.dbo.divvy_long_lat$ t3 ON t1.end_st = t3.full_address




INSERT INTO [Bike_trips_class].[dbo].['divvytips_ProjQ1$'](started_at_lat, started_at_lng,ended_at_lat, ended_at_lng)
(SELECT t2.Latitude, t2.Longitude,  t3.Latitude, t3.Longitude
FROM Bike_trips_class.dbo.['divvytips_ProjQ1$'] t1
INNER JOIN Bike_trips_class.dbo.divvy_long_lat$ t2 ON t1.start_st = t2.full_address
INNER JOIN Bike_trips_class.dbo.divvy_long_lat$ t3 ON t1.end_st = t3.full_address)



UPDATE Bike_trips_class.dbo.divvytips_proj_all_data 
SET started_at_lat =t4.Latitude,
    started_at_lng = t4.Longitude,
	ended_at_lat = t4.end_lat,
	ended_at_lng = t4.end_lng

FROM 
(SELECT t2.Latitude, t2.Longitude,  t3.Latitude AS end_lat, t3.Longitude AS end_lng, t1.start_st AS start_stn, t1.end_st AS end_stn
FROM Bike_trips_class.dbo.divvytips_proj_all_data t1
INNER JOIN Bike_trips_class.dbo.divvy_long_lat$ t2 ON t1.start_st = t2.full_address
INNER JOIN Bike_trips_class.dbo.divvy_long_lat$ t3 ON t1.end_st = t3.full_address)
AS t4
WHERE t4.start_stn = Bike_trips_class.dbo.divvytips_proj_all_data.start_st
AND t4.end_stn = Bike_trips_class.dbo.divvytips_proj_all_data.end_st

SELECT * FROM Bike_trips_class.dbo.['divvytips_ProjQ4$']


select * from Bike_trips_class.dbo.divvy_long_lat$
WHERE full_address = 'Clark St & Lincoln Ave'



--ended_at_lat	ended_at_lng
--started_at_lat	started_at_lng
--41.9156173	-87.6343492



SELECT * FROM Bike_trips_class.dbo.divvytips_proj_all_data
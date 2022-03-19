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

2) A bike trip with missing start or end station names, and latitudes or longitudes of less five characters or less. Correct latitudes and longitudes are comprised of 2 numbers and at least four numbers following the decimal point;

3) Bike trips which were test rides, those of one minute or less duration and those of greater than 24 hours do not represent usual customers per Cyclistic. Those are deleted from the database;

4) Searched for duplicate rides and found none.

```
DELETE FROM cyclistic_project
  WHERE started_at > ended_at;
DELETE FROM cyclistic_project
  WHERE start_station_name IS NULL 
    AND start_station_id IS NULL;
DELETE FROM cyclistic_project
  WHERE end_station_name IS NULL
     AND end_station_ID IS NULL;



<!---
MatijaMosunic/MatijaMosunic is a ✨ special ✨ repository because its `README.md` (this file) appears on your GitHub profile.
You can click the Preview link to take a look at your changes.
--->

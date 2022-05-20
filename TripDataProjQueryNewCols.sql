--Tableu Graph Tables
--Create a temo table with the filtered data 
--date,day,month,year,ride_len_sec,ride_len_min,day_of_week in SQL
select * 
From TripDataProj..TripDataFull

--Date, Day, month, year 
select started_at,
Cast(started_at as date) as date,
Datename(WEEKDAY, started_at) as weekday,
Datepart(WEEKDAY, started_at) as weekday_num,
year(started_at) as year,
Datename(MONTH, started_at) as month,
Month(started_at) as month_num
From TripDataProj..TripDataFull

--ride_len_sec,ride_len_min
select started_at, ended_at,
datediff(second, started_at, ended_at) As ride_len_sec,
datediff(minute, started_at, ended_at) As ride_len_minApprox, --Rounds to the nearest minute 
Cast(datediff(second, started_at, ended_at) as float)/60 As ride_len_min --exact
From TripDataProj..TripDataFull
order by started_at




--Put them all together

--Lets get a clone of TripDataFull
--Create Table TripData_v1 like TripDataProj..TripDataFull does not work with T-SQL
Drop Table if Exists TripData_v1
CREATE TABLE [dbo].[TripData_v1](
	[ride_id] [nvarchar](255) NULL,
	[rideable_type] [nvarchar](255) NULL,
	[started_at] [datetime] NULL,
	[ended_at] [datetime] NULL,
	[start_station_name] [nvarchar](255) NULL,
	[start_station_id] [nvarchar](255) NULL,
	[end_station_name] [nvarchar](255) NULL,
	[end_station_id] [nvarchar](255) NULL,
	[start_lat] [float] NULL,
	[start_lng] [float] NULL,
	[end_lat] [float] NULL,
	[end_lng] [float] NULL,
	[member_casual] [nvarchar](255) NULL,
	[date] [date] NULL,
	[weekday] [nvarchar](255) NULL,
	[weekday_num] [int] NULL,
	[year] [int] NULL,
	[month] [nvarchar](255) NULL,
	[month_num] [int] NULL,
	[ride_len_sec] [int] NULL,
	[ride_len_minApprox] [int] NULL,
	[ride_len_min] [float] NULL 
) 
Go

--What we want to Insert in TripData_v1
select *, 
Cast(started_at as date) as date,
Datename(WEEKDAY, started_at) as weekday,
Datepart(WEEKDAY, started_at) as weekday_num,
year(started_at) as year,
Datename(MONTH, started_at) as month,
Month(started_at) as month_num,
datediff(second, started_at, ended_at) As ride_len_sec,
datediff(minute, started_at, ended_at) As ride_len_minApprox, --Rounds to the nearest minute 
Cast(datediff(second, started_at, ended_at) as float)/60 As ride_len_min --exact
From TripDataProj..TripDataFull


Insert into TripDataProj..TripData_v1
select *, 
Cast(started_at as date) as date,
Datename(WEEKDAY, started_at) as weekday,
Datepart(WEEKDAY, started_at) as weekday_num,
year(started_at) as year,
Datename(MONTH, started_at) as month,
Month(started_at) as month_num,
datediff(second, started_at, ended_at) As ride_len_sec,
datediff(minute, started_at, ended_at) As ride_len_minApprox, --Rounds to the nearest minute 
Cast(datediff(second, started_at, ended_at) as float)/60 As ride_len_min --exact
From TripDataProj..TripDataFull

select *
From TripDataProj..TripData_v1
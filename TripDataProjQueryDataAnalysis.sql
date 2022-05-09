--This is Trip Data_v2 
Drop Table if Exists TripData_v2
CREATE TABLE [dbo].[TripData_v2](
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
--omit the Negative ride lengths 
Insert into TripData_v2
select *
From TripDataProj..TripData_v1
where not ride_len_sec <= 0


Select *
From TripDataProj..TripData_v2


--Average ride length in seconds: Member vs Casual
Select member_casual,
	Avg(cast(ride_len_sec as bigint)) as Mean_ride_len
From TripDataProj..TripData_v2
Group By member_casual

--Average ride length in seconds: Member vs Casual By Day of Week
Select member_casual, weekday, weekday_num,  
	Avg(cast(ride_len_sec as bigint)) as Mean_ride_len
From TripDataProj..TripData_v2
Group By member_casual, weekday, weekday_num
Order By member_casual, weekday_num

--Average ride length in seconds: Member vs Casual By Month
Select member_casual, month, month_num,
	Avg(cast(ride_len_sec as bigint)) as Mean_ride_len
From TripDataProj..TripData_v2
Group By member_casual, month, month_num
Order by member_casual, month_num

--Average ride length in seconds: Member vs Casual By Bike Type
Select member_casual, rideable_type,
	Avg(cast(ride_len_sec as bigint)) as Mean_ride_len
From TripDataProj..TripData_v2
Group By member_casual, rideable_type



--Number of Rides: Member vs Casual 
Select member_casual,
	Count(ride_len_sec) as ride_len_count
From TripDataProj..TripData_v2
Group By member_casual

--Number of Rides: Member vs Casual By Day of Week
Select member_casual, weekday, weekday_num,  
	Count(ride_len_sec) as ride_len_count
From TripDataProj..TripData_v2
Group By member_casual, weekday, weekday_num
Order By member_casual, weekday_num

--Number of Rides: Member vs Casual By Bike Type
Select member_casual, rideable_type,
	Count(ride_len_sec) as ride_len_count
From TripDataProj..TripData_v2
Group By member_casual, rideable_type

--Number of Rides: Member vs Casual By Month
Select member_casual, month, month_num,
	Count(ride_len_sec) as ride_len_count
From TripDataProj..TripData_v2
Group By member_casual, month, month_num
Order by member_casual, month_num


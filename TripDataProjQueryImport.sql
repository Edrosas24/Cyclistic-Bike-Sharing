Create Table TripDataFull
([ride_id] nvarchar(255) null
,[rideable_type] nvarchar(255) null
,[started_at] datetime null
,[ended_at] datetime  null
,[start_station_name] nvarchar(255) null
,[start_station_id] nvarchar(255) null
,[end_station_name] nvarchar(255) null
,[end_station_id] nvarchar(255) null
,[start_lat] float null
,[start_lng] float null
,[end_lat] float null
,[end_lng] float null
,[member_casual] nvarchar(255) null
)


Insert Into TripDataFull(
[ride_id]
      ,[rideable_type]
      ,[started_at]
      ,[ended_at]
      ,[start_station_name]
      ,[start_station_id]
      ,[end_station_name]
      ,[end_station_id]
      ,[start_lat]
      ,[start_lng]
      ,[end_lat]
      ,[end_lng]
      ,[member_casual]
)
Select [ride_id]
      ,[rideable_type]
      ,[started_at]
      ,[ended_at]
      ,[start_station_name]
      ,[start_station_id]
      ,[end_station_name]
      ,[end_station_id]
      ,[start_lat]
      ,[start_lng]
      ,[end_lat]
      ,[end_lng]
      ,[member_casual]
From TripDataProj..['202202-divvy-tripdata$'] --went through all the tables 
--I inserted the the monthly tables into my new Table: TripDataFull 
--I changed TripDataProj..['202102-divvy-tripdata$'] to TripDataProj..['202103-divvy-tripdata$']
-- Executed and kept inserting until the last table TripDataProj..['202202-divvy-tripdata$']

Select Count(*)
From TripDataProj..TripDataFull

--Lets Extract the data 

--We will export as csv to up load it to R
--We can also do an excel file 









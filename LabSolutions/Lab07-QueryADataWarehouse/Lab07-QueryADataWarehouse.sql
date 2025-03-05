
SELECT 
D.MonthName, 
COUNT(*) AS TotalTrips, 
SUM(T.TotalAmount) AS TotalRevenue 
FROM dbo.Trip AS T
JOIN dbo.[Date] AS D
    ON T.[DateID]=D.[DateID]
GROUP BY D.MonthName;


SELECT 
D.DayName, 
AVG(T.TripDurationSeconds) AS AvgDuration, 
AVG(T.TripDistanceMiles) AS AvgDistance 
FROM dbo.Trip AS T
JOIN dbo.[Date] AS D
    ON T.[DateID]=D.[DateID]
GROUP BY D.DayName;

SELECT TOP 10 
G.City, 
COUNT(*) AS TotalTrips 
FROM dbo.Trip AS T
JOIN dbo.Geography AS G
    ON T.PickupGeographyID=G.GeographyID
GROUP BY G.City
ORDER BY TotalTrips DESC;

SELECT TOP 10 
    G.City, 
    COUNT(*) AS TotalTrips 
FROM dbo.Trip AS T
JOIN dbo.Geography AS G
    ON T.DropoffGeographyID=G.GeographyID
GROUP BY G.City
ORDER BY TotalTrips DESC;

-- Check for trips with unusually long duration
SELECT COUNT(*) FROM dbo.Trip WHERE TripDurationSeconds > 86400; -- 24 hours

-- Check for trips with negative trip duration
SELECT COUNT(*) FROM dbo.Trip WHERE TripDurationSeconds < 0;

-- Remove trips with negative trip duration
DELETE FROM dbo.Trip WHERE TripDurationSeconds < 0;

SELECT 
    D.DayName, 
    AVG(T.TripDurationSeconds) AS AvgDuration, 
    AVG(T.TripDistanceMiles) AS AvgDistance 
FROM dbo.Trip AS T
JOIN dbo.[Date] AS D
    ON T.[DateID]=D.[DateID]
GROUP BY D.DayName;

SELECT 
    D.DayName, 
    AVG(T.TripDurationSeconds) AS AvgDuration, 
    AVG(T.TripDistanceMiles) AS AvgDistance 
FROM dbo.Trip AS T
JOIN dbo.[Date] AS D
    ON T.[DateID]=D.[DateID]
WHERE D.Month = 1
GROUP BY D.DayName
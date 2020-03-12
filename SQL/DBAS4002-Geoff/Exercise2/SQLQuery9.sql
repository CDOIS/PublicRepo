SELECT concat(FirstName, ' ', LastName) as "Customer"
	FROM Customer
	WHERE Company is not null;

SELECT Name
	FROM Track
	WHERE Composer is null;

SELECT Name
	FROM Track
	WHERE Name like '%love%';

SELECT Name
	FROM Track
	WHERE Bytes BETWEEN 1000000 AND 2000000
	ORDER BY Bytes ASC;

SELECT FirstName, LastName
	FROM Customer
	WHERE Email like '%.ca';

SELECT ROUND(AVG(Total),2) as 'Average'
	FROM Invoice
	WHERE Total > 6
	GROUP BY CustomerId	
	ORDER BY Average DESC;

SELECT COUNT(TrackId) AS 'Track', Composer
	FROM Track
	GROUP BY AlbumId, Composer
	HAVING Composer is not null
	ORDER BY Track DESC;

SELECT Name, Genre.Name, MediaType.Name
	FROM Track


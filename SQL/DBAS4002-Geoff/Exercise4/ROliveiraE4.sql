/** Ricardo Oliveira - W0428722 - Exercise 4 **/

/*DBAS 4002 – Practice Queries – Outer Joins and SetsRequired 
Databases:ChinookAdventureWorksNumbersDB (Needs to be installed, see script on D2L)
Instructions:Write SELECT statements to gather data results to answer the following questions:*/

/*1.(Chinook DB) Create a query that lists the id and name of all tracks that have not yet been purchased at least once. 
Sort the results by track name in alphabetical order.*/
SELECT Track.TrackId, Track.Name FROM Chinook.dbo.Track
--EXCEPT
--SELECT Invoiceline.TrackId FROM Chinook.dbo.InvoiceLine
LEFT JOIN Chinook.dbo.InvoiceLine on Track.TrackId = InvoiceLine.TrackId
WHERE InvoiceLine.InvoiceId IS NULL;

/*2.(Chinook DB) Create a query that lists the id and name of all playlists that do not have any tracks assigned to them. 
Alias the columns appropriately.*/
SELECT Playlist.PlaylistId, Playlist.Name FROM Chinook.dbo.Playlist
LEFT JOIN Chinook.dbo.PlaylistTrack on PlaylistTrack.PlaylistId = Playlist.PlaylistId
LEFT JOIN Chinook.dbo.Track on Track.TrackId = PlaylistTrack.TrackId
WHERE PlaylistTrack.TrackId is null

/*3.(Numbers db) Using the Multiples_Of_Two and Multiples_Of_Three tables, show the results of a query that only 
displays numbers that have a matching value in the other table. Here’s the catch: You are not
permitted to use a WHERE clause or joins for this query.*/
SELECT MULTIPLE_OF_2 as 'CommonVal' FROM NumbersDB.dbo.NUMBERS_TWOS
INTERSECT
SELECT MULTIPLE_OF_3 as 'CommonVal' FROM NumbersDB.dbo.NUMBERS_THREES

/*4.(Chinook db) Create a query to find a list of all employees that have never served as a rep for any customers. 
Both the employee’s first and last names should only be displayed in a single field named “Employee Name”, 
and include the employee’s job title in your results.*/
SELECT Employee.FirstName + ' ' + Employee.LastName  as Employee, 
				Employee.Title  as 'Job Title' 
FROM Chinook.dbo.Employee
LEFT JOIN Chinook.dbo.Customer on Employee.EmployeeId = Customer.SupportRepId
WHERE SupportRepId is null

/*5.(Multiple DBs) Create a query to gather a list of all first & last names and the country of residence of 
people living in either Canada or France, from the Customer and Employee tables in Chinook and the Person.Person 
and Person.CountryRegion tables in AdventureWorks.*/
SELECT *
FROM (SELECT CONCAT(Person.FirstName, ' ', Person.LastName) COLLATE DATABASE_DEFAULT as Names, CountryRegion.Name COLLATE DATABASE_DEFAULT as 'Country'
		FROM AdventureWorks.Person.Person
		INNER JOIN AdventureWorks.Person.BusinessEntity on BusinessEntity.BusinessEntityID = Person.BusinessEntityID
		INNER JOIN AdventureWorks.Person.BusinessEntityAddress on BusinessEntity.BusinessEntityID = BusinessEntityAddress.BusinessEntityID
		INNER JOIN AdventureWorks.Person.Address on BusinessEntityAddress.AddressID = Address.AddressID
		INNER JOIN AdventureWorks.Person.StateProvince ON StateProvince.StateProvinceID = Address.StateProvinceID
		INNER JOIN AdventureWorks.Person.CountryRegion ON StateProvince.CountryRegionCode = CountryRegion.CountryRegionCode
		UNION
		SELECT CONCAT(FirstName, ' ', LastName) COLLATE DATABASE_DEFAULT AS Names, Country COLLATE DATABASE_DEFA
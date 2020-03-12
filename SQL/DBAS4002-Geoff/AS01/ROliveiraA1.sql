-- Ricardo Oliveira  W0428722

--1.(Chinook db) Display the First Name, Last Name of each customer along with the First Name and Last Name of their 
--support rep, sorted by customer last and first names. Give the support rep columns an appropriate alias.  (59 records)
SELECT concat(Customer.FirstName, ' ', Customer.LastName) as CustomerName, 
			Concat(Employee.FirstName, ' ', Employee.LastName) as EmployeeName
FROM Chinook.dbo.Customer
LEFT JOIN Chinook.dbo.Employee on Chinook.dbo.Employee.EmployeeId = Chinook.dbo.Customer.SupportRepId
ORDER BY Customer.LastName, Customer.FirstName ASC

--2.(Chinook db) Display the track name, genre name, and mediatype name for each track in the database, 
--sorted by track name. (3503 records) (+1 from my previous INSERT)
SELECT Track.Name, Genre.Name, MediaType.Name
FROM Chinook.dbo.Track
INNER JOIN Chinook.dbo.Genre on track.GenreId = Genre.GenreId
INNER JOIN Chinook.dbo.MediaType on track.MediaTypeId = MediaType.MediaTypeId
ORDER BY Track.Name asc

--3.(Chinook db) Display the name of every artist and the total number of albums each artist has available for sale. 
--Results should show the highest totals first. (275 records)
SELECT Artist.Name, COUNT(Album.AlbumID) as TotalAlbums
FROM Chinook.dbo.Artist
LEFT JOIN Chinook.dbo.Album on Artist.ArtistId = Album.ArtistId
GROUP BY Artist.Name
ORDER BY TotalAlbums DESC;

--4.(Chinook db) Display the first name and last name of each customer along with a unique list of the types of 
--media that they have purchased. (128 records)
SELECT DISTINCT concat(FirstName, ' ', LastName) as Customer, MediaType.Name
FROM Chinook.dbo.Customer
LEFT JOIN Chinook.dbo.Invoice on Customer.CustomerId = Invoice.CustomerId
LEFT JOIN Chinook.dbo.InvoiceLine on Invoice.InvoiceId = InvoiceLine.InvoiceId
LEFT JOIN Chinook.dbo.Track on InvoiceLine.TrackId = Track.TrackId
LEFT JOIN Chinook.dbo.MediaType on Track.MediaTypeId = MediaType.MediaTypeId

--5.(Chinook db) Display the first name and last name of the single customer who has purchased the most video tracks. 
--(1 record)
SELECT TOP 1 CustomerName, count(Mediatype) as MediaSum
FROM (SELECT concat(Customer.FirstName, ' ', Customer.LastName) as CustomerName, Mediatype.MediaTypeID as MediaType
		FROM Chinook.dbo.Customer
		INNER JOIN Chinook.dbo.Invoice on Customer.CustomerId = Invoice.CustomerId
		INNER JOIN Chinook.dbo.InvoiceLine on Invoice.InvoiceId = InvoiceLine.InvoiceId
		INNER JOIN Chinook.dbo.Track on InvoiceLine.TrackId = Track.TrackId
		INNER JOIN Chinook.dbo.MediaType on Track.MediaTypeId = MediaType.MediaTypeId) as T
WHERE MediaType = 3
GROUP BY CustomerName, MediaType
ORDER BY MediaSum desc

--6.(Chinook db) Display the name of the artist and number of orders for the single artist who has 
--had the highest number orders of his/her music placed. (1 record)
SELECT TOP 1 ArtistName, count(InvoiceSum) as Invoices
FROM (SELECT ca.Name as ArtistName, ci.InvoiceLineId as InvoiceSum
		FROM Chinook.dbo.Artist ca
		LEFT JOIN Chinook.dbo.Album cab on ca.ArtistId = cab.ArtistId
		LEFT JOIN Chinook.dbo.Track ct on cab.AlbumId = ct.AlbumId
		LEFT JOIN Chinook.dbo.InvoiceLine ci on ci.TrackId = ct.TrackId) as  T
GROUP BY ArtistName
ORDER BY Invoices DESC

--7.(Chinook db) Display the TrackID and Track Name of any tracks that have not yet been purchased. (1519 records)
SELECT ct.TrackId, ct.Name
FROM Chinook.dbo.Track ct
LEFT JOIN Chinook.dbo.InvoiceLine ci ON ct.TrackId = ci.TrackId
WHERE InvoiceLineId is null

--8.(Bookstore db) Using the “b_” tables, display the first and last names of all authors who currently do not have any
-- books listed, sorted author last/first name. (2 records)
SELECT bAut.Fname, bAut.Lname
FROM Bookstore.dbo.B_AUTHOR bAut
LEFT JOIN Bookstore.dbo.B_BOOKAUTHOR BBa ON bAut.AuthorID = BBa.AUTHORid
--LEFT JOIN Bookstore.dbo.B_BOOKS Bb ON BBa.ISBN = Bb.ISBN
WHERE BBa.AUTHORid IS NULL /*at 1st used Bb.ISBN is null*/
ORDER BY bAut.Lname, bAut.Fname

--9.(Bookstore db) Using the “b_” tables, display the Customer number, First name, and Last name of any customers who 
--have yet to place an order, sorted customer last/first name. (6 records)
SELECT bc.Customer#, FirstName, LastName
FROM Bookstore.dbo.B_CUSTOMERS bc
LEFT JOIN Bookstore.dbo.B_ORDERS bo ON bc.Customer# = bo.Customer#
WHERE bo.Order# IS NULL
ORDER BY bc.LastName, bc.FirstName

--10.(Cars db) Using the Cars_Car_Types, Cars_Number_Of_Doors and Cars_Colors tables, create a query that returns 
--every possible combination of the values of each table. (Hint: The result set should contain 24 rows.)
SELECT *
FROM CarsDB.dbo.CARS_CAR_TYPES ccar
CROSS JOIN CarsDB.dbo.CARS_COLORS ccol
CROSS JOIN CarsDB.dbo.CARS_NUMBER_OF_DOORS
 
--11.(Lunches db) List the employee ID, last name, and phone number of each employee with the name and phone number 
--of his or her manager. Make sure that every employee is listed, even those that do not have a manager. 
--Sort by the employee’s id number. (10 records)
SELECT lemp.EMPLOYEE_ID, lemp.LAST_NAME, lemp.PHONE_NUMBER, lxemp.FIRST_NAME as Manager, lxemp.PHONE_NUMBER
FROM LunchesDB.dbo.L_EMPLOYEES lemp
LEFT JOIN LunchesDB.dbo.L_EMPLOYEES lxemp on lxemp.EMPLOYEE_ID = lemp.MANAGER_ID

--12.(Multiple dbs) Create one full list of first names and last names of all customers from the Chinook tables, 
--all authors from the Bookstore tables, all customers from the Bookstore tables, and all employees from the Lunches 
--tables. Sort the list by last name and first name in ascending order. (103 records) 	
--*** See note about this query below rubric ***
SELECT cc.FirstName COLLATE DATABASE_DEFAULT as FirstName, cc.LastName COLLATE DATABASE_DEFAULT as LastName 
FROM Chinook.dbo.Customer cc
UNION
SELECT ba.Fname COLLATE DATABASE_DEFAULT as FirstName, ba.Lname COLLATE DATABASE_DEFAULT as LastName
FROM Bookstore.dbo.B_AUTHOR ba
UNION
SELECT bc.FirstName COLLATE DATABASE_DEFAULT as FirstName, bc.LastName COLLATE DATABASE_DEFAULT as LastName 
FROM Bookstore.dbo.B_CUSTOMERS bc
UNION
SELECT le.FIRST_NAME COLLATE DATABASE_DEFAULT as FirstName, le.LAST_NAME COLLATE DATABASE_DEFAULT as LastName
FROM LunchesDB.dbo.L_EMPLOYEES le
ORDER BY LastName, FirstName ASC;

--13.(Numbers db) Using the Numbers_Twos and Numbers_Threes tables, show the results of a query that only displays 
--numbers that do not have a matching value in the other table. (51 records)

(SELECT *
FROM NumbersDB.dbo.NUMBERS_TWOS
EXCEPT
SELECT *
FROM NumbersDB.dbo.NUMBERS_THREES)
UNION
(SELECT *
FROM NumbersDB.dbo.NUMBERS_THREES
EXCEPT
SELECT *
FROM NumbersDB.dbo.NUMBERS_TWOS)
	
--14.(Numbers db) Using the Numbers_Twos and Numbers_threes tables, show the results of a query that only displays 
--numbers that have a matching value in the other table. Here’s the catch: 
--You are not permitted to use a WHERE clause or JOINs for this query. (17 records) 

SELECT ntt.MULTIPLE_OF_3 AS 'Matching Values'
FROM NumbersDB.dbo.NUMBERS_THREES ntt
INTERSECT
SELECT nt.MULTIPLE_OF_2 AS 'Matching Values'
FROM NumbersDB.dbo.NUMBERS_TWOS nt
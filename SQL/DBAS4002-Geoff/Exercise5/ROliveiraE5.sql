--1.	In T-SQL, create a new VIEW called PersonsByCountry that displays a list of all Persons’ names and the country they live in.
CREATE VIEW PersonsbyCountry AS 
SELECT Person.FirstName COLLATE DATABASE_DEFAULT as FirstName, Person.LastName COLLATE DATABASE_DEFAULT as LastName, CountryRegion.Name COLLATE DATABASE_DEFAULT as Country
		FROM AdventureWorks.Person.Person
		INNER JOIN AdventureWorks.Person.BusinessEntity on BusinessEntity.BusinessEntityID = Person.BusinessEntityID
		INNER JOIN AdventureWorks.Person.BusinessEntityAddress on BusinessEntity.BusinessEntityID = BusinessEntityAddress.BusinessEntityID
		INNER JOIN AdventureWorks.Person.Address on BusinessEntityAddress.AddressID = Address.AddressID
		INNER JOIN AdventureWorks.Person.StateProvince ON StateProvince.StateProvinceID = Address.StateProvinceID
		INNER JOIN AdventureWorks.Person.CountryRegion ON StateProvince.CountryRegionCode = CountryRegion.CountryRegionCode
GO
--2.	Write a SELECT query to display all the data from the PersonsByCountry view, sorted by country name, person’s last name, then first name.
SELECT *
FROM AdventureWorks.dbo.PersonsbyCountry
ORDER BY PersonsbyCountry.Country, LastName, FirstName
GO
--3.	In the SSMS GUI Editor, create a second VIEW, called PersonAndEmailsByCountry, based on the view from part 1, that displays all data and includes each person’s email address. Note: This isn’t a copy-paste-SQL job! Reference the other view in the new view, which may require you to make some changes to the original PersonsByCountry view.
--4.	Script your GUI-created VIEW and add the CREATE VIEW part to the T-SQL script you’re writing for the other steps. (Right-click the PersonAndEmailsByCountry view, choose Script View AS… Create…)
CREATE VIEW PersonAndEmailsByCountry AS 
SELECT        Person.Person.FirstName, Person.Person.LastName, Person.EmailAddress.EmailAddress, Person.CountryRegion.Name
FROM            Person.Person INNER JOIN
                         Person.EmailAddress ON Person.Person.BusinessEntityID = Person.EmailAddress.BusinessEntityID INNER JOIN
                         Person.BusinessEntity ON Person.Person.BusinessEntityID = Person.BusinessEntity.BusinessEntityID INNER JOIN
                         Person.BusinessEntityAddress ON Person.BusinessEntity.BusinessEntityID = Person.BusinessEntityAddress.BusinessEntityID INNER JOIN
                         Person.Address ON Person.BusinessEntityAddress.AddressID = Person.Address.AddressID INNER JOIN
                         Person.StateProvince ON Person.Address.StateProvinceID = Person.StateProvince.StateProvinceID INNER JOIN
                         Person.CountryRegion ON Person.StateProvince.CountryRegionCode = Person.CountryRegion.CountryRegionCode
GO
--5.	Write a SELECT query to display data from the PersonAndEmailsByCountry view, for persons residing in the USA, and whose email addresses start with ‘P’, sorted by person’s last name, then first name, and hiding any non-user-friendly columns of data.
SELECT *
FROM PersonAndEmailsByCountry PEC
where PEC.Name = 'United States' AND PEC.EmailAddress LIKE 'p%'
ORDER BY PEC.LastName, FirstName
GO
--6.	In T-SQL, create a new view called PersonEmployees, based on the view from part 3, that displays all the person data for anyone who is an employee of the AdventureWorks company, and includes their job title and hire date.
CREATE VIEW PersonEmployees AS
SELECT APP.FirstName, APP.LastName, CountryRegion.Name, ahe.JobTitle, ahe.HireDate, EmailAddress.EmailAddress
FROM AdventureWorks.Person.Person app
INNER JOIN Person.EmailAddress ON app.BusinessEntityID = Person.EmailAddress.BusinessEntityID
INNER JOIN AdventureWorks.HumanResources.Employee ahe ON app.BusinessEntityID = ahe.BusinessEntityID
INNER JOIN AdventureWorks.Person.BusinessEntityAddress on app.BusinessEntityID = BusinessEntityAddress.BusinessEntityID
INNER JOIN AdventureWorks.Person.Address on BusinessEntityAddress.AddressID = Address.AddressID
INNER JOIN AdventureWorks.Person.StateProvince ON StateProvince.StateProvinceID = Address.StateProvinceID
INNER JOIN AdventureWorks.Person.CountryRegion ON StateProvince.CountryRegionCode = CountryRegion.CountryRegionCode
GO

--7.	Write a SELECT query to display data from the PersonEmployees view, showing the employee’s full name (in a single field), their job title, hire date, email address and country, for any employee hired in 2012 or later. Sort the data from most recent hire date, then by job title, then employee name. (Note: Remember that in AdventureWorks, you have to include the schema in the table name. The Employee table is in a schema called HumanResources).

SELECT CONCAT(PersonEmployees.FirstName, ' ', PersonEmployees.LastName) AS 'Employee', JobTitle, HireDate, PersonEmployees.EmailAddress
FROM PersonEmployees
WHERE HireDate > '2012'
ORDER BY HireDate, JobTitle, Employee
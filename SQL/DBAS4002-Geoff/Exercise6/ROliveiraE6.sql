--Exercise: Working with Transactions
--Start your SQL script by creating two tables:
--Employee – EmployeeID (PK), FirstName, LastName
--PhoneNumber – PhoneID (PK), PhoneNumber, PhoneType, EmployeeID (FK)
--Your tables should contain all fields and the appropriate PK and FK constraints.
DROP DATABASE IF EXISTS StudentsCO;
CREATE DATABASE StudentsCO;
USE StudentsCO;
CREATE TABLE Employee (
			EmployeeID INT identity(1,1),
			FirstName varchar(50),
			LastName varchar(50),
			PRIMARY KEY (EmployeeID)
			);
CREATE TABLE PhoneNumber (
			PhoneID int identity(1,1),
			PhoneNumber int,
			PhoneType varchar(10),
			EmployeeID int,
			PRIMARY KEY (PhoneID));
--Write SQL statements to INSERT three records into each table.
	
INSERT INTO Employee (FirstName, LastName)
	VALUES  ('RICARDO', 'OLIVEIRA'),
			('GUILHERME', 'OLIVEIRA'),
			('BRUNO', 'OLIVEIRA');
INSERT INTO PhoneNumber (PhoneNumber, PhoneType, EmployeeID)
	VALUES (839504, 'CEL', 1),
			(254901, 'CEL', 2),
			(612012, 'CEL', 3);
ALTER TABLE PhoneNumber 
			ADD FOREIGN KEY (EmployeeID) 
			REFERENCES Employee(EmployeeID);		
BEGIN TRANSACTION					

--Apply transaction commands at appropriate places for the above statements.
--In a new transaction, write a statement to delete a record from the parent Employee table. If your key constraints are set up properly, this should fail. Include TRAN commands to revert to the original record state if the delete fails (which it should)
	BEGIN TRAN
		DELETE FROM Employee WHERE EmployeeID = 1;
	ROLLBACK
--In another new transaction, include statements to delete two separate child records from PhoneNumber, and then each child’s related parent record as well. Include appropriate TRAN commands to ensure that the child record deletes will revert if they happened to fail.
	BEGIN TRAN
		DELETE FROM PhoneNumber WHERE PhoneID = 1;
		DELETE FROM PhoneNumber WHERE PhoneID = 2;
	ROLLBACK
--Also include a save point after the first child/parent deletes, with a way to revert to that save point should it fail.
	BEGIN TRAN
		DELETE FROM PhoneNumber WHERE PhoneID = 1;
		SAVE TRANSACTION savedata1
		DELETE FROM PhoneNumber WHERE PhoneID = 2;
	ROLLBACK TRANSACTION savedata1
--End your script with a TRAN command that would execute if everything succeeds.
COMMIT

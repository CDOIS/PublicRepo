--Ricardo Oliveira - W0428722 - Assignment 3 - DBAS
USE [Chinook_A3]
GO
--1.	A new table called RecordLogging will be added. See ERD below.
DROP TABLE IF EXISTS RecordLogging;
CREATE TABLE RecordLogging (    --CREATE TABLE WITH SPECIFIED ATTRIBUTES.
	LogID INT IDENTITY,
	TableName VARCHAR(30),
	RecordID INT,
	ActionType VARCHAR(30) NOT NULL,
	IsError BIT NOT NULL,
	ErrorNum INT,
	LogDate DATETIME NOT NULL,
	CONSTRAINT PK_LogID PRIMARY KEY (LogID)	
	);
GO

--2.	A new stored procedure called uspAddRecordLog will be created, to add logging records and track data changes. The data they would like to track for each record changed is:
--a.	The affected table’s name
--b.	The record’s ID, if applicable. This would typically be the Primary Key for a newly-inserted record, or -1 for other cases.
--c.	The action type of the change, ie. INSERT or DELETE.
--d.	When logging an error, the SQL Server error number should be recorded, and the IsError flag set to True. For records that are not errors, set the error number to zero.
--e.	Every log record, of any type, must be automatically time-stamped when it is added to the Logging table.

CREATE OR ALTER PROCEDURE uspAddRecordLog (@TableName VARCHAR(30), @ActionType VARCHAR (30), 
										   @RecordID INT = -1, @ErrorNum INT = 0)
AS
BEGIN
	BEGIN TRAN
		BEGIN TRY			
			DECLARE @IsError BIT; -- If statement to check if the entry is an error.
			IF @ErrorNum > 0
				BEGIN
				SET @IsError = 1;
				END
			ELSE
				BEGIN 
				SET @IsError = 0;
				END

			DECLARE @LogDate DATETIME;
			SELECT @LogDate = SYSDATETIME();			
			INSERT INTO RecordLogging(TableName,  --Create respective log record
								RecordID, 
								ActionType, 
								IsError,
								ErrorNum,
								LogDate)

					VALUES (@TableName,
							@RecordID,
							@ActionType,
							@IsError,
							@ErrorNum,
							@LogDate)			
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0 
			ROLLBACK TRAN
			PRINT ('You GOT ERROR~! CALL DB ADMIN');			
		END CATCH
	IF @@TRANCOUNT > 0		
	COMMIT TRAN
END;
GO

--3.	For each of the five tables (Tracks, Artists, Albums, Genres and Mediatypes), add a new stored procedure called usp<TableName>_Insert. These stored procedures should:
--a.	Accept values for all applicable fields, of the appropriate datatypes and sizes.
--b.	Parameters should be nullable where appropriate. See each table’s constraints for details.
--c.	Have an output parameter, which will return the ID of the newly-created record. 
--Hint: Research the SCOPE_IDENTITY() function.
--d.	Contain a transaction and error handling, so that should the insert statement fail, it will be reverted. Otherwise, it will be committed.
--e.	If the insert action is successful, a call to the uspAddRecordLog proc will be used to create a logging record. See screenshots below for details that should be captured for a successful insert.
--f.	If the insert action is NOT successful, a different call to the uspAddRecordLog proc will be used to create a logging record to save basic error details. See screenshots below for details that should be captured for a failed insert.
--uspAlbum_DeleteByID
--4.	For each of the five tables (Tracks, Artists, Albums, Genres and Mediatypes), add a new stored procedure called usp<TableName>_DeleteByID. These stored procedures should:
--a.	Accept the PK ID for the table as a parameter.
--b.	Use the incoming ID value to attempt to delete the record associated with that ID.
--c.	Contain a transaction and error handling, so that should the delete statement fail, it will be reverted. Otherwise, it will be committed.
--d.	If the delete action is successful, a call to the uspAddRecordLog proc will be used to create a logging record. See screenshots below for details that should be captured for a successful delete.
--e.	If the delete action is NOT successful, a different call to the uspAddRecordLog proc will be used to create a logging record to save basic error details. See screenshots below for details that should be captured for a failed delete.

--uspAlbum_DeleteByID
CREATE OR ALTER PROCEDURE uspAlbum_DeleteByID(@ID INT)
AS
BEGIN
	BEGIN TRAN
		BEGIN TRY
			DECLARE @TableName VARCHAR(30);
			SET @TableName = 'Album';
			DECLARE @RecordID INT;
			SET @RecordID = @ID;
			DECLARE @ActionType VARCHAR(30);
			SET @ActionType = 'Delete';
		
			DELETE FROM [dbo].[Album]
				  WHERE @ID = Album.AlbumId
			exec uspAddRecordLog @TableName, @ActionType, @RecordID;

		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
				ROLLBACK
			DECLARE @ErrorNum INT;
			PRINT ('You GOT ERROR~! CALL DB ADMIN');			
			SELECT @ErrorNum = ERROR_NUMBER();
			exec uspAddRecordLog @TableName = @TableName, @ActionType = @ActionType, @ErrorNum = @ErrorNum;	
		END CATCH
	IF @@TRANCOUNT > 0
		COMMIT
END;
GO

--uspAlbum_Insert
CREATE OR ALTER PROCEDURE uspAlbum_Insert(@Title nvarchar(160), @ArtistID INT)
AS
BEGIN
	BEGIN TRAN
		BEGIN TRY
			DECLARE @TableName VARCHAR(30);
			SET @TableName = 'Album';
			DECLARE @RecordID INT;
			
			DECLARE @ActionType VARCHAR(30);
			SET @ActionType = 'Insert';

			INSERT INTO [dbo].[Album]
			   ([Title]
			   ,[ArtistId])
			 VALUES
				   (@Title, @ArtistID)
			SELECT @RecordID = SCOPE_IDENTITY();
			exec uspAddRecordLog @TableName, @ActionType, @RecordID;

		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
				ROLLBACK TRAN
			DECLARE @ErrorNum INT;
			PRINT ('You GOT ERROR~! CALL DB ADMIN');			
			SELECT @ErrorNum = ERROR_NUMBER();
			exec uspAddRecordLog @TableName = @TableName, @ActionType = @ActionType, @ErrorNum = @ErrorNum;			
		END CATCH	
	IF @@TRANCOUNT > 0
		COMMIT
END;
GO

--uspArtist_DeleteByID
CREATE OR ALTER PROCEDURE uspArtist_DeleteByID(@ID INT)
AS
BEGIN
	BEGIN TRAN
		BEGIN TRY
			DECLARE @TableName VARCHAR(30);
			SET @TableName = 'Artist';
			DECLARE @RecordID INT;
			SET @RecordID = @ID;
			DECLARE @ActionType VARCHAR(30);
			SET @ActionType = 'Delete';
		
		
			DELETE FROM [dbo].[Artist]
			  WHERE Artist.ArtistId = @ID
								
			exec uspAddRecordLog @TableName, @ActionType, @RecordID;
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
				ROLLBACK TRAN
			DECLARE @ErrorNum INT;
			PRINT 'You GOT ERROR~! CALL DB ADMIN';
			THROW
			SELECT  ERROR_NUMBER() AS ErrorNumber;
			SELECT @ErrorNum = ERROR_NUMBER();
			exec uspAddRecordLog @TableName = @TableName, @ActionType = @ActionType, @ErrorNum = @ErrorNum;
			
		END CATCH
	IF @@TRANCOUNT > 0			
		COMMIT
END;
GO

--uspArtist_Insert
CREATE OR ALTER PROCEDURE uspArtist_Insert(@Name nvarchar(120))
AS
BEGIN
	BEGIN TRAN
		BEGIN TRY
			DECLARE @TableName VARCHAR(30);
			SET @TableName = 'Artist';			
			DECLARE @ActionType VARCHAR(30);
			SET @ActionType = 'Insert';
			DECLARE @RecordID INT;

			INSERT INTO [dbo].[Artist]
					   ([Name])
				 VALUES
					   (@Name)
		
			SELECT @RecordID = SCOPE_IDENTITY();
			exec uspAddRecordLog @TableName, @ActionType, @RecordID;
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
				ROLLBACK TRAN
			DECLARE @ErrorNum INT;
			PRINT ('You GOT ERROR~! CALL DB ADMIN');			
			SELECT @ErrorNum = ERROR_NUMBER();
			exec uspAddRecordLog @TableName = @TableName, @ActionType = @ActionType, @ErrorNum = @ErrorNum;					
		END CATCH	
	IF @@TRANCOUNT > 0
		COMMIT
END;
GO

--uspGenre_DeleteByID
CREATE OR ALTER PROCEDURE uspGenre_DeleteByID(@ID INT)
AS
BEGIN
	BEGIN TRAN
		BEGIN TRY
			DECLARE @TableName VARCHAR(30);
			SET @TableName = 'Genre';
			DECLARE @RecordID INT;
			SET @RecordID = @ID;
			DECLARE @ActionType VARCHAR(30);
			SET @ActionType = 'Delete';
		
			DELETE FROM [dbo].[Genre]
				  WHERE @ID = Genre.GenreId
			exec uspAddRecordLog @TableName, @ActionType, @RecordID;

		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
				ROLLBACK TRAN
			DECLARE @ErrorNum INT;
			PRINT ('You GOT ERROR~! CALL DB ADMIN');			
			SELECT @ErrorNum = ERROR_NUMBER();
			exec uspAddRecordLog @TableName = @TableName, @ActionType = @ActionType, @ErrorNum = @ErrorNum;				
		END CATCH	
	IF @@TRANCOUNT > 0
		COMMIT
END;
GO

--uspGenre_Insert
CREATE OR ALTER PROCEDURE uspGenre_Insert(@Name nvarchar(120))
AS
BEGIN
	BEGIN TRAN
		BEGIN TRY
			DECLARE @TableName VARCHAR(30);
			SET @TableName = 'Genre';
			DECLARE @RecordID INT;
		
			DECLARE @ActionType VARCHAR(30);
			SET @ActionType = 'Insert';

			INSERT INTO [dbo].[Genre]
					   ([Name])
				 VALUES
					   (@Name)

			SELECT @RecordID = SCOPE_IDENTITY();
			exec uspAddRecordLog @TableName, @ActionType, @RecordID;
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
					ROLLBACK TRAN
			DECLARE @ErrorNum INT;
			PRINT ('You GOT ERROR~! CALL DB ADMIN');			
			SELECT @ErrorNum = ERROR_NUMBER();
			exec uspAddRecordLog @TableName = @TableName, @ActionType = @ActionType, @ErrorNum = @ErrorNum;			
		END CATCH
	IF @@TRANCOUNT > 0
		COMMIT
END;
GO

--uspMediaType_DeleteByID
CREATE OR ALTER PROCEDURE uspMediaType_DeleteByID(@ID INT)
AS
BEGIN
	BEGIN TRAN
		BEGIN TRY
			DECLARE @TableName VARCHAR(30);
			SET @TableName = 'MediaType';
			DECLARE @RecordID INT;
			SET @RecordID = @ID;
			DECLARE @ActionType VARCHAR(30);
			SET @ActionType = 'Delete';
		
			DELETE FROM [dbo].[MediaType]
				  WHERE @ID = MediaType.MediaTypeId
			exec uspAddRecordLog @TableName, @ActionType, @RecordID;
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
				ROLLBACK TRAN
			DECLARE @ErrorNum INT;
			PRINT ('You GOT ERROR~! CALL DB ADMIN');			
			SELECT @ErrorNum = ERROR_NUMBER();
			exec uspAddRecordLog @TableName = @TableName, @ActionType = @ActionType, @ErrorNum = @ErrorNum;				
		END CATCH	
	IF @@TRANCOUNT > 0
		COMMIT
END;
GO

--uspMediaType_Insert
CREATE OR ALTER PROCEDURE uspMediaType_Insert(@Name nvarchar(120))
AS
BEGIN
	BEGIN TRAN
		BEGIN TRY
			DECLARE @TableName VARCHAR(30);
			SET @TableName = 'MediaType';
			DECLARE @RecordID INT;
		
			DECLARE @ActionType VARCHAR(30);
			SET @ActionType = 'Insert';


			INSERT INTO [dbo].[MediaType]
					   ([Name])
				 VALUES
					   (@Name)

			SELECT @RecordID = SCOPE_IDENTITY();
			exec uspAddRecordLog @TableName, @ActionType, @RecordID;
			
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
					ROLLBACK TRAN
			DECLARE @ErrorNum INT;
			PRINT ('You GOT ERROR~! CALL DB ADMIN');			
			SELECT @ErrorNum = ERROR_NUMBER();
			exec uspAddRecordLog @TableName = @TableName, @ActionType = @ActionType, @ErrorNum = @ErrorNum;			
			ROLLBACK
		END CATCH
	IF @@TRANCOUNT > 0
		COMMIT
END;
GO

--uspTrack_DeleteByID
CREATE OR ALTER PROCEDURE uspTrack_DeleteByID(@ID INT)
AS
BEGIN
	BEGIN TRAN
		BEGIN TRY
		DECLARE @TableName VARCHAR(30);
		SET @TableName = 'Track';
		DECLARE @RecordID INT;
		SET @RecordID = @ID;
		DECLARE @ActionType VARCHAR(30);
		SET @ActionType = 'Delete';
		
		DELETE FROM [dbo].[Track]
			  WHERE @ID = Track.TrackId
		exec uspAddRecordLog @TableName, @ActionType, @RecordID;

		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
				ROLLBACK TRAN
			DECLARE @ErrorNum INT;
			SELECT @ErrorNum = ERROR_NUMBER();
			PRINT ('You GOT ERROR~! CALL DB ADMIN');
			exec uspAddRecordLog @TableName = @TableName, @ActionType = @ActionType, @ErrorNum = @ErrorNum;					
		END CATCH
	IF @@TRANCOUNT > 0
	COMMIT TRAN
END;
GO

--uspTrack_Insert
CREATE OR ALTER PROCEDURE uspTrack_Insert(@Name nvarchar(200), @AlbumId int = Null, @MediaTypeId int, @GenreId int = Null,
										  @Composer nvarchar(220) = Null, @Milliseconds int,@Bytes int = Null, @UnitPrice numeric(10,2))
AS
BEGIN
	BEGIN TRAN
		BEGIN TRY
			DECLARE @TableName VARCHAR(30);
			SET @TableName = 'Track';
			DECLARE @RecordID INT;		
			DECLARE @ActionType VARCHAR(30);
			SET @ActionType = 'Insert';

			INSERT INTO [dbo].[Track]
					   ([Name]
					   ,[AlbumId]
					   ,[MediaTypeId]
					   ,[GenreId]
					   ,[Composer]
					   ,[Milliseconds]
					   ,[Bytes]
					   ,[UnitPrice])
				 VALUES
					   (@Name
					   ,@AlbumId
					   ,@MediaTypeId
					   ,@GenreId
					   ,@Composer
					   ,@Milliseconds
					   ,@Bytes
					   ,@UnitPrice)

			SELECT @RecordID = SCOPE_IDENTITY();
			exec uspAddRecordLog @TableName, @ActionType, @RecordID;

		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
				ROLLBACK TRAN
			DECLARE @ErrorNum INT;
			PRINT ('You GOT ERROR~! CALL DB ADMIN');			
			SELECT @ErrorNum = ERROR_NUMBER();
			exec uspAddRecordLog @TableName = @TableName, @ActionType = @ActionType, @ErrorNum = @ErrorNum;			
			
		END CATCH
	IF @@TRANCOUNT > 0
		COMMIT
END;
GO

-- TESTING INSERT/DELETE PROCEDURES -- DISPLAY REPORT INSIDE EACH TRANSACTION

BEGIN TRAN
	DECLARE @InsertVal VARCHAR (30);
	SET  @InsertVal = 'ComfortableNumb';
	EXEC uspAlbum_Insert @Title = @InsertVal, @ArtistID = 1;
	DECLARE @InsertValID INT;
	SELECT @InsertValID = AlbumId FROM Album WHERE Title = @InsertVal;;
	EXEC uspAlbum_DeleteByID @ID = @InsertValID;
	SELECT * FROM RecordLogging
COMMIT
GO

BEGIN TRAN
	DECLARE @InsertVal VARCHAR (30);
	SET @InsertVal = 'SydBarret';
	EXEC uspArtist_Insert @InsertVal
	DECLARE @InsertValID INT;
	SELECT @InsertValID = ArtistId FROM Artist WHERE Name = @InsertVal;;
	EXEC uspArtist_DeleteByID @ID = @InsertValID
	SELECT * FROM RecordLogging
COMMIT
GO

BEGIN TRAN
	DECLARE @InsertVal VARCHAR (30);
	SET @InsertVal = 'NewBossa' ;
	EXEC uspGenre_Insert @Name = @InsertVal
	DECLARE @InsertValID INT;
	SELECT @InsertValID = GenreId FROM Genre WHERE Name = @InsertVal;;
	EXEC uspGenre_DeleteByID @ID = @InsertValID
	SELECT * FROM RecordLogging
COMMIT
GO

BEGIN TRAN
	DECLARE @InsertVal VARCHAR (30);
	SET @InsertVal = 'DotNapster3' ;
	EXEC uspMediaType_Insert @Name = @InsertVal
	DECLARE @InsertValID INT;
	SELECT @InsertValID = MediaTypeId FROM MediaType WHERE Name = @InsertVal;;
	EXEC uspMediaType_DeleteByID @ID = @InsertValID
	SELECT * FROM RecordLogging
COMMIT
GO

BEGIN TRAN
	DECLARE @InsertVal VARCHAR (30);
	SET @InsertVal = 'PinkFLoyd' ;
	EXEC uspTrack_Insert @Name = @InsertVal, @AlbumId = 100, @MediaTypeId = 1, @GenreId = 11, @Composer = 'Someone', @Milliseconds = 1, @Bytes = 10, @UnitPrice = 10.11;
	DECLARE @InsertValID INT;
	SELECT @InsertValID = TrackId FROM Track WHERE Name = @InsertVal;;
	EXEC uspTrack_DeleteByID @ID = @InsertValID
	SELECT * FROM RecordLogging
COMMIT
GO

--WRONG DATA INPUT - CHECK ERROR LOGGING

EXEC uspAlbum_Insert @Title = 'ThunderStones', @ArtistID = 9765
SELECT * FROM RecordLogging
GO


EXEC uspTrack_Insert @Name = 'ThunderStones', @AlbumId = 100, @MediaTypeId = null, @GenreId = 11, @Composer = 'Someone', @Milliseconds = 1, @Bytes = 10, @UnitPrice = 10.11;
SELECT * FROM RecordLogging
GO

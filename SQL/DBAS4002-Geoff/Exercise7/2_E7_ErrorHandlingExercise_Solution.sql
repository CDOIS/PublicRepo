USE Chinook;

-- Analyze the Artist/Album data to find artists with no albums.
-- Pick one artist with at least one album, and an artist with no albums.
-- I chose Rush (ID 128) with albums, and Azymuth (ID 26) with none.
SELECT * 
FROM Artist
	LEFT JOIN Album ON Artist.ArtistId = Album.ArtistId;

BEGIN TRY
	BEGIN TRAN
		--Azymuth, has no associated album(s)
		DELETE FROM Artist WHERE ArtistID = 26;	--This should work with no errors
	COMMIT;
END TRY
BEGIN CATCH
	--If an error occurs in the TRY block, run this SELECT to show error into,
	--then ROLLBACK, to revert the data to pre-delete state.
	SELECT   
        ERROR_NUMBER() AS ErrorNumber  
		,ERROR_SEVERITY() AS ErrorSeverity  
		,ERROR_STATE() AS ErrorState  
		,ERROR_LINE () AS ErrorLine  
		,ERROR_PROCEDURE() AS ErrorProcedure  
		,ERROR_MESSAGE() AS ErrorMessage;
	ROLLBACK TRAN;
END CATCH

--Test the data. Azymuth (ID 26) should have been successfully deleted, and the delete committed.
SELECT * FROM Artist WHERE ArtistID IN (26, 128);

BEGIN TRY
	BEGIN TRAN
		--Rush, has at least one associated album
		DELETE FROM Artist WHERE ArtistID = 128;	--This should fail, due to FK constraint
	COMMIT;
END TRY
BEGIN CATCH
	--If an error occurs in the TRY block, run this SELECT to show error into,
	--then ROLLBACK, to revert the data to pre-delete state.
	SELECT   
        ERROR_NUMBER() AS ErrorNumber
		,ERROR_SEVERITY() AS ErrorSeverity  
		,ERROR_STATE() AS ErrorState  
		,ERROR_LINE () AS ErrorLine  
		,ERROR_PROCEDURE() AS ErrorProcedure  
		,ERROR_MESSAGE() AS ErrorMessage;
	ROLLBACK TRAN;
END CATCH

--Test the data again. Rush's delete attempt should have failed, and the delete rolled back.
SELECT * FROM Artist WHERE ArtistID IN (26, 128);

BEGIN TRY
	BEGIN TRAN
		--Rush, has at least one associated album
		DELETE FROM Artist WHERE ArtistID = 128;	--This should fail, due to FK constraint
	COMMIT;
END TRY
BEGIN CATCH
	--If an error occurs in the TRY block:
	--	Attempt 1 shows the unhandled error (ie. no THROW used)
	--	Attempt 2 (using just THROW) shows the info for the most recent error handled in this block
	--	Attempt 3 (using custom THROW) displays a custom error message (must use a custom error number >= 50,000)

	--Attempt 1 (no throw used)

	--Attempt 2 (just THROW)
	--THROW

	--Attempt 3 (THROW with custom message)
	THROW 50000, 'YOU CAN''T DELETE RUSH, HEATHEN!', 1

	--Finally, roll back, since an error occurred.
	ROLLBACK TRAN;
END CATCH

--Test the data one last time. Rush's delete attempt should have failed, and the delete rolled back, with diff error messages.
-- Rush should still be in the table, but Azymuth is gone, from the first, successful delete.
SELECT * FROM Artist WHERE ArtistID IN (26, 128);
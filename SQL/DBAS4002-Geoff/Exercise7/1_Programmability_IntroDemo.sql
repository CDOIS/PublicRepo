-- Print every Artist Name from Artist Table to console

--Declare variables
DECLARE @currentName varchar(120);	--name of current artist as we loop through each artist record
DECLARE @counter int;	-- a manual counter for our loop
DECLARE @maxArtistID int;	--HACK way of getting the highest artist id (for ending loop)
							--Note: Assumes the artist ids are sequential, with no gaps.

--Initialize variables
SET @counter = 1;
SELECT @maxArtistID = MAX(ArtistID) FROM Artist;

--Print report heading
PRINT 'List of all Artists in db'
PRINT '---------------------------'

--Loop through each artist record in the Artist table
WHILE (@counter <= @maxArtistID)
	BEGIN
		--Get single artist, based on artist id = current counter value
		SELECT @currentName = Artist.Name 
		FROM Artist
		WHERE ArtistID = @counter;
		
		--Print current artist name to console
		PRINT @currentName;

		--Increment counter for next loop iteration
		SET @counter = @counter + 1;
		--SET @counter += 1;
	END

--Print report footer (Note: this is outside loop)
PRINT '------------------';
PRINT CAST(@maxArtistID as varchar) + ' total artists found.'
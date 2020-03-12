USE [Chinook]
GO
-- Create a new table to hold Premium Tracks
-- Based on existing Track table, with these changes:
--		- GenreID, AlbumID and MediaTypeID fields removed
--		- New field added for Rating
DROP TABLE PremiumTrack;
GO
CREATE TABLE [dbo].[PremiumTrack](
	[TrackId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Composer] [nvarchar](220) NULL,
	[Milliseconds] [int] NOT NULL,
	[Bytes] [int] NULL,
	[UnitPrice] [numeric](10, 2) NOT NULL,
	[Rating] int NOT NULL CHECK (Rating IN (1,2,3,4,5)),
 CONSTRAINT [PK_PremiumTrack] PRIMARY KEY CLUSTERED 
(
	[TrackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--■	Declare and set values for any variables that are required
DECLARE @counter INT;
DECLARE @highestrackid INT;
DECLARE @currentracklength INT;
DECLARE @rating INT;
DECLARE @newprice INT;

USE Chinook
SET @counter = 0;
SELECT @highestrackID = MAX(trackID) FROM track;

BEGIN;
	WHILE (@counter <= @highestrackID)

--■	Use a transaction and error handling to allow us to deal with any errors or commit the work if successful.

--■	Loop through every track in the Track table and decide whether it qualifies as a Premium track. (has a track length (milliseconds) over 500,000.

--■	For qualifying tracks, use the track length (milliseconds) to determine which tier it belongs to, set the appropriate rate and price values, and insert it into the new PremiumTrack table.

--4.	Start by declaring variables for:
--■	A counter (for the loop)
--■	The highest trackID in the Track table
--■	The current track’s track length.
--■	A rating variable
--■	A newPrice variable

--5.	Set your counter to start at 1.

--6.	Use a SELECT statement to get the highest TrackID and set it as the value for the highest track ID variable.

--7.	Start your transaction

--8.	Start your try block.

--9.	Use a looping structure, which will go through each Track one at a time, starting at ID 1 and ending at the highest track ID. (Don’t hard-code it!)

--10.	For each iteration of the loop, your code should:

--■	Determine and store the current track’s length
--■	Determine if the current track qualifies as Premium. If it doesn’t, ignore it and move to the next track. If it does qualify, continue with the next steps:
--■	Initialize the “default” values for rating and price
--■	Determine which tier the current track belongs to and set the rating/price variable values accordingly.
--■	Insert the current track record into the new PremiumTrack table, including the rating value and new price. Hint: Remember INSERT INTO… SELECT?
--■	Don’t forget to increment your counter… we don’t want any infinite loops!

--11.	If no errors occur in the TRY block, commit the transaction.

--12.	Create a CATCH block, in case of errors. The CATCH block should:
--■	Print a message to the console, indicating an error occurred.
--■	Undo any changes that may have been made prior to the error being encountered.

--13.	Finally, no work is complete with some rudimentary testing. See the expected record counts table below to verify your work.

--14.	Testing Statements:

--■	Write a SELECT against the new PremiumTrack table to see how many total records are in the newly-populated table.

--■	Write a SELECT to see if any NON-premium tracks were mistakenly added.

--■	Write five more SELECTs, one per tier, to check how many records exist per tier.

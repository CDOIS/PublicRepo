/**  Ricardo Oliveira - W0428722
Outer Join Queries – PracticeUsing the Chinook DB:
1.	a. Add at least one record to the Track table
	b. Build a query to show how many records are not part of a playlist
2.Display the Name of every available track. In addition, display the number of times that 
											 the track has been included as part of an order.
3.Displaythe TrackID, TrackName, ofany tracks in Chinook DB that have not yet been purchase **/

USE Chinook

/** 1. - a. and b.**/

INSERT INTO Album (Title, ArtistId)
VALUES ('Lado B Lado A',(SELECT Artist.ArtistId FROM Artist WHERE Artist.Name = 'O Rappa'));

INSERT INTO Track (Name, Composer, Milliseconds, Bytes, GenreId, AlbumId, UnitPrice, MediaTypeId)
VALUES ('Minha Alma', 'Marcelo Falcao Custodio', 330000, 538231319, 14,
	   (SELECT Album.AlbumId FROM Album WHERE Album.Title = 'Lado B Lado A'), 19.99, 1);

/** 2 **/
SELECT Track.Name, SUM(InvoiceLine.Quantity) AS 'Total Sales'
FROM Track
LEFT JOI
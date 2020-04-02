CREATE PROCEDURE test1new
AS
	
	DECLARE @toBeInserted INT = (SELECT NoOfRows FROM TestTables WHERE TableID = 1)
	DECLARE @startPositionToDelete INT = (SELECT Position FROM TestTables WHERE TableID = 1)

	DECLARE @lastPositionInTable INT = (SELECT MAX(Bid) FROM BOOK) + 1

	DECLARE @beginExecution DATETIME = getDate();

	WHILE (@toBeInserted > 0)
	BEGIN
		INSERT INTO AUTHOR VALUES (@lastPositionInTable, 'Author-Name')
		INSERT INTO BOOK VALUES (@lastPositionInTable, 'Book-Title', @lastPositionInTable)

		SET @lastPositionInTable = @lastPositionInTable + 1;
		SET @toBeInserted = @toBeInserted - 1;
	END

	DECLARE @beginView DATETIME = getDate();
	SELECT * FROM dbo.BookAuthorView
	DECLARE @endView DATETIME = getDate();

	WHILE (@lastPositionInTable >= @startPositionToDelete)
	BEGIN
		DELETE FROM BOOK WHERE Bid = @startPositionToDelete
		DELETE FROM AUTHOR WHERE AuthorID = @startPositionToDelete

		SET @startPositionToDelete = @startPositionToDelete + 1;
	END

	DECLARE @endExecution DATETIME = getDate();

	INSERT INTO TestRuns VALUES ('Inserted and Deleted 2000 values for table Book', @beginExecution, @endExecution);

	DECLARE @idRun INT = (SELECT MAX(TestRunID) FROM TestRuns)

	INSERT INTO TestRunTables VALUES (@idRun, 1, @beginExecution, @endExecution)
	INSERT INTO TestRunViews VALUES(@idRun, 2, @beginView, @endView);
GO
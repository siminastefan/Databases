ALTER PROCEDURE test3
AS
	
	DECLARE @toBeInserted INT = (SELECT NoOfRows FROM TestTables WHERE TableID = 3)
	DECLARE @startPositionToDelete INT = (SELECT Position FROM TestTables WHERE TableID = 3)

	DECLARE @lastPositionInTableCharacter INT = (SELECT MAX(Cid) FROM [CHARACTER]) + 1;
	DECLARE @lastPositionInTableBook INT = (SELECT MAX(Bid) FROM BOOK) + 1;
	DECLARE @lastPositionInTableAppearsIn INT = (SELECT MAX(Aid) FROM APPEARS_IN) + 1;



	INSERT INTO MAXIM VALUES (1, @lastPositionInTableAppearsIn)
	INSERT INTO MAXIM VALUES (2, @lastPositionInTableBook)
	INSERT INTO MAXIM VALUES (3, @lastPositionInTableCharacter)

	DECLARE @lastPositionInTable INT = (SELECT MAX(CountNo) FROM MAXIM)

	DELETE FROM MAXIM

	DECLARE @beginExecution DATETIME = getDate();

	WHILE (@toBeInserted > 0)
	BEGIN
		INSERT INTO AUTHOR VALUES (@lastPositionInTable, 'Author-Name')
		INSERT INTO BOOK VALUES (@lastPositionInTable, 'Book-Title', @lastPositionInTable)
		INSERT INTO [CHARACTER] VALUES (@lastPositionInTable, 'Character-Name')
		INSERT INTO APPEARS_IN VALUES (@lastPositionInTable, @lastPositionInTable, @lastPositionInTable)

		SET @lastPositionInTable = @lastPositionInTable + 1;
		SET @toBeInserted = @toBeInserted - 1;
	END

	DECLARE @beginView DATETIME = getDate();
	SELECT * FROM dbo.CharacterAppearsInView
	DECLARE @endView DATETIME = getDate();

	WHILE (@lastPositionInTable >= @startPositionToDelete)
	BEGIN
		DELETE FROM APPEARS_IN WHERE Aid = @startPositionToDelete
		DELETE FROM [CHARACTER] WHERE Cid = @startPositionToDelete
		DELETE FROM BOOK WHERE Bid = @startPositionToDelete
		DELETE FROM AUTHOR WHERE AuthorID = @startPositionToDelete

		SET @startPositionToDelete = @startPositionToDelete + 1;
	END

	DECLARE @endExecution DATETIME = getDate();

	INSERT INTO TestRuns VALUES ('Inserted and Deleted 7000 values for table Appears-In', @beginExecution, @endExecution)

	DECLARE @idRun INT = (SELECT MAX(TestRunID) FROM TestRuns)

	INSERT INTO TestRunTables VALUES (@idRun, 3, @beginExecution, @endExecution)
	INSERT INTO TestRunViews VALUES (@idRun, 3, @beginView, @endView)

GO
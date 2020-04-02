ALTER PROCEDURE test2
AS

	DECLARE @toBeInserted INT = (SELECT NoOfRows FROM TestTables WHERE TableID = 2)
	DECLARE @startPositionToDelete INT = (SELECT Position FROM TestTables WHERE TableID = 2)

	DECLARE @lastPositionInTable INT = (SELECT MAX(Cid) FROM [CHARACTER]) + 1;

	DECLARE @beginExecution DATETIME = getDate();
	
	WHILE (@toBeInserted > 0)
	BEGIN
		PRINT(@toBeInserted)
		INSERT INTO [CHARACTER] VALUES (@lastPositionInTable, 'Character-Name');

		SET @lastPositionInTable = @lastPositionInTable + 1;
		SET @toBeInserted = @toBeInserted - 1;
	END

	DECLARE @beginView DATETIME = getDate();
	SELECT * FROM dbo.CharacterView
	DECLARE @endView DATETIME = getDate();

	WHILE (@lastPositionInTable >= @startPositionToDelete)
	BEGIN
		DELETE FROM [CHARACTER] WHERE Cid = @startPositionToDelete
		SET @startPositionToDelete = @startPositionToDelete + 1;
	END

	DECLARE @endExecution DATETIME = getDate();

	INSERT INTO TestRuns VALUES ('Inserted and Deleted 5000 values for table Character', @beginExecution, @endExecution);

	DECLARE @idRun INT = (SELECT MAX(TestRunID) FROM TestRuns) 

	INSERT INTO TestRunTables VALUES(@idRun, 2, @beginExecution, @endExecution);

	INSERT INTO TestRunViews VALUES(@idRun, 1, @beginView, @endView);

GO
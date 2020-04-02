
USE [UBB Library Database]
GO

CREATE PROCEDURE updateCurrent(@version SMALLINT)
AS
	UPDATE CURRENT_VERSION SET current_id = @version;
GO

CREATE PROCEDURE Change_Versions (@version SMALLINT)
AS
BEGIN
	DECLARE @doProcedure VARCHAR(100);
	DECLARE @current SMALLINT = (SELECT current_id
								FROM CURRENT_VERSION
								)
	IF (@current >= @version)
	BEGIN
		IF (@version = 0)
		BEGIN
			SET @doProcedure = (
				SELECT restoreProcedure
				FROM VERSION_SCHEMA
				WHERE ID = 1
			)
		END
		ELSE
		BEGIN
			SET @doProcedure = (
				SELECT restoreProcedure
				FROM VERSION_SCHEMA
				WHERE ID = @version
			)
			SET @version = @version - 1
			EXECUTE updateCurrent @version;
		END
	END
	ELSE
	BEGIN
		SET @doProcedure = (
			SELECT alterProcedure
			FROM VERSION_SCHEMA
			WHERE ID = @version
		)
		EXECUTE updateCurrent @version;
	END
	EXECUTE @doProcedure;
END;
GO
EXECUTE Change_Versions 0

SELECT * FROM LIBRARIAN
GO

CREATE PROCEDURE RUN (@version SMALLINT)
AS
BEGIN
	DECLARE @current SMALLINT = (
			SELECT current_id
			FROM CURRENT_VERSION
	)
	PRINT(@current)
	IF (@current <= @version)
	BEGIN
		WHILE (@current < @version)
		BEGIN
			SET @current = @current + 1
			EXECUTE Change_Versions @current
		END
	END
	ELSE
	BEGIN
		WHILE (@current > @version)
		BEGIN
			EXECUTE Change_Versions @current
			SET @current = @current - 1
		END
	END
END;
GO
DROP PROCEDURE RUN;
DROP PROCEDURE Change_Versions;
SELECT * FROM STUDENT
SELECT * FROM LIBRARIAN
SELECT * FROM CURRENT_VERSION
SELECT * FROM VERSION_SCHEMA
EXECUTE RUN 1
USE [UBB Library Database]
GO

-- Add/remove a table

CREATE PROCEDURE addTable
AS
BEGIN
	CREATE TABLE CHARACTER_CATEGORY
	(
		CCid SMALLINT PRIMARY KEY,
		--CCName VARCHAR(50)
	)
END;
GO

CREATE PROCEDURE removeTable
AS
BEGIN
	DROP TABLE CHARACTER_CATEGORY
END;
GO

DROP PROCEDURE addTable
DROP PROCEDURE removeTable
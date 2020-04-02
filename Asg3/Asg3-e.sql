USE [UBB Library Database]
GO

-- Add/remove a candidate key

CREATE PROCEDURE addCandidateKey
AS
BEGIN

	ALTER TABLE CHARACTER_CATEGORY
	ADD CCName VARCHAR(50) NOT NULL;

END;
GO

CREATE PROCEDURE removeCandidateKey
AS
BEGIN

	ALTER TABLE CHARACTER_CATEGORY
	DROP COLUMN CCName

END;
GO

DROP PROCEDURE addCandidateKey
DROP PROCEDURE removeCandidateKey
USE [UBB Library Database]
GO

-- Add/remove a foreign key

CREATE PROCEDURE addForeignKey
AS
BEGIN
	ALTER TABLE [CHARACTER]
	ADD  CCid SMALLINT

	ALTER TABLE [CHARACTER]
	ADD CONSTRAINT FK_Char
	FOREIGN KEY (CCid) REFERENCES CHARACTER_CATEGORY(CCid);
END;
GO

CREATE PROCEDURE removeForeignKey
AS
BEGIN
	ALTER TABLE [CHARACTER]
	DROP CONSTRAINT FK_Char

	ALTER TABLE [CHARACTER]
	DROP COLUMN CCid
END;
GO
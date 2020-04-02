USE [UBB Library Database]
GO

-- Add/remove a DEFAULT constraint

CREATE PROCEDURE addDefaultConstraint
AS
BEGIN
	ALTER TABLE LIBRARIAN
	ADD CONSTRAINT df_Salary
	DEFAULT 1800 FOR Salary
END;
GO

CREATE PROCEDURE removeDefaultConstraint
AS
BEGIN
	ALTER TABLE LIBRARIAN
	DROP CONSTRAINT df_Salary
END;
GO
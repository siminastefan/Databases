USE [UBB Library Database]

CREATE TABLE VERSION_SCHEMA 
(
	ID SMALLINT IDENTITY(1, 1) PRIMARY KEY,
	alterProcedure VARCHAR(50) NOT NULL,
	restoreProcedure VARCHAR(50) NOT NULL
)
GO

INSERT INTO VERSION_SCHEMA(alterProcedure, restoreProcedure)
VALUES ('addColumn', 'removeColumn');

INSERT INTO VERSION_SCHEMA(alterProcedure, restoreProcedure)
VALUES ('addDefaultConstraint', 'removeDefaultConstraint');

INSERT INTO VERSION_SCHEMA(alterProcedure, restoreProcedure)
VALUES ('doModify', 'undoModify');

INSERT INTO VERSION_SCHEMA(alterProcedure, restoreProcedure)
VALUES ('removePrimaryKey', 'addPrimaryKey');

INSERT INTO VERSION_SCHEMA(alterProcedure, restoreProcedure)
VALUES ('addTable', 'removeTable');

INSERT INTO VERSION_SCHEMA(alterProcedure, restoreProcedure)
VALUES ('addForeignKey', 'removeForeignKey');

INSERT INTO VERSION_SCHEMA(alterProcedure, restoreProcedure)
VALUES ('addCandidateKey', 'removeCandidateKey');

UPDATE VERSION_SCHEMA SET ID = 7 WHERE ID = 8

DROP TABLE VERSION_SCHEMA

CREATE TABLE CURRENT_VERSION
(
	current_id SMALLINT PRIMARY KEY
)
GO
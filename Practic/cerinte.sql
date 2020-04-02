--2.

CREATE OR ALTER PROCEDURE up_deleteCitizens (@City VARCHAR(30))
AS
	DECLARE @CID SMALLINT = (SELECT	C.CID FROM Cities C WHERE C.CityName = @City)

	IF @CID IS NULL
	BEGIN
		RAISERROR ('no such city',16,1)
		RETURN -1
	END

	DELETE CityCitizens WHERE CID = @CID

GO

INSERT INTO Cities VALUES ('City1', 'M1'), ('City2', 'M2'), ('City3', 'M3')
INSERT INTO Citizens VALUES ('Citizen1', 18), ('Citizen1', 19), ('Citizen1', 20)
INSERT INTO CityCitizens VALUES (1, 1), (2, 2), (3, 1)

SELECT * FROM Cities
SELECT * FROM Citizens
SELECT * FROM CityCitizens


EXECUTE up_deleteCitizens 'City1'
GO

--3.

CREATE OR ALTER VIEW vLargestNoOfStations
AS
	SELECT RS.CAID , COUNT(*) as Frequency
	FROM RechargingStationCars RS
    GROUP BY RS.CAID
    HAVING COUNT(*) =
			(
				SELECT MAX(Frequency)
				FROM 
					(
					SELECT RS2.CAID , COUNT(*) as Frequency
					FROM RechargingStationCars RS2
					GROUP BY RS2.CAID 
					) AS carsWithTheirFrequency
			)

GO

SELECT * FROM vLargestNoOfStations

--1 si 2

INSERT INTO Cars VALUES (25, 5), (50, 5), (75, 5), (100, 5)
INSERT INTO RechargingStations VALUES ('Location1'), ('Location2'), ('Location3'), ('Location4'), ('Location5'), ('Location6'), ('Location7')
INSERT INTO RechargingStationCars VALUES (1, 1), (1, 2), (1, 3), (2, 1), (2, 2), (2, 7), (3, 6), (3, 5), (4, 1)

SELECT * FROM Cars
SELECT * FROM RechargingStations
SELECT * FROM RechargingStationCars
GO

--4.
CREATE OR ALTER FUNCTION uf_CityElectricCars (@N INT)
RETURNS TABLE
RETURN 
	SELECT Ci.CID, C.CityName
	FROM CityCitizens Ci INNER JOIN Cities C ON C.CID = Ci.CID
	WHERE Ci.PID IN 
	(
		SELECT CC.PID
		FROM CitizenCars CC
		GROUP BY CC.PID
		HAVING COUNT(*) >= @N
	)
GO


SELECT * FROM Cars
SELECT * FROM Citizens

INSERT INTO CitizenCars VALUES (1, 1), (1, 2), (2, 3)
INSERT INTO CityCitizens VALUES (1, 1), (2, 2), (3, 1)

SELECT * FROM CitizenCars
SELECT * FROM Cities
SELECT * FROM CityCitizens
SELECT * FROM uf_CityElectricCars (2)
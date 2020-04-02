SELECT *
FROM STUDENT

SELECT *
FROM FACULTY

--Find the names and the ids of students who attend lectures at FSEGA or MateInfo faculty.
--UNION
SELECT S1.SFName, S1.SLName, S1.[Sid]
FROM STUDENT S1
WHERE S1.Fid = 3
UNION
SELECT S2.SFName, S2.SLName, S2.[Sid]
FROM STUDENT S2
WHERE S2.Fid = 12

--Find the romantic or fiction books.
--OR
SELECT TOP 3 B.Title,B.Aid
FROM BOOK B
WHERE B.BCid = 1 --OR B.BCid = 7
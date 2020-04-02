SELECT * FROM FACULTY
SELECT * FROM STUDENT
SELECT * FROM BORROWS
SELECT * FROM BOOK

--Find the names of the romance authors
SELECT DISTINCT A.AFName, A.AlName
FROM 
	(
		SELECT *
		FROM BOOK B
		WHERE B.BCid = 1
	) AS AB, AUTHOR A
WHERE AB.Aid = A.Aid

--Find all the books that appeared after 1971.
SELECT RB.Title, RB.Release_Year
FROM
	(
		SELECT *
		FROM BOOK B
		WHERE B.Release_Year > '19710101'
	) AS RB

SELECT * FROM AUTHOR
SELECT * FROM AUTHOR_CATEGORY

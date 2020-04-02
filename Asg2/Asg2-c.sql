--Find the authors who published romantic books, but not fiction books.
--EXCEPT
SELECT A.AFName, A.AlName
FROM AUTHOR A, BOOK B
WHERE B.BCid = 1 AND A.Aid = B.Aid
EXCEPT
SELECT A2.AFName, A2.AlName
FROM AUTHOR A2, BOOK B2
WHERE B2.BCid = 7 AND A2.Aid = B2.Aid

--Find all the students that didn't borrow a book.
--NOT IN
SELECT DISTINCT S.SFName, S.SLName
FROM STUDENT S
WHERE S.[Sid] NOT IN
	(
		SELECT BR.[Sid]
		FROM BORROWS BR
	)

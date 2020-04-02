--Find the authors who published romantic and fiction books.
-- INTERSECT
SELECT A.AFName, A.AlName
FROM AUTHOR A, BOOK B
WHERE B.BCid = 1 AND A.Aid = B.Aid
INTERSECT
SELECT A2.AFName, A2.AlName
FROM AUTHOR A2, BOOK B2
WHERE B2.BCid = 7 AND A2.Aid = B2.Aid

SELECT * FROM BOOK
SELECT * FROM BOOK_CATEGORY
SELECT * FROM AUTHOR
--Find the names of students that borrowed 'The Murder of Roger Ackroyd'.
-- IN
SELECT S.SFName, S.SLName, S.[Sid]
FROM STUDENT S
WHERE S.[Sid] IN 
(
	SELECT BR.[Sid]
	FROM BORROWS BR
	WHERE BR.Bid = 3
	)

SELECT * FROM BOOK
SELECT * FROM STUDENT
SELECT * FROM BORROWS
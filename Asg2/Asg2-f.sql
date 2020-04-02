SELECT * FROM ISSUES
SELECT * FROM LIBRARIAN
SELECT * FROM [RETURNS]
SELECT * FROM BORROWS
SELECT * FROM STUDENT
SELECT * FROM BOOK


--Find the name of the librarian that issued "Murder of Roger Ackroyd"
--EXISTS
SELECT L.LFName, L.LLNAME, L.Lid
FROM LIBRARIAN L
WHERE EXISTS
(
	SELECT *
	FROM ISSUES I
	WHERE I.Lid = L.Lid AND I.Bid = 3
)
--Find the name of the students that returned "Murder of Roger Ackroyd"
--EXISTS
SELECT S.SFName, S.SLName, S.[Sid]
FROM STUDENT S
WHERE EXISTS
	(
		SELECT *
		FROM [RETURNS] RT
		WHERE S.[Sid] = RT.[Sid] AND RT.Bid = 3
	)
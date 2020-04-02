
SELECT Title, AFName, AlName, CName, Language_name
FROM BOOK B
INNER JOIN AUTHOR A ON A.Aid = B.Aid
INNER JOIN BOOK_CATEGORY BC ON BC.BCid = B.BCid
INNER JOIN [LANGUAGE] L ON L.Language_id = B.Language_id
ORDER BY Title;

--BUN
SELECT Title, Character_name
FROM APPEARS_IN  AI
RIGHT JOIN [CHARACTER] C ON C.Character_id = AI.Character_id
RIGHT JOIN BOOK B ON B.Bid = AI.Bid
ORDER BY B.Bid;

--IDK, YDK
SELECT Title, Character_name
FROM APPEARS_IN AI
LEFT JOIN BOOK B ON B.Bid = AI.Bid
LEFT JOIN [CHARACTER] C ON C.Character_id = AI.Character_id
ORDER BY B.Bid

SELECT S.SFName, s.SLName, f.Faculty_Name
FROM FACULTY F
RIGHT JOIN STUDENT S ON S.Fid = F.Fid
ORDER BY F.Faculty_Name

--2 m:m, [1] student-borrrows-book, [2] librarian-issues-book

SELECT S.SFName, S.SLName, B.Title, BR.Borrow_Date, L.LFName, L.LLNAME
FROM BORROWS BR
FULL OUTER JOIN BOOK B ON B.Bid = BR.Bid
FULL OUTER JOIN STUDENT S ON S.[Sid] = BR.[Sid]
FULL OUTER JOIN ISSUES I ON I.Bid = BR.Bid
FULL OUTER JOIN LIBRARIAN L ON L.Lid = I.Lid
ORDER BY BR.Borrow_Date


SELECT * FROM APPEARS_IN
SELECT * FROM BOOK
SELECT * FROM [CHARACTER]

INSERT INTO APPEARS_IN(Bid, Character_id)
VALUES(11,2);




INSERT INTO [CHARACTER](Character_id, Character_name)
VALUES (3, 'Hermione Granger');

INSERT INTO [CHARACTER](Character_id, Character_name)
VALUES (4, 'Ron Weasley');

INSERT INTO [CHARACTER](Character_id, Character_name)
VALUES (5, 'Draco Malfoy');

INSERT INTO [CHARACTER](Character_id, Character_name)
VALUES (6, 'Cedric Diggory');

INSERT INTO [CHARACTER](Character_id, Character_name)
VALUES (7, 'Ursula Bourne');

INSERT INTO APPEARS_IN(Character_id, Bid)
VALUES (3, 11);

INSERT INTO APPEARS_IN(Character_id, Bid)
VALUES (3, 12);

INSERT INTO APPEARS_IN(Character_id, Bid)
VALUES (4, 11);

INSERT INTO APPEARS_IN(Character_id, Bid)
VALUES (4, 12);

INSERT INTO APPEARS_IN(Character_id, Bid)
VALUES (5, 11);

INSERT INTO APPEARS_IN(Character_id, Bid)
VALUES (5, 12);

INSERT INTO APPEARS_IN(Character_id, Bid)
VALUES (6, 11);

INSERT INTO APPEARS_IN(Character_id, Bid)
VALUES (6, 12);

INSERT INTO APPEARS_IN(Character_id, Bid)
VALUES (7, 3);

SELECT C.Character_name, B.Title, A.AFName, A.AlName
FROM [CHARACTER] C
INNER JOIN APPEARS_IN AI ON AI.Character_id = C.Character_id
INNER JOIN BOOK B ON B.Bid = AI.Bid
INNER JOIN AUTHOR A ON A.Aid = B.Aid
ORDER BY C.Character_name
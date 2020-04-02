SELECT * FROM STUDENT
SELECT * FROM BOOK
SELECT * FROM BOOK_CATEGORY
SELECT * FROM BORROWS
SELECT * FROM ISSUES

--Find all the students that borrrowed a fiction book.
SELECT S.SFName, S.SLName, (S.Age - 19) AS Year_Of_Study
FROM STUDENT S
WHERE S.[Sid] IN
	(
		SELECT BR.[Sid]
		FROM BORROWS BR
		WHERE BR.Bid IN
			(
				SELECT B.Bid
				FROM BOOK B
				WHERE B.BCid = 7
			)
	)


SELECT * FROM STUDENT
SELECT * FROM BORROWS

--Find all the law students that borrowed a book
SELECT DISTINCT BR.[Sid]
FROM BORROWS BR
WHERE BR.[Sid] IN
	(
		SELECT S.[Sid]
		FROM STUDENT S
		WHERE S.[Fid] = 1
	)

INSERT INTO BORROWS(Borrow_Date, Bid, [Sid])
VALUES ('2019-11-05', 1, 1);

SELECT * FROM ISSUES

INSERT INTO ISSUES(Lid, Bid, Issue_Date)
VALUES (1, 1, '2019-11-05');
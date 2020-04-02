--Find all the Aghata Christie books that were borrowed.
SELECT B.Title, A.AFName, A.AlName, B.Bid
FROM BOOK B
INNER JOIN AUTHOR A ON A.Aid = B.Aid
WHERE B.Bid = ANY
	(
		SELECT BR.Bid
		FROM BORROWS BR
		WHERE BR.Bid IN
			(
				SELECT B1.Bid
				FROM BOOK B1
				WHERE B1.Aid = 1
			)
	)


--Find the last borrowed book
SELECT Title, Borrow_Date
FROM BORROWS BR
INNER JOIN BOOK B ON B.Bid = BR.Bid
WHERE BR.Borrow_Date = ALL
	(
		SELECT MAX(BR1.Borrow_Date)
		FROM BORROWS BR1
	);

SELECT Title, Borrow_Date
FROM BORROWS BR
INNER JOIN BOOK B ON B.Bid = BR.Bid
WHERE BR.Borrow_Date IN
	(
		SELECT MAX(BR1.Borrow_Date)
		FROM BORROWS BR1
	);


SELECT * FROM BOOK

--Find all the books whose copies are more than the average of all.
SELECT Title, B.Copies
FROM BOOK B
WHERE B.Copies > 
	(
		SELECT AVG(B1.Copies)
		FROM BOOK B1
	)
	
SELECT Title, A.AFName, A.AlName, B.Copies
FROM BOOK B
INNER JOIN AUTHOR A ON A.Aid = B.Aid
WHERE B.Copies > ALL
	(
		SELECT (B1.Copies)
		FROM BOOK B1
	)


SELECT B.Title, A.AFName, A.AlName, B.Release_Year
FROM BOOK B
INNER JOIN AUTHOR A ON A.Aid = B.Aid
WHERE B.Release_Year >= ALL
	(
		SELECT B1.Release_Year
		FROM BOOK B1
		WHERE B1.Bid NOT IN
			(
				SELECT B2.Bid
				FROM BOOK B2
				WHERE B2.Release_Year < '20000101'
			)
	)

SELECT * FROM BOOK

SELECT * FROM STUDENT
SELECT * FROM BORROWS
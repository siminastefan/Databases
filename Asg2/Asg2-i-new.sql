--Find all the books that were borrowd
SELECT B.Title
FROM BOOK B
WHERE
    B.Bid = ANY (
        SELECT BR.Bid
        FROM BORROWS BR
    )
ORDER BY B.Bid;

SELECT B.Title
FROM BOOK B
WHERE B.Bid IN 
	(
		SELECT BR.Bid
		FROM BORROWS BR
	)
ORDER BY B.Bid;

--Find all the books in which Hercule Poirot appearss
SELECT B.Title
FROM BOOK B
WHERE B.Bid = ANY (
	SELECT AI.Bid
	FROM APPEARS_IN AI
	WHERE AI.Character_id = 1
)

SELECT B.Title
FROM BOOK B
WHERE B.Bid IN (
	SELECT AI.Bid
	FROM APPEARS_IN AI
	WHERE AI.Character_id = 1
)

--Find the last borrowed book
SELECT Title, Borrow_Date
FROM BORROWS BR
INNER JOIN BOOK B ON B.Bid = BR.Bid
WHERE BR.Borrow_Date >= ALL
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

--Find the last returned book
SELECT Title, Return_Date
FROM [RETURNS] R
INNER JOIN BOOK B ON B.Bid = R.Bid
WHERE R.Return_Date = ALL
	(
		SELECT MAX(R1.Return_Date)
		FROM [RETURNS] R1
	);

SELECT Title, Return_Date
FROM [RETURNS] R
INNER JOIN BOOK B ON B.Bid = R.Bid
WHERE R.Return_Date IN
	(
		SELECT MAX(R1.Return_Date)
		FROM [RETURNS] R1
	);
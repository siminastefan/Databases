INSERT INTO FACULTY ( Number_Of_Students, Faculty_Name)
VALUES(10234,'MateInfo');

INSERT INTO STUDENT ( SFName, SLName, Fid)
VALUES( 'Andrei', 'Popescu', 1);

INSERT INTO BOOK_CATEGORY(BCid, CName)
VALUES(7, 'Beletristica');

INSERT INTO AUTHOR_CATEGORY(ACid, [Time])
VALUES(4, 'Postbelic');

INSERT INTO AUTHOR(Aid, AFName, ALName, ACid)
VALUES(2, 'Marin', 'Preda', 4);

INSERT INTO BOOK( Title, Release_Year, Copies, Aid, BCid)
VALUES('Morometii', '1955-01-11', 10000, 2, 7);

INSERT INTO LIBRARIAN( LFName, LLNAME, Salary)
VALUES('Ana','Maria',1800);

INSERT INTO LIBRARIAN(LFName, LLNAME, Salary)
VALUES('Anastasia','Marin',1890);

INSERT INTO LIBRARIAN(LFName, LLNAME, Salary)
VALUES('Costache','Alb',1890);

SELECT * FROM LIBRARIAN

BULK INSERT FACULTY
FROM 'E:\Facultate\Anul2\Sem1\Baze de Date\faculty.csv'
WITH
(
ROWTERMINATOR='\n',
FIELDTERMINATOR=','
)

BULK INSERT STUDENT
FROM 'E:\Facultate\Anul2\Sem1\Baze de Date\student.csv'
WITH
(
ROWTERMINATOR='\n',
FIELDTERMINATOR=','
)

BULK INSERT BOOK_CATEGORY
FROM 'E:\Facultate\Anul2\Sem1\Baze de Date\bookCategory.csv'
WITH
(
ROWTERMINATOR='\n',
FIELDTERMINATOR=','
)

BULK INSERT AUTHOR_CATEGORY
FROM 'E:\Facultate\Anul2\Sem1\Baze de Date\authorCategory.csv'
WITH
(
ROWTERMINATOR='\n',
FIELDTERMINATOR=','
)

BULK INSERT AUTHOR
FROM 'E:\Facultate\Anul2\Sem1\Baze de Date\author.csv'
WITH
(
ROWTERMINATOR='\n',
FIELDTERMINATOR=','
)

BULK INSERT BOOK
FROM 'E:\Facultate\Anul2\Sem1\Baze de Date\book.csv'
WITH
(
ROWTERMINATOR='\n',
FIELDTERMINATOR=','
)

BULK INSERT BORROWS
FROM 'E:\Facultate\Anul2\Sem1\Baze de Date\borrow.csv'
WITH
(
ROWTERMINATOR='\n',
FIELDTERMINATOR=','
)

SELECT * FROM FACULTY
SELECT * FROM STUDENT
SELECT * FROM BOOK_CATEGORY
SELECT * FROM AUTHOR_CATEGORY
SELECT * FROM AUTHOR
SELECT * FROM BOOK
SELECT * FROM BORROWS

DELETE FROM BOOK_CATEGORY WHERE BCiD = 7

DELETE FROM FACULTY WHERE Fid>5;
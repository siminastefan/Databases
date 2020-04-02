USE [Customer Service Database]

select * from [Order]


--a)

--clustered index scan
SELECT OID
FROM [Order]
WHERE CID = 2

--clustered index seek
SELECT Price
FROM Product
WHERE PID = 4

--non clustered index scan
SELECT SerialNumber FROM Product

--non clustered index seek
SELECT SerialNumber FROM Product WHERE SerialNumber > 250000


--key look up
CREATE NONCLUSTERED INDEX IDX_NCL_PRICE ON Product(Price)

SELECT [Name], Price, PID
FROM Product
WITH (INDEX(IDX_NCL_PRICE))
WHERE PRICE > 50

--b)Write a query on table Tb with a WHERE clause of the form WHERE b2 = value and analyze its execution plan. Create a nonclustered index that can speed up the query.
--Recheck the query’s execution plan (operators, SELECT’s estimated subtree cost). --customer(cnp)

SELECT Age
FROM Customer
WHERE Age > 50
--007345

CREATE NONCLUSTERED INDEX IDX_NCL_Age ON Customer(Age)
drop index IDX_NCL_Age ON Customer

SELECT  Age
FROM Customer
WITH(INDEX(IDX_NCL_Age))
WHERE Age > 50
--0046046

--c. Create a view that joins at least 2 tables. Check whether existing indexes are helpful; if not, reassess existing indexes / examine the cardinality of the tables.


--0.0108346
SELECT * FROM dbo.CView

SELECT * FROM dbo.CView
WITH(INDEX(IDX_NCL_ID), INDEX(IDX_NCL_Price))

CREATE UNIQUE NONCLUSTERED INDEX IDX_NCL_Price ON Product(Price)
drop index IDX_NCL_Price ON Product

CREATE NONCLUSTERED INDEX IDX_NCL_CName ON Customer(Name, CID)
drop index IDX_NCL_CName ON Customer

CREATE NONCLUSTERED INDEX IDX_NCL_ID ON [Order](PID, CID)
drop index IDX_NCL_ID ON [Order]
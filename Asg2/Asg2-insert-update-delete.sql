INSERT INTO [RETURNS](Return_Date, Bid, [Sid])
VALUES('2018-05-10', 3, 6);

INSERT INTO [RETURNS](Return_Date, Bid, [Sid])
VALUES('2018-10-23', 2, 5);

DELETE FROM BOOK WHERE Bid = 6

INSERT INTO ISSUES(Issue_Date, Lid, Bid)
VALUES('2018-04-30',1,3);

INSERT INTO ISSUES(Issue_Date, Lid, Bid)
VALUES('2019-01-01',3,3);

INSERT INTO ISSUES(Issue_Date, Lid, Bid)
VALUES('2019-10-10',2,1);

INSERT INTO ISSUES(Issue_Date, Lid, Bid)
VALUES('2018-09-23',1,2);

INSERT INTO BORROWS([Sid], Bid, Borrow_Date)
VALUES (4, 12, '2019-10-29');

INSERT INTO BORROWS([Sid], Bid, Borrow_Date)
VALUES (4, 11, '2019-10-29');

INSERT INTO ISSUES(Issue_Date, Lid, Bid)
VALUES ('2019-10-29', 1, 12);

INSERT INTO ISSUES(Issue_Date, Lid, Bid)
VALUES ('2019-10-29', 1, 11);

UPDATE BOOK SET BCid = 7 WHERE Aid = 2

UPDATE STUDENT SET SFName = 'Ionut' WHERE [Sid] = 1
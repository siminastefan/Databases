--Find the number of books in each language
SELECT COUNT(IWI.Language_id) Count_id, IWI.Language_id
FROM IS_WRITTEN_IN IWI
GROUP BY IWI.Language_id


--Find the librarians that earn more than the average of all
SELECT L.Lid, L.Salary
FROM LIBRARIAN L
GROUP BY L.Lid, L.Salary
HAVING L.Salary > 
	( SELECT AVG(L1.Salary)
	  FROM LIBRARIAN L1
	);

--Find in how many books the characters appear
SELECT COUNT(AI.Character_id) AS count_id, C.Character_name
FROM APPEARS_IN AI, [CHARACTER] C
WHERE AI.Character_id = C.Character_id
GROUP BY AI.Character_id, C.Character_name
ORDER BY count_id DESC


--Find the first book that appeared after 1990
SELECT B.Release_Year, B.Title, B.BCid
FROM BOOK B
GROUP BY B.Release_Year, B.Title, B.BCid
HAVING B.Release_Year > '19900101' AND B.Release_Year <=
	(
		SELECT MAX(B1.Release_Year)
		FROM BOOK B1
	)
ORDER BY B.Release_Year DESC;


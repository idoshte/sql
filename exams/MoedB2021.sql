--1

SELECT E.FirstName, E.LastName, E.BirthDate , '12345567' AS ID
FROM Employees E
WHERE E.BirthDate = 
(SELECT MAX(E.BirthDate)
FROM Employees E )
UNION 
SELECT E.FirstName, E.LastName, E.BirthDate , '12345567' AS ID
FROM Employees E
WHERE E.EmployeeID IN 
(SELECT DISTINCT E.ReportsTo
FROM Employees E 
)
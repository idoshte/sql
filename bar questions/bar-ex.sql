USE [Northwind]

--ex 20
SELECT C.Region,C.City,COUNT(C.CustomerID) 'NumResidents'
FROM CUSTOMERS C 
WHERE C.Region IS NOT NULL AND
      C.CITY LIKE '%[LM]%' AND
      C.Region IN (
          SELECT REGION FROM 
          Customers
          GROUP BY Region
          HAVING COUNT(Region)>=2
      )
GROUP BY C.Region,C.City

--ex 21 E=0

SELECT E.FirstName+' '+E.LastName 'FULLNAME',
       COUNT(*) AS 'SUM ORDERS',
       MAX(O.OrderDate) LASTDATE
FROM Employees E INNER JOIN
     Orders O 
     ON O.EmployeeID=E.EmployeeID
GROUP BY E.EmployeeID,E.FirstName,E.LastName
HAVING COUNT(*) >100

SELECT C.*
FROM Customers C

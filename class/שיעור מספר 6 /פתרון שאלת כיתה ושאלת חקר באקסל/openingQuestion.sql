USE Northwind
SELECT E.FirstName + ' ' + E.LastName AS 'Full Name',
       AVG(OD.Quantity) AS 'AVG Q',
	   AVG(OD.UnitPrice) AS 'AVG P',
	   SUM(OD.Quantity*OD.UnitPrice) AS 'SUM R'
FROM Employees AS E INNER JOIN
     Orders AS O ON E.EmployeeID=O.EmployeeID
	 INNER JOIN [Order Details] AS OD
	 ON O.OrderID=OD.OrderID
WHERE E.City LIKE 'LONDON' AND
      YEAR(O.OrderDate)=1996 AND
	  OD.Quantity*OD.UnitPrice 
	  NOT BETWEEN 30 AND 300 
GROUP BY E.EmployeeID,E.FirstName,E.LastName
HAVING SUM(OD.Quantity*OD.UnitPrice)>15000

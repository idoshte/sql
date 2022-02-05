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

--2

SELECT S.CompanyName, SUM(OD.Quantity*OD.UnitPrice) 'SUM', COUNT(*) AS 'CNT'
FROM Shippers S INNER JOIN Orders O
ON S.ShipperID = O.ShipVia
INNER JOIN [Order Details] OD 
ON O.OrderID = OD.OrderID
WHERE YEAR(O.OrderDate) = 1996 AND (DATEPART(Q,O.OrderDate)=1 OR MONTH(O.OrderDate) IN (7,8))
GROUP BY S.CompanyName, S.ShipperID
HAVING SUM(OD.Quantity*OD.UnitPrice) > 

	(SELECT COUNT(*)
	FROM Orders O
	WHERE O.CustomerID LIKE 'ALFKI') *10 * 5

--3
SELECT YEAR(O.OrderDate) 'Y', DATEPART(Q,O.OrderDate) 'Q',  AVG(od.Quantity*od.UnitPrice) AS 'AVG' , COUNT(*) AS 'CNT'
FROM Orders O INNER JOIN [Order Details] OD
ON O.OrderID = OD.OrderID
GROUP BY YEAR(O.OrderDate) , DATEPART(Q,O.OrderDate)
HAVING COUNT(*) < 

	(SELECT COUNT(*)
	FROM Orders O INNER JOIN [Order Details] OD
	ON O.OrderID = OD.OrderID
	WHERE O.CustomerID LIKE 'QUICK')/6

--4

SELECT C.CustomerID,
       SUM(OD.Quantity*OD.UnitPrice) SR,
       SUM(OD.UnitPrice) SU
FROM Customers C INNER JOIN 
     Orders O ON O.CustomerID=C.CustomerID INNER JOIN 
     [Order Details] OD ON OD.OrderID=O.OrderID
WHERE C.CompanyName LIKE '[ABC]%'
GROUP BY C.CustomerID
HAVING COUNT(*) BETWEEN 
               (
                   SELECT COUNT(*)/20
                   FROM Orders O 
                   WHERE O.ShipVia=1
               )
        AND (3+1)*15


--1

SELECT P.ProductName,
       AVG(OD.Quantity) CNTQ
FROM Products P INNER JOIN 
     [Order Details] OD ON OD.ProductID=P.ProductID
WHERE P.CategoryID = 

(
    SELECT P.CategoryID
    FROM Products P 
    WHERE P.ProductName LIKE 'Chocolade' 
)
AND (P.ProductName LIKE 'S%' OR P.ProductID=205478613)
GROUP BY P.ProductID,P.ProductName
HAVING AVG(OD.Quantity)>20

--2

SELECT C.CompanyName,
       COUNT(*) CNTORDERS,
       MAX(O.OrderDate) LASTORDER
FROM Customers C LEFT JOIN 
     Orders O ON O.CustomerID=C.CustomerID
GROUP BY C.CustomerID,C.CompanyName
HAVING COUNT(*) =0 OR AVG(O.Freight)<
            (
                SELECT AVG(O.Freight)
                FROM Customers C INNER JOIN 
                     Orders O ON O.CustomerID=C.CustomerID
                WHERE C.City IN ('PARIS','MADRID')
            )

--3

SELECT P.ProductName+'@@@205478613' NEWNAME,
       OD.Quantity,
       DATEPART(QUARTER,O.OrderDate) QUARTER,
       DATEDIFF(MONTH,O.OrderDate,GETDATE()) DIFF
       
FROM Products P INNER JOIN
     [Order Details] OD ON OD.ProductID=P.ProductID INNER JOIN 
     Orders O ON O.OrderID=OD.OrderID
WHERE YEAR(O.OrderDate)<>1996 AND OD.Quantity BETWEEN 30 AND 100


--4

SELECT YEAR(O.OrderDate) YEAR,
       MONTH(O.OrderDate) MONTH,
       SUM(OD.Quantity*OD.UnitPrice) SR
FROM Orders O INNER JOIN 
     [Order Details] OD ON OD.OrderID=O.OrderID INNER JOIN 
     Products P ON OD.ProductID=P.ProductID
WHERE P.UnitPrice=OD.UnitPrice
GROUP BY YEAR(O.OrderDate),MONTH(O.OrderDate)
HAVING SUM(Quantity)<5000

--5

SELECT C.CategoryID,
       C.CategoryName 'CATEGORY_NAME/PRODUCT_NAME',
       AVG(P.UnitPrice) 'AvgUnitPrice/UnitPrice',
       '$$Category$$' as 'Information'
FROM Categories C INNER JOIN 
     Products P ON P.CategoryID=C.CategoryID
group by C.CategoryID,C.CategoryName

UNION

SELECT P.CategoryID,
       p.ProductName,
       p.UnitPrice,
       '--Product--'
FROM Products P
ORDER BY CategoryID ASC,Information DESC

--6



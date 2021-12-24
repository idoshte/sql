--1 

SELECT C.CompanyName,
       C.COUNTRY,
       COUNT(DISTINCT O.OrderID) AS CNTORDERS,
       SUM(OD.Quantity*OD.UnitPrice) SUMREV
FROM Customers C LEFT JOIN
     ORDERS O ON O.CustomerID=C.CustomerID LEFT JOIN
     [Order Details] OD ON OD.OrderID=O.OrderID
WHERE C.Country IN ('spain','FRANCE')
GROUP BY C.CustomerID,C.CompanyName,C.Country
HAVING COUNT(DISTINCT O.OrderID) =0 OR 
       COUNT(DISTINCT O.OrderID)>=10

--2

SELECT P.*
FROM Products P
WHERE P.UnitsInStock>

        (
            SELECT AVG(P.UnitsInStock)
            FROM Products P
        )

--3

SELECT C.City
FROM Customers C
ORDER BY C.City

--4

SELECT O.*
FROM ORDERS O INNER JOIN 
     [Order Details] OD ON OD.OrderID=O.OrderID
WHERE OD.Quantity>50

--5

SELECT C.CompanyName,O.OrderDate,O.Freight
FROM Customers C INNER JOIN
     Orders O  ON O.CustomerID=C.CustomerID
WHERE O.Freight> 100+

            (
                SELECT AVG(O.Freight)
                FROM ORDERS O
            )

--6
SELECT DATEPART(YEAR,O.OrderDate) AS ORDERYear,
       COUNT(DISTINCT O.OrderID) CNTORDERS,
       COUNT(*) AS CNTROWSORDERS,
       SUM(OD.Quantity) AS SUMQUANINTY
FROM ORDERS O INNER JOIN
     [Order Details] OD ON OD.OrderID=O.OrderID
GROUP BY DATEPART(YEAR,O.OrderDate)

--7

SELECT DISTINCT C.CompanyName
FROM Customers C INNER JOIN
     ORDERS O ON O.CustomerID=C.CustomerID INNER JOIN
     Employees E ON O.EmployeeID=E.EmployeeID
WHERE C.Country LIKE '%UK%' AND E.Country LIKE 'USA' 

--8

SELECT C.CompanyName,
       SUM(OD.Quantity*OD.UnitPrice) SUMREV,
       SUM(OD.Quantity*OD.UnitPrice)/
       (
           SELECT SUM(OD.UnitPrice*OD.Quantity)
           FROM [Order Details] OD
       ) AS PERCREV
FROM CUSTOMERS C INNER JOIN 
     ORDERS O  ON O.CustomerID=C.CustomerID INNER JOIN
     [Order Details] OD ON OD.OrderID=O.OrderID
GROUP BY C.CustomerID,C.CompanyName

--12
SELECT S.CompanyName,
       AVG(OD.UnitPrice) - 
       (
           SELECT AVG(OD.UnitPrice)

           FROM [Order Details] OD
       ) AS HEFRESH
FROM Shippers S INNER JOIN
     Orders O ON O.ShipVia=S.ShipperID INNER JOIN
     [Order Details] OD ON OD.OrderID =O.OrderID INNER JOIN 
     Products P ON P.ProductID=OD.ProductID INNER JOIN 
     Categories CAT ON CAT.CategoryID=P.CategoryID
WHERE CAT.CategoryName LIKE 'Beverages'
GROUP BY S.ShipperID,S.CompanyName

--13
SELECT P.*
FROM Categories CAT INNER JOIN 
     Products P ON P.CategoryID=CAT.CategoryID
WHERE CAT.CategoryName LIKE 'CHAI' AND
      P.UnitPrice BETWEEN 
         
         (
             SELECT AVG(P.UnitPrice)
             FROM Categories CAT INNER JOIN 
                  Products P ON P.CategoryID=CAT.CategoryID
            WHERE CAT.CategoryName LIKE 'PRODUCE'
         )

    AND 100

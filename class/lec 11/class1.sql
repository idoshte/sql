--1

SELECT C.CustomerID,
       C.CompanyName,
       C.Country,
       C.City,
       C.ContactName
FROM Customers C

--2

SELECT O.CustomerID,
       COUNT(*) AS CNTORDERS
FROM Orders O  
     INNER JOIN 
    [Order Details] OD ON OD.OrderID=O.OrderID
GROUP BY O.CustomerID


--3

SELECT O.CustomerID,
       O.Freight
FROM Orders O

--4

SELECT SUM(OD.Quantity*OD.UnitPrice)
FROM [Order Details] OD

--5

SELECT SUM(O.Freight)
FROM ORDERS O
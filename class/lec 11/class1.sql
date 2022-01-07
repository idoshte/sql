--1

SELECT C.CustomerID,
       C.CompanyName,
       C.Country,
       C.City,
       C.ContactName
FROM Customers C

--2

SELECT O.CustomerID,
       COUNT(*) AS CNTORWOS,
       SUM(OD.UnitPrice*OD.Quantity) SUMREV
FROM Orders O  
     INNER JOIN 
    [Order Details] OD ON OD.OrderID=O.OrderID
GROUP BY O.CustomerID


--3

SELECT O.CustomerID,
       SUM(O.Freight) SUMFRIEGHT,
       COUNT(*) CNTORDERS
FROM Orders O
GROUP BY O.CustomerID

--4

SELECT SUM(OD.Quantity*OD.UnitPrice)
FROM [Order Details] OD

--5

SELECT SUM(O.Freight)
FROM ORDERS O


-- sub query from

USE Northwind
SELECT Q1.CompanyName,Q1.City,Q1.Country,
       Q2.[Count of Rows],Q2.SumRevenue,
	   Q3.[Count of Orders],Q3.SumFreight
FROM 
	(SELECT C.CustomerID,C.CompanyName,C.Country,C.City,C.ContactName
	 FROM Customers AS C) AS Q1
INNER JOIN 
	(SELECT O.CustomerID,SUM(OD.Quantity*OD.UnitPrice) AS SumRevenue,COUNT(*) AS 'Count of Rows'
	 FROM Orders AS O INNER JOIN [Order Details] AS OD
		 ON O.OrderID=OD.OrderID
	 GROUP BY O.CustomerID) AS Q2
ON Q1.CustomerID=Q2.CustomerID
INNER JOIN
	(SELECT O.CustomerID,SUM(O.Freight) AS SumFreight,COUNT(*) AS 'Count of Orders'
	 FROM Orders AS O
	 GROUP BY O.CustomerID) AS Q3
ON Q3.CustomerID=Q2.CustomerID


--sub query full

SELECT Q1.CompanyName,Q1.City,Q1.Country,Q1.Fax,
       Q2.[Count of Rows],Q2.SumRevenue,
	   1.0*Q2.SumRevenue/
	   (
	    SELECT SUM(OD.Quantity*OD.UnitPrice) AS GrandRevenue
	    FROM [Order Details] AS OD
		) AS 'SR T',
	   Q3.[Count of Orders],
	   Q3.SumFreight,
	   1.0*Q3.SumFreight/
	   (
		SELECT SUM(O.Freight) AS GrandFreight
		FROM Orders AS O
	   ) AS 'SF T'
FROM 
	(SELECT C.CustomerID,C.CompanyName,C.Country,C.City,C.ContactName,C.Fax
	 FROM Customers AS C) AS Q1
INNER JOIN 
	(SELECT O.CustomerID,SUM(OD.Quantity*OD.UnitPrice) AS SumRevenue,COUNT(*) AS 'Count of Rows'
	 FROM Orders AS O INNER JOIN [Order Details] AS OD
		 ON O.OrderID=OD.OrderID
	 GROUP BY O.CustomerID) AS Q2
ON Q1.CustomerID=Q2.CustomerID
INNER JOIN
	(SELECT O.CustomerID,SUM(O.Freight) AS SumFreight,COUNT(*) AS 'Count of Orders'
	 FROM Orders AS O
	 GROUP BY O.CustomerID) AS Q3
ON Q3.CustomerID=Q2.CustomerID
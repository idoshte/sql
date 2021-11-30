USE Northwind

/*1*/
  SELECT O.OrderID, O.OrderDate, 
		 DATEPART(QUARTER,O.OrderDate) AS Qdate,
		 DATEPART(YEAR, O.OrderDate) AS Ydate,
		 DATEPART(MONTH, O.OrderDate) AS Mdate,
		 DATEDIFF(MONTH,O.ShippedDate,O.RequiredDate) AS Diff,
		 O.Freight, 
		 O.Freight*0.85 AS FreighDis
  FROM Orders AS O
/*2*/
  SELECT E.*
  FROM Employees AS E
  Where E.Country = 'UK' AND DATEDIFF(YEAR,E.BirthDate,E.HireDate)<40
/*3*/
  SELECT E.*
  FROM Employees AS E
  WHERE E.City IN ('LONDON','SEATTLE','TACOMA')
/*4*/
SELECT O.*
FROM Orders AS O
WHERE DATEPART(YEAR,O.OrderDate) IN(1996,1998) 
/*5*/
SELECT C.*
FROM Customers AS C
WHERE C.Country IN  ('GERMANY', 'MEXICO', 'UK')
/*6*/
SELECT O.OrderID
FROM Orders AS O
WHERE (O.Freight>100 OR O.Freight<10) AND (O.ShipVia=1 OR O.ShipVia=3)
/*7*/
SELECT O.*
FROM Orders AS O
WHERE DATEPART(YEAR, O.OrderDate)=1998
/*8*/
SELECT P.*
FROM Products AS P
WHERE P.ProductName LIKE 'g%'
/*9*/
SELECT P.*
FROM Products AS P
WHERE P.ProductName LIKE '%A'
/*10*/
SELECT P.*
FROM Products AS P
WHERE P.ProductName LIKE 'G%A'
/*11*/
SELECT P.*
FROM Products AS P
WHERE P.ProductName LIKE 'G%' OR P.ProductName LIKE '%a'
/*12*/
SELECT P.*
FROM Products AS P
WHERE P.ProductName LIKE '_E%'
/*13*/
SELECT P.*
FROM Products AS P
WHERE P.QuantityPerUnit LIKE '%BOX%'
/*14*/
SELECT C.*
FROM Customers AS C
WHERE C.City LIKE  '[M,L,b]%'
/*15*/
SELECT P.*
FROM Products AS P
WHERE (P.UnitsInStock >100 OR P.UnitsInStock <15) AND
	  P.QuantityPerUnit LIKE '%OZ%'
/*16*/
  SELECT E.*
  FROM Employees AS E
  WHERE LEN(E.FirstName)>3
 /*17*/
  SELECT E.*
  FROM Employees AS E
  WHERE E.ReportsTo IS NULL
 /*18*/
  SELECT E.*
  FROM Employees AS E
  WHERE E.FirstName LIKE 'A__%'
/*19*/
   SELECT O.OrderID, O.OrderDate, 
		 DATEPART(MONTH, O.OrderDate) AS Mdate,
		 O.Freight, 
		 O.Freight/1.2 AS FreighUK
  FROM Orders AS O 
  WHERE DATEPART(YEAR, O.OrderDate) IN (1996,1997) AND 
	    DATEPART(MONTH, O.OrderDate) %2=0 AND
		O.Freight BETWEEN 8 AND 80
/*20*/
SELECT E.*
FROM Employees AS E
WHERE DATEPART(YEAR, E.BirthDate) IN (1990,1980,1970)
/*21*/
  SELECT E.*
  FROM Employees AS E
  WHERE E.City IN ('LONDON','SEATTLE') AND
        DATEPART(YEAR, E.BirthDate)<1950

			


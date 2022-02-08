
SELECT *

FROM
(
SELECT C.CompanyName,
6666 QUARTER,
'CUSTOMER TOTAL' INFO,
AVG(OD.Quantity*OD.UnitPrice) REVENUIE
FROM Customers C INNER JOIN
ORDERS O ON O.CustomerID=C.CustomerID INNER JOIN
[Order Details] OD ON OD.OrderID=O.OrderID
GROUP BY C.CustomerID,C.CompanyName
) AS REVPERC
UNION
(
SELECT C.CompanyName,
DATEPART(QUARTER,O.OrderID) QUARTER,
'ORDER' INFO,
AVG(OD.Quantity*OD.UnitPrice) REVENUIE
FROM Customers C INNER JOIN
ORDERS O ON O.CustomerID=C.CustomerID INNER JOIN
[Order Details] OD ON OD.OrderID=O.OrderID
GROUP BY C.CustomerID,C.CompanyName,DATEPART(QUARTER,O.OrderID)
)


ORDER BY REVPERC.CompanyName ASC , QUARTER DESC



SELECT S1.CompanyName,S2.CompanyName
FROM Suppliers S1 INNER JOIN
    Suppliers S2 ON S1.SupplierID>S2.SupplierID
WHERE S1.Country=S2.Country AND 
      S1.SupplierID IN 
                (
                    SELECT DISTINCT P.SupplierID
                    FROM Products P INNER JOIN 
                         Categories C ON C.CategoryID=P.CategoryID
                    WHERE C.CategoryName LIKE 'Beverages'
                ) 
    AND S2.SupplierID IN 
                (
                    SELECT DISTINCT P.SupplierID
                    FROM Products P INNER JOIN 
                         Categories C ON C.CategoryID=P.CategoryID
                    WHERE C.CategoryName LIKE 'Beverages'
                ) 
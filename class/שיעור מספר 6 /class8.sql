USE [Northwind]

--2
SELECT E.FirstName+ ' '+E.LastName AS 'FullName',count(*) as cntO
FROM Employees E INNER JOIN 
ORDERS O ON O.EmployeeID=E.EmployeeID
WHERE O.Freight>=250
GROUP BY E.EmployeeID,E.FirstName,E.LastName
HAVING COUNT(*)>=100


--7
SELECT S.Country , SUM (OD.Quantity*OD.UnitPrice) AS REV
FROM Suppliers S INNER JOIN 
     Products P ON P.SupplierID=S.SupplierID INNER JOIN
     [Order Details] OD ON OD.ProductID=P.ProductID
WHERE S.Country LIKE 'S%'
GROUP BY S.Country

-- 8 no because count of products is mathmatical operation not
-- on the last table in hirchly. we can to compute sepertly 
-- from table products and from ordr deatails and to connect them
-- by join 
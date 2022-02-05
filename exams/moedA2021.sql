--1
select e.LastName +' ' +e.FirstName as 'Full Name', 'Yael' as 'FN'
from Employees e
where e.BirthDate in (
(select max(e.BirthDate)
from Employees e ) ,
(select min(e.BirthDate)
from Employees e  )
)

--2
select s.CompanyName, sum(od.Quantity*od.UnitPrice) as 'SUM', count(*) as 'CNT'
from Suppliers s inner join Orders o
on s.SupplierID= o.ShipVia
inner join [Order Details] od
on o.OrderID= od.OrderID
WHERE YEAR(O.OrderDate) =1996 AND (DATEPART(Q,O.OrderDate)=1 OR MONTH(O.OrderDate) IN (7,8))
GROUP BY S.SupplierID, S.CompanyName
HAVING sum(od.Quantity*od.UnitPrice)>300

--3
SELECT YEAR(O.OrderDate) 'Y', DATEPART(Q,O.OrderDate) 'Q',  AVG(od.Quantity*od.UnitPrice) AS 'AVG'
FROM Products P INNER JOIN [Order Details] OD
ON P.ProductID = OD.ProductID
INNER JOIN Orders O 
ON OD.OrderID= O.OrderID
WHERE P.UnitPrice<> OD.UnitPrice
GROUP BY YEAR(O.OrderDate) , DATEPART(Q,O.OrderDate)
HAVING AVG(OD.Quantity) >12

--4
SELECT C.CategoryName, sum(od.Quantity*od.UnitPrice) as 'SUM',  AVG(OD.Quantity) AS 'AVG' ,COUNT(DISTINCT P.ProductID) AS 'CNT'
 FROM Categories C INNER JOIN Products P 
 ON C.CategoryID= P.CategoryID
 INNER JOIN [Order Details] OD
 ON P.ProductID =  OD.ProductID
 INNER JOIN Orders O 
 ON OD.OrderID = O.OrderID
 WHERE YEAR(O.OrderDate) =1996 AND OD.UnitPrice<P.UnitPrice
 GROUP BY C.CategoryName

 --5

 SELECT
 FROM CATE

 --6
 select c.*
from Customers c left join Orders o
on c.CustomerID = o.CustomerID
where o.OrderID is null

select c.*
from Customers c 
where c.CustomerID not in 
(select distinct customerid from Orders)
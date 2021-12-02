

SELECT *
FROM Region R

SELECT *
FROM Territories T

SELECT * 
FROM EmployeeTerritories ET

SELECT * 
FROM Employees E

SELECT * 
FROM ORDERS O

SELECT * 
FROM [Order Details] OD


SELECT TerritoryID,count(*) 
FROM EmployeeTerritories ET
GROUP BY TerritoryID
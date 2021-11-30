USE [Northwind]

SELECT C.Region,C.City,COUNT(C.CustomerID) 'NumResidents'
FROM CUSTOMERS C 
WHERE C.Region IS NOT NULL AND
      C.CITY LIKE '%[LM]%' AND
      C.Region IN (
          SELECT REGION FROM 
          Customers
          GROUP BY Region
          HAVING COUNT(Region)>=2
      )
GROUP BY C.Region,C.City

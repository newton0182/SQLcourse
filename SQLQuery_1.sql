USE AdventureWorks2012;
GO

-- Select top5 
SELECT TOP (5) *
FROM Person.Person;




-- Select top5 specific columns
SELECT TOP (5) FirstName, LastName
FROM Person.Person;




-- Hvor mange personer, er der i tabellen: Person.Person ?
SELECT COUNT(DISTINCT BusinessEntityID) 
AS Antal_personer 
FROM Person.Person;




-- Select with order by
SELECT
    FirstName, 
    LastName
FROM
    Person.Person
ORDER BY
    FirstName DESC,
    LastName ASC;




-- Filter dates
SELECT
    FirstName, 
    LastName,
    ModifiedDate
FROM
    Person.Person
WHERE
    ModifiedDate = '2007-12-04';




-- Filter dates (compare)
SELECT 
    CustomerID, SalesOrderID, OrderDate
FROM
    Sales.SalesOrderHeader
WHERE OrderDate > '2011-07-05'; -- >=, != etc





-- Filter row where alphabetically is bigger than just 'M'
SELECT 
    BusinessEntityID, FirstName
FROM 
    Person.Person
WHERE 
    FirstName > 'M';    





-- Alias and order by
SELECT
    FirstName, 
    LastName AS "Efternavn",
    GETDATE() AS "DagensDato"
FROM
    Person.Person
ORDER BY
    FirstName DESC,
    LastName ASC;




-- Add days to a date
SELECT
    FirstName, 
    LastName,
    DATEADD(week, 1, GETDATE())  AS "DagensDatoPlusUge"
FROM
    Person.Person;











-- Select top5 
SELECT TOP (5) * 
FROM [AdventureWorks2012].[Person].[Address];




-- Get twp distinct columns
SELECT DISTINCT [City], [PostalCode] 
FROM [AdventureWorks2012].[Person].[Address];




/*
-- check if these the values are unique
SELECT COUNT(DISTINCT (SELECT DISTINCT [City], [PostalCode] FROM [AdventureWorks2012].[Person].[Address])) 
AS Antal_City 
FROM [AdventureWorks2012].[Person].[Address];
*/




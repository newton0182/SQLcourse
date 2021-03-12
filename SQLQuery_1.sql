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




-- CONCAT 1 (NULLs appear when only title is NULL)
SELECT Title + ' ' + FirstName + ' ' + MiddleName + ' ' + LastName AS [Title and name]
FROM Person.Person;





-- CONCAT 2 (Extra spaces appear when one of them is NULL)
SELECT ISNULL(Title, '') + ' ' + FirstName + ' ' + ISNULL(MiddleName, '') + ' ' + LastName AS [Title and name]
FROM Person.Person;





-- CONCAT 3 (Problem with NULL and spaces is solved)
SELECT ISNULL(Title + ' ', '') + FirstName + ' ' + ISNULL(MiddleName + ' ', '') + LastName AS [Title and name]
FROM Person.Person;






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


-- Literal values and column names together
SELECT 'A nice day' AS "Literal Value",
 BusinessEntityID AS EmployeeID,
 LoginID JobTitle --AS can be omittet when using an alias. Kolumn LoginID will be renamed to JobTitle, and the actual JobTitle column is ignored
FROM HumanResources.Employee;




--1 : BETWEEN
SELECT CustomerID, SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2005-07-02' AND '2005-07-15';
--2
SELECT CustomerID, SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader
WHERE CustomerID BETWEEN 25000 AND 25005;
--3
SELECT BusinessEntityID, JobTitle
FROM HumanResources.Employee
WHERE JobTitle BETWEEN 'C' and 'E';

--4 An illogical BETWEEN expression
SELECT CustomerID, SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader
WHERE CustomerID BETWEEN 25005 AND 25000;




-- Using NOT BETWEEN
--1
SELECT CustomerID, SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader
WHERE OrderDate NOT BETWEEN '2005-07-02' AND '2005-07-04';
--2
SELECT CustomerID, SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader
WHERE CustomerID NOT BETWEEN 25000 AND 25005;
--3
SELECT BusinessEntityID, JobTitle
FROM HumanResources.Employee
WHERE JobTitle NOT BETWEEN 'C' and 'E';
--4 An illogical BETWEEN expression
SELECT CustomerID, SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader
WHERE CustomerID NOT BETWEEN 25005 AND 25000;




-- Table Setup for Date/Time Example
CREATE TABLE #DateTimeExample(
 ID INT NOT NULL IDENTITY PRIMARY KEY,
 MyDate DATETIME2(0) NOT NULL,
 MyValue VARCHAR(25) NOT NULL
);
GO
INSERT INTO #DateTimeExample
 (MyDate,MyValue)
VALUES ('2009-01-02 10:30','Bike'),
 ('2009-01-03 13:00','Trike'),
 ('2009-01-03 13:10','Bell'),
 ('2009-01-03 17:35','Seat');

--1 (Doen't return anything, it has to do with the DATETIME2(0) type)
SELECT ID, MyDate, MyValue
FROM #DateTimeExample
WHERE MyDate = '2009-01-03';
--2
SELECT ID, MyDate, MyValue
FROM #DateTimeExample
WHERE MyDate BETWEEN '2009-01-03 00:00:00' AND '2009-01-03 23:59:59';





-- How to Use AND and OR
--1
SELECT BusinessEntityID, FirstName, MiddleName, LastName
FROM Person.Person
WHERE FirstName = 'Ken' AND LastName = 'Myer';
--2
SELECT BusinessEntityID, FirstName, MiddleName, LastName
FROM Person.Person
WHERE LastName = 'Myer' OR LastName = 'Meyer';




-- Delete a table if it is not empty
IF OBJECT_ID('tempdb..#DateTimeExample') IS NOT NULL BEGIN
 DROP TABLE #DateTimeExample;
END;
GO

-- Create a new table again 
CREATE TABLE #DateTimeExample(
 ID INT NOT NULL IDENTITY PRIMARY KEY,
 MyDate DATETIME2(0) NOT NULL,
 MyValue VARCHAR(25) NOT NULL
);
GO

INSERT #DateTimeExample (MyDate, MyValue)
VALUES ('2009-01-01 10:30','Bike'),
 ('2009-01-01 11:30','Bike'),
 ('2009-01-02 13:00','Trike'),
 ('2009-01-03 13:10','Bell'),
 ('2009-01-03 17:35','Seat'),
 ('2009-01-04 00:00','Bike');
--4
SELECT ID, MyDate, MyValue
FROM #DateTimeExample
WHERE MyDate >= '2009-01-02' AND MyDate < '2009-01-04';







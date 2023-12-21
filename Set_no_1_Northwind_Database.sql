--12/ We are looking for information about products sold in bottles (bottle)

SELECT ProductID, ProductName, QuantityPerUnit
FROM Products
WHERE QuantityPerUnit LIKE '%bottle%';

--13/ Search for job information for employees whose surnames begin with a letter B through L.

SELECT EmployeeID, FirstName, LastName, Title
FROM Employees
WHERE LastName BETWEEN 'B' AND 'L';

--14/ Find job information for employees that start with B or L

SELECT EmployeeID, FirstName, LastName, Title
FROM Employees
WHERE LastName LIKE 'B%' OR LastName LIKE 'L%';

--15/ Find category names that contain a comma in the description

SELECT CategoryID, CategoryName, Description
FROM Categories
WHERE Description LIKE '%,%';

--16/ Find customers that have .Store somewhere in their name.

SELECT CustomerID, CompanyName, ContactName
FROM Customers
WHERE CompanyName LIKE '%.Store%';

--17/ We are looking for information about products with prices less than 10 or greater than 20

SELECT ProductID, ProductName, UnitPrice
FROM Products
WHERE UnitPrice < 10 OR UnitPrice > 20;

--18/ Write a select statement to select the order number, order date, customer number for all unrealized orders for which the recipient's country is Argentina - (GETDATE)

SELECT OrderID, OrderDate, CustomerID
FROM Orders
WHERE OrderDate > GETDATE() AND ShipCountry = 'Argentina';

--19/ Select the names and countries of all customers, sort the results by country, within a given country, sort company names alphabetically

SELECT CustomerID, CompanyName, ContactName, Country
FROM Customers
ORDER BY Country, CompanyName;

--20/ Select information about products (group, name, price), sort products by groups and in groups descending by price

SELECT CategoryName AS [Group], ProductName AS [Name], UnitPrice AS [Price]
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
ORDER BY CategoryName, UnitPrice DESC;

--21/ Select the names and countries of all clients based in Japan or Italy , sort the results by country, within a given .
country sort company names alphabetically

SELECT CustomerID, CompanyName, ContactName, Country
FROM Customers
WHERE Country IN ('Japan', 'Italy')
ORDER BY Country, CompanyName;

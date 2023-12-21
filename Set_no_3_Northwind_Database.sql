--1/  Write a command returning the names of the products and the companies providing them (so that products without suppliers and suppliers without products do not show up in the output).

      --RESP
      SELECT Products.ProductName, Suppliers.CompanyName
      FROM Products
      INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;

--2/ Write a command that returns as a result the names of customers who placed orders after March 1, 1998

      --RESP
	  SELECT DISTINCT Customers.ContactName
      FROM Customers
      JOIN Orders ON Customers.CustomerID = Orders.CustomerID
      WHERE Orders.OrderDate > '1998-03-01';


--3/ Write a command that returns all customers with order dates.

     --RESP
	 SELECT  Customers.ContactName, Orders.OrderDate
     FROM Customers
     LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
	 
	 
--4/ Select the names and prices of products with a unit price between 20.00 and 30.00, provide the supplier's address details for each product.

     --RESP
	 SELECT Products.ProductName, Products.UnitPrice, Suppliers.Address
     FROM Products
     JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
     WHERE Products.UnitPrice BETWEEN 20.00 AND 30.00;

--5/ Select the names of the products and info. on the inventory for products supplied by Tokyo Traders.

     --RESP
	 SELECT Products.ProductName, Products.UnitsInStock, Products.ReorderLevel
     FROM Products
     JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
     WHERE Suppliers.CompanyName = 'Tokyo Traders';
	 

--6/ Select the names and phone numbers of suppliers who are delivering products that are currently out of stock.

     --RESP
	 SELECT DISTINCT Suppliers.SupplierName, Suppliers.Phone
     FROM Suppliers
     JOIN Products ON Suppliers.SupplierID = Products.SupplierID
     JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
     JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
     WHERE Products.UnitsInStock = 0;

	 
--7/ Write the command that returns the list of products ordered on 1996-07-08.

     --RESP
	 SELECT Products.ProductName, OrderDetails.Quantity
     FROM Products
     JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
     JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
     WHERE Orders.OrderDate = '1996-07-08';

	 
--8/ Select the names and prices of products with a unit price between 20.00 and 30.00, provide the supplier's address details for each product, we are only interested in products from the Meat / Poultry category.

     --RESP
	  SELECT Products.ProductName, Products.UnitPrice, Suppliers.Address
      FROM Products
      JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
      JOIN Categories ON Products.CategoryID = Categories.CategoryID
      WHERE Products.UnitPrice BETWEEN 20.00 AND 30.00
      AND Categories.CategoryName = 'Meat/Poultry';
 
--9/ Select product names and prices from the Confections category and enter a vendor name for each product.

     --RESP
	 SELECT Products.ProductName, Products.UnitPrice, Suppliers.SupplierName
     FROM Products
     JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
     JOIN Categories ON Products.CategoryID = Categories.CategoryID
     WHERE Categories.CategoryName = 'Confections';

--10/ Select the names and phone numbers of the customers who were shipped by United Package in 1997.

     --RESP
	 SELECT DISTINCT Customers.ContactName, Customers.Phone
     FROM Customers
     JOIN Orders ON Customers.CustomerID = Orders.CustomerID
     JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
     WHERE Shippers.ShipperName = 'United Package' AND YEAR(Orders.ShippedDate) = 1997;

--11/ Select the names and phone numbers of customers who purchased products from the Confections category.

     --RESP
	 SELECT DISTINCT Customers.ContactName, Customers.Phone
     FROM Customers
     JOIN Orders ON Customers.CustomerID = Orders.CustomerID 
     JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
     JOIN Products ON OrderDetails.ProductID = Products.ProductID
     JOIN Categories ON Products.CategoryID = Categories.CategoryID
     WHERE Categories.CategoryName = 'Confections';


--12/ Write an instruction that shows pairs of employees occupying the same position

     --RESP
	 SELECT A.EmployeeID AS Employee1ID, A.FirstName AS Employee1FirstName, A.LastName AS Employee1LastName,
       B.EmployeeID AS Employee2ID, B.FirstName AS Employee2FirstName, B.LastName AS Employee2LastName,
       A.Title
FROM Employees A
JOIN Employees B ON A.Title = B.Title AND A.EmployeeID < B.EmployeeID;

	 
--13/ Write a command that displays the employees and their subordinates

     --RESP
	 WITH EmployeeHierarchy AS (
    SELECT EmployeeID, LastName, FirstName, ReportsTo
    FROM Employees
    WHERE ReportsTo IS NULL -- Select top-level employees (those who don't report to anyone)
    
    UNION ALL
    
    SELECT e.EmployeeID, e.LastName, e.FirstName, e.ReportsTo
    FROM Employees e
    INNER JOIN EmployeeHierarchy eh ON e.ReportsTo = eh.EmployeeID
)

SELECT *
FROM EmployeeHierarchy
ORDER BY COALESCE(ReportsTo, EmployeeID), EmployeeID;

	 
--14/ Write a command that displays employees who have no subordinates

     --RESP
	 SELECT *
FROM Employees
WHERE EmployeeID NOT IN (SELECT DISTINCT ReportsTo FROM Employees WHERE ReportsTo IS NOT NULL);




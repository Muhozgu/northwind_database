--8/ Write a command that returns the order information from the order details array. The inquiry is to group and display the ID of each product and then calculate the overall quantity ordered. The total quantity is summed with the SUM aggregate function and displayed as one value for each product.

SELECT ProductID, SUM(Quantity) AS TotalQuantityOrdered
FROM OrderDetails
GROUP BY ProductID;

--9/ Enter the maximum price of the ordered product for each order

SELECT OrderID, MAX(UnitPrice) AS MaxOrderPrice
FROM OrderDetails
GROUP BY OrderID;

--10/ Sort orders by maximum product price

SELECT OrderID, MAX(UnitPrice) AS MaxOrderPrice
FROM OrderDetails
GROUP BY OrderID
ORDER BY MaxOrderPrice DESC;

--11/ Enter the maximum and minimum price of the ordered product for each order

SELECT OrderID, MAX(UnitPrice) AS MaxOrderPrice, MIN(UnitPrice) AS MinOrderPrice
FROM OrderDetails
GROUP BY OrderID;

--12/ Enter the number of orders delivered by each shipper

SELECT ShipperID, COUNT(*) AS NumberOfOrders
FROM Orders
GROUP BY ShipperID;

--13/ Which of the forwarders was the most active in 1997

SELECT ShipperID, COUNT(*) AS NumberOfOrders
FROM Orders
WHERE YEAR(OrderDate) = 1997
GROUP BY ShipperID
ORDER BY NumberOfOrders DESC
LIMIT 1;

--14/ Display the orders for which the number of order items is greater than 5.

SELECT OrderID, COUNT(*) AS NumberOfOrderItems
FROM OrderDetails
GROUP BY OrderID
HAVING COUNT(*) > 5;

--15/ Display customers for whom more than 8 orders were completed in 1998 (sort results in descending order by the total amount for delivery of orders for each customer

SELECT 
    C.CustomerID,
    C.CompanyName,
    COUNT(O.OrderID) AS NumberOfOrders,
    SUM(OD.Quantity * OD.UnitPrice) AS TotalAmount
FROM 
    Customers C
JOIN 
    Orders O ON C.CustomerID = O.CustomerID
JOIN 
    OrderDetails OD ON O.OrderID = OD.OrderID
WHERE 
    YEAR(O.OrderDate) = 1998
GROUP BY 
    C.CustomerID, C.CompanyName
HAVING 
    COUNT(O.OrderID) > 8
ORDER BY 
    TotalAmount DESC;

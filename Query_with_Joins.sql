-- Retrieve customer orders
SELECT c.CompanyName, o.SalesOrderID, o.TotalDue
FROM SalesLT.Customer AS c
INNER JOIN SalesLT.SalesOrderHeader AS o
    ON c.CustomerID = o.CustomerID;

-- Retrieve customer orders with addresses
SELECT c.CompanyName, a.AddressLine1, ISNULL(a.AddressLine2,'') AS AddressLine2, a.City, a.StateProvince, a.PostalCode, a.CountryRegion, o.SalesOrderID, o.TotalDue
FROM SalesLT.Customer AS c
INNER JOIN SalesLT.SalesOrderHeader AS o
    ON c.CustomerID = o.CustomerID
INNER JOIN SalesLT.CustomerAddress AS ca
    ON c.CustomerID = ca.CustomerID
INNER JOIN SalesLT.Address AS a 
    ON ca.AddressID = a.AddressID
WHERE ca.AddressType = 'Main Office';

-- Retrieve a list of all customers and their orders
SELECT c.CompanyName, c.FirstName + ' ' + c.LastName AS Contacts, oh.SalesOrderID, oh.TotalDue
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.SalesOrderHeader AS oh
    ON c.CustomerID = oh.CustomerID
ORDER BY oh.SalesOrderID DESC;

-- Retrieve a list of customers with no address
SELECT c.CustomerID, c.CompanyName, c.FirstName + ' ' + c.LastName AS ContactName, c.Phone
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.CustomerAddress AS ca 
    ON c.CustomerID = ca.CustomerID
WHERE ca.AddressID IS NULL;

-- Retrieve product information by category
SELECT par.Name AS ParentCategoryName, sub.Name AS SubCategoryName, pr.Name
FROM SalesLT.ProductCategory AS par
JOIN SalesLT.ProductCategory AS sub
    ON par.ProductCategoryID = sub.ParentProductCategoryID
JOIN SalesLT.Product AS pr 
    ON sub.ProductCategoryID = pr.ProductCategoryID
ORDER BY ParentCategoryName, SubCategoryName, pr.Name;


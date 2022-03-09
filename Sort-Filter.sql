-- Retrieve a list of cities
SELECT DISTINCT City, StateProvince
FROM SalesLT.Address
ORDER BY City;

-- Retrieve the heaviest products
SELECT TOP 10 PERCENT WITH TIES Name, Weight
FROM SalesLT.Product
ORDER BY Weight DESC;

-- Retrieve product details for product model 1
SELECT Name, Color, Size 
FROM SalesLT.Product
WHERE ProductModelID = 1;

-- Filter products by color and size
SELECT ProductNumber, Name
FROM SalesLT.Product
WHERE Color IN ('Black', 'Red', 'White')
AND Size IN ('S','M');

-- Filter products by product number
SELECT ProductNumber, Name, ListPrice
FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK-%';

-- Retrieve specific products by product number. any character other than R
SELECT ProductNumber, Name, ListPrice
FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK-[^R]%-[0-9][0-9]';

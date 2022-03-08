-- This script is exercise for Introduction to Transact-SQL

-- Retrieve customer details
SELECT * FROM SalesLT.Customer;

-- Retrieve customer name data
SELECT Title,FirstName,MiddleName,LastName,Suffix 
FROM SalesLT.Customer;

-- Retrieve customer names and phone numbers
SELECT SalesPerson, Title+' '+LastName AS CustomerName, Phone 
FROM SalesLT.Customer;

-- Retrieve a list of customer companies
SELECT CONVERT(varchar(5), CustomerID) + ': ' + CompanyName AS Companies
FROM SalesLT.Customer;

-- Retrieve a list of sales order revisions
SELECT SalesOrderNumber + ' (' + STR(RevisionNumber, 1) + ')' AS sales_order, CONVERT(nvarchar(30),OrderDate, 102) AS order_date
FROM SalesLT.SalesOrderHeader;

-- Retrieve customer contact names with middle names if known
SELECT FirstName + ' ' + ISNULL(MiddleName+ ' ', '') + LastName AS Customer_contact
FROM SalesLT.Customer;

-- Retrieve primary contact details
SELECT CustomerID, COALESCE(EmailAddress, Phone) AS PrimaryContact
FROM SalesLT.Customer;

-- Retrieve shipping status
SELECT SalesOrderID, OrderDate, 
    CASE 
        WHEN ShipDate IS NULL THEN 'Awaiting Shipment'
        ELSE 'Shipped'
    END AS ShippingStatus
FROM SalesLT.SalesOrderHeader;

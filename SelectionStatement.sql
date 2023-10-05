/*
This query shows how many products we have from each vendors, including our total cost and profits
It updates along with inventories changes
*/
USE Caps_Retail_Company;

SELECT Vendor_Name as [Vendor Name]
     , COUNT(Current_Stock_Level) as [Inventory Amount]
     , SUM(Wholesale_Price) as [Sum of Inventory Cost]
     , SUM(Retail_Price) as [Sum of Inventory Sale]
     , SUM(Retail_Price) - SUM(Wholesale_Price) as [Profits]
FROM Vendor v JOIN Product p
    ON v.VendorID = p.VendorID
    JOIN Inventory i
    ON p.ProductID = i.ProductID
GROUP BY Vendor_Name
ORDER BY [Inventory Amount] DESC;

/*
This query shows how many inventories of one color genre we have
It updates along with inventories changes
*/
USE Caps_Retail_Company;

SELECT ProductID
     , Product_Name
     , Color
     , Vendor_Name
FROM Product p JOIN Vendor v 
    ON p.VendorID = v.VendorID 
WHERE Color like '%Navy%'  -- this can be any general color
ORDER BY ProductID ASC;
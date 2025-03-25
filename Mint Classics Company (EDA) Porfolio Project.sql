-- Mint Classics Company (EDA) Project by Frakhodbek

-----------------------------------------------------------------------------
-- Section: Inventory Overview and Warehouse Utilization
-----------------------------------------------------------------------------

-- 1. Product Line Inventory Distribution by Warehouse
--
--   This query provides an overview of how product lines are distributed across different warehouses.
--   It helps identify which warehouses hold specific types of products and the total quantity of each product line in each warehouse.
--   Useful for understanding the overall inventory landscape.

SELECT
    p.productLine,
    SUM(p.quantityInStock) AS quantityInStock,
    w.warehouseCode,
    w.warehouseName
FROM
    products p
JOIN
    warehouses w ON p.warehouseCode = w.warehouseCode
GROUP BY
    p.productLine, w.warehouseCode, w.warehouseName
ORDER BY
    p.productLine;

-- 2. Underutilized Warehouse Identification
--
--   This query identifies warehouses with lower total inventory.
--   The goal is to find candidates for potential closure based on low storage utilization.
--   The total inventory is calculated for each warehouse and ordered from least to greatest.

SELECT
    w.warehouseCode,
    w.warehouseName,
    SUM(p.quantityInStock) AS totalInventory
FROM
    products p
JOIN
    warehouses w ON p.warehouseCode = w.warehouseCode
GROUP BY
    w.warehouseCode, w.warehouseName
ORDER BY
    totalInventory ASC;

-----------------------------------------------------------------------------
-- Section: Sales and Inventory Performance Analysis
-----------------------------------------------------------------------------

-- 3. Inventory Levels vs. Sales Comparison (Product Level)
--
--   This query compares inventory levels with sales data for each product.
--   It shows the total quantity sold and current inventory for each product.
--   Helps to understand product popularity and potential overstocking issues.

SELECT
    p.productCode,
    p.productName,
    SUM(od.quantityOrdered) AS totalSold,
    p.quantityInStock AS currentInventory
FROM
    products p
JOIN
    orderdetails od ON p.productCode = od.productCode
GROUP BY
    p.productCode, p.productName, p.quantityInStock
ORDER BY
    totalSold DESC;

-- 4. Identifying Slow-Moving or Non-Moving Products (Product Level)
--
--   This query identifies products with little to no sales, indicating slow-moving or obsolete inventory.
--   It filters out products with a total sales quantity of 0 or NULL.
--   This list is then ranked from higher volumes to small inventory volume which would support the closing out a whole area (low inventory- zero turnover).

SELECT
    p.productCode,
    p.productLine,
    SUM(od.quantityOrdered) AS totalSold,
    p.quantityInStock AS currentInventory,
    p.warehouseCode
FROM
    products p
LEFT JOIN
    orderdetails od ON p.productCode = od.productCode
GROUP BY
    p.productCode, p.productLine, p.quantityInStock, p.warehouseCode
HAVING
    totalSold IS NULL OR totalSold = 0
ORDER BY
    currentInventory DESC;

-- 5. Inventory Turnover Ratio Calculation (Product Line Level)
--
--   This query calculates the inventory turnover ratio, measuring how quickly inventory is sold and replaced.
--   The formula used is (Total Quantity Sold) / (Quantity in Stock). A lower ratio indicates slower inventory turnover.
--  Using Productline it supports to quickly determine a bigger impact, instead of using itemize products!
SELECT
    p.productLine,
    SUM(od.quantityOrdered) AS totalSold,
    p.quantityInStock AS currentInventory,
    ROUND(SUM(od.quantityOrdered) / p.quantityInStock, 2) AS inventoryTurnoverRatio
FROM
    products p
JOIN
    orderdetails od ON p.productCode = od.productCode
GROUP BY
    p.productCode, p.productline, p.quantityInStock
ORDER BY
    inventoryTurnoverRatio ASC;

-- 6. Products with High Inventory but Low Sales (Product Level)
--
--   This query focuses on identifying products where inventory is high, but sales are significantly lower.
--   The criterion used here is that sales should be less than 10% of the inventory.  Can filter inventory volume greater that 0 too!
--  Can filter inventory volume greater that 0 too

SELECT
    p.productCode,
    p.productName,
    p.quantityInStock AS currentInventory,
    SUM(od.quantityOrdered) AS totalSold
FROM
    products p
LEFT JOIN
    orderdetails od ON p.productCode = od.productCode
GROUP BY
    p.productCode, p.productName, p.quantityInStock
HAVING
    totalSold < p.quantityInStock * 0.1
ORDER BY
    currentInventory DESC;

-----------------------------------------------------------------------------
-- Section: Warehouse Consolidation Planning
-----------------------------------------------------------------------------

-- 7. Potential Inventory Consolidation for Warehouse Closure
--
--   This query aims to suggest potential warehouses to relocate inventory from underutilized locations.
--   It identifies the best potential move candidates!
--      and it would cause another business problem in moving to warehouses already near capacity of inventory
--      moving volume needs planning not as effective with near cap inventories volumes!

SELECT
    p.productCode,
    p.productName,
    p.quantityInStock,
    w.warehouseName,
    w2.warehouseName AS suggestedWarehouse
FROM
    products p
JOIN
    warehouses w ON p.warehouseCode = w.warehouseCode
JOIN
    warehouses w2 ON w2.warehouseCode <> w.warehouseCode
WHERE
    w.warehousePctCap < 50

ORDER BY
    p.quantityInStock DESC;

-----------------------------------------------------------------------------
-- Section: Storage Location Summaries
-----------------------------------------------------------------------------

-- 8. Product Sale per warehouse
--  Analyzing the number of each volume, not the quantity would make a better comparison when making this analysis

SELECT p.productCode, p.productName, SUM(od.quantityOrdered) AS totalSold
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productCode, p.productName
ORDER BY totalSold DESC;


-- 9. Inventory levels, it is measured for amount instead of volumetric measure. It would misguide your analysis to reduce a location to low product volumes and then relocate else!

SELECT warehouseCode, COUNT(productCode) AS numProducts, SUM(quantityInStock) AS totalInventory
FROM products
GROUP BY warehouseCode;

-- Thank you for exploring the Mint Classics Company EDA project. I hope you found our query documentation easy and follow to fully engage our report and data outcome!!

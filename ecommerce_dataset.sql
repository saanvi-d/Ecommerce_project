SELECT * FROM ecommerce_transactions.`ecommerce dataset`;

 -- Total Orders, Returns, and Return Rate
 SELECT 
    COUNT(*) AS total_orders,
    COUNT(CASE WHEN `shipped` = 0 THEN 1 END) AS returned_orders,
    ROUND(100.0 * COUNT(CASE WHEN `shipped` = 0 THEN 1 END) / COUNT(*), 2) AS return_rate
FROM ecommerce_transactions.`ecommerce dataset`;

-- Return Rate by Product Category
SELECT 
    `product`,
    COUNT(*) AS total_orders,
    COUNT(CASE WHEN `shipped` = 0 THEN 1 END) AS returned_orders,
    ROUND(100.0 * COUNT(CASE WHEN `shipped` = 0 THEN 1 END) / COUNT(*), 2) AS return_rate
FROM ecommerce_transactions.`ecommerce dataset`
GROUP BY `product`
ORDER BY return_rate DESC;

--  Distinct Product-wise Frequency of Return
SELECT DISTINCT 
    `product`
FROM ecommerce_transactions.`ecommerce dataset`
WHERE `shipped` = 0;
SELECT 
    `product`,
    COUNT(*) AS return_count
FROM ecommerce_transactions.`ecommerce dataset`
WHERE `shipped` = 0
GROUP BY `product`
ORDER BY return_count DESC;

--  Top 5 High-Return Products
SELECT 
    `product`,
    COUNT(*) AS total_orders,
    COUNT(CASE WHEN `shipped` = 1 THEN 0 END) AS returned_orders,
    ROUND(100.0 * COUNT(CASE WHEN `shipped` = 1 THEN 0 END) / COUNT(*), 2) AS return_rate
FROM ecommerce_transactions.`ecommerce dataset`
GROUP BY  `product`
HAVING COUNT(*) >= 5
ORDER BY return_rate DESC
LIMIT 5;

--  Return Rate by city
SELECT 
    `city`,
    COUNT(*) AS total_orders,
    COUNT(CASE WHEN `shipped` = 0 THEN 1 END) AS returned_orders,
    ROUND(100.0 * COUNT(CASE WHEN `shipped` = 0 THEN 1 END) / COUNT(*), 2) AS return_rate
FROM ecommerce_transactions.`ecommerce dataset`
GROUP BY `city`
ORDER BY return_rate DESC;

-- distinct paymentmethod used
SELECT DISTINCT `paymentmethod`
FROM  ecommerce_transactions.`ecommerce dataset`;
SELECT 
    `paymentmethod`,
    COUNT(*) AS usage_count
FROM  ecommerce_transactions.`ecommerce dataset`
GROUP BY `paymentmethod`
ORDER BY usage_count DESC;

-- names having discount greater than or equal to 10
SELECT `customername`,`discount(%)`
FROM  ecommerce_transactions.`ecommerce dataset`
WHERE `discount(%)` >= 10;

-- Return % distinct per product
SELECT 
    `product`,
    COUNT(*) AS total_orders,
    COUNT(CASE WHEN `shipped` = 0 THEN 1 END) AS returned_orders,
    ROUND(100.0 * COUNT(CASE WHEN `shipped` = 0 THEN 1 END) / COUNT(*), 2) AS return_percentage
FROM ecommerce_transactions.`ecommerce dataset`
GROUP BY `product`
ORDER BY return_percentage DESC

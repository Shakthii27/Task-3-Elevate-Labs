-- Query 1: Basic SELECT (First 10 Rows)
SELECT * 
FROM data
LIMIT 10;


-- Query 2: WHERE Filter (Quantity > 5)
SELECT *
FROM data
WHERE Quantity > 5;


-- Query 3: ORDER BY (Highest Unit Price Products)
SELECT *
FROM data
ORDER BY UnitPrice DESC
LIMIT 10;


-- Query 4: Total Revenue (SUM of Quantity * UnitPrice)
SELECT SUM(Quantity * UnitPrice) AS total_revenue
FROM data;


-- Query 5: Revenue by Country (GROUP BY)
SELECT Country,
       SUM(Quantity * UnitPrice) AS revenue
FROM data
GROUP BY Country
ORDER BY revenue DESC;


-- Query 6: Top Products by Revenue
SELECT Description,
       SUM(Quantity * UnitPrice) AS product_revenue
FROM data
GROUP BY Description
ORDER BY product_revenue DESC
LIMIT 10;


-- Query 7: Customers with Most Orders (COUNT)
SELECT CustomerID,
       COUNT(*) AS total_orders
FROM data
GROUP BY CustomerID
ORDER BY total_orders DESC
LIMIT 10;


-- Query 8: HAVING Clause (Customers Spending > 5000)
SELECT CustomerID,
       SUM(Quantity * UnitPrice) AS total_spent
FROM data
GROUP BY CustomerID
HAVING total_spent > 5000
ORDER BY total_spent DESC;


-- Query 9: Subquery (Customers Above Average Spending)
SELECT CustomerID,
       SUM(Quantity * UnitPrice) AS revenue
FROM data
GROUP BY CustomerID
HAVING revenue >
      (SELECT AVG(Quantity * UnitPrice) FROM data)
ORDER BY revenue DESC;


-- Query 10: Create View for Customer Revenue Summary
CREATE VIEW customer_revenue_summary AS
SELECT CustomerID,
       SUM(Quantity * UnitPrice) AS revenue
FROM data
GROUP BY CustomerID;


-- Query 11: View Output (Top 10 Customers by Revenue)
SELECT *
FROM customer_revenue_summary
WHERE CustomerID IS NOT NULL
ORDER BY revenue DESC
LIMIT 10;


-- Query 12: Handling NULL Values (Replace Missing CustomerID)
SELECT IFNULL(CustomerID, 'Unknown') AS customer,
       Country
FROM data
LIMIT 10;


-- Query 13: Index Creation for Optimization
CREATE INDEX idx_customer
ON data(CustomerID);

WITH 
t1 AS (
SELECT STRFTIME('%Y', i.InvoiceDate) AS year, 
c.CustomerId AS customer_id, 
SUM(i.Total) AS total
FROM Invoice i
JOIN Customer c
ON i.CustomerId = c.CustomerId
GROUP BY 1, 2
ORDER BY 1, 3 DESC),

t2 AS (
SELECT year AS year, MAX(total) AS total
FROM t1
GROUP BY 1)

SELECT t1.*
FROM t1
JOIN t2
ON t2.year = t1.year AND t2.total = t1.total
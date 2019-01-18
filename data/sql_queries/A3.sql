WITH
t1 AS (
SELECT ar.Name AS artist, SUM(il.UnitPrice*il.Quantity) AS total
FROM InvoiceLine il
JOIN Track t
ON il.TrackId = t.TrackId
JOIN Album a
ON t.AlbumId = a.AlbumId
JOIN Artist ar
ON a.ArtistId = ar.ArtistId
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5),

t2 AS (
SELECT c.CustomerId AS Customer, ar.Name AS artist, SUM(i.Total) AS total
FROM Customer c
JOIN Invoice i
ON i.CustomerId = c.CustomerId
JOIN InvoiceLine il
ON il.InvoiceId = i.InvoiceId
JOIN Track t
ON il.TrackId = t.TrackId
JOIN Album a
ON t.AlbumId = a.AlbumId
JOIN Artist ar
ON a.ArtistId = ar.ArtistId
WHERE ar.Name IN (SELECT artist FROM t1)
GROUP BY 1, 2
ORDER BY 1, 2)

SELECT Customer, SUM(total)
FROM t2
GROUP BY 1
ORDER BY 2 DESC

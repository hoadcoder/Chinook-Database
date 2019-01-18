SELECT c.Country AS country, a.Title AS album, SUM(il.Quantity) AS quantity
FROM Customer c
JOIN Invoice i
ON i.CustomerId = c.CustomerId
JOIN InvoiceLine il
ON il.InvoiceId = i.InvoiceId
JOIN Track t
ON il.TrackId = t.TrackId
JOIN Album a
ON t.AlbumId = a.AlbumId
WHERE t.MediaTypeId != 3 AND c.Country = 'Brazil'
GROUP BY 1, 2
ORDER BY 1, 3 DESC
LIMIT 3
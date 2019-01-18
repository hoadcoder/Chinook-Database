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
LIMIT 5
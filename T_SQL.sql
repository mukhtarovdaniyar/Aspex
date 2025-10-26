SELECT 
    b.Brand,
    SUM(ISNULL(rb.TotalPrice, 0)) AS TotalRevenue,
    SUM(ISNULL(sb.Price, 0)) AS TotalRepairCost,
    SUM(ISNULL(rb.TotalPrice, 0)) - SUM(ISNULL(sb.Price, 0)) AS Profit
FROM Bicycle b
LEFT JOIN RentBook rb ON b.Id = rb.BicycleId
LEFT JOIN ServiceBook sb ON b.Id = sb.BicycleId
GROUP BY b.Brand
ORDER BY Profit DESC;
--показывает,какие велосипеды самые выгодные — помогает решить,какие модели закупать больше.

SELECT 
    c.Country,
    COUNT(rb.Id) AS RentCount,
    SUM(rb.TotalPrice) AS TotalRevenue,
    AVG(rb.TotalPrice) AS AvgCheck
FROM Client c
JOIN RentBook rb ON c.Id = rb.ClientId
GROUP BY c.Country
ORDER BY TotalRevenue DESC;
--можно понять,где стоит больше рекламировать прокат или открывать новые точки аренды.

SELECT 
    s.Name,
    s.Position,
    COUNT(rb.Id) AS RentCount,
    SUM(rb.TotalPrice) AS TotalRevenue
FROM Staff s
LEFT JOIN RentBook rb ON s.Id = rb.StaffId
GROUP BY s.Name, s.Position
ORDER BY TotalRevenue DESC;
--можно использовать для KPI—кто из сотрудников работает эффективнее,а кто меньше приносит прибыли.

SELECT 
    b.Brand,
    AVG(rb.TotalPrice) AS AvgRentPrice,
    AVG(sb.Price) AS AvgRepairPrice
FROM Bicycle b
LEFT JOIN RentBook rb ON b.Id = rb.BicycleId
LEFT JOIN ServiceBook sb ON b.Id = sb.BicycleId
GROUP BY b.Brand
ORDER BY AvgRentPrice DESC;
--помогает определить,какие бренды приносят больше прибыли, а какие требуют дорогого обслуживания.

SELECT TOP 5
    b.Brand AS BicycleName,
    b.Status,
    SUM(r.TotalPrice) AS TotalRevenue,
    AVG(b.RentPrice) AS AvgRentPrice
FROM Bicycle b
JOIN RentBook r ON b.Id = r.BicycleId
GROUP BY b.Brand, b.Status
ORDER BY TotalRevenue DESC;
-- Топ-5 самых прибыльных велосипедов

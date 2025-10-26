--1

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

--Output:

Brand                    | TotalRevenue | TotalRepairCost | Profit
-----------------------------------------------------------------
Polygon Xtrada 6         | 279000       | 190000          | 89000
Norco Storm              | 256000       | 180000          | 76000
Scott Scale 970          | 187000       | 180000          | 7000
Merida Big Nine          | 162000       | 180000          | -18000
Specialized Rockhopper   | 174000       | 185000          | -11000
Giant Talon 2            | 13500        | 15000           | -1500
Marin 7                  | 10000        | 12000           | -2000
Fuji Nevada 1.9          | 216000       | 260000          | -44000
Author Basic             | 175000       | 224000          | -49000
Stels Navigator          | 176000       | 270000          | -94000
Format A-Matrix          | 110000       | 209000          | -99000
Format 1414              | 150000       | 250000          | -100000
Forward Apache           | 174000       | 280000          | -106000
Ideal Aspect 960         | 155000       | 280000          | -125000
Cannondale Trail 7       | 55000        | 180000          | -125000
Giant ATX                | 13250        | 31000           | -17750
Trek Spider 30           | 48000        | 230000          | -182000
Cube Attention           | 8550         | 30000           | -21450


--2

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

--Output:

Country      | RentCount | TotalRevenue | AvgCheck
---------------------------------------------------
Kazakhstan   | 13        | 196250.00    | 15096.153846
Russia       | 4         | 55500.00     | 13875.000000
USA          | 3         | 50450.00     | 16816.666666



--3

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

--Output:

Name       | Position     | RentCount | TotalRevenue
----------------------------------------------------
Ezat       | Mechanic     | 6         | 112200.00
Nurlan     | Mechanic     | 5         | 81000.00
Aman       | Mechanic     | 4         | 55450.00
Mirga      | Mechanic     | 2         | 29000.00
Arsen      | Mechanic     | 1         | 25450.00
Quinai     | Administrator| 0         | NULL
Gulnaz     | Administrator| 0         | NULL
Dina       | Cashier      | 0         | NULL
Samat      | Cleaner      | 0         | NULL
Yerlan     | Manager      | 0         | NULL
Timur      | Manager      | 0         | NULL
Adian      | Mechanic     | 0         | NULL
Aigerim    | Receptionist | 0         | NULL


--4

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

--Output:

Brand                  | AvgRentPrice | AvgRepairPrice
------------------------------------------------------
Polygon Xtrada 6        | 27900.000000 | 19000.000000
Norco Storm             | 26000.000000 | 21000.000000
Fuji Nevada 1.9         | 21600.000000 | 26100.000000
Merida Big Nine         | 20000.000000 | 15600.000000
Scott Scale 970         | 19000.000000 | 16000.000000
Specialized Rockhopper  | 18300.000000 | 27800.000000
Stels Navigator         | 17600.000000 | 28000.000000
Author Basic            | 17100.000000 | 24000.000000
Format 1414             | 15000.000000 | 25000.000000
GT Avalanche            | 15000.000000 | 17500.000000
Author A-Matrix         | 14000.000000 | 19000.000000
Giant Talon 2           | 13500.000000 | 21000.000000
Giant ATX               | 13500.000000 | 12000.000000
Trek Marlin 7           | 10500.000000 | 31000.000000
Forward Apache          |  8400.000000 | 18500.000000
Cube Attention          |  7000.000000 | 20000.000000
Cannondale Trail 7      |  5500.000000 | 20000.000000
Kellys Spider 30        |  4500.000000 | 23000.000000



--5

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

--Output:

BicycleName       | Status     | TotalRevenue | AvgRentPrice
-------------------------------------------------------------
Polygon Xtrada 6   | Available  | 27900.00      | 3100.000000
Norco Storm        | Available  | 26000.00      | 2600.000000
Fuji Nevada 1.9    | Available  | 21600.00      | 2700.000000
Merida Big Nine    | Rented     | 20800.00      | 2600.000000
Scott Scale 970    | Available  | 20300.00      | 2900.000000

CREATE PROCEDURE LoadEmployeeBonusMart
AS
BEGIN

    -- Удаляем старые данные, чтобы не было дублей
    DELETE FROM EmployeeBonusMart;

    -- Вставляем новые данные
    INSERT INTO EmployeeBonusMart ([Year], [Month],[StaffId],[StaffName],[BonusAmount])
    SELECT 
        YEAR(GETDATE()) AS [Year],          -- текущий год
        MONTH(GETDATE()) AS [Month],        -- текущий месяц
        s.Id AS StaffId,
        s.Name AS StaffName,

        -- считаем премию по формуле X=(P1*X1+P2*X2)*X0
        (
            (
                ISNULL(SUM(r.TotalPrice)*0.3,0) +   -- 30% от аренды
                ISNULL(SUM(sb.Price)*0.8,0)         -- 80% от ремонта
            ) *
            CASE 
                WHEN DATEDIFF(YEAR, s.[Date], GETDATE())<1 THEN 0.05  --стаж<1 года→5%
                WHEN DATEDIFF(YEAR, s.[Date], GETDATE())<2 THEN 0.10  --от 1 до 2 лет→10%
                ELSE 0.15                                               --больше 2 лет→15%
            END
        ) AS BonusAmount
    FROM Staff s
    LEFT JOIN RentBook r ON s.Id=r.StaffId
    LEFT JOIN ServiceBook sb ON s.Id=sb.StaffId
    GROUP BY s.Id,s.Name,s.[Date];
END;

-- Изменяем таблицу Bicycle
-- меняем тип цены на decimal, чтобы можно было указывать копейки
ALTER TABLE Bicycle
ALTER COLUMN RentPrice DECIMAL(10,2) NOT NULL;

-- добавляем статус велосипеда
ALTER TABLE Bicycle
ADD Status VARCHAR(20) NOT NULL;

-- увеличиваем длину имени,10 мало
ALTER TABLE Client
ALTER COLUMN Name VARCHAR(50) NOT NULL;

-- Таблица Detail
-- цена с копейками
ALTER TABLE Detail
ALTER COLUMN Price DECIMAL(10,2) NOT NULL;

-- добавляем колонку количество
ALTER TABLE Detail
ADD Quantity INT NOT NULL;

-- Таблица Staff
-- увеличиваем длину имени
ALTER TABLE Staff
ALTER COLUMN Name VARCHAR(50) NOT NULL;

-- добавляем должность и зарплату
ALTER TABLE Staff
ADD Position VARCHAR(50) NOT NULL;

ALTER TABLE Staff
ADD Salary DECIMAL(10,2) NULL;

-- Таблица ServiceBook
-- добавляем id,чтобы каждая запись имела свой номер
ALTER TABLE ServiceBook
ADD Id INT IDENTITY(1,1) PRIMARY KEY;

-- цена работы в decimal
ALTER TABLE ServiceBook
ALTER COLUMN Price DECIMAL(10,2) NOT NULL;

-- добавляем колонку общей суммы аренды
ALTER TABLE RentBook
ADD TotalPrice DECIMAL(10,2) NULL; 

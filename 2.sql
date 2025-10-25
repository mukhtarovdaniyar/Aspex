--lal lala
SELECT TOP (1000) [Id]
      ,[Name]
      ,[Passport]
      ,[Phone number]
      ,[Country]
      ,[ClientLevel]
  FROM [msdb].[dbo].[Client]
+----+----------+-------------+----------------+-----------+-------------+
| Id | Name     | Passport    | Phone number   | Country   | ClientLevel |
+----+----------+-------------+----------------+-----------+-------------+
| 1  | Dancho   | KZ010122334 | +77011223344   | Kazakhstan| VIP         |
| 2  | Aidos    | KZ6543219   | +77015556677   | Kazakhstan| Regular     |
| 3  | Timur    | KZ0742567890| +77042567890   | Kazakhstan| Regular     |
| 4  | Yerun    | KZ9876543   | +77031321321   | Kazakhstan| Regular     |
| 5  | Askar    | RU854432    | +79097776655   | Russia    | Regular     |
| 6  | Chen     | CN9238475   | +18156667777   | USA       | VIP         |
| 7  | Li       | CN2387456   | +861391234567  | China     | New         |
| 8  | Amir     | KZ9988774   | +77019998877   | Kazakhstan| Regular     |
| 9  | Alina    | UA877712345 | +380671234567  | Ukraine   | New         |
| 10 | Murat    | TR8899775   | +905551234567  | Turkey    | Regular     |
| 11 | Dana     | KZ2233446   | +77022334455   | Kazakhstan| VIP         |
| 12 | Nurlan   | KZ4455667   | +77034445566   | Kazakhstan| Regular     |
+----+----------+-------------+----------------+-----------+-------------+
(12 rows affected)

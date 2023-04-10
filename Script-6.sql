
--Создать столбец "NULL" так, чтобы получить значение NULL
--если аэропорт прибытия - SVO из 
--Представления Routes.

SELECT 
      r.arrival_airport 
      ,NULLIF(arrival_airport , 'SVO') AS "NULL"
FROM demo.bookings.routes AS r
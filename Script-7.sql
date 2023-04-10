-- Сортировка дальности полета по убыванию из 
--Представления Aircrafts.
SELECT 
		a.range  
FROM demo.bookings.aircrafts a 
ORDER BY a.range DESC 
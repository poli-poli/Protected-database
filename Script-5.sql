--Показать временные зоны, для городов
--Хабаровск, 
--Владивосток из
--Представления airports;
SELECT 
      a.timezone  
FROM demo.bookings.airports a 
WHERE city 
IN ('Хабаровск', 'Владивосток');
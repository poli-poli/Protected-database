--Показать поля city и timezone из 
--Представления Airports, 
--где города в названии содержат сочетание "ск";
SELECT 
      a.city 
    , a.timezone 
FROM demo.bookings.airports a 
WHERE city LIKE '%ск%';


--Показать поля city и timezone из 
--Представления Airports, 
--где города в названии содержат 8 символов.
SELECT 
      a.city 
    , a.timezone 
FROM demo.bookings.airports a 
WHERE city LIKE '________';

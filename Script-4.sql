--Показать рейсы с актуальным прибытием из
--Представления Flights.
SELECT 
      f.flight_no
FROM demo.bookings.flights f
WHERE f.actual_arrival IS NOT NULL ;
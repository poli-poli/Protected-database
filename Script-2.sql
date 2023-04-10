---Показать полe seat_no из 
--Представления boarding_passes, 
--где посадочный номер между 40 и 60;
SELECT 
      b.seat_no 
FROM demo.bookings.boarding_passes b
WHERE "boarding_no" BETWEEN 40 AND 60;
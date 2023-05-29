-- SCRIPT 1
-- Вывести всех клиентов, кроме клиентов 
-- из страны "Germany"
SELECT *
FROM clients
EXCEPT
SELECT *
FROM clients
WHERE country = 'Germany';

-- SCRIPT 2
-- Объединить накладные и клиентов
SELECT c.country, c.name, c.sale, n.time_sale, n.summ, n.seller, n.check_code
FROM clients c
FULL OUTER JOIN nakladnye n ON c.client_code = n.check_code;

-- SCRIPT 3
-- Показать клиентов и соответствующие им накладные, если они есть
SELECT c.name, n.check_code
FROM clients c
LEFT OUTER JOIN nakladnye n ON c.client_code = n.check_code;

-- SCRIPT 4
-- Показать накладные и соответствующих им клиентов, если они есть
SELECT c.name, n.check_code
FROM clients c
RIGHT OUTER JOIN nakladnye n ON c.client_code = n.check_code;

-- SCRIPT 5
-- Показать клиентов из Германии с sale > 2
SELECT client_code, country, name, sale
FROM clients
WHERE country = 'Germany'
INTERSECT
SELECT client_code, country, name, sale
FROM clients
WHERE sale > 2

-- SCRIPT 6
-- Показать клиентов из Германии 
-- и клиентов с sale > 2
SELECT client_code, country, name, sale
FROM clients
WHERE country = 'Germany'
UNION
SELECT client_code, country, name, sale
FROM clients
WHERE sale > 2

-- SCRIPT 7
-- Объединить клиентов и накладные
SELECT c.client_code, c.country, c.name, c.sale, n.time_sale
FROM clients c
INNER JOIN nakladnye n ON c.client_code = n.nakladnye_code;

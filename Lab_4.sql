-- SCRIPT 1
-- Вывести клиентов с покупками позднее 2023-01-01
SELECT c.client_code, c.country, c.name, c.sale
FROM clients c
WHERE c.client_code IN (
  SELECT client_code
  FROM nakladnye
  WHERE time_sale >= '2023-01-01'
);

-- SCRIPT 2
-- Вывести максимальное значение 
-- sale у клиентов из Германии
SELECT max(sales)
FROM (
	SELECT c.sale AS sales
	FROM clients AS c
	WHERE c.country = 'Germany') AS T;

-- SCRIPT 3
-- Есть ли в Германии клиент с sale = 2?
SELECT c.name
FROM clients AS c 
WHERE c.country = 'Germany' AND 
EXISTS
(
    SELECT *
    FROM clients AS c
    WHERE c.sale = 2
);
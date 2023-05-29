-- SCRIPT 1      
-- вывести страну и количество 
-- клиентов оттуда
SELECT country, COUNT(*) AS total_clients
FROM clients
GROUP BY country;


-- SCRIPT 2
-- Общее количество клиентов
SELECT COUNT(*) AS total_clients
FROM clients;


-- SCRIPT 3
-- Найти среднюю, максимальную 
-- и минимальную цену
SELECT MIN(sale) AS min_sale, 
       MAX(sale) AS max_sale, 
       AVG(sale) AS avg_sale
FROM clients;


-- SCRIPT 4
-- вывести страны, где 
-- средняя цена больше 100
SELECT country, AVG(sale) AS avg_sale
FROM clients
GROUP BY country
HAVING AVG(sale) > 100;


-- SCRIPT 5
-- Вывести клиентов и их ранг
SELECT name,
       RANK() OVER ()
FROM clients;


-- SCRIPT 6
-- ВЫвести все возможные 
-- комбинации клиента и страны
SELECT country, name
FROM clients
GROUP BY CUBE (country, name);
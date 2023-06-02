-- Создание Vendor
CREATE TABLE Vendor (
    id SERIAL PRIMARY KEY,
    country TEXT,
    article INT,
    name TEXT 
);
-- Создание Warehouse
CREATE TABLE Warehouse (
    id SERIAL PRIMARY KEY,
    name TEXT,
    quantity INT,
    vendor_id INT,
    FOREIGN KEY (vendor_id) REFERENCES Vendor(id)
);
-- Создание Store
CREATE TABLE Store (
    id SERIAL PRIMARY KEY,
    name TEXT,
    phone TEXT, 
 	warehouse_id INT,
	FOREIGN KEY (warehouse_id) REFERENCES Warehouse(id)
);
-- Создание Client
CREATE TABLE Client (
    id SERIAL PRIMARY KEY,
    name TEXT,
    country TEXT,
    phone TEXT 
);
-- Создание Invoice
CREATE TABLE Invoice (
    id SERIAL PRIMARY KEY,
    date DATE,
    store_id INT,
    price MONEY,
    client_id INT,
    FOREIGN KEY (store_id) REFERENCES Store(id),
    FOREIGN KEY (client_id) REFERENCES Client(id)
);
-------------------------------------------------------------------------
-- Заполнение Vendor
INSERT INTO Vendor (country, article, name) VALUES
	('Russia', 12345, 'Поставщик 1'),
	('Germany', 54321, 'Поставщик 2');
-- Заполнение Warehouse
INSERT INTO Warehouse (name, quantity, vendor_id) VALUES
	('Склад 1', 100, 1),
	('Склад 2', 200, 2);
-- Заполнение Store
INSERT INTO Store (name, phone, warehouse_id) VALUES
	('Магазин 1', '123-456-7890', 1),
	('Магазин 2', '987-654-3210', 2),
	('Магазин 3', '555-555-5555', 1);
-- Заполнение Client
INSERT INTO Client (name, country, phone) VALUES
	('Petr Ivanov', 'Russia', '111-111-1111'),
	('Thomas Becker', 'Germany', '222-222-2222'),
	('Josh Smith', 'USA', '333-333-3333');
-- Заполнение Invoice
INSERT INTO Invoice (date, store_id, price, client_id) VALUES
	('2023-05-20', 1, 50.00, 1),
	('2023-05-21', 2, 75.00, 2),
	('2023-05-22', 1, 30.00, 3);
-------------------------------------------------------------------------
-- Создание представления
CREATE VIEW Vendor_Russia AS
SELECT *
FROM vendor 
WHERE country = 'Russia'
-- Вызов представления
SELECT *
FROM Vendor_Russia
-------------------------------------------------------------------------
-- Создание процедуры
CREATE OR REPLACE PROCEDURE GetClientsByCountry(IN country_param TEXT)
AS
$$
BEGIN
    PERFORM *
    FROM Client
    WHERE country = country_param;
END;
$$
LANGUAGE plpgsql;
-- Вызов процедуры
CALL GetClientsByCountry('Russia');
-------------------------------------------------------------------------
-- Создание функции
CREATE OR REPLACE FUNCTION CountVendorsByCountry(country_param TEXT) 
RETURNS INTEGER AS
$$
DECLARE
    vendor_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO vendor_count
    FROM vendor
    WHERE country = country_param;
    
    RETURN vendor_count;
END;
$$
LANGUAGE plpgsql;
-- Вызов функции
SELECT CountVendorsByCountry('Russia');
-------------------------------------------------------------------------
-- Создание функции для триггера
CREATE OR REPLACE FUNCTION DeleteInvoiceRow()
RETURNS TRIGGER AS
$$
BEGIN
    RAISE NOTICE 'Строка с id % была удалена из таблицы Invoice.', OLD.id;
    RETURN OLD;
END;
$$
LANGUAGE plpgsql;
-- Создание триггера
CREATE TRIGGER DeleteInvoiceTrigger
AFTER DELETE ON Invoice
FOR EACH ROW
EXECUTE FUNCTION DeleteInvoiceRow();
-- Вызов триггера
DELETE FROM invoice WHERE id=1

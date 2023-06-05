-- Создание таблицы clients
CREATE TABLE clients(
  client_code INT PRIMARY KEY,
  id INT,
  country VARCHAR(255),
  name VARCHAR(255),
  sale INT,
  FOREIGN KEY (client_code) REFERENCES nakladnye(nakladnye_code)
);

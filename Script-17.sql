-- Создание таблицы nakladnye
CREATE TABLE nakladnye (
  nakladnye_code INT PRIMARY KEY,
  time_sale DATE,
  summ MONEY,
  seller VARCHAR(255),
  check_code INT NOT null
  
);
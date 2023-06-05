-- Создание таблицы sklad
CREATE TABLE sklad(
  postavshik_code INT PRIMARY KEY,
  time_godn DATE,
  summ MONEY,
  articukul VARCHAR(255),
  num VARCHAR(255),
  shop_code INT,
  FOREIGN KEY (shop_code) REFERENCES shop(shop_code)
);

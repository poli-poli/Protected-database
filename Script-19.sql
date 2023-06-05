-- Создание таблицы shop
CREATE TABLE shop (
  shop_code INT PRIMARY KEY,
  av_check MONEY NOT NULL,
  nakladnye_code INT not null,
  FOREIGN KEY (nakladnye_code) REFERENCES nakladnye(nakladnye_code)
);

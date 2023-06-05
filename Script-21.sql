-- Создание таблицы postavshik
CREATE TABLE postavshik(
  id VARCHAR(255),
  articul VARCHAR(255),
  strana VARCHAR(255),
  postavshik_code INT NOT NULL,
  FOREIGN KEY (postavshik_code) REFERENCES sklad(postavshik_code)
);

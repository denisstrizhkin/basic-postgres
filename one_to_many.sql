-----------------------------------------------
-- Один ко многим (*один к одному) (One to many)
-----------------------------------------------

-- Родительская таблица (Parent table)

CREATE TABLE tmp_parent_1 (
  -- Первичный ключ он же сурогатный в данном случаее
  -- Всегда берем за первичный ключ один столбец
  -- численного типа
  id         integer     CONSTRAINT tmp_parent_1_pk PRIMARY KEY,

  -- Остальные поля, который не могут быть пустыми (из-за NOT NULL)
  first_name varchar(40) NOT NULL,
  last_name  varchar(40) NOT NULL,

  -- Пример уникального ограничения в данном случаее
  -- [ last_name, first_name ] является альтернативным/натуральным ключом
  CONSTRAINT tmp_parent_1_uq UNIQUE (first_name, last_name)
);

-- Дочерняя таблица (С внешним ключом) (Child table)

CREATE TABLE tmp_child_1 (
  -- Задаем ключ дочерней таблицы
  id        integer CONSTRAINT tmp_child_1_pk PRIMARY KEY,

  -- Задаем поле для внешнего ключа, его тип должен совпадать с 
  -- типом поля, на которое мы будем ссылаться
  parent_id integer;

  -- Задаем ограничение ссылки/референса он же внешний ключ (foreign key)
  -- выбираем таблицу, на которую ссылаемся (родительскую) и поле
  -- (или несколько полей) этой таблицы
  CONSTRAINT tmp_child_1_ref 
    FOREIGN KEY (parent_id)
    REFERENCES tmp_parent_1 (id)
);

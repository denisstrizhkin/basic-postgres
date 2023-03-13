----------------------------------
-- Многие ко многим (many to many)
----------------------------------

-- Удаляем эти таблицы если они уже есть
DROP TABLE tmp_person;
DROP TABLE tmp_project;
DROP TABLE tmp_person_to_project_assoc;

-- Таблица людей по аналогии из один ко многим
-- Есть первичный сурогатный ключ и другие поля
-- В данном случаее альтернативный/потенциальный ключ
CREATE TABLE tmp_person (
  id integer CONSTRAINT tmp_person_pk PRIMARY KEY,

  first_name varchar(40) NOT NULL,
  last_name  varchar(40) NOT NULL,

  CONSTRAINT tmp_person_uq UNIQUE (first_name, last_name)
);

-- Таблица проектов по аналогии
CREATE TABLE tmp_project (
  id integer CONSTRAINT tmp_project_pk PRIMARY KEY,

  project_name varchar(40) NOT NULL,

  CONSTRAINT tmp_project_uq UNIQUE (project_name)
);

-- Ассоциативная таблица для связи проектков и людей
-- в стиле многие ко многим
CREATE TABLE tmp_person_to_project_assoc (
  -- Поле для номера человека
  person_id integer,
  -- Поле для номера проекта
  project_id integer,

  -- Внешний ключ на таблицу людей
  CONSTRAINT tmp_person_to_project_assoc_ref_person
    FOREIGN KEY (person_id)
    REFERENCES tmp_person(id),

  -- Внешний ключ на таблицу проектов
  CONSTRAINT tmp_person_to_project_assoc_ref_project
    FOREIGN KEY (project_id)
    REFERENCES tmp_project(id),

  -- Первичный ключ ассоциативной таблцы
  -- состоит из пары [ persond_id, project_id ]
  CONSTRAINT tmp_person_to_project_assoc_pk
    PRIMARY KEY (person_id, project_id)
)

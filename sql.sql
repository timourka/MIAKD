-- Active: 1728559127076@@127.0.0.1@5432@miakd
-- Таблица брендов
CREATE TABLE brands (
    id SERIAL PRIMARY KEY,       -- Уникальный идентификатор бренда
    name VARCHAR(100) NOT NULL,  -- Название бренда
    country VARCHAR(50)          -- Страна происхождения бренда (опционально)
);

-- Таблица ноутбуков
CREATE TABLE laptops (
    id SERIAL PRIMARY KEY,       -- Уникальный идентификатор ноутбука
    model VARCHAR(100) NOT NULL, -- Модель ноутбука
    price DECIMAL(10, 2),        -- Цена ноутбука
    release_date DATE,           -- Дата выпуска ноутбука
    brand_id INT,                -- Внешний ключ на таблицу брендов
    CONSTRAINT fk_brand
        FOREIGN KEY (brand_id)
        REFERENCES brands (id)
        ON DELETE CASCADE        -- Удаление всех ноутбуков при удалении бренда
);


-- Вставка дополнительных данных в таблицу брендов
INSERT INTO brands (name, country)
VALUES ('Lenovo', 'China'),
       ('Asus', 'Taiwan'),
       ('Acer', 'Taiwan'),
       ('Microsoft', 'USA'),
       ('Samsung', 'South Korea'),
       ('MSI', 'Taiwan');

INSERT INTO laptops (model, price, release_date, brand_id) 
VALUES ('MacBook Air M1', 999.99, '2020-11-17', 1),
       ('MacBook Pro 14', 1999.99, '2021-10-25', 1),
       ('XPS 15', 1799.99, '2022-05-12', 2),
       ('Inspiron 15', 749.99, '2021-04-22', 2),
       ('Spectre x360', 1499.99, '2022-01-05', 3),
       ('Envy 13', 1199.99, '2021-07-14', 3),
       ('ThinkPad X1 Carbon', 1699.99, '2022-02-10', 4),
       ('IdeaPad 5', 799.99, '2021-10-02', 4),
       ('ZenBook 14', 999.99, '2021-12-01', 5),
       ('ROG Strix G15', 1599.99, '2022-03-10', 5),
       ('Aspire 5', 599.99, '2021-09-20', 6),
       ('Predator Helios 300', 1299.99, '2022-06-07', 6),
       ('Surface Laptop 4', 1299.99, '2021-04-27', 4),
       ('Surface Book 3', 2099.99, '2020-05-06', 4),
       ('Galaxy Book Pro 360', 1199.99, '2021-05-14', 5),
       ('Galaxy Book Ion', 1099.99, '2020-06-05', 5),
       ('MSI GF65 Thin', 1099.99, '2021-11-10', 6),
       ('MSI Stealth 15M', 1599.99, '2022-02-15', 6);

COPY (SELECT xmlelement(
name "laptops", xmlagg(
    xmlelement(
        name "laptop", 
        xmlforest(id AS "id", model AS "model", price AS "price", release_date AS "release_date", brand_id AS "brand_id")
        )
        )
        ) AS result_xml FROM laptops) 
        TO 'D:\MIAKD\laptops.xml';

COPY (SELECT xmlelement(
        name "brands", xmlagg(
            xmlelement(
                name "brand", 
                xmlforest(id AS "id", name AS "name", country AS "country")
                )
                )
                ) AS result_xml FROM brands) 
                TO 'D:\MIAKD\brands.xml';

CREATE INDEX idx_laptops_brand_id_hash ON laptops USING HASH (brand_id); -- Поиск по точному значению brand_id
CREATE INDEX idx_brands_name_hash ON brands USING HASH (name);
CREATE INDEX idx_laptops_price ON laptops USING BTREE (price);

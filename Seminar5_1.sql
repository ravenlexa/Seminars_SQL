-- 1. 

CREATE VIEW affordable_cars AS
SELECT * FROM cars
WHERE price <= 25000;

-- 2.

ALTER VIEW affordable_cars AS
SELECT * FROM cars
WHERE price <= 30000;

-- 3.

CREATE VIEW popular_brand_cars AS
SELECT * FROM cars
WHERE brand IN ('Шкода', 'Ауди');
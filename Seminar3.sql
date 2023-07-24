-- 1. Создание БД
CREATE DATABASE IF NOT EXISTS Seminar3; -- Создаем БД, если она не существует 

-- 2. Выбор БД
USE Seminar3;

-- 3. Создание таблицы с персоналом
DROP TABLE IF EXISTS staff; -- Удаляем таблицу, если она существует
CREATE TABLE staff
(
	id INT PRIMARY KEY AUTO_INCREMENT, 
    firstname VARCHAR(45),
    lastname VARCHAR(45),
    post VARCHAR(45),
    seniority INT, 
    salary DECIMAL (8,2), -- д-н: от - 999 999 до 999 999
    age INT
);

INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
 ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
 ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
 ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
 ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
 ('Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
 ('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
 ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
 ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
 ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
 ('Максим', 'Максимов', 'Рабочий', 2, 11000, 22),
 ('Юрий', 'Галкин', 'Рабочий', 3, 12000, 24),
 ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
 
SELECT *
FROM staff; -- выводим все данные из таблицы

-- Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания
SELECT * FROM staff
ORDER BY salary DESC;  -- сортировка в порядке убывания

SELECT * FROM staff 
ORDER BY salary; -- сортировка в порядке возрастания

-- Выведите 5 максимальных заработных плат (saraly).
SELECT * FROM staff
ORDER BY salary DESC
LIMIT 5; 

-- Посчитайте суммарную зарплату (salary) по каждой специальности (роst).
SELECT post, SUM(salary) FROM staff
GROUP BY post;

-- Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 25 до 49 лет включительно.
SELECT post, COUNT(lastname) AS "Количество сот-ов" FROM staff
WHERE (age BETWEEN 25 AND 49) AND post = 'Рабочий';

-- Найдите количество специальностей.
SELECT post, COUNT(post) AS "Кол-во специальностей"
FROM staff
GROUP BY post;

-- Выведите специальности, у которых средний возраст сотрудников меньше 30 лет.
SELECT post, AVG(age) FROM staff
GROUP BY post
HAVING AVG(age) < 30;
-- 1. Создание таблицы "sales" и заполнение ее данными:

CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2)
);

INSERT INTO sales (product, quantity, price)
VALUES
('prod1', 25, 10.50),
('prod2', 80, 23.00),
('prod3', 150, 15.75),
('prod4', 225, 9.99),
('prod5', 600, 55.00),
('prod6', 420, 17.50);
SELECT * FROM  sales;

-- 2. Группировка значений количества в 3 сегмента:

SELECT 
    CASE 
        WHEN quantity < 100 THEN 'less than 100' 
        WHEN quantity BETWEEN 100 AND 300 THEN '100-300' 
        ELSE 'more than 300' 
    END AS quantity_segment,
    COUNT(*) AS quantity_count
FROM 
    sales
GROUP BY 
    quantity_segment;

-- 3. Создание таблицы "orders" и заполнение ее данными:
DROP TABLE IF EXISTS orders ;
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer VARCHAR(50),
    product VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    order_date DATE
);


INSERT INTO orders (customer, product, quantity, price, order_date)
VALUES
('customer1', 'product1', 10, 10.50, '2021-01-01'),
('customer1', 'product2', 20, 23.00, '2021-01-02'),
('customer2', 'product1', 15, 10.50, '2021-01-03'),
('customer2', 'product5', 50, 55.00, '2021-01-04'),
('customer3', 'product6', 10, 17.50, '2021-01-05'),
('customer3', 'product3', 100, 15.75, '2021-01-06');

SELECT * FROM  orders;

-- 4. Получение "полного" статуса заказа:

SELECT 
    id, 
    customer, 
    product, 
    quantity, 
    price, 
    order_date,
    CASE 
        WHEN quantity > 0 AND price > 0 THEN 'Fully Paid' 
        WHEN quantity > 0 AND price = 0 THEN 'Partially Paid' 
        ELSE 'Unpaid' 
    END AS order_status
FROM 
    orders;
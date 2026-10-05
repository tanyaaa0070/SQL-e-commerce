CREATE DATABASE ecommerce;

USE ecommerce;

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address VARCHAR(255)
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2),
    status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO users (name, email, phone, address)
VALUES
('Tanya Singh', 'tanya@gmail.com', '9876543210', 'Bangalore'),
('Rahul Sharma', 'rahul@gmail.com', '9876543211', 'Delhi'),
('Priya Verma', 'priya@gmail.com', '9876543212', 'Mumbai'),
('Amit Kumar', 'amit@gmail.com', '9876543213', 'Chennai'),
('Sneha Reddy', 'sneha@gmail.com', '9876543214', 'Hyderabad');

INSERT INTO categories (category_name)
VALUES
('Electronics'),
('Clothing'),
('Books'),
('Home Appliances'),
('Sports');

INSERT INTO products (product_name, price, stock, category_id)
VALUES
('Laptop', 55000.00, 10, 1),
('Wireless Mouse', 800.00, 50, 1),
('Keyboard', 1500.00, 30, 1),
('T-Shirt', 999.00, 40, 2),
('Jeans', 1999.00, 25, 2),
('Python Programming Book', 600.00, 20, 3),
('Data Science Book', 750.00, 15, 3),
('Mixer Grinder', 3500.00, 12, 4),
('Smart Watch', 2500.00, 18, 1),
('Football', 1200.00, 20, 5);

INSERT INTO orders (user_id, total_amount, status)
VALUES
(1, 55800.00, 'Confirmed'),
(2, 999.00, 'Pending'),
(3, 2750.00, 'Confirmed'),
(4, 4100.00, 'Shipped'),
(5, 600.00, 'Delivered');

INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES
(1, 1, 1, 55000.00),
(1, 2, 1, 800.00),
(2, 4, 1, 999.00),
(3, 5, 1, 1999.00),
(3, 10, 1, 1200.00),
(4, 8, 1, 3500.00),
(4, 2, 1, 600.00),
(5, 6, 1, 600.00);

INSERT INTO payments (order_id, amount, payment_method, payment_status)
VALUES
(1, 55800.00, 'UPI', 'Success'),
(2, 999.00, 'Credit Card', 'Pending'),
(3, 2750.00, 'Debit Card', 'Success'),
(4, 4100.00, 'UPI', 'Success'),
(5, 600.00, 'Cash on Delivery', 'Success');

SELECT * FROM users;

SELECT * FROM categories;

SELECT * FROM products;

SELECT * FROM orders;

SELECT * FROM payments;

SELECT *
FROM products
WHERE price > 1000;

SELECT *
FROM products
WHERE price < 2000;

SELECT *
FROM products
ORDER BY price DESC;

SELECT *
FROM products
ORDER BY price DESC
LIMIT 1;

SELECT *
FROM products
ORDER BY price ASC
LIMIT 1;

SELECT *
FROM products
WHERE stock < 20;

SELECT
    p.product_id,
    p.product_name,
    p.price,
    p.stock,
    c.category_name
FROM products p
JOIN categories c
ON p.category_id = c.category_id;

SELECT
    o.order_id,
    u.name,
    u.email,
    o.order_date,
    o.total_amount,
    o.status
FROM orders o
JOIN users u
ON o.user_id = u.user_id;

SELECT
    o.order_id,
    u.name AS customer_name,
    p.product_name,
    oi.quantity,
    oi.price
FROM order_items oi
JOIN orders o
ON oi.order_id = o.order_id
JOIN users u
ON o.user_id = u.user_id
JOIN products p
ON oi.product_id = p.product_id;

SELECT SUM(total_amount) AS total_sales
FROM orders
WHERE status != 'Cancelled';

SELECT AVG(price) AS average_price
FROM products;

SELECT MAX(price) AS maximum_price
FROM products;

SELECT MIN(price) AS minimum_price
FROM products;

SELECT COUNT(*) AS total_products
FROM products;

SELECT COUNT(*) AS total_customers
FROM users;

SELECT
    c.category_name,
    COUNT(p.product_id) AS total_products
FROM categories c
LEFT JOIN products p
ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name;

SELECT
    u.name,
    COUNT(o.order_id) AS total_orders
FROM users u
LEFT JOIN orders o
ON u.user_id = o.user_id
GROUP BY u.user_id, u.name;

SELECT
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;

SELECT DISTINCT
    u.user_id,
    u.name,
    u.email
FROM users u
JOIN orders o
ON u.user_id = o.user_id;

SELECT
    u.user_id,
    u.name,
    u.email
FROM users u
LEFT JOIN orders o
ON u.user_id = o.user_id
WHERE o.order_id IS NULL;

SELECT *
FROM orders
WHERE status = 'Confirmed';

SELECT *
FROM orders
WHERE status = 'Pending';

SELECT *
FROM orders
WHERE status = 'Delivered';

SELECT *
FROM orders
WHERE total_amount > 3000;

SELECT *
FROM payments
WHERE payment_status = 'Success';

SELECT *
FROM payments
WHERE payment_status = 'Pending';

SELECT SUM(amount) AS total_paid
FROM payments
WHERE payment_status = 'Success';

UPDATE products
SET stock = stock - 1
WHERE product_id = 1;

UPDATE orders
SET status = 'Delivered'
WHERE order_id = 2;

SELECT * FROM users;

SELECT * FROM categories;

SELECT * FROM products;

SELECT * FROM orders;

SELECT * FROM order_items;

SELECT * FROM payments;
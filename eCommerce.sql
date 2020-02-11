// #1 

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL
)

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    price INTEGER NOT NULL
)

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL REFERENCES products(product_id),
    user_id INTEGER REFERENCES users(user_id)
)

// #2

INSERT INTO users (user_name, email)
VALUES 
('Phillip', 'phil@gmail.com'),
('Austin', 'dupio@me.com'),
('Jeremy', 'jeremy@outlook.com')

INSERT INTO products (product_name, price)
VALUES 
('iPad Pro', 859.99),
('MacBook Pro 16in', 2399.99),
('Apple TV', 179.00)

INSERT INTO orders (user_id, product_id)
VALUES 
(1,3)
(2,2)
(3,1)

// #3a

SELECT products.product_name 
FROM products
JOIN orders ON products.product_id = orders.product_id
WHERE orders.order_id = 1

// #3b

SELECT * FROM orders

// #3c

SELECT SUM(products.price)
FROM products
JOIN orders ON products.product_id = orders.product_id
WHERE orders.order_id = 2

// #4

ALTER TABLE users 
ADD COLUMN order_id INTEGER
REFERENCES orders(order_id)

// #5

product_id INTEGER NOT NULL REFERENCES products(product_id),
user_id INTEGER REFERENCES users(user_id)

// #6a

SELECT * FROM orders
WHERE user_id = 2

// #6b

SELECT COUNT (order_id) FROM orders
GROUP BY user_id
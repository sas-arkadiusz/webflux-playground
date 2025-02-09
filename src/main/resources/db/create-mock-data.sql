DROP TABLE IF EXISTS customer_order;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS product;

CREATE TABLE customer
(
    id    INT AUTO_INCREMENT PRIMARY KEY,
    name  VARCHAR(100)        NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE product
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(100) NOT NULL,
    price       INT CHECK (price >= 0)
);

CREATE TABLE customer_order
(
    order_id    UUID                     DEFAULT random_uuid() PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id  INT NOT NULL,
    amount      INT CHECK (amount >= 0),
    order_date  TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customer (id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES product (id)
);

INSERT INTO customer(name, email)
VALUES ('Alice', 'alice@gmail.com'),
       ('Bob', 'bob@gmail.com'),
       ('Charlie', 'charlie@gmail.com'),
       ('Diana', 'diana@example.com'),
       ('Ethan', 'ethan@example.com'),
       ('Fiona', 'fiona@example.com'),
       ('George', 'george@example.com'),
       ('Hannah', 'hannah@example.com'),
       ('Ivy', 'ivy@example.com'),
       ('Jack', 'jack@example.com');

INSERT INTO product(description, price)
VALUES ('The Catcher in the Rye', 45),
       ('To Kill a Mockingbird', 50),
       ('1984 by George Orwell', 60),
       ('The Great Gatsby', 40),
       ('Moby Dick', 55),
       ('Pride and Prejudice', 50),
       ('War and Peace', 75),
       ('Crime and Punishment', 65),
       ('Jane Eyre', 48),
       ('Wuthering Heights', 45);

INSERT INTO customer_order (customer_id, product_id, amount, order_date)
VALUES (1, 1, 45, CURRENT_TIMESTAMP),
       (1, 2, 50, CURRENT_TIMESTAMP);

INSERT INTO customer_order (customer_id, product_id, amount, order_date)
VALUES (2, 3, 60, CURRENT_TIMESTAMP),
       (2, 4, 40, CURRENT_TIMESTAMP);

INSERT INTO customer_order (customer_id, product_id, amount, order_date)
VALUES (3, 5, 55, CURRENT_TIMESTAMP),
       (3, 6, 50, CURRENT_TIMESTAMP);

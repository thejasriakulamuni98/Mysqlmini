-- WALMART_DB WITH STORED PROCEDURES , TRIGGERS AND QUERY OPTIMIZATION
-- Group 07:
-- Thejasri Akula Muni (2888308)
-- Bala Siva Sai Chennupalli (2894547)
-- Jaya Kishore Chetikam (2893364)
-- Likith Ram Varma Kankipati (2898045)



-- Dropping the database if it already exists to avoid duplication errors
DROP DATABASE IF EXISTS `Walmart_DB`;

-- Creating a new database called Walmart_DB
CREATE DATABASE `Walmart_DB`;

-- Selecting Walmart_DB as the active database
USE `Walmart_DB`;

-- Creating USERS table to store user information
CREATE TABLE USERS (
    user_id INT NOT NULL,           -- Unique identifier for each user
    first_name VARCHAR(50),         -- User's first name with a maximum length of 50 characters
    last_name VARCHAR(50),          -- User's last name with a maximum length of 50 characters
    email_id VARCHAR(100),          -- User's email address with a maximum length of 100 characters
    PRIMARY KEY (user_id)           -- Setting user_id as the primary key for unique identification
);


-- Inserting data into USERS
INSERT INTO USERS (user_id, first_name, last_name, email_id) VALUES
(1, 'John', 'Doe', 'john.doe@example.com'),
(2, 'Jane', 'Smith', 'jane.smith@example.com'),
(3, 'Michael', 'Brown', 'michael.brown@example.com'),
(4, 'Emily', 'Davis', 'emily.davis@example.com'),
(5, 'Daniel', 'Johnson', 'daniel.johnson@example.com'),
(6, 'Olivia', 'Wilson', 'olivia.wilson@example.com'),
(7, 'Matthew', 'Miller', 'matthew.miller@example.com'),
(8, 'Sophia', 'Moore', 'sophia.moore@example.com'),
(9, 'James', 'Taylor', 'james.taylor@example.com'),
(10, 'Isabella', 'Anderson', 'isabella.anderson@example.com'),
(11, 'William', 'Thomas', 'william.thomas@example.com'),
(12, 'Ava', 'Jackson', 'ava.jackson@example.com'),
(13, 'Christopher', 'White', 'christopher.white@example.com'),
(14, 'Mia', 'Harris', 'mia.harris@example.com'),
(15, 'Alexander', 'Martin', 'alexander.martin@example.com'),
(16, 'Charlotte', 'Thompson', 'charlotte.thompson@example.com'),
(17, 'Benjamin', 'Garcia', 'benjamin.garcia@example.com'),
(18, 'Amelia', 'Martinez', 'amelia.martinez@example.com'),
(19, 'Elijah', 'Robinson', 'elijah.robinson@example.com'),
(20, 'Grace', 'Clark', 'grace.clark@example.com'),
(21, 'Gavaskar', 'Border', 'bordergavaskar@example.com');


-- Creating PRODUCTS table
CREATE TABLE PRODUCTS (
    product_id INT NOT NULL,          -- Unique identifier for each product
    product_name VARCHAR(100),        -- Name of the product, with a maximum length of 100 characters
    price DECIMAL(10, 2),             -- Price of the product with up to 10 digits, including 2 decimal places for cents
    category_id INT,                  -- Foreign key linking to the PRODUCT_CATEGORY table, representing the product category
    PRIMARY KEY (product_id)          -- Defining product_id as the primary key for unique product identification
);


-- Inserting data into PRODUCTS
INSERT INTO PRODUCTS (product_id, product_name, price, category_id) VALUES
(1, 'Laptop', 999.99, 1),
(2, 'Smartphone', 799.99, 1),
(3, 'Tablet', 499.99, 1),
(4, 'Headphones', 199.99, 2),
(5, 'Smartwatch', 249.99, 2),
(6, 'Television', 1199.99, 3),
(7, 'Camera', 699.99, 3),
(8, 'Fridge', 899.99, 4),
(9, 'Washing Machine', 499.99, 4),
(10, 'Microwave', 199.99, 4),
(11, 'Sofa', 299.99, 5),
(12, 'Dining Table', 499.99, 5),
(13, 'Office Chair', 149.99, 5),
(14, 'T-shirt', 19.99, 6),
(15, 'Jeans', 49.99, 6),
(16, 'Shoes', 79.99, 6),
(17, 'Blender', 59.99, 7),
(18, 'Toaster', 29.99, 7),
(19, 'Air Conditioner', 499.99, 7),
(20, 'Vacuum Cleaner', 199.99, 7);



-- Creating PRODUCT_CATEGORY table
CREATE TABLE PRODUCT_CATEGORY (
    category_id INT NOT NULL,         -- Unique identifier for each category
    category_name VARCHAR(100),       -- Name of the product category, with a maximum length of 100 characters
    PRIMARY KEY (category_id)         -- Defining category_id as the primary key for unique category identification
);


-- Inserting data into PRODUCT_CATEGORY
INSERT INTO PRODUCT_CATEGORY (category_id, category_name) VALUES
(1, 'Electronics'),
(2, 'Accessories'),
(3, 'Appliances'),
(4, 'Home Appliances'),
(5, 'Furniture'),
(6, 'Clothing'),
(7, 'Kitchen Appliances');


-- Creating ORDERS table
CREATE TABLE ORDERS (
    order_id INT NOT NULL,            -- Unique identifier for each order
    order_date DATE,                  -- Date the order was placed
    user_id INT,                      -- Foreign key linking to USERS table, identifying the user who placed the order
    total_amount DECIMAL(10, 2),      -- Total cost of the order
    PRIMARY KEY (order_id),           -- Defining order_id as the primary key for unique order identification
    FOREIGN KEY (user_id) REFERENCES USERS(user_id)  -- Enforcing referential integrity for user_id
);

-- Inserting data into ORDERS
INSERT INTO ORDERS (order_id, order_date, user_id, total_amount) VALUES
(1, '2023-10-10', 1, 1999.99),
(2, '2023-10-11', 2, 1299.99),
(3, '2023-10-12', 3, 499.99),
(4, '2023-10-13', 4, 899.99),
(5, '2023-10-14', 5, 199.99),
(6, '2023-10-15', 6, 79.99),
(7, '2023-10-16', 7, 299.99),
(8, '2023-10-17', 8, 149.99),
(9, '2023-10-18', 9, 999.99),
(10, '2023-10-19', 10, 49.99),
(11, '2023-10-20', 11, 149.99),
(12, '2023-10-21', 12, 59.99),
(13, '2023-10-22', 13, 19.99),
(14, '2023-10-23', 14, 69.99),
(15, '2023-10-24', 15, 89.99),
(16, '2023-10-25', 16, 499.99),
(17, '2023-10-26', 17, 249.99),
(18, '2023-10-27', 18, 199.99),
(19, '2023-10-28', 19, 149.99),
(20, '2023-10-29', 20, 99.99);


-- Creating PAYMENTS table
CREATE TABLE PAYMENTS (
    payment_id INT NOT NULL,          -- Unique identifier for each payment
    order_id INT,                     -- Foreign key linking to the ORDERS table, identifying the order associated with the payment
    payment_method VARCHAR(50),       -- Method of payment (e.g., Credit Card, Debit Card)
    payment_date DATE,                -- Date the payment was processed
    PRIMARY KEY (payment_id),         -- Defining payment_id as the primary key for unique payment identification
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id)  -- Enforcing referential integrity for order_id
);

-- Inserting data into PAYMENTS
INSERT INTO PAYMENTS (payment_id, order_id, payment_method, payment_date) VALUES
(1, 1, 'Credit Card', '2023-10-10'),
(2, 2, 'Debit Card', '2023-10-11'),
(3, 3, 'PayPal', '2023-10-12'),
(4, 4, 'Credit Card', '2023-10-13'),
(5, 5, 'Debit Card', '2023-10-14'),
(6, 6, 'Credit Card', '2023-10-15'),
(7, 7, 'PayPal', '2023-10-16'),
(8, 8, 'Credit Card', '2023-10-17'),
(9, 9, 'Debit Card', '2023-10-18'),
(10, 10, 'PayPal', '2023-10-19'),
(11, 11, 'Credit Card', '2023-10-20'),
(12, 12, 'Debit Card', '2023-10-21'),
(13, 13, 'PayPal', '2023-10-22'),
(14, 14, 'Credit Card', '2023-10-23'),
(15, 15, 'Debit Card', '2023-10-24'),
(16, 16, 'PayPal', '2023-10-25'),
(17, 17, 'Credit Card', '2023-10-26'),
(18, 18, 'Debit Card', '2023-10-27'),
(19, 19, 'PayPal', '2023-10-28'),
(20, 20, 'Credit Card', '2023-10-29');


-- Creating ADDRESS table
CREATE TABLE ADDRESS (
    address_id INT NOT NULL,          -- Unique identifier for each address
    user_id INT,                      -- Foreign key linking to the USERS table, representing the user associated with this address
    address VARCHAR(255),             -- Street address, with a maximum length of 255 characters
    city VARCHAR(50),                 -- City name
    postal_code VARCHAR(10),          -- Postal code
    PRIMARY KEY (address_id),         -- Defining address_id as the primary key for unique address identification
    FOREIGN KEY (user_id) REFERENCES USERS(user_id)  -- Enforcing referential integrity for user_id
);

-- Inserting data into ADDRESS
INSERT INTO ADDRESS (address_id, user_id, address, city, postal_code) VALUES
(1, 1, '123 Main St', 'New York', '10001'),
(2, 2, '456 Oak St', 'Los Angeles', '90001'),
(3, 3, '789 Pine St', 'Chicago', '60601'),
(4, 4, '321 Maple St', 'Houston', '77001'),
(5, 5, '654 Birch St', 'Phoenix', '85001'),
(6, 6, '987 Elm St', 'Philadelphia', '19101'),
(7, 7, '543 Cedar St', 'San Antonio', '78201'),
(8, 8, '210 Walnut St', 'San Diego', '92101'),
(9, 9, '369 Ash St', 'Dallas', '75201'),
(10, 10, '147 Spruce St', 'San Jose', '95101'),
(11, 11, '258 Palm St', 'Austin', '73301'),
(12, 12, '741 Oak St', 'Jacksonville', '32099'),
(13, 13, '853 Pine St', 'San Francisco', '94102'),
(14, 14, '159 Maple St', 'Columbus', '43201'),
(15, 15, '368 Birch St', 'Indianapolis', '46201'),
(16, 16, '742 Elm St', 'Charlotte', '28201'),
(17, 17, '963 Cedar St', 'Fort Worth', '76101'),
(18, 18, '852 Walnut St', 'Seattle', '98101'),
(19, 19, '147 Ash St', 'Denver', '80201'),
(20, 20, '951 Spruce St', 'Boston', '02108');


-- Creating TRACKING_DETAILS table
CREATE TABLE TRACKING_DETAILS (
    tracking_id INT NOT NULL,         -- Unique identifier for each tracking detail
    order_id INT,                     -- Foreign key linking to the ORDERS table, representing the order being tracked
    tracking_number VARCHAR(50),      -- Tracking number for shipment
    status VARCHAR(50),               -- Current status of the shipment (e.g., Shipped, Delivered)
    estimated_delivery DATE,          -- Estimated delivery date
    PRIMARY KEY (tracking_id),        -- Defining tracking_id as the primary key for unique tracking detail identification
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id)  -- Enforcing referential integrity for order_id
);

-- Inserting data into TRACKING_DETAILS
INSERT INTO TRACKING_DETAILS (tracking_id, order_id, tracking_number, status, estimated_delivery) VALUES
(1, 1, 'TRK001', 'Shipped', '2023-10-15'),
(2, 2, 'TRK002', 'Delivered', '2023-10-16'),
(3, 3, 'TRK003', 'In Transit', '2023-10-18'),
(4, 4, 'TRK004', 'Delivered', '2023-10-19'),
(5, 5, 'TRK005', 'Shipped', '2023-10-20'),
(6, 6, 'TRK006', 'Delivered', '2023-10-21'),
(7, 7, 'TRK007', 'In Transit', '2023-10-22'),
(8, 8, 'TRK008', 'Shipped', '2023-10-23'),
(9, 9, 'TRK009', 'In Transit', '2023-10-24'),
(10, 10, 'TRK010', 'Delivered', '2023-10-25'),
(11, 11, 'TRK011', 'Shipped', '2023-10-26'),
(12, 12, 'TRK012', 'In Transit', '2023-10-27'),
(13, 13, 'TRK013', 'Shipped', '2023-10-28'),
(14, 14, 'TRK014', 'Delivered', '2023-10-29'),
(15, 15, 'TRK015', 'In Transit', '2023-10-30'),
(16, 16, 'TRK016', 'Delivered', '2023-10-31'),
(17, 17, 'TRK017', 'Shipped', '2023-11-01'),
(18, 18, 'TRK018', 'Delivered', '2023-11-02'),
(19, 19, 'TRK019', 'In Transit', '2023-11-03'),
(20, 20, 'TRK020', 'Delivered', '2023-11-04');


-- Creating REVIEWS table
CREATE TABLE REVIEWS (
    review_id INT NOT NULL,           -- Unique identifier for each review
    user_id INT,                      -- Foreign key linking to USERS table, identifying the user who wrote the review
    product_id INT,                   -- Foreign key linking to PRODUCTS table, identifying the reviewed product
    rating INT,                       -- Rating given by the user (e.g., 1 to 5)
    review_text TEXT,                 -- Detailed review text provided by the user
    review_date DATE,                 -- Date the review was submitted
    PRIMARY KEY (review_id),          -- Defining review_id as the primary key for unique review identification
    FOREIGN KEY (user_id) REFERENCES USERS(user_id),  -- Enforcing referential integrity for user_id
    FOREIGN KEY (product_id) REFERENCES PRODUCTS(product_id)  -- Enforcing referential integrity for product_id
);

-- Inserting data into REVIEWS
INSERT INTO REVIEWS (review_id, user_id, product_id, rating, review_text, review_date) VALUES
(1, 1, 1, 5, 'Excellent laptop, highly recommend!', '2023-10-15'),
(2, 2, 2, 4, 'Good smartphone but battery life could be better.', '2023-10-16'),
(3, 3, 3, 3, 'Average tablet, nothing special.', '2023-10-17'),
(4, 4, 4, 5, 'Great headphones, amazing sound quality.', '2023-10-18'),
(5, 5, 5, 4, 'Nice smartwatch, works well with my phone.', '2023-10-19'),
(6, 6, 6, 5, 'Fantastic TV, crystal clear display.', '2023-10-20'),
(7, 7, 7, 3, 'Decent camera, but not as expected for the price.', '2023-10-21'),
(8, 8, 8, 5, 'Great fridge, lots of storage space.', '2023-10-22'),
(9, 9, 9, 4, 'Washing machine works fine, no issues.', '2023-10-23'),
(10, 10, 10, 5, 'Microwave is easy to use, heats up food quickly.', '2023-10-24'),
(11, 11, 11, 4, 'Comfortable sofa, looks good in the living room.', '2023-10-25'),
(12, 12, 12, 5, 'Solid dining table, good value for money.', '2023-10-26'),
(13, 13, 13, 4, 'Nice office chair, very ergonomic.', '2023-10-27'),
(14, 14, 14, 5, 'T-shirt fits well, comfortable fabric.', '2023-10-28'),
(15, 15, 15, 4, 'Good jeans, stylish and durable.', '2023-10-29'),
(16, 16, 16, 5, 'Shoes are comfortable, great for daily wear.', '2023-10-30'),
(17, 17, 17, 4, 'Blender works well, easy to clean.', '2023-10-31'),
(18, 18, 18, 3, 'Toaster is okay, but could toast more evenly.', '2023-11-01'),
(19, 19, 19, 5, 'Air conditioner cools the room quickly.', '2023-11-02'),
(20, 20, 20, 4, 'Vacuum cleaner is powerful, works great on carpets.', '2023-11-03');



-- Creating SELLERS table
CREATE TABLE SELLERS (
    seller_id INT NOT NULL,           -- Unique identifier for each seller
    seller_name VARCHAR(100),         -- Name of the seller, with a maximum length of 100 characters
    contact_email VARCHAR(100),       -- Seller's contact email, with a maximum length of 100 characters
    phone_number VARCHAR(15),         -- Seller's contact phone number, with a maximum length of 15 characters
    PRIMARY KEY (seller_id)           -- Defining seller_id as the primary key for unique seller identification
);


-- Inserting data into SELLERS
INSERT INTO SELLERS (seller_id, seller_name, contact_email, phone_number) VALUES
(1, 'Tech World', 'contact@techworld.com', '123-456-7890'),
(2, 'Home Essentials', 'info@homeessentials.com', '234-567-8901'),
(3, 'Fashion Hub', 'support@fashionhub.com', '345-678-9012'),
(4, 'Book Nook', 'hello@booknook.com', '456-789-0123'),
(5, 'Sports Zone', 'contact@sportszone.com', '567-890-1234'),
(6, 'Gadget Galaxy', 'sales@gadgetgalaxy.com', '678-901-2345'),
(7, 'Beauty Store', 'info@beautystore.com', '789-012-3456'),
(8, 'Pet Paradise', 'support@petparadise.com', '890-123-4567'),
(9, 'Furniture Mart', 'hello@furnituremart.com', '901-234-5678'),
(10, 'Grocery Shop', 'contact@groceryshop.com', '012-345-6789'),
(11, 'Outdoor Supplies', 'info@outdoorsupplies.com', '123-456-7891'),
(12, 'Toys & Games', 'support@toysandgames.com', '234-567-8902'),
(13, 'Stationery World', 'hello@stationeryworld.com', '345-678-9013'),
(14, 'Jewelry Box', 'contact@jewelrybox.com', '456-789-0124'),
(15, 'Craft Corner', 'info@craftcorner.com', '567-890-1235'),
(16, 'Health & Wellness', 'support@healthwellness.com', '678-901-2346'),
(17, 'Luxury Goods', 'hello@luxurygoods.com', '789-012-3457'),
(18, 'Auto Supplies', 'contact@autosupplies.com', '890-123-4568'),
(19, 'Beverage Shop', 'info@beverageshop.com', '901-234-5679'),
(20, 'Electronics Emporium', 'support@electronicsemporium.com', '012-345-6780');


-- Creating INVENTORY table
CREATE TABLE INVENTORY (
    inventory_id INT NOT NULL,        -- Unique identifier for each inventory entry
    product_id INT,                   -- Foreign key linking to PRODUCTS table, identifying the product
    seller_id INT,                    -- Foreign key linking to SELLERS table, identifying the seller
    stock_quantity INT,               -- Quantity of the product in stock with this seller
    restock_date DATE,                -- Expected date for restocking the product
    PRIMARY KEY (inventory_id),       -- Defining inventory_id as the primary key for unique inventory identification
    FOREIGN KEY (product_id) REFERENCES PRODUCTS(product_id),  -- Enforcing referential integrity for product_id
    FOREIGN KEY (seller_id) REFERENCES SELLERS(seller_id)  -- Enforcing referential integrity for seller_id
);

-- Inserting data into INVENTORY
INSERT INTO INVENTORY (inventory_id, product_id, seller_id, stock_quantity, restock_date) VALUES
(1, 1, 1, 50, '2023-10-01'),
(2, 2, 2, 30, '2023-10-05'),
(3, 3, 3, 20, '2023-10-10'),
(4, 4, 4, 15, '2023-10-15'),
(5, 5, 5, 25, '2023-10-20'),
(6, 6, 6, 10, '2023-10-25'),
(7, 7, 7, 60, '2023-10-30'),
(8, 8, 8, 40, '2023-11-01'),
(9, 9, 9, 55, '2023-11-05'),
(10, 10, 10, 45, '2023-11-10'),
(11, 11, 11, 35, '2023-11-15'),
(12, 12, 12, 70, '2023-11-20'),
(13, 13, 13, 80, '2023-11-25'),
(14, 14, 14, 90, '2023-11-30'),
(15, 15, 15, 25, '2023-12-05'),
(16, 16, 16, 15, '2023-12-10'),
(17, 17, 17, 10, '2023-12-15'),
(18, 18, 18, 5, '2023-12-20'),
(19, 19, 19, 0, '2023-12-25'),  -- Out of stock
(20, 20, 20, 2, '2023-12-30');




-- WalmartDB COMPLEX QUERIES

-- Group 07:
-- Thejasri Akula Muni (2888308)
-- Bala Siva Sai Chennupalli (2894547)
-- Jaya Kishore Chetikam (2893364)
-- Likith Ram Varma Kankipati (2898045)


-- Selecting Walmart_DB as the active database
USE `Walmart_DB`;


-- 1. Customer Purchase Frequency with Spending Tiers

SELECT u.user_id, u.first_name, u.last_name, COUNT(o.order_id) AS purchase_frequency,
    CASE 
        WHEN SUM(o.total_amount) < 200 THEN 'Low'
        WHEN SUM(o.total_amount) BETWEEN 200 AND 500 THEN 'Medium'
        ELSE 'High'
    END AS spending_tier
FROM USERS u
JOIN ORDERS o ON u.user_id = o.user_id
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY purchase_frequency DESC;

-- 2. Retrives User order history
SELECT U.user_id, U.first_name, U.last_name, O.order_id, O.order_date, O.total_amount
FROM USERS U
JOIN ORDERS O ON U.user_id = O.user_id
ORDER BY U.user_id, O.order_date;


-- 3. Average Product Rating by Category

SELECT pc.category_name, AVG(r.rating) AS avg_rating
FROM PRODUCT_CATEGORY pc
JOIN PRODUCTS p ON pc.category_id = p.category_id
JOIN REVIEWS r ON p.product_id = r.product_id
GROUP BY pc.category_name
ORDER BY avg_rating DESC;


-- 4. Monthly Sales Report by Category

SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    category_name,
    SUM(total_amount) AS total_sales
FROM ORDERS
JOIN PRODUCTS ON ORDERS.order_id = PRODUCTS.product_id
JOIN PRODUCT_CATEGORY ON PRODUCTS.category_id = PRODUCT_CATEGORY.category_id
GROUP BY month, category_name
ORDER BY month DESC, total_sales DESC;


-- 5. Show Average Rating per Product
SELECT P.product_name, AVG(R.rating) AS average_rating
FROM PRODUCTS P
JOIN REVIEWS R ON P.product_id = R.product_id
GROUP BY P.product_id, P.product_name
ORDER BY average_rating DESC;


-- 6. High-Rating Product Report (4+ Stars)

SELECT
    product_name,
    AVG(rating) AS average_rating,
    COUNT(review_id) AS review_count
FROM REVIEWS
JOIN PRODUCTS ON REVIEWS.product_id = PRODUCTS.product_id
WHERE rating >= 4
GROUP BY product_name
ORDER BY average_rating DESC, review_count DESC;

-- 7. Customer Purchase Patterns Analysis

SELECT
    user_id,
    GROUP_CONCAT(product_name ORDER BY order_date) AS products_purchased
FROM ORDERS
JOIN PRODUCTS ON ORDERS.order_id = PRODUCTS.product_id
GROUP BY user_id
ORDER BY user_id;

-- 8. Customer with the Most Orders

SELECT
    first_name,
    last_name,
    COUNT(order_id) AS total_orders
FROM USERS
JOIN ORDERS ON USERS.user_id = ORDERS.user_id
GROUP BY USERS.user_id
ORDER BY total_orders DESC
LIMIT 1;


-- 9.Reorder Alert for Low Stock Products

SELECT
    product_name,
    COUNT(*) AS stock_count
FROM PRODUCTS
GROUP BY product_name
HAVING stock_count < 5
ORDER BY stock_count ASC;


-- 10.Low Stock Products with High Sales

SELECT product_name, stock_quantity, total_sales
FROM (
    SELECT p.product_name, i.stock_quantity, SUM(o.total_amount) AS total_sales
    FROM PRODUCTS p
    JOIN INVENTORY i ON p.product_id = i.product_id
    JOIN ORDERS o ON o.order_id = p.product_id
    GROUP BY p.product_name, i.stock_quantity
) AS product_sales
WHERE stock_quantity < 20
ORDER BY total_sales DESC;


-- 11.Identify Top 3 Categories by Total Sales


SELECT category_name, total_sales
FROM (
    SELECT pc.category_name, SUM(o.total_amount) AS total_sales
    FROM ORDERS o
    JOIN PRODUCTS p ON o.order_id = p.product_id
    JOIN PRODUCT_CATEGORY pc ON p.category_id = pc.category_id
    WHERE MONTH(o.order_date) = 10 AND YEAR(o.order_date) = 2023
    GROUP BY pc.category_name
) AS category_sales
ORDER BY total_sales DESC
LIMIT 3;



-- 12. Products Ranked by Most Reviews Given and Their Average Rating
SELECT p.product_name, COUNT(r.review_id) AS review_count, AVG(r.rating) AS average_rating
FROM PRODUCTS p
JOIN REVIEWS r ON p.product_id = r.product_id
GROUP BY p.product_id, p.product_name
ORDER BY review_count DESC, average_rating DESC
LIMIT 10;





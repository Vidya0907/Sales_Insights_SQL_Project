

-- Customers Table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    city VARCHAR(50),
    age INT,
    loyalty_member BOOLEAN
);

-- Products Table
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    unit_price NUMERIC(10,2)
);

-- Sales Table
CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT,
    sale_date DATE,
    sale_time TIME,
    payment_method VARCHAR(20),
    rating NUMERIC(3,2),
    profit_margin NUMERIC(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- 1. Top 3 customers by total spending
SELECT 
    c.customer_id, 
    c.first_name || ' ' || c.last_name AS customer_name, 
    SUM(s.quantity * p.unit_price) AS total_spent
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.customer_id, customer_name
ORDER BY total_spent DESC
LIMIT 3;

-- 2. Monthly sales growth percentage
WITH monthly_sales AS (
    SELECT TO_CHAR(s.sale_date,'YYYY-MM') AS month, SUM(s.quantity * p.unit_price) AS total_sales
    FROM sales s 
    JOIN products p ON s.product_id = p.product_id
    GROUP BY month
)
SELECT 
    month, 
    total_sales,
    LAG(total_sales) OVER(ORDER BY month) AS prev_month_sales,
    ROUND((total_sales - LAG(total_sales) OVER(ORDER BY month)) / LAG(total_sales) OVER(ORDER BY month) * 100, 2) AS growth_percent
FROM monthly_sales;

-- 3. Products with above-average ratings per category
SELECT 
    p.product_name, 
    p.category, 
    AVG(s.rating) AS avg_rating
FROM sales s 
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name, p.category
HAVING AVG(s.rating) > (
    SELECT AVG(s2.rating) 
    FROM sales s2 
    JOIN products p2 ON s2.product_id = p2.product_id 
    WHERE p2.category = p.category
);

-- 4. Customers with highest single-sale profit
SELECT 
    c.first_name || ' ' || c.last_name AS customer_name, 
    s.sale_id, 
    s.profit_margin
FROM sales s 
JOIN customers c ON s.customer_id = c.customer_id
ORDER BY s.profit_margin DESC
LIMIT 5;

-- 5. Rank customers by total quantity purchased
SELECT 
    c.customer_id, 
    c.first_name || ' ' || c.last_name AS customer_name,
    SUM(s.quantity) AS total_qty,
    RANK() OVER(ORDER BY SUM(s.quantity) DESC) AS rank_qty
FROM sales s 
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_id, customer_name;

-- 6. Total sales per city and top city per month
WITH city_month_sales AS (
    SELECT 
        c.city, 
        TO_CHAR(s.sale_date,'YYYY-MM') AS month, 
        SUM(s.quantity * p.unit_price) AS sales_total
    FROM sales s 
    JOIN customers c ON s.customer_id = c.customer_id
    JOIN products p ON s.product_id = p.product_id
    GROUP BY c.city, month
)
SELECT *
FROM (
    SELECT *, ROW_NUMBER() OVER(PARTITION BY month ORDER BY sales_total DESC) AS rn
    FROM city_month_sales
) t
WHERE rn = 1;



-- 7. Average purchase interval per customer
WITH sale_intervals AS (
    SELECT 
        s.customer_id,
        s.sale_date,
        s.sale_date - LAG(s.sale_date) OVER(PARTITION BY s.customer_id ORDER BY s.sale_date) AS interval_days
    FROM sales s
)
SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    AVG(si.interval_days) AS avg_interval_days
FROM sale_intervals si
JOIN customers c ON si.customer_id = c.customer_id
GROUP BY c.customer_id, customer_name;

-- 8. Top-selling product per category
SELECT category, product_name, total_qty
FROM (
    SELECT 
        p.category, 
        p.product_name, 
        SUM(s.quantity) AS total_qty,
        ROW_NUMBER() OVER(PARTITION BY p.category ORDER BY SUM(s.quantity) DESC) AS rn
    FROM sales s 
    JOIN products p ON s.product_id = p.product_id
    GROUP BY p.category, p.product_name
) t
WHERE rn = 1;

-- 9. Loyalty members with highest average rating given
SELECT 
    c.first_name || ' ' || c.last_name AS customer_name, 
    AVG(s.rating) AS avg_rating
FROM sales s 
JOIN customers c ON s.customer_id = c.customer_id
WHERE c.loyalty_member = TRUE
GROUP BY customer_name
ORDER BY avg_rating DESC
LIMIT 5;




-- 10. Cumulative sales per product
SELECT 
    p.product_name, 
    s.sale_date, 
    SUM(s.quantity * p.unit_price) OVER(PARTITION BY s.product_id ORDER BY s.sale_date) AS cumulative_sales
FROM sales s 
JOIN products p ON s.product_id = p.product_id
ORDER BY p.product_name, s.sale_date;

-- 11. Payment method preference per city
WITH payment_rank AS (
    SELECT 
        c.city, 
        s.payment_method, 
        COUNT(*) AS method_count,
        RANK() OVER(PARTITION BY c.city ORDER BY COUNT(*) DESC) AS rank_method
    FROM sales s 
    JOIN customers c ON s.customer_id = c.customer_id
    GROUP BY c.city, s.payment_method
)
SELECT *
FROM payment_rank
WHERE rank_method = 1;

-- 12. Customers who spent above category average
SELECT 
    c.first_name || ' ' || c.last_name AS customer_name, 
    p.category, 
    SUM(s.quantity * p.unit_price) AS total_spent
FROM sales s 
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY customer_name, p.category
HAVING SUM(s.quantity * p.unit_price) > (
    SELECT AVG(s2.quantity * p2.unit_price) 
    FROM sales s2 
    JOIN products p2 ON s2.product_id = p2.product_id 
    WHERE p2.category = p.category
);

-- 13. Products with least sales in last 3 months
SELECT 
    p.product_name, 
    SUM(s.quantity) AS total_qty
FROM sales s 
JOIN products p ON s.product_id = p.product_id
WHERE s.sale_date >= CURRENT_DATE - INTERVAL '3 months'
GROUP BY p.product_name
ORDER BY total_qty ASC
LIMIT 5;



-- 14. Highest profit margin product per month
SELECT 
    TO_CHAR(s.sale_date,'YYYY-MM') AS month, 
    p.product_name, 
    MAX(s.profit_margin) AS max_profit
FROM sales s 
JOIN products p ON s.product_id = p.product_id
GROUP BY month, p.product_name
ORDER BY month, max_profit DESC;



-- 15. Average sales per age group
SELECT 
    (c.age/10)*10 AS age_group, 
    AVG(s.quantity * p.unit_price) AS avg_sales
FROM sales s 
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY age_group
ORDER BY age_group;

-- 16. Top 2 customers per product category
SELECT category, customer_name, total_spent
FROM (
    SELECT 
        p.category, 
        c.first_name || ' ' || c.last_name AS customer_name,
        SUM(s.quantity * p.unit_price) AS total_spent,
        ROW_NUMBER() OVER(PARTITION BY p.category ORDER BY SUM(s.quantity * p.unit_price) DESC) AS rn
    FROM sales s 
    JOIN customers c ON s.customer_id = c.customer_id
    JOIN products p ON s.product_id = p.product_id
    GROUP BY p.category, customer_name
) t
WHERE rn <= 2;









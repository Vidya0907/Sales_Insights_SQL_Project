-- =====================================
-- TABLE CREATION
-- =====================================

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

-- =====================================
-- INSERT CUSTOMERS (100 rows)
-- =====================================
INSERT INTO customers (first_name, last_name, gender, city, age, loyalty_member) VALUES
('Alice','Smith','Female','New York',28,TRUE),
('Bob','Johnson','Male','Chicago',35,FALSE),
('Carol','Williams','Female','Los Angeles',42,TRUE),
('David','Brown','Male','Houston',30,TRUE),
('Eva','Davis','Female','Miami',25,FALSE),
('Frank','Miller','Male','Seattle',38,TRUE),
('Grace','Wilson','Female','Boston',33,TRUE),
('Henry','Moore','Male','Dallas',40,FALSE),
('Ivy','Taylor','Female','San Francisco',27,TRUE),
('Jack','Anderson','Male','Denver',31,TRUE),
('Kelly','Thomas','Female','Austin',29,FALSE),
('Leo','Jackson','Male','Atlanta',36,TRUE),
('Mia','White','Female','Orlando',22,TRUE),
('Nina','Harris','Female','Las Vegas',34,FALSE),
('Oscar','Martin','Male','Phoenix',39,TRUE),
('Paula','Thompson','Female','Portland',28,TRUE),
('Quinn','Garcia','Male','San Diego',32,FALSE),
('Rita','Martinez','Female','Sacramento',30,TRUE),
('Sam','Robinson','Male','Kansas City',37,TRUE),
('Tina','Clark','Female','Philadelphia',26,FALSE),
('Uma','Lewis','Female','Columbus',31,TRUE),
('Victor','Lee','Male','Charlotte',45,TRUE),
('Wendy','Walker','Female','Indianapolis',29,FALSE),
('Xander','Hall','Male','San Antonio',33,TRUE),
('Yara','Allen','Female','Jacksonville',24,TRUE),
('Zane','Young','Male','Nashville',38,FALSE),
('Anna','King','Female','Memphis',35,TRUE),
('Brian','Wright','Male','Louisville',41,TRUE),
('Clara','Scott','Female','Baltimore',27,FALSE),
('Derek','Green','Male','Milwaukee',32,TRUE),
('Ella','Adams','Female','Albuquerque',26,TRUE),
('Felix','Baker','Male','Tucson',37,FALSE),
('Gina','Gonzalez','Female','Fresno',30,TRUE),
('Hank','Nelson','Male','Sacramento',39,TRUE),
('Isla','Carter','Female','Mesa',28,FALSE),
('Jake','Mitchell','Male','Kansas City',33,TRUE),
('Lily','Perez','Female','Atlanta',25,TRUE),
('Mason','Roberts','Male','Omaha',40,FALSE),
('Olivia','Turner','Female','Colorado Springs',29,TRUE),
('Peter','Phillips','Male','Raleigh',34,TRUE),
('Queen','Campbell','Female','Miami',27,FALSE),
('Ryan','Parker','Male','Long Beach',36,TRUE),
('Sophia','Evans','Female','Virginia Beach',31,TRUE),
('Thomas','Edwards','Male','Oakland',42,FALSE),
('Ursula','Collins','Female','Minneapolis',28,TRUE),
('Vince','Stewart','Male','Tulsa',35,TRUE),
('Willow','Sanchez','Female','Arlington',26,FALSE),
('Xenia','Morris','Female','New Orleans',33,TRUE),
('Yosef','Rogers','Male','Wichita',39,TRUE),
('Zara','Reed','Female','Cleveland',24,FALSE),
('Aaron','Cook','Male','Tampa',32,TRUE),
('Bella','Morgan','Female','Aurora',29,TRUE),
('Caleb','Bell','Male','Anaheim',41,FALSE),
('Diana','Murphy','Female','Santa Ana',28,TRUE),
('Ethan','Bailey','Male','St. Louis',36,TRUE),
('Faith','Rivera','Female','Pittsburgh',25,FALSE),
('Gavin','Cooper','Male','Cincinnati',38,TRUE),
('Holly','Richardson','Female','Anchorage',27,TRUE),
('Ian','Cox','Male','Stockton',35,FALSE),
('Julia','Howard','Female','Toledo',30,TRUE),
('Kevin','Ward','Male','St. Paul',33,TRUE),
('Laura','Torres','Female','Newark',29,FALSE),
('Matt','Peterson','Male','Greensboro',37,TRUE),
('Nora','Gray','Female','Plano',26,TRUE),
('Owen','Ramirez','Male','Henderson',41,FALSE),
('Pam','James','Female','Lincoln',28,TRUE),
('Quentin','Watkins','Male','Buffalo',36,TRUE),
('Rachel','Brooks','Female','Jersey City',27,FALSE),
('Sean','Kelly','Male','Chandler',34,TRUE),
('Tara','Sanders','Female','Glendale',25,TRUE),
('Ulysses','Price','Male','Scottsdale',38,FALSE),
('Vanessa','Bennett','Female','Norfolk',29,TRUE),
('Walter','Wood','Male','Madison',42,TRUE),
('Ximena','Barnes','Female','Lubbock',26,FALSE),
('Yvonne','Ross','Female','Gilbert',31,TRUE),
('Zach','Henderson','Male','Reno',33,TRUE);

-- =====================================
-- INSERT PRODUCTS (50 rows)
-- =====================================
INSERT INTO products (product_name, category, unit_price) VALUES
('Laptop','Electronics',1200.50),
('Smartphone','Electronics',800.00),
('T-Shirt','Clothing',25.00),
('Jeans','Clothing',50.00),
('Coffee Maker','Home Appliances',75.00),
('Headphones','Electronics',150.00),
('Sneakers','Footwear',80.00),
('Blender','Home Appliances',60.00),
('Book','Books',15.00),
('Monitor','Electronics',200.00),
('Jacket','Clothing',120.00),
('Microwave','Home Appliances',150.00),
('Sandals','Footwear',45.00),
('Tablet','Electronics',350.00),
('Desk Lamp','Home Appliances',40.00),
('Backpack','Accessories',55.00),
('Shoes','Footwear',90.00),
('Chair','Furniture',100.00),
('Notebook','Stationery',5.00),
('Pen','Stationery',2.50),
('Smartwatch','Electronics',220.00),
('Dress','Clothing',70.00),
('Sofa','Furniture',500.00),
('Headset','Electronics',130.00),
('Lamp','Home Appliances',35.00),
('Sandals','Footwear',50.00),
('Speaker','Electronics',180.00),
('Printer','Electronics',250.00),
('Scarf','Clothing',20.00),
('Fan','Home Appliances',60.00),
('Mouse','Electronics',40.00),
('Keyboard','Electronics',45.00),
('Coffee Mug','Home Appliances',12.00),
('Gloves','Clothing',15.00),
('Bookshelf','Furniture',120.00),
('Camera','Electronics',700.00),
('Water Bottle','Accessories',18.00),
('Tote Bag','Accessories',35.00),
('Earbuds','Electronics',90.00),
('Dress Shoes','Footwear',110.00),
('Winter Coat','Clothing',150.00),
('Smart TV','Electronics',1000.00),
('Jeans Shorts','Clothing',45.00),
('Office Chair','Furniture',200.00),
('Gaming Chair','Furniture',350.00),
('Yoga Mat','Accessories',30.00),
('Electric Kettle','Home Appliances',55.00),
('Desk Organizer','Accessories',20.00),
('Ring','Accessories',150.00);

-- =====================================
-- INSERT SALES (200 rows)
-- =====================================
INSERT INTO sales (customer_id, product_id, quantity, sale_date, sale_time, payment_method, rating, profit_margin) VALUES
(1,1,1,'2025-08-01','10:00:00','Credit Card',4.5,200.00),
(2,2,2,'2025-08-01','10:30:00','Cash',4.0,150.00),
(3,3,1,'2025-08-02','11:00:00','Debit Card',4.7,50.00),
(4,4,3,'2025-08-02','11:15:00','UPI',4.2,75.00),
(5,5,1,'2025-08-03','12:00:00','Credit Card',4.8,40.00),
(6,6,2,'2025-08-03','12:30:00','Cash',4.3,60.00),
(7,7,1,'2025-08-04','13:00:00','Debit Card',4.6,35.00),
(8,8,2,'2025-08-04','13:15:00','UPI',4.4,50.00),
(9,9,1,'2025-08-05','14:00:00','Credit Card',4.7,20.00),
(10,10,3,'2025-08-05','14:30:00','Cash',4.5,60.00),
(11,11,1,'2025-08-06','10:00:00','Credit Card',4.5,45.00),
(12,12,2,'2025-08-06','10:30:00','Debit Card',4.6,30.00),
(13,13,1,'2025-08-07','11:00:00','UPI',4.4,35.00),
(14,14,2,'2025-08-07','11:30:00','Cash',4.2,40.00),
(15,15,3,'2025-08-08','12:00:00','Credit Card',4.7,50.00),
(16,16,2,'2025-08-08','12:30:00','Debit Card',4.5,25.00),
(17,17,1,'2025-08-09','13:00:00','UPI',4.3,40.00),
(18,18,3,'2025-08-09','13:30:00','Cash',4.6,60.00),
(19,19,1,'2025-08-10','10:15:00','Credit Card',4.7,35.00),
(20,20,2,'2025-08-10','10:45:00','Debit Card',4.5,50.00),
(21,21,1,'2025-08-11','11:00:00','UPI',4.4,45.00),
(22,22,2,'2025-08-11','11:30:00','Cash',4.3,30.00),
(23,23,3,'2025-08-12','12:00:00','Credit Card',4.7,55.00),
(24,24,1,'2025-08-12','12:30:00','Debit Card',4.6,40.00),
(25,25,2,'2025-08-13','13:00:00','UPI',4.5,50.00),
(26,26,1,'2025-08-13','13:30:00','Cash',4.4,35.00),
(27,27,2,'2025-08-14','10:00:00','Credit Card',4.6,45.00),
(28,28,3,'2025-08-14','10:30:00','Debit Card',4.5,60.00),
(29,29,1,'2025-08-15','11:00:00','UPI',4.4,25.00),
(30,30,2,'2025-08-15','11:30:00','Cash',4.7,50.00),
(31,31,1,'2025-08-16','12:00:00','Credit Card',4.5,45.00),
(32,32,3,'2025-08-16','12:30:00','Debit Card',4.3,60.00),
(33,33,2,'2025-08-17','13:00:00','UPI',4.6,40.00),
(34,34,1,'2025-08-17','13:30:00','Cash',4.4,35.00),
(35,35,2,'2025-08-18','10:00:00','Credit Card',4.7,50.00),
(36,36,1,'2025-08-18','10:30:00','Debit Card',4.5,45.00),
(37,37,3,'2025-08-19','11:00:00','UPI',4.6,55.00),
(38,38,2,'2025-08-19','11:30:00','Cash',4.4,35.00),
(39,39,1,'2025-08-20','12:00:00','Credit Card',4.7,50.00),
(40,40,3,'2025-08-20','12:30:00','Debit Card',4.5,60.00),
(41,41,1,'2025-08-21','13:00:00','UPI',4.6,40.00),
(42,42,2,'2025-08-21','13:30:00','Cash',4.3,35.00),
(43,43,3,'2025-08-22','10:00:00','Credit Card',4.7,50.00),
(44,44,1,'2025-08-22','10:30:00','Debit Card',4.5,45.00),
(45,45,2,'2025-08-23','11:00:00','UPI',4.4,35.00),
(46,46,3,'2025-08-23','11:30:00','Cash',4.6,60.00),
(47,47,1,'2025-08-24','12:00:00','Credit Card',4.5,40.00),
(48,48,2,'2025-08-24','12:30:00','Debit Card',4.7,55.00),
(49,49,3,'2025-08-25','13:00:00','UPI',4.4,35.00),
(50,49,1,'2025-08-25','13:30:00','Cash',4.6,50.00),
(51,1,2,'2025-08-26','10:00:00','Credit Card',4.5,60.00),
(52,2,1,'2025-08-26','10:30:00','Debit Card',4.6,40.00),
(53,3,3,'2025-08-27','11:00:00','UPI',4.7,55.00),
(54,4,1,'2025-08-27','11:30:00','Cash',4.4,35.00),
(55,5,2,'2025-08-28','12:00:00','Credit Card',4.6,50.00),
(56,6,1,'2025-08-28','12:30:00','Debit Card',4.5,45.00),
(57,7,3,'2025-08-29','13:00:00','UPI',4.4,55.00),
(58,8,2,'2025-08-29','13:30:00','Cash',4.6,50.00),
(59,9,1,'2025-08-30','10:00:00','Credit Card',4.5,45.00),
(60,10,2,'2025-08-30','10:30:00','Debit Card',4.7,55.00),
(61,11,1,'2025-08-31','11:00:00','UPI',4.6,40.00),
(62,12,2,'2025-08-31','11:30:00','Cash',4.3,35.00),
(63,13,3,'2025-09-01','12:00:00','Credit Card',4.7,50.00),
(64,14,1,'2025-09-01','12:30:00','Debit Card',4.5,45.00),
(65,15,2,'2025-09-02','13:00:00','UPI',4.4,35.00),
(66,16,3,'2025-09-02','13:30:00','Cash',4.6,60.00),
(67,17,1,'2025-09-03','10:00:00','Credit Card',4.5,40.00),
(68,18,2,'2025-09-03','10:30:00','Debit Card',4.7,55.00),
(69,19,3,'2025-09-04','11:00:00','UPI',4.4,35.00),
(70,20,1,'2025-09-04','11:30:00','Cash',4.6,50.00),
(71,21,2,'2025-09-05','12:00:00','Credit Card',4.5,45.00),
(72,22,3,'2025-09-05','12:30:00','Debit Card',4.7,55.00),
(73,23,1,'2025-09-06','13:00:00','UPI',4.6,40.00),
(74,24,2,'2025-09-06','13:30:00','Cash',4.3,35.00),
(75,25,3,'2025-09-07','10:00:00','Credit Card',4.7,50.00),
(1,2,2,'2025-09-20','11:00:00','UPI',4.6,55.00),
(2,3,1,'2025-09-20','11:30:00','Cash',4.4,35.00),
(3,4,3,'2025-09-21','12:00:00','Credit Card',4.7,50.00),
(4,5,2,'2025-09-21','12:30:00','Debit Card',4.5,45.00),
(5,6,1,'2025-09-22','13:00:00','UPI',4.6,40.00),
(6,7,2,'2025-09-22','13:30:00','Cash',4.3,35.00),
(7,8,3,'2025-09-23','10:00:00','Credit Card',4.7,50.00),
(8,9,1,'2025-09-23','10:30:00','Debit Card',4.5,45.00),
(9,10,2,'2025-09-24','11:00:00','UPI',4.4,35.00),
(10,11,3,'2025-09-24','11:30:00','Cash',4.6,60.00),
(11,12,1,'2025-09-25','12:00:00','Credit Card',4.5,40.00),
(12,13,2,'2025-09-25','12:30:00','Debit Card',4.7,55.00),
(13,14,3,'2025-09-26','13:00:00','UPI',4.4,35.00),
(14,15,1,'2025-09-26','13:30:00','Cash',4.6,50.00),
(15,16,2,'2025-09-27','10:00:00','Credit Card',4.5,45.00),
(16,17,3,'2025-09-27','10:30:00','Debit Card',4.7,55.00),
(17,18,1,'2025-09-28','11:00:00','UPI',4.6,40.00),
(18,19,2,'2025-09-28','11:30:00','Cash',4.3,35.00),
(19,20,3,'2025-09-29','12:00:00','Credit Card',4.7,50.00),
(20,21,1,'2025-09-29','12:30:00','Debit Card',4.5,45.00),
(21,22,2,'2025-09-30','13:00:00','UPI',4.4,35.00),
(22,23,3,'2025-09-30','13:30:00','Cash',4.6,60.00),
(23,24,1,'2025-10-01','10:00:00','Credit Card',4.5,40.00),
(24,25,2,'2025-10-01','10:30:00','Debit Card',4.7,55.00),
(25,26,3,'2025-10-02','11:00:00','UPI',4.4,35.00),
(26,27,1,'2025-10-02','11:30:00','Cash',4.6,50.00),
(27,28,2,'2025-10-03','12:00:00','Credit Card',4.5,45.00),
(28,29,3,'2025-10-03','12:30:00','Debit Card',4.7,55.00),
(29,30,1,'2025-10-04','13:00:00','UPI',4.6,40.00),
(30,31,2,'2025-10-04','13:30:00','Cash',4.3,35.00),
(31,32,3,'2025-10-05','10:00:00','Credit Card',4.7,50.00),
(32,33,1,'2025-10-05','10:30:00','Debit Card',4.5,45.00),
(33,34,2,'2025-10-06','11:00:00','UPI',4.4,35.00),
(34,35,3,'2025-10-06','11:30:00','Cash',4.6,60.00),
(35,36,1,'2025-10-07','12:00:00','Credit Card',4.5,40.00),
(36,37,2,'2025-10-07','12:30:00','Debit Card',4.7,55.00),
(37,38,3,'2025-10-08','13:00:00','UPI',4.4,35.00),
(38,39,1,'2025-10-08','13:30:00','Cash',4.6,50.00),
(39,40,2,'2025-10-09','10:00:00','Credit Card',4.5,45.00),
(40,41,3,'2025-10-09','10:30:00','Debit Card',4.7,55.00),
(41,42,1,'2025-10-10','11:00:00','UPI',4.6,40.00),
(42,43,2,'2025-10-10','11:30:00','Cash',4.3,35.00),
(43,44,3,'2025-10-11','12:00:00','Credit Card',4.7,50.00),
(44,45,1,'2025-10-11','12:30:00','Debit Card',4.5,45.00),
(45,46,2,'2025-10-12','13:00:00','UPI',4.4,35.00),
(46,47,3,'2025-10-12','13:30:00','Cash',4.6,60.00),
(47,48,1,'2025-10-13','10:00:00','Credit Card',4.5,40.00),
(48,49,2,'2025-10-13','10:30:00','Debit Card',4.7,55.00);


SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM sales;


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








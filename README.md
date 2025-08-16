# Sales Analytics SQL Project

## Project Overview
This project demonstrates a comprehensive **Sales Analytics System** built using **PostgreSQL**. It simulates a real-world retail environment with customers, products, and sales transactions. The database is designed to capture essential business metrics and generate actionable insights through advanced SQL queries.



## Objectives
- Design a relational database schema for **customers, products, and sales**.  
- Analyze sales data to identify **top-performing customers, products, and regions**.  
- Extract insights using **aggregate functions, window functions, and CTEs**.  
- Generate **business intelligence metrics** such as customer ranking, monthly sales growth, and loyalty analysis.  



## Database Schema

### Customers Table
Stores customer information including demographic data and loyalty membership status.

| Column Name      | Data Type | Description                        |
|-----------------|-----------|------------------------------------|
| customer_id      | SERIAL    | Primary Key                        |
| first_name       | VARCHAR   | Customer first name                |
| last_name        | VARCHAR   | Customer last name                 |
| gender           | VARCHAR   | Gender                             |
| city             | VARCHAR   | City of residence                  |
| age              | INT       | Customer age                       |
| loyalty_member   | BOOLEAN   | Whether the customer is a loyalty member |

### Products Table
Stores product details including pricing and category.

| Column Name    | Data Type | Description          |
|---------------|-----------|--------------------|
| product_id     | SERIAL    | Primary Key        |
| product_name   | VARCHAR   | Name of product    |
| category       | VARCHAR   | Product category   |
| unit_price     | NUMERIC   | Price per unit     |

### Sales Table
Records sales transactions linking customers and products.

| Column Name     | Data Type | Description                  |
|----------------|-----------|------------------------------|
| sale_id         | SERIAL    | Primary Key                  |
| customer_id     | INT       | Foreign Key → customers      |
| product_id      | INT       | Foreign Key → products       |
| quantity        | INT       | Quantity sold                |
| sale_date       | DATE      | Date of sale                 |
| sale_time       | TIME      | Time of sale                 |
| payment_method  | VARCHAR   | Payment type (e.g., Cash, Card) |
| rating          | NUMERIC   | Customer rating (1-5 scale) |
| profit_margin   | NUMERIC   | Profit earned per sale       |



## Key Analytics Queries
1. **Top 3 Customers by Total Spending**  
2. **Monthly Sales Growth Percentage**  
3. **Products with Above-Average Ratings per Category**  
4. **Customers with Highest Single-Sale Profit**  
5. **Rank Customers by Total Quantity Purchased**  
6. **Total Sales per City and Top City per Month**  
7. **Average Purchase Interval per Customer**  
8. **Top-Selling Product per Category**  
9. **Loyalty Members with Highest Average Ratings**  
10. **Cumulative Sales per Product**  
11. **Payment Method Preference per City**  
12. **Customers Who Spent Above Category Average**  
13. **Products with Least Sales in Last 3 Months**  
14. **Highest Profit Margin Product per Month**  
15. **Average Sales per Age Group**  
16. **Top 2 Customers per Product Category**

These queries leverage **CTEs, window functions, subqueries, and aggregations** to provide deep insights into customer behavior, product performance, and sales trends.



## Technical Skills Demonstrated
- Database Design & Normalization  
- SQL Joins and Relationships  
- Aggregate and Window Functions (`SUM`, `AVG`, `ROW_NUMBER`, `RANK`, `LAG`)  
- Common Table Expressions (CTEs)  
- Data Analysis & Business Insights  



## Potential Enhancements
- Integrate **real-world datasets** for realistic insights.  
- Connect with **Python or Tableau** for data visualization dashboards.  
- Add **predictive analytics** for sales forecasting using historical trends.  


## Conclusion
This project showcases the ability to design a relational database and perform **complex analytical queries**. It demonstrates skills in **data modeling, SQL mastery, and deriving actionable business insights**, making it highly relevant for analytics-focused roles.

CREATE TABLE swiggy_orders (
    state TEXT,
    city TEXT,
    order_date DATE,
    restaurant_name TEXT,
    location TEXT,
    category TEXT,
    dish_name TEXT,
    price_inr NUMERIC(10,2),
    rating NUMERIC(3,2),
    rating_count INTEGER
);

SELECT COUNT(*) AS total_rows
FROM swiggy_orders;

---view first 10 rows---
SELECT *FROM swiggy_orders LIMIT 10;

---check table structure---
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'swiggy_orders';

---data cleaning(check for null values)---
SELECT
COUNT(*) FILTER (WHERE state IS NULL) AS state_null,
COUNT(*) FILTER (WHERE city IS NULL) AS city_null,
COUNT(*) FILTER (WHERE order_date IS NULL) AS date_null,
COUNT(*) FILTER (WHERE restaurant_name IS NULL) AS restaurant_null,
COUNT(*) FILTER (WHERE category IS NULL) AS category_null,
COUNT(*) FILTER (WHERE price_inr IS NULL) AS price_null,
COUNT(*) FILTER (WHERE rating IS NULL) AS rating_null,
COUNT(*) FILTER (WHERE rating_count IS NULL) AS ratingcount_null
FROM swiggy_orders;

---check duplicate records---
SELECT COUNT(*) - COUNT(DISTINCT (
    state,
    city,
    order_date,
    restaurant_name,
    location,
    category,
    dish_name,
    price_inr,
    rating,
    rating_count
)) AS duplicate_rows
FROM swiggy_orders;

---check date range---
SELECT
MIN(order_date) AS first_date,
MAX(order_date) AS last_date
FROM swiggy_orders;

---add primary key---
ALTER TABLE swiggy_orders
ADD COLUMN order_id BIGSERIAL PRIMARY KEY;

---add month,quarter, year columns---
ALTER TABLE swiggy_orders
ADD COLUMN order_year INT,
ADD COLUMN order_month VARCHAR(20),
ADD COLUMN order_quarter VARCHAR(10);

---update values---
UPDATE swiggy_orders
SET
order_year = EXTRACT(YEAR FROM order_date),
order_month = TO_CHAR(order_date, 'Month'),
order_quarter = CONCAT('Q', EXTRACT(QUARTER FROM order_date));

SELECT order_date, order_year, order_month, order_quarter
FROM swiggy_orders
LIMIT 10;

---KPI-1: Total revenue---
SELECT ROUND(SUM(price_inr),2) AS total_revenue
FROM swiggy_orders;

---KPI-2: Total orders---
SELECT COUNT(*) AS total_orders
FROM swiggy_orders;

---KPI-3: average order value---
SELECT ROUND(AVG(price_inr),2) AS average_order_value
FROM swiggy_orders;

---KPI-4:Total restaurants---
SELECT COUNT(DISTINCT restaurant_name) AS restaurants
FROM swiggy_orders;

---KPI-5:Total cities---
SELECT COUNT(DISTINCT city) AS cities
FROM swiggy_orders;

---KPI-6:average ratings---
SELECT ROUND(AVG(rating),2) AS average_rating
FROM swiggy_orders;

---KPI-7:highest rated restaurant---
SELECT
restaurant_name,
ROUND(AVG(rating),2) AS rating
FROM swiggy_orders
GROUP BY restaurant_name
ORDER BY rating DESC
LIMIT 10;

---KPI-8:top revenue restaurant---
SELECT
restaurant_name,
ROUND(SUM(price_inr),2) AS revenue
FROM swiggy_orders
GROUP BY restaurant_name
ORDER BY revenue DESC
LIMIT 10;

---KPI-9:top revenue city---
SELECT
city,
ROUND(SUM(price_inr),2) AS revenue
FROM swiggy_orders
GROUP BY city
ORDER BY revenue DESC
LIMIT 10;

---KPI-10:most ordered category---
SELECT
category,
COUNT(*) AS orders
FROM swiggy_orders
GROUP BY category
ORDER BY orders DESC;

---top 10 states by revenue---
SELECT
state,
ROUND(SUM(price_inr),2) revenue
FROM swiggy_orders
GROUP BY state
ORDER BY revenue DESC;

---top 10 dishes---
SELECT
dish_name,
COUNT(*) orders,
ROUND(SUM(price_inr),2) revenue
FROM swiggy_orders
GROUP BY dish_name
ORDER BY revenue DESC
LIMIT 10;

---monthly revenue trend---
SELECT
dish_name,
COUNT(*) orders,
ROUND(SUM(price_inr),2) revenue
FROM swiggy_orders
GROUP BY dish_name
ORDER BY revenue DESC
LIMIT 10;

---monthly order count---
SELECT
DATE_TRUNC('month',order_date)::DATE AS month,
COUNT(*) orders
FROM swiggy_orders
GROUP BY month
ORDER BY month;

---running revenue---
SELECT
order_date,
SUM(price_inr) daily_revenue,
SUM(SUM(price_inr))
OVER(ORDER BY order_date)
AS cumulative_revenue
FROM swiggy_orders
GROUP BY order_date
ORDER BY order_date;

---top 5 restaurants in every city---
SELECT *
FROM
(
SELECT
city,
restaurant_name,
SUM(price_inr) revenue,
ROW_NUMBER()
OVER(PARTITION BY city ORDER BY SUM(price_inr) DESC) rank
FROM swiggy_orders
GROUP BY city,restaurant_name
)t
WHERE rank<=5;

---dashboard view---
CREATE VIEW kpi_dashboard AS
SELECT
COUNT(*) total_orders,
COUNT(DISTINCT restaurant_name) restaurants,
COUNT(DISTINCT city) cities,
ROUND(SUM(price_inr),2) total_revenue,
ROUND(AVG(price_inr),2) average_order_value,
ROUND(AVG(rating),2) average_rating
FROM swiggy_orders;
SELECT * FROM kpi_dashboard;

---restaurants performance view---
CREATE VIEW restaurant_performance AS
SELECT
restaurant_name,
city,
ROUND(SUM(price_inr),2) revenue,
ROUND(AVG(rating),2) rating,
SUM(rating_count) reviews
FROM swiggy_orders
GROUP BY restaurant_name,city;
select * from restaurant_performance;

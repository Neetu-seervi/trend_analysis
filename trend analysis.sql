create database online_sales;
use online_sales;
select * from details;
select * from   orderss;

SELECT EXTRACT(MONTH FROM `order date`) AS month
FROM orderss;
SELECT EXTRACT(YEAR FROM `order date`) AS year
FROM orderss;

SELECT *
FROM orderss o
JOIN details d ON o.`order id` = d.`order id`;


SELECT 
  o.`order id`,
  EXTRACT(YEAR FROM o.`order date`) AS year,
  EXTRACT(MONTH FROM o.`order date`) AS month,
  SUM(d.amount) AS total_revenue
FROM orderss o
JOIN details d ON o.`order id` = d.`order id`
GROUP BY o.`order id`, year, month
ORDER BY year, month ;

SELECT 
  DATE_FORMAT(o.`order date`, '%Y-%m') AS order_date,
  COUNT(DISTINCT o.`order id`) AS order_volume
FROM orderss o
JOIN details d ON o.`order id` = d.`order id`
GROUP BY `order date`
ORDER BY `order date`;

SELECT 
  DATE_FORMAT(o.`order date`, '%Y-%m') AS order_date,
  SUM(d.amount) AS total_revenue,
  COUNT(DISTINCT o.`order id`) AS order_volume
FROM orderss o
JOIN details d ON o.`order id`= d.`order id`
GROUP BY `order date`
ORDER BY `order date`;

SELECT 
  o.city,
  d.category,
  SUM(d.amount) AS total_revenue
FROM orderss o
JOIN details d ON o.`order id` = d.`order id`
GROUP BY o.city, d.category
ORDER BY o.city, total_revenue DESC;

SELECT 
  d.category,
  SUM(d.quantity) AS total_quantity
FROM orderss o
JOIN details d ON o.`order id` = d.`order id`
GROUP BY d.category
ORDER BY total_quantity DESC
LIMIT 5;

SELECT 
  o.state,
  SUM(d.amount) AS total_revenue,
  SUM(d.profit) AS total_profit
FROM orderss o
JOIN details d ON o.`order id` = d.`order id`
GROUP BY o.state
ORDER BY total_revenue DESC;

SELECT 
  o.city,
  d.category,
  SUM(d.amount) AS total_revenue
FROM orderss o
JOIN details d ON o.`order id` = d.`order id`
GROUP BY o.city, d.category
ORDER BY o.city, total_revenue DESC;























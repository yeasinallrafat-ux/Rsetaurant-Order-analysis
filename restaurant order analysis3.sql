USE restaurant_db;
-- view the menu items table
SELECT * FROM menu_items;
-- Find The number of items on the menu
SELECT COUNT(*) FROM menu_items;
-- Find the most expensive menu on the item
-- For least expensive items:
SELECT * FROM menu_items
ORDER BY price;
-- For the most expensive items
SELECT * FROM menu_items
ORDER BY price DESC;
-- How many italian dishes are on the menu?
SELECT count(*) FROM menu_items
WHERE category= "italian";
-- What are the least and most expensive italian dishes on the menu?
-- for least expensive italian items
SELECT * FROM menu_items
WHERE category= "italian"
ORDER BY price;
-- for the most expensive italian items
SELECT * FROM menu_items
WHERE category= "italian"
ORDER BY price DESC;
-- How many dishes are in each category?
SELECT category, COUNT(menu_item_id) AS num_dishes
FROM menu_items
GROUP BY category;
-- what is the average dish price within each category?
SELECT category, avg(price) AS avg_price
FROM menu_items
GROUP BY category;
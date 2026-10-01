-- combine the menu_items and order_details tables into a single table.
SELECT * FROM menu_items; 
SELECT * FROM order_details;

SELECT *
FROM order_details od LEFT JOIN menu_items mi 
	ON od.item_id = mi.menu_item_id;
-- What were the least and most ordered items? what categories were they in?
-- Least ordered items.
SELECT item_name, category, COUNT(order_details_id) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi 
	ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases;
-- Most ordered items
SELECT item_name, category, COUNT(order_details_id) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi 
	ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases DESC;
-- what were the top 5 orders that spent the most money?
SELECT order_id, SUM(price) AS total_spend
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spend DESC
LIMIT 5;
-- view the details of the highest spend order, what insights can you gather from the results?
SELECT order_id,
    mi.category,
    COUNT(od.item_id) AS num_items
FROM order_details od
LEFT JOIN menu_items mi
    ON od.item_id = mi.menu_item_id
WHERE od.order_id IN ( 440, 2075, 1957,330,2675)
GROUP BY order_id, mi.category;

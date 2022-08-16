USE northwind;

# EJERCICIO 1: Extraed información de los productos "Beverages"

SELECT product_id, product_name, category_id
FROM products
WHERE category_id IN (
SELECT category_id
FROM categories
WHERE category_name = "Beverages");

# EJERCICIO 2: Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país

SELECT DISTINCT(country)
FROM customers
WHERE country NOT IN(
SELECT DISTINCT(country)
FROM suppliers);

# EJERCICIO 3: Extraer los clientes que compraron mas de 20 articulos "Grandma's Boysenberry Spread"

SELECT order_id, customer_id
FROM orders
WHERE order_id IN
(SELECT order_id
FROM order_details
WHERE quantity > 20 AND product_id IN
(SELECT product_id
FROM products
WHERE product_name = "Grandma's Boysenberry Spread"))
ORDER BY customer_id;

# EJERCICIO 4: Extraer los 10 productos más caros

SELECT product_name, unit_price
FROM products
WHERE unit_price IN (
SELECT DISTINCT(unit_price)
FROM order_details)
ORDER BY unit_price DESC
LIMIT 10;

# CONSULTA SIMPLE

SELECT product_name, unit_price
FROM products
ORDER BY unit_price DESC
LIMIT 10;

# BONUS: Extraed cuál es el producto que más ha sido comprado y la cantidad que se compró

SELECT products.product_name, SUM(order_details.quantity) AS cantidad_Ventas
FROM order_details
INNER JOIN products
ON order_details.product_id = products.product_id
GROUP BY  order_details.product_id
ORDER BY cantidad_Ventas DESC
LIMIT 1;


USE northwind;

# EJERCICIO 1: Extraer los pedidos por empresa de UK

SELECT customers.customer_id AS identificador, customers.company_name AS nombre_empresa, COUNT(orders.order_id) AS numero_pedidos
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
WHERE customers.country = "UK"
GROUP BY customers.company_name;

# EJERCICIO 2: Extraer la cantidad de productos pedidos por empresa de UK por año:

SELECT customers.company_name AS empresa, YEAR(orders.order_date) AS Año, SUM(order_details.quantity) AS cantidad_productos
FROM orders
	INNER JOIN customers
		ON orders.customer_id = customers.customer_id
	INNER JOIN order_details
		ON order_details.order_id = orders.order_id
WHERE country = "UK"
GROUP BY empresa, Año;

# EJERCICIO 3: Extraer el dinero perdido por pedidos en empresas de UK

SELECT customers.company_name AS empresa, YEAR(orders.order_date) AS Año, SUM(order_details.quantity) AS cantidad_productos, 
SUM(order_details.unit_price*order_details.quantity) - SUM(order_details.unit_price*order_details.quantity*order_details.discount) AS dinero_perdido
FROM orders
	INNER JOIN customers
		ON orders.customer_id = customers.customer_id
	INNER JOIN order_details
		ON order_details.order_id = orders.order_id
WHERE country = "UK"
GROUP BY empresa, Año;

# BONUS 1: Extraer los pedidos que ha realizado cada compañía de UK y su fecha

SELECT orders.order_id, customers.company_name, orders.order_date
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id;

# BONUS 2: Extraer cada tipo de producto que se han vendido, sus categorías, nombre de la categoría 
# y el nombre del producto, y el total de dinero por el que se ha vendido cada tipo de producto (teniendo en cuenta los descuentos).

SELECT categories.category_id, categories.category_name, products.product_name, 
ROUND(SUM(order_details.unit_price*order_details.quantity*(1-order_details.discount)), 2) AS product_sales
FROM categories
	INNER JOIN products
		ON categories.category_id = products.category_id
	INNER JOIN order_details
		ON products.product_id = order_details.product_id
GROUP BY order_details.product_id
ORDER BY products.product_name;



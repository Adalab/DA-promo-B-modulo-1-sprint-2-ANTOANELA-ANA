use northwind;

# ejercicio 1: pedidos por empresa UK

SELECT customers.customer_id AS identificador, customers.company_name AS nombre_empresa, COUNT(orders.order_id) AS numero_pedidos
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
WHERE customers.country = "UK"
GROUP BY customers.company_name;

# ejercicio 2: productos pedidos por empresa en UK por año:

SELECT customers.company_name AS empresa, YEAR(orders.order_date) AS Año, SUM(order_details.quantity) AS cantidad_productos
FROM orders
	INNER JOIN customers
		ON orders.customer_id = customers.customer_id
	INNER JOIN order_details
		ON order_details.order_id = orders.order_id
WHERE country = "UK"
GROUP BY empresa, Año;

-- ejercicio 3:

	

# ejercicio 3: dinero perdido por pedidos en empresas de UK

SELECT customers.company_name AS empresa, YEAR(orders.order_date) AS Año, SUM(order_details.quantity) AS cantidad_productos, 
SUM(order_details.unit_price*order_details.quantity) - SUM(order_details.unit_price*order_details.quantity*order_details.discount) AS dinero_perdido
FROM orders
	INNER JOIN customers
		ON orders.customer_id = customers.customer_id
	INNER JOIN order_details
		ON order_details.order_id = orders.order_id
WHERE country = "UK"
GROUP BY empresa, Año;





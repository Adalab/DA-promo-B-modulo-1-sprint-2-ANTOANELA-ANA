use northwind;

# ejercicio 1: pedidos por empresa UK

SELECT customers.customer_id AS identificador, customers.company_name AS nombre_empresa, COUNT(orders.order_id) AS numero_pedidos
FROM customers
CROSS JOIN orders
WHERE customers.customer_id = orders.customer_id AND customers.country = "UK"
GROUP BY customers.company_name;

# ejercicio 2: productos pedidos por empresa en UK por año:

SELECT customers.company_name, YEAR(orders.order_date), COUNT(order_details.quantity)
FROM orders
	INNER JOIN order_details 
		ON orders.order_id = order_details.order_id
	INNER JOIN customers 
		ON customers.customer_id = orders.customer_id
	
WHERE customers.country = "UK"
GROUP BY customers.company_name AND  YEAR(orders.order_date);






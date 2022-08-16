USE northwind;

# EJERCICIO 1: Extraer en una CTE todos los nombres de las compañias y los id de los clientes

WITH companias_clientes
AS (
	SELECT company_name, customer_id
    FROM customers)
SELECT *
FROM companias_clientes;


# EJERCICIO 2: Selecciona solo los de que vengan de "Germany"

WITH companias_clientes
AS (
	SELECT company_name, customer_id, country
    FROM customers
    WHERE country = 'Germany')
SELECT *
FROM companias_clientes;


# EJERCICIO 3: Extraed el id de las facturas y su fecha de cada cliente.
# En este caso queremos extraer todas las facturas que se han emitido a un cliente, su fecha, la compañia

WITH facturas_clientes (facturas_emitidas, fecha_factura, customer_id, compañía) 
AS (SELECT orders.order_id, orders.order_date, customers.customer_id, customers.company_name
	FROM orders
    INNER JOIN customers)
SELECT *
FROM facturas_clientes;

# EJERCICIO 4: Contad el número de facturas por cliente
-- Mejoremos la query anterior. En este caso queremos saber el número de facturas emitidas por cada cliente.

WITH facturas_clientes (facturas_emitidas, fecha_factura, customer_id, compañía) 
AS (SELECT orders.order_id, orders.order_date, customers.customer_id, customers.company_name
	FROM orders
    INNER JOIN customers)
SELECT customer_id, COUNT(order_id) AS cantidad_de_facturas
FROM orders
GROUP BY customer_id
ORDER BY cantidad_de_facturas;


# EJERCICIO 5: Cuál la cantidad media pedida de todos los productos ProductID.
-- Necesitaréis extraer la suma de las cantidades por cada producto y calcular la media.

WITH cantidad AS (
SELECT  product_id,  SUM(quantity) AS cantidad_productos
FROM order_details
GROUP BY product_id)
SELECT AVG(cantidad_productos) AS cantidad_media
FROM cantidad;




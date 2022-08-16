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
	SELECT company_name, customer_id
    FROM customers
    WHERE country = 'Germany')
SELECT *
FROM companias_clientes;


# EJERCICIO 3: Extraed el id de las facturas y su fecha de cada cliente.
# En este caso queremos extraer todas las facturas que se han emitido a un cliente, su fecha, la compañia

WITH facturas
AS (
    SELECT orders.order_id, customers.customer_id, customers.company_name, orders.order_date
    FROM orders
    INNER JOIN customers
    ON orders.customer_id = customers.customer_id)
SELECT *
FROM facturas;

# EJERCICIO 4: Contad el número de facturas por cliente

WITH facturas
AS (
    SELECT orders.order_id, customers.customer_id, customers.company_name, orders.order_date
    FROM orders
    INNER JOIN customers
    ON orders.customer_id = customers.customer_id)
SELECT customer_id, COUNT(order_id) AS cantidad_de_facturas
FROM facturas
GROUP BY customer_id
ORDER BY cantidad_de_facturas;


# EJERCICIO 5: Cuál la cantidad media pedida de todos los productos ProductID.

WITH cantidad AS (
    SELECT  product_id,  SUM(quantity) AS cantidad_productos
    FROM order_details
    GROUP BY product_id)
SELECT AVG(cantidad_productos) AS cantidad_media
FROM cantidad;




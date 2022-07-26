# Seleccionamos la base de datos

USE northwind;

# EJERCICIO 1: Realizar una consulta que nos devuelva el nombre de todas las empresas clientes, los IDs de los pedidos y las fechas de los pedidos

SELECT orders.order_id, customers.company_name, orders.order_date
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;

# EJERCICIO 2: Realizar una consulta que nos devuelva la cantidad de pedidos por cliente en UK

SELECT customers.company_name, COUNT(orders.order_id) AS numero_pedidos
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE country = "UK"
GROUP BY customers.company_name;

# EJERCICIO 3: Realizar una consulta que nos devuelva los nombres de las empresas de UK, con pedidos o no, junto con los ids de todos los pedidos que han realizado, 
# el nombre de contacto de cada empresa y la fecha del pedido. 

SELECT orders.order_id, customers.company_name, customers.contact_name,  orders.order_date
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE country = "UK";

# EJERCIIO 4: Realizar una consulta que nos devuelva los datos de todas las empleadas y sus supervisoras.

SELECT A.first_name AS Nombre_empleada, A.last_name AS Apellido_empleada, A.city AS ubicacion_empleada, B.first_name AS Nombre_supervisor, B.last_name AS Apellido_supervisor, B.city AS ubicacion_supervisor  
FROM employees A, employees B  
WHERE B.employee_id = A.reports_to;  


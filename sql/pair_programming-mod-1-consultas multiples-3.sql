use northwind;

# EJERCICIO 1: Extraer toda la info sobre las compañias que tengamos en la bbdd

SELECT city, company_name, contact_name, "customers" AS relationship
FROM customers
UNION
SELECT city, company_name, contact_name, "suppliers" AS relationship
FROM suppliers
ORDER BY city;

# EJERCICIO 2: Extraer todos los pedidos gestionados por Nancy Davolio

SELECT *
FROM orders
WHERE employee_id IN
(SELECT employee_id
FROM employees
WHERE last_name = 'Davolio' AND first_name = 'Nancy');

# EJERCICIO 3: Extraed todas las empresas que no han comprado en 1997

SELECT company_name, country
FROM customers
WHERE customer_id NOT IN (
 SELECT customer_id
 FROM orders
 WHERE YEAR(order_date) = 1997);
 
 # EJERCICIO 4: Extraed toda la información de los pedidos donde tengamos "Konbu"
 
 SELECT *
 FROM orders AS pedidos
 WHERE order_id IN (
	SELECT order_id
    FROM products
    INNER JOIN order_details
    ON order_details.product_id = products.product_id
    WHERE product_name = "Konbu");
 
 






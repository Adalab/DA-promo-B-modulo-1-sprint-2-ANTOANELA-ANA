USE northwind;

# EJERCICIO 1: Extraed los pedidos con el máximo "order_date" para cada empleado.

SELECT O1.order_id, O1.customer_id, O1.employee_id, O1.order_date, O1.required_date 
FROM orders AS O1
WHERE order_date >= (
SELECT MAX(order_date)
FROM orders AS O2
WHERE O1.employee_id = O2.employee_id
GROUP BY employee_id);

# EJERCICIO 2: Extraer el precio unitario máximo (unit_price) de cada producto vendido.

# CONSULTA SIMPLE 

SELECT  product_id, MAX(unit_price)
FROM order_details 
GROUP BY product_id
ORDER BY product_id;

# CONSULTA AGREGADA

SELECT product_id, MAX(unit_price)
FROM order_details
WHERE product_id IN (
SELECT product_id
FROM products)
GROUP BY product_id
ORDER BY product_id;

# EJERCICIO 3: Extraer las ciudades que empiezan con "A" o "B".

SELECT city, company_name, contact_name
FROM customers AS C
WHERE city REGEXP '^[A-B]'
ORDER BY city;

# EJERCICIO 4: Extraer el número de pedidos que han hecho en las ciudades que empiezan con L.

SELECT city, company_name, contact_name
FROM customers AS C
WHERE city LIKE 'L%' = (
SELECT COUNT(order_id)
FROM orders AS O
WHERE C.customer_id = O.customer_ID
GROUP BY customer_id)
ORDER BY city;

# EJERCICIO 5: Extraer todos los clientes cuyo "contact_title" no incluya "Sales".

SELECT  contact_name, contact_title, company_name
FROM customers 
WHERE contact_title NOT LIKE '%Sales%';

# EJERCICIO 6: Extraer todos los clientes que no tengan una "A" en segunda posición en su nombre.

SELECT contact_name
FROM customers
WHERE contact_name NOT LIKE '_A%';
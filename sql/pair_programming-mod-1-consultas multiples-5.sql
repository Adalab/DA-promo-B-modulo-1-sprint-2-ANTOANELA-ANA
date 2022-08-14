USE northwind;

# EJERCICIO 1

SELECT O1.order_id, O1.customer_id, O1.employee_id, O1.order_date, O1.required_date 
FROM orders AS O1
WHERE order_date >= (
SELECT MAX(order_date)
FROM orders AS O2
WHERE O1.employee_id = O2.employee_id
GROUP BY employee_id);

# EJERCICIO 2
HAY QUE HACER UN JOIN 

SELECT  product_id, MAX(unit_price)
FROM order_details 
GROUP BY product_id
ORDER BY product_id;

# EJERCICIO 3

SELECT city, company_name, contact_name
FROM customers AS C
WHERE city REGEXP '^[A-B]'
ORDER BY city;

# EJERCICIO 4
SELECT city, company_name, contact_name
FROM customers AS C
WHERE city LIKE 'L%' = (
SELECT COUNT(order_id)
FROM orders AS O
WHERE C.customer_id = O.customer_ID
GROUP BY customer_id)
ORDER BY city;
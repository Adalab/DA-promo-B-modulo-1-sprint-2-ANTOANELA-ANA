USE northwind;

# EJERCICIO 1: CANTIDAD DE PEDIDOS Y MAX FREIGHT POR EMPLEADO 

SELECT COUNT(order_id) AS cantidad_de_pedidos, MAX(freight), employee_id
FROM orders
GROUP BY employee_id;

# EJERCICIO 2: DESCARTAR PEDIDOS SIN FECHA Y ORDENAR

SELECT COUNT(order_id) AS cantidad_de_pedidos, MAX(freight), employee_id
FROM orders
WHERE shipped_date != "0000-00-00 00:00:00" 
GROUP BY employee_id
ORDER BY employee_id ASC;

# EJERCICIO 3: CANTIDAD DE PEDIDOS SEGÚN FECHAS

SELECT COUNT(order_id) AS cantidad_de_pedidos, DAY(order_date) as Día, MONTH(order_date) AS Mes, YEAR(order_date) AS Año
FROM orders
GROUP BY order_date;

# EJERCICIO 4: NUMERO DE PEDIDOS POR MES Y AÑO

SELECT COUNT(order_id) AS cantidad_de_pedidos, MONTH(order_date) AS Mes, YEAR(order_date) AS Año
FROM orders
GROUP BY MONTH(order_date);

# EJERCICIO 5: SELECCIONAR CIUDADES CON 4 O MÁS EMPLEADOS

SELECT COUNT(employee_id), city
FROM employees
GROUP BY city
HAVING COUNT(employee_id) >= 4;

# EJERCICIO 6: CREAR COLUMNA QUE CLASIFIQUE LOS PEDIDOS SEGUN COSTES

SELECT order_id, unit_price*quantity AS coste_total,
CASE 
	WHEN unit_price*quantity > 2000 THEN "Alto" 
    ELSE "Bajo"
    END AS Costes
FROM order_details;






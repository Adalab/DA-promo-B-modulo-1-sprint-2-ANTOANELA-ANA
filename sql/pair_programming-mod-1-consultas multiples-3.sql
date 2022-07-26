use northwind;

-- ej 1 extraer toda la info sobre las compañias que tengamos en la bbdd
select city, company_name, contact_name, "customers" as relationship
from customers
union
select city, company_name, contact_name, "suppliers" as relationship
from suppliers;

-- ej 2 extraer todos los pedidos gestionados por Nancy Davolio
select *
from orders
where employee_id = 1;

-- ej 3 extraed todas las empresas que no han comprado en 1997
select customer_id
from orders
where year(order_date) = "1997" not in (
 select company_name, country
 from customers);

-- 4 extraed toda la informacion de los pedidos donde tengamos "konbu"




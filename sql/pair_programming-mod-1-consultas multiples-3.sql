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
select company_name, country
from customers
where customer_id not in (
 select order_date
 from orders
 where year(order_date) = 1997);
 
 -- ej 4 Extraed toda la información de los pedidos donde tengamos "Konbu"
 select *
 from orders as pedidos
 where order_id in (
	select order_id
    from products
    inner join order_details
    on order_details.product_id = products.product_id
    where   product_name = "Konbu");
 
 






--Explore tables
--products
--orders
--order_items
--employees

select * from customers;
select * from products;
select * from orders;
select * from order_items;
select * from employees;



select * from customers
where signup_date > '2022-01-01';

select * from products
order by price desc ;

select COUNT(*)
from customers;

select category,count(*)
from products
group by category;

select * from orders o 
where o.total_amount is null;

--
--Cleaning , Transformation 

--Find duplicates customers 
select email, count(*)
from customers c 
group by c.email 
having count(*) >1;

select distinct order_status
from orders;

update orders o 
set order_status = TRIM(initcap(order_status));

select distinct city 
from customers c ;

update customers c 
set city = case
	when city in ('new york')		then 'New York'
	when city in ('New Yoyk')		then 'New York'
	when city in ('Chciago')		then 'Chicago'
	when c.city in ('Los angeles') 	then 'Los Angeles'
end
where c.city in ('new york','Chciago','Los angeles','New Yoyk');

update customers c 
set 
first_name = initcap(c.first_name ),
last_name = initcap(c.last_name );

update customers c 
set email = LOWER(email);

UPDATE customers c 
SET email = lower(first_name || '.' || last_name || '@email.com')
WHERE email IS DISTINCT FROM lower(first_name || '.' || last_name || '@email.com');
-- Extract
SELECT payment_date FROM payment;

SELECT customer_id ,extract(day from payment_date) AS Day FROM payment;


-- get total spent for each month	
SELECT SUM(amount) AS total_spend, extract(month from payment_date) AS month
FROM payment
GROUP BY month
ORDER BY total_spend DESC; 

--- Math function
SELECT customer_id+rental_id AS new_id
FROM payment;

SELECT rental_id/customer_id AS new_id
FROM payment;

-- String Function
SELECT * FROM customer;

-- concat first name and last name as full name
SELECT first_name ||' '|| last_name AS full_name FROM customer;

SELECT first_name, char_length(first_name) FROM customer;

-- Subquery
/**
* Find the films whose rental rate is higher than the average rental rate
*
* 1. find the average rental rate by using the SELECT statement and average function AVG
* 2. Use the result of the first query in the second SELECT statement to find the films that we want
**/

SELECT title, rental_rate 
FROM film
WHERE rental_rate > (SELECT AVG(rental_rate) FROM film);



select * from rental;
select * from inventory limit 1;








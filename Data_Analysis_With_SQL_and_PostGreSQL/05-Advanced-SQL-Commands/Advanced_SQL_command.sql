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

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


SELECT film_id, title
FROM film
WHERE film_id IN
(SELECT inventory.film_id
FROM rental
INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30');


/**
* SELF-JOIN
**/

-- find out which employees are from the same location as the employee named joe
/**
* Using subquery
*
* Interview question:  https://blog.sqlauthority.com/2016/03/27/self-join-explain-example-interview-question-week-064/
**/
SELECT employee_name FROM employee
WHERE employee_location IN
(SELECT employee_location FROM employee WHERE employee_name="Joe")

-- Use self join
SELECT e1.employee_name
FROM employee AS e1, employee AS e2
WHERE
e1.employee_location = e2.employee_location
AND e2.employee_name = "Joe";


-- find out customer whoes first name matches last name

SELECT c1.customer_id,c1.first_name, c1.last_name, c2.first_name, c2.last_name
FROM customer AS c1, customer AS c2
WHERE c1.first_name = c2.last_name
ORDER BY c1.customer_id;















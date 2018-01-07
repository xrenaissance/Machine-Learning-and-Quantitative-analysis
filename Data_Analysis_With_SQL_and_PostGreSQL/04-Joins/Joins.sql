-- INNER JOIN
SELECT customer.customer_id, first_name,
last_name, email, amount, payment_date
FROM customer
INNER JOIN payment ON payment.customer_id = customer.customer_id
ORDER BY customer.customer_id;

-- add condition
SELECT customer.customer_id, first_name,
last_name, email, amount, payment_date
FROM customer
INNER JOIN payment ON payment.customer_id = customer.customer_id
WHERE customer.customer_id = 2
ORDER BY customer.customer_id;


/**
* By default, JOIN is equivalent to INNER JOIN
**/

-- first name start from A
SELECT customer.customer_id, first_name,
last_name, email, amount, payment_date
FROM customer
INNER JOIN payment ON payment.customer_id = customer.customer_id
WHERE first_name LIKE 'A%'
ORDER BY customer.customer_id;

-- Play with staff table
SELECT payment_id, amount, first_name, last_name
FROM payment
INNER JOIN staff ON payment.staff_id = staff.staff_id;


-- check inventory data
select * from inventory limit 5;
select * from film;

SELECT store_id, title FROM inventory
INNER JOIN film ON inventory.film_id  = film.film_id;

-- find out in store_id 1, the num of each movie rented
SELECT title, COUNT(title) AS copies_at_store1 FROM inventory
INNER JOIN film ON inventory.film_id  = film.film_id
WHERE store_id = 1
GROUP BY title
ORDER BY title;


SELECT film.title, lan.name AS movie_language
FROM film
INNER JOIN language AS lan ON lan.language_id = film.language_id
;



/**
* LEFT OUTER JOIN
**/

SELECT film.film_id, film.title, inventory_id
FROM film
LEFT OUTER JOIN inventory ON inventory.film_id = film.film_id;












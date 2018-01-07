SELECT COUNT(DISTINCT rating) FROM film;

SELECT first_name, last_name
FROM customer
ORDER BY first_name DESC, last_name ASC;

-- PostSQL allows you to search columns that are not in order by
SELECT first_name FROM customer
ORDER BY last_name;

-- get the customer id numbers for the top 10 highest payment amounts
SELECT customer_id, amount
FROM payment
ORDER BY amount DESC
LIMIT 10;


-- Get the titles of the movies with film ids 1-5
SELECT film_id,title
FROM film
WHERE film_id IN (1,2,3,4,5);

SELECT film_id, title, release_year
FROM film
ORDER BY film_id
LIMIT 5;

/**
* We use the BETWEEN operator to match a 
* value against a range of values. e.g.
* value BETWEEN low AND high;
*
* value >= low and value <= hight;
**/

-- payment between 8 to 9
SELECT customer_id , amount 
FROM payment
WHERE amount BETWEEN 8 AND 9;


-- payment not between 8 to 9
SELECT customer_id , amount 
FROM payment
WHERE amount NOT BETWEEN 8 AND 9;


-- all the payments between 2007-02-07 to 2007-02-15
SELECT amount, payment_date FROM payment
WHERE payment_date BETWEEN '2007-02-07' AND '2007-02-15';


--- IN
SELECT customer_id, rental_id, return_date
FROM rental
WHERE customer_id IN (1,2)
ORDER BY return_date DESC;


-- LIKE
/**
* PostgreSQL LIKE
* LIKE is case sensetive, ILIKE is not 
*
* SELECT first_name, last_name
* FROM customer
* WHERE first_name LIKE 'Jen%';
*
* % for matching any sequence of characters
* - for matching any single character.
**/

SELECT first_name, last_name
FROM customer
WHERE first_name LIKE 'Jen%';


-- first name ends with y
SELECT first_name, last_name
FROM customer
WHERE first_name LIKE '%y';

-- er in first name
SELECT first_name, last_name
FROM customer
WHERE first_name LIKE '%er%';


-- any letter followed by her
SELECT first_name, last_name
FROM customer
WHERE first_name LIKE '_her%';

-- name not start with Jen
SELECT first_name, last_name
FROM customer
WHERE first_name NOT LIKE 'Jen%';


-- case insenticisitve ILIKE
SELECT first_name, last_name
FROM customer
WHERE first_name ILIKE 'BaR%';



-- How many payment transactions were greater than $5.00
SELECT COUNT(amount)
FROM payment
WHERE amount > 5;


-- How many actors have a first name that starts with the letter P
SELECT * FROM actor LIMIT 2;

SELECT COUNT(first_name)
FROM actor
WHERE first_name LIKE 'P%';


-- How many unique districts are our customers from?
SELECT * FROM address LIMIT 2;

SELECT COUNT(DISTINCT (district))
FROM address;


-- Retrieve the list of names for those distinct districts from the previous question
SELECT DISTINCT(district)
FROM address;

-- How many films have a rating of R and a replacement cost between $5 and $15?

SELECT COUNT(*)
FROM film
WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;

-- hOW Many films have th word Truman somewhere in the tilte
select * from film;

SELECT COUNT(*)
FROM film
WHERE title LIKE '%Truman%';










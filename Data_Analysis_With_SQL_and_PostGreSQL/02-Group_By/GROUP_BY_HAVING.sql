-- Group By Syntax
-- SELECT column_1, aggregate_function(column_2)
-- FROM table_name
-- GROUP BY column_1;

-- Look at basic data
SELECT * FROM payment
limit 2;

-- Sum of Amount group by customer id
SELECT customer_id, SUM(amount) AS sum_of_amount
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount)
;

-- Who deal with the most trasaction
SELECT staff_id, COUNT(payment_id) as num_of_trasactions
FROM payment
GROUP BY staff_id
ORDER BY COUNT(payment_id);

SELECT staff_id, COUNT(*) as num_of_trasactions
FROM payment
GROUP BY staff_id
ORDER BY COUNT(payment_id);

-- check file table
SELECT * FROM film
limit 5;

-- how many ratings for each rating point
SELECT rating, COUNT(rating) as num_of_rating
FROM film
GROUP BY rating
ORDER BY COUNT(rating);

-- How many counts for each rental_duration period
SELECT rental_duration, COUNT(rental_duration) as num_of_counts
FROM film
GROUP BY rental_duration
ORDER BY COUNT(rental_duration);


-- for each rating, what is the average rental_rate
SELECT rating, AVG(rental_rate) as avg_rental_rate
FROM film
GROUP BY rating
ORDER BY AVG(rental_rate);

-- which staff members handled the most payments
SELECT staff_id, SUM(amount) AS total_amount
FROM payment
GROUP BY staff_id
ORDER BY SUM(amount);


-- how many payments did each staff member handle?
-- how much was the total amount processed by each staff?
SELECT staff_id, COUNT(payment_id) AS num_of_trasactions, SUM(amount) AS total_amount
FROM payment
GROUP BY staff_id
ORDER BY SUM(amount);


/**
* Corporater HQ is auditing our store, they want to know the average 
* replacement cost of movie by rating
*
* e.g. R rated movie have an average replacement cost of $20.33
**/
SELECT * FROM film;

SELECT rating, ROUND(AVG(replacement_cost),2) AS AVG_Replacement
FROM film
GROUP BY rating
ORDER BY AVG(replacement_cost);


/**
* We want to send coupons to the 5 customers who have spent the 
* most amout of money.
* Get me the customer ids of the top 5 spenders.
**/

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
limit 5;


-------------- GROUP BY WITH HAVING CLAUSE -------------------
/**
* SELECT column_1, aggregate_function(column_2)
* FROM table_name
* GROUP BY column_1
* HAVING condition;
**/

-- ONLY SELECT customer who spent more than $200
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 200;


-- Which store has more than 300 customer
SELECT store_id, COUNT(customer_id)
FROM customer
GROUP BY store_id
HAVING COUNT(customer_id) > 300;


-- ONLY look at rating in (R, G, PG)
SELECT rating, AVG(rental_rate)
FROM film
WHERE rating IN ('R', 'G', 'PG')
GROUP BY rating
HAVING AVG(rental_rate) < 3;


/**
* We want to know hwat customers are eligible for
* our platinum credit card. The requirements are that 
* the customer that has at least a total of 40 transaction
* payments.
*
* What customer (by customer_id) ar eeligible for the credit card?
**/

SELECT customer_id, COUNT(payment_id)
FROM payment
GROUP BY customer_id
HAVING COUNT(payment_id) > 40
ORDER BY COUNT(payment_id) DESC;

/**
* When grouped by rating, what movie ratings
* have an average rental duration of more than
* 5 days?
**/
SELECT * FROM film;
SELECT rating, AVG(rental_duration)
FROM film
GROUP BY rating
HAVING AVG(rental_duration) > 5;







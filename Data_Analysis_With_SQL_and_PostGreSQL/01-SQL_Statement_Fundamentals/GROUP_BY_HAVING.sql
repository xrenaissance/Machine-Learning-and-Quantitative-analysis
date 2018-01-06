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








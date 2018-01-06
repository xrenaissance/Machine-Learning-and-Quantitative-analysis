-- Agg Functions

-- Get average amout
SELECT AVG(amount) FROM payment;

-- Using Round to limit the decimal point
SELECT ROUND(AVG(amount), 5) FROM payment;

-- Get minimum amount
SELECT MIN(amount) FROM payment;

-- MAX
SELECT MAX(amount) FROM payment;

-- ORDER BY
SELECT amount FROM payment
ORDER BY amount;

-- COUNT
SELECT COUNT(amount) FROM payment
WHERE amount=0.00;

-- SUM
SELECT SUM(amount) FROM payment;
CREATE VIEW customer_info AS 
SELECT first_name, last_name, email, address, phone
FROM customer
JOIN address
ON customer.address_id = address.address_id;

SELECT * FROM customer_info;


-- ALTER VIEW name_of_view RENAME TO new_name
-- DROP VIEW IF EXISTS name_of_view;
ALTER VIEW customer_info RENAME TO customer_master_list;

SELECT * FROM customer_master_list;

DROP VIEW customer_master_list;
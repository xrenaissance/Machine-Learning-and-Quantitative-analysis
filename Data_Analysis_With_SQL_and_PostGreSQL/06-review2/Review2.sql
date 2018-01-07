SELECT * FROM cd.bookings;
SELECT * FROM cd.facilities;
SELECT * FROM cd.members;

-- 1.How can you retrieve all the information from the cd.facilities table?



-- 2.You want to print out a list of all of the facilities and their cost to members.
-- How would you retrieve a list of only facility names and costs?


-- 3.How can you produce a list of facilities that charge a fee to members?


-- 4.How can you produce a list of facilities that charge a fee to members, 
-- and that fee is less than 1/50th of the monthly maintenance cost? Return
-- the facid, facility name, member cost, and monthly maintenance of the facilities in question.


-- 5. How can you produce a list of all facilities with the word 'Tennis' in their name?



-- 6.How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.


-- 7.How can you produce a list of members who joined after the start of September 2012? Return the memid, surname,
-- firstname, and joindate of the members in question.



-- 8.How can you produce an ordered list of the first 10 surnames in the members table? 
-- The list must not contain duplicates.



-- 9.You'd like to get the signup date of your last member. How can you retrieve this information?


-- 10.Produce a count of the number of facilities that have a cost to guests of 10 or more.



-- 12.Produce a list of the total number of slots booked per facility 
-- in the month of September 2012. Produce an output table consisting 
-- of facility id and slots, sorted by the number of slots.



-- 13.Produce a list of facilities with more than 1000 slots booked. 
-- Produce an output table consisting of facility id and total slots,
--  sorted by facility id.


-- 14.How can you produce a list of the start times for bookings for tennis
-- courts, for the date '2012-09-21'? Return a list of start time and facility
--  name pairings, ordered by the time.


-- 15.How can you produce a list of the start times for bookings by members named 'David Farrell'?
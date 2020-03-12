#Student: Ricardo Oliveira - w0428722

# Query Requirements, using the Sakila database:
USE SAKILA;

# 1.	Create a query that returns all film titles in alphabetical order for the language with ID = 1.
SELECT title
FROM film
WHERE language_id = 1
ORDER BY TITLE ASC;

# 2.	Create a query that will list all the film titles containing the word “Drama” in the description. (You need only to accommodate the displayed spelling of the word.)
SELECT title
FROM film
WHERE description like '%Drama%';

# 3.	Create a query that lists all films with the ratings 'G', 'PG, and 'PG-13' and also do not have an original language ID. Build the query to check for all conditions, regardless of the data. Sort the results alphabetically by rating, then title.
SELECT title
FROM film
WHERE original_language_id IS NULL AND rating = 'G' OR rating = 'pg' OR rating = 'PG-13'
ORDER BY rating ASC, title ASC;

# 4.	Create a query that lists all payment ids for amounts less than $2.99 and after the June 1st, 2005. Sort the results by payment date, then amount.
SELECT payment_id
FROM payment
WHERE amount < '2.99' and payment_date > '2005-06-01'
ORDER BY payment_date asc, amount asc;

# 5.	Create a query that lists all cities who have 'Canada' as a country.  Build the query as if you do not know Canada's country id.  Hint: Remember you can have selects within select queries. Sort the results reverse alphabetically by city name.
SELECT city
FROM city
WHERE COUNTRY_ID = (SELECT country_id FROM country WHERE COUNTRY = 'CANADA')
ORDER BY city DESC;

# 6.	Create a query that returns all films that either start with the letter ‘A’, or end with the letter ‘t’. Suppress any duplicate film names and sort the results in reverse alphabetical order.
SELECT DISTINCT title
from film
WHERE title LIKE 'A%' or title LIKE '%t'
ORDER BY TITLE DESC;

# 7.	*Create a query that returns each customer ID and the count of payments they have made. Make sure you call the second column "count". Sort results by count in reverse order.
SELECT customer_id, COUNT(payment_id) as Count
FROM payment
GROUP BY customer_id
ORDER BY count desc;

# 8.	Create a query that lists the CustomerId and maximum paid by each customer.  Then modify the query to display only those records whose amount was more than $5.99. Sort from highest total to lowest total, then sort by CustomerId from lowest to highest.
SELECT customer_id, max(amount) as Max
FROM payment
WHERE amount > '5.99'
GROUP BY customer_id
ORDER by max(amount) DESC,customer_id asc;

# 9.	Create a query that returns the CustomerId and the total number of items for each rental. Sort the results from the most number of items rented to least number of items rented. Note: this is using a different table from the previous two queries.
SELECT customer_id, COUNT(rental_id) as Count
FROM rental
GROUP BY customer_id
ORDER BY COUNT(RENTAL_ID) DESC;

# 10.	Create a query that returns all customers who have payments with a total over $7.00 and were served by the staff with an ID of 1. Sort the results by customer ID from highest to lowest, then amount lowest to highest.
SELECT customer_id, amount
from payment
WHERE amount > '7.00' and staff_id = '1'
# GROUP BY customer_id, amount -> Why we don't need that?
ORDER BY customer_id DESC, amount ASC;

# 11.	Create a query that lists the CategoryId and count of films (name this column Cat_Count). Restrict your results to only those categories with more than 60 films. Sort the results by the Category Count in descending order.
SELECT category_id, COUNT(ALL film_id) as Cat_Count
from film_category
GROUP BY category_id
HAVING Cat_Count > 60
ORDER BY Cat_Count DESC;

# 12.	*Create a query that returns the names of the films with Actor ID 107.  Sort the movie titles alphabetically.
SELECT title
FROM film INNER JOIN film_actor ON film.film_id = film_actor.film_id
WHERE actor_id = 107
GROUP BY film.film_id, actor_id
ORDER BY title ASC;

# 13.	Create a query that only lists the actor ids from actors that appear in more than 36 films. Sort from largest to smallest amount of films per actor. Rename columns as indicated.
SELECT actor_id, count(film_id) as Film_Count
FROM film_actor
GROUP BY actor_id
HAVING Film_Count > 36
ORDER BY Film_Count desc;

# 14.	Create a query that displays the total of films are not in inventory. Call the single column "Total Not In Inventory".
SELECT COUNT(film.film_id) as "Total Not in Inventory"
FROM film #inner join inventory on film.film_id = inventory.film_id -> Why not worked this way?
WHERE film_id not in (select film_id from inventory); #film.film_id not in (inventory.film_id);

# 15.	Create a query that lists all of the film ids for any movies that contain the actor with the title "RIP CRAWFORD". Do not use the actor's ID in the query. Display Film IDs in Ascending order.
SELECT film_id
FROM film_actor
WHERE actor_id = (select actor_id from actor where concat(first_name, ' ', last_name) = 'RIP CRAWFORD')
ORDER BY film_id asc;
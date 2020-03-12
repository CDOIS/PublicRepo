# Author: Ricardo Oliveira - W0428722
USE sakila;
# 1.	Create a query that displays a list of Sakila stores (IDs) and the first/last name of each store's manager.
SELECT store.store_id, first_name, last_name
FROM store
    INNER JOIN staff ON staff.store_id = store.store_id;

# 2.	Create a query that displays a list of all cities and their associated countries, alphabetized by country.
SELECT city, country.country
FROM city
    INNER JOIN country ON city.country_id = country.country_id
ORDER BY country.country ASC;

# 3.	Create a query that displays the names of every actor and the number of movies they are in. Display the actor's last and first names and sort from most movies to least. Rename columns as indicated.
SELECT last_name, first_name, COUNT(film_actor.film_id) as '#Movies'
FROM film_actor
    INNER JOIN actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
ORDER BY COUNT(film_actor.film_id) desc;

# 4.	Create a query that displays a list of all customers who currently reside in Japan. Show their last and first
#       names, city and country, sorted by city of residence, then by customer last name, first name.
SELECT last_name, first_name, city, country
FROM customer
    INNER JOIN address ON address.address_id = customer.address_id
    INNER JOIN city ON address.city_id = city.city_id
    INNER JOIN country ON city.country_id = country.country_id
WHERE country.country = 'Japan'
GROUP BY customer_id
ORDER BY city, last_name, first_name;

# 5.	Create a query that lists all G-rated movies in which actress Audrey Olivier has appeared. Display the actress' name in a single field named ActorName. Rename other columns as indicated.
SELECT concat(first_name, " " ,last_name) as ActorName, title, rating as "Movie Rating"
FROM actor
    INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
    INNER JOIN film ON film_actor.film_id = film.film_id
WHERE rating = 'G' AND actor.first_name = 'Audrey' AND actor.last_name = 'Olivier'
GROUP BY film.title

# 6.	Create a query that displays the total profits per staff member for rentals returned in July of 2005. Rename columns as indicated.
SELECT first_name, last_name, SUM(amount) as 'Profits on Returned Movies - July 2005'
FROM payment
    INNER JOIN rental ON payment.rental_id = rental.rental_id
    INNER JOIN staff ON payment.staff_id = staff.staff_id
WHERE return_date <= '2005-08-01%' AND return_date >= '2005-06-31%'
GROUP BY staff.staff_id
ORDER BY `Profits on Returned Movies - July 2005` DESC;

# 7.	Create a query that displays which and how many movies are available for rental from store #1, that have an R  rating, are 2 hours or less in run time, and
#       that include deleted scenes as a special feature. Sort by movie length, from shortest to longest. Rename the Available column as indicated.
SELECT title, COUNT(film.film_id) AS "#Available", rating, length, special_features
FROM film
    INNER JOIN inventory on film.film_id = inventory.film_id
WHERE rating = 'R' AND length <= 120 and special_features like '%Deleted Scenes%' AND store_id = 1
GROUP BY title
ORDER BY length ASC;

# 8.	Create a query that displays the top five actors that have made the most rental profits for our store, sorted from largest profit to smallest. Rename columns as indicated.
SELECT last_name, first_name, sum(amount) as 'Total Profit by Actor'
FROM actor
    INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
    INNER JOIN film ON film_actor.film_id = film.film_id
    INNER JOIN inventory ON film.film_id = inventory.film_id
    INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
    INNER JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY actor.actor_id
order by `Total Profit by Actor` desc
LIMIT 5;

# 9.	Create a query that displays all movies from the Action or Comedy categories that were rented by Canadian customers, sorted by movie title.
#       Display the name of the rented movie, its category, the customer's name as a single field and the country. Rename columns as indicated.
SELECT title AS MovieRented, category.name AS Category, concat(customer.first_name, ' ', customer.last_name) AS Customer, country as Country
FROM film
    INNER JOIN film_category ON film.film_id = film_category.film_id
    INNER JOIN category ON film_category.category_id = category.category_id
    INNER JOIN inventory ON film.film_id = inventory.film_id
    INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
    INNER JOIN customer ON rental.customer_id = customer.customer_id
    INNER JOIN address ON customer.address_id = address.address_id
    INNER JOIN city ON address.city_id = city.city_id
    INNER JOIN country ON city.country_id = country.country_id
WHERE category.name = 'Action' OR category.name = 'Comedy'
GROUP BY TITLE, Customer
HAVING Country = 'CANADA'
ORDER BY TITLE ASC;

# 10.	Create a query that displays how many movies were rented by customer Ruby Washington, listed by category.
#       Display the customer's last and first names, the category and how many movies from each category were rented by this customer.
#       Sort by category, then by customer last name. Rename columns as indicated.
SELECT last_name as LastName, first_name as FirstName, category.name as Category, count(rental_id)
FROM customer
    INNER JOIN rental ON customer.customer_id = rental.customer_id
    INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
    INNER JOIN  film ON inventory.film_id = film.film_id
    INNER JOIN film_category on film.film_id = film_category.film_id
    INNER JOIN category on film_category.category_id = category.category_id
where customer.last_name = 'washington' and customer.first_name = 'ruby'
group by category.name
order by category.name, customer.last_name;

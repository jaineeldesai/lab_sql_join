USE sakila;

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.

SELECT c.name as category, COUNT(f.film_id) as total_films
FROM sakila.film_category fc
JOIN sakila.film f
ON fc.film_id=f.film_id
JOIN sakila.category c
ON  fc.category_id=c.category_id
GROUP BY category
ORDER BY category;

-- realised there was no need for film table for this task, however leaving it in

-- 2. Display the total amount rung up by each staff member in August of 2005.

SELECT staff_id, SUM(amount) as amount
FROM sakila.payment
WHERE payment_date BETWEEN "2005-08-01" AND "2005-08-31"
GROUP BY staff_id;

-- 3. Which actor has appeared in the most films?

SELECT fa.actor_id,CONCAT(a.first_name,' ',a.last_name) as actor_name, COUNT(fa.film_id) as total_films
FROM sakila.film_actor fa
JOIN sakila.actor a
ON fa.actor_id=a.actor_id
GROUP BY actor_id
ORDER BY total_films DESC
LIMIT 1;

-- 4. Most active customer (the customer that has rented the most number of films)

SELECT r.customer_id,CONCAT(c.first_name,' ',c.last_name) as cust_name,COUNT(r.rental_id) as total_films_rented
FROM sakila.rental r
JOIN sakila.customer c
ON r.customer_id=c.customer_id
GROUP BY r.customer_id
ORDER BY total_films_rented DESC
LIMIT 1;

-- 5. Display the first and last names, as well as the address, of each staff member.

SELECT s.staff_id, s.first_name,s.last_name, a.address
FROM sakila.staff s
JOIN sakila.address a
ON s.address_id=a.address_id
ORDER BY staff_id;

-- 6. List each film and the number of actors who are listed for that film.

SELECT f.title, COUNT(fa.actor_id) as total_actors
FROM sakila.film f
JOIN sakila.film_actor fa
ON f.film_id= fa.film_id
GROUP BY f.title
ORDER BY f.title;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

SELECT c.customer_id,c.first_name,c.last_name, SUM(p.amount) as total_paid
FROM sakila.payment p
JOIN sakila.customer c
ON p.customer_id=c.customer_id
GROUP BY c.customer_id
ORDER BY c.last_name;

-- 8. List the titles of films per category

SELECT  f.title,c.name as category
FROM sakila.film_category fc
JOIN sakila.film f
ON fc.film_id=f.film_id
JOIN sakila.category c
ON  fc.category_id=c.category_id
ORDER BY category;
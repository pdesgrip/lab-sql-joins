USE Sakila;

-- List the number of films per category.

SELECT c.name AS category, COUNT(film_id) AS number_of_films
FROM category AS c 
JOIN film_category AS fc ON c.category_id = fc.category_id
GROUP BY c.name;

-- Retrieve the store ID, city, and country for each store.

SELECT s.store_id, ci.city, co.country
FROM store AS s
JOIN address AS a ON s.address_id = a.address_id
JOIN city AS ci ON a.city_id = ci.city_id
JOIN country AS co on ci.country_id = co.country_id;

-- Calculate the total revenue generated by each store in dollars

SELECT SUM(p.amount) AS total_revenue, s.store_id
FROM store AS s
JOIN staff AS st ON s.store_id = st.store_id
JOIN payment as p ON st.staff_id = p.staff_id
GROUP BY s.store_id;

-- Determine the average running time by category

SELECT c.name AS category, AVG(f.length) AS avg_running_time
FROM category AS c
JOIN film_category AS fc ON c.category_id = fc.category_id
JOIN film AS f ON fc.film_id = f.film_id
GROUP BY c.name;

-- Indentify the the film categories with the longest average running time

SELECT c.name AS category, AVG(f.length) AS avg_running_time
FROM category AS c
JOIN film_category AS fc ON c.category_id = fc.category_id
JOIN film AS f ON fc.film_id = f.film_id
GROUP BY c.name
ORDER BY avg_running_time DESC;

-- Display the top 10 most frequently rented movies (desc order)

SELECT f.title, COUNT(r.inventory_id) AS total_rentals
FROM film AS f
JOIN inventory AS i ON f.film_id = i.film_id
JOIN rental AS r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY total_rentals DESC
LIMIT 10;


-- Acadmey Dinosaur available

SELECT f.title, COUNT(i.inventory_id) AS num_of_copies
FROM film AS f
JOIN inventory AS i ON f.film_id = i.film_id
WHERE f.title = 'Academy Dinosaur' AND i.store_id = 1
GROUP BY f.title;


-- List of all distinct film titles, along with their availability status in the inventory.


SELECT film.title AS film_title,
    CASE WHEN IFNULL(inventory.inventory_id, 0) > 0 THEN 'Available'
	ELSE 'NOT available'
    END AS status
FROM film JOIN inventory ON film.film_id = inventory.film_id;
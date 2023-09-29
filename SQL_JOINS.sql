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
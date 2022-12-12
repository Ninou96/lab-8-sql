-- Rank films by length (filter out the rows with nulls or zeros in length column). 
-- Select only columns title, length and rank in your output.
select title, length, 
rank() over(order by length desc) as 'rank by length' 
from film 
where length <> " " or length is not null or length <> 0;

-- Rank films by length within the rating category (filter out the rows with nulls or zeros in length column). In your output, only select the columns title, length, rating and rank.
select * from film;

select title, length, rating,
rank() over(partition by rating order by length desc) as 'rank by length'
from film
where length <> " " or length is not null or length <> 0;
-- How many films are there for each of the categories in the category table? Hint: Use appropriate join between the tables "category" and "film_category".
SELECT name AS 'fc', COUNT(*) AS 'films'
FROM category
INNER JOIN film_category ON category.category_id = film_category.category_id
GROUP BY name;
-- Which actor has appeared in the most films? Hint: You can create a join between the tables "actor" and "film actor" and count the number of times an actor appears.
select first_name, last_name, count(*) as cnt
from actor a
inner join film_actor on actor.actor_id = film_actor.actor_id
group by a.actor_id
order by count(*) desc;
-- Which is the most active customer (the customer that has rented the most number of films)? Hint: Use appropriate join between the tables "customer" and "rental" and count the rental_id for each customer.
SELECT customer.customer_id, count(rental_id) as Total_Rentals
FROM rental as r
INNER JOIN customer AS cust on r.customer_id = customer.customer_id
GROUP BY customer.customer_id
ORDER BY Total_Rentals DESC LIMIT 1;
-- Bonus: Which is the most rented film? (The answer is Bucket Brotherhood).
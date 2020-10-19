#Instructions
use sakila;

#Which last names appear more than once?
select last_name, count(customer_id) from sakila.customer
group by last_name
having count(customer_id)>=1;

#Rentals by employee.
select customer_id, count(rental_id) from sakila.rental
group by customer_id;

#Films by year.
select release_year, count(film_id) from sakila.film
group by release_year;

#Films by rating.
select rating, count(film_id) from sakila.film
group by rating;

#Mean length by rating.
select rating, round(avg(length)) from sakila.film
group by rating;

#Which kind of movies (rating) have a mean duration of more than two hours?
select rating, round(avg(length)) from sakila.film
group by rating
having round(avg(length))>=120;

#List movies and add information of average duration for their rating and original language.
select title,language_id,rating,round(avg(length)) from sakila.film
group by title,language_id,rating;

select title,language_id, rating, avg(length) over (partition by title) from sakila.film;


#Which rentals are longer than expected?
select avg(rental_duration) from sakila.film;

select film_id, rental_duration, avg(rental_duration) over(partition by film_id) as average_rental from sakila.film
where rental_duration > (select avg(rental_duration) from sakila.film);


1:-- Who is the senior most employee based on job title? */

SELECT title, last_name, first_name 
FROM employee
ORDER BY levels DESC
LIMIT 1

--Q-2}Which country has the most invoices?

select * from invoice
select count(*) as c,billing_country from invoice
group by billing_country
order by c desc

Q-3} --what are top 3 values of total invoice?

select total from invoice
order by total desc 
limit 3

4-] --Which city has the best customers we would like to through a promotional music festival in the
--city we made the most money. write a query that returns one city that has the highest sum of invoice
--totals return both the city name and sum of all invoice totals?

select * from invoice
select billing_city as city ,sum(total) as invoice_total from invoice
group by city
order by invoice_total desc
limit 1;

--5] Who is the best customer? the customer who has spent the most money will be declared the best customer
--. write a query that returns the person who has spent the most money?

select * from customer
select customer.customer_id,customer.first_name,customer.last_name, sum(invoice.total) as total
from customer
inner join invoice
on customer.customer_id=invoice.customer_id
group by customer.customer_id
order by total desc
limit 1;

--6] Write query to return the email, first name, last name, and genre of all the rock music
--listeners. return your list ordered alphabetically by email starting with A?
select distinct first_name, last_name,email from customer
join invoice on customer.customer_id= invoice.customer_id
join invoice_line on invoice.invoice_id=invoice_line.invoice_id
where track_id in(
	select track_id from track 
				 join genre on track.genre_id=genre.genre_id
				 where genre.name = 'Rock')
order by email;
7]--Lets invite the artist who have written the most rock music in our data set. write a query that returns
-- the artist name and total work count of the top 10 rock bands?

SELECT artist.artist_id, artist.name,COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;
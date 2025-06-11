select * from books;
select * from customers;
select * from orders;

1) Retrieve all books in the "Fiction" genre:

select * from books
where genre='Fiction';

2- Find books published after the year 1950:

select * from books
where published_year > 1950;

3- List all customers from the Canada:

select * from customers 
where country='Canada';

4- Show orders placed in November 2023:

select * from orders
where order_date between '2023-11-01' and '2023-11-30'; 

5- Retrieve the total stock of books available:

select  sum(stock) as "available stock" from books;

6- Find the details of the most expensive book:

select * from books
order by price desc
 limit 1;

 7- Show all customers who ordered more than 1 quantity of a book:
 
 select * from orders
 where quantity >1;

 8- Retrieve all orders where the total amount exceeds $20:
 
 select * from orders
 where total_amount >20;

 9- List all genres available in the Books table:


 select genre from books
 group by genre;
 
 or
 
 select distinct genre from books;

 10- Calculate the total revenue generated from all orders:
 

select * from books
 order by stock;

 11- Find the book with the lowest stock:
 
 select sum(total_amount) as sale from orders;

 12-  Retrieve the total number of books sold for each genre:
 
 select genre, sum(quantity)
 from books b
 join orders o on b.book_id=o.order_id
group by genre; 

13- Find the average price of books in the "Fantasy" genre:

select avg(price) from books
where genre ='Fantasy';

14- List customers who have placed at least 2 orders:


select customer_id, count(order_id)
as order_count
from orders
group by customer_id
having count(order_id) >=2;

15- Find the most frequently ordered book:

select b.title, count(*)
 as final from orders o
join books b on b.book_id=o.book_id
group by b.title
order by final desc
limit 1;

16- Show the top 3 most expensive books of 'Fantasy' Genre :

SELECT *
FROM books
WHERE price IN (
    SELECT DISTINCT price
    FROM books
    ORDER BY price DESC
    LIMIT 3
)
ORDER BY price DESC;

17-  Retrieve the total quantity of books sold by each author:

select author,sum( quantity) as total
from orders o
join books b on b.book_id=o.book_id
group by author 
order by total  desc;

18- List the cities where customers who spent over $30 are located:

select distinct(city), total_amount
from orders o
join customers c on c.customer_id=o.customer_id 
where total_amount >30;

19- Find the customer who spent the most on orders:

select c.name,sum(total_amount) as total_spent
from orders o 
join customers c on o.customer_id=c.customer_id
group by c.name
order by total_spent desc 
limit 1;

20-  Calculate the stock remaining after fulfilling all orders:

select b.title,b.stock,
coalesce (sum(o.quantity),0) as order_quantity,
b.stock- coalesce (sum(o.quantity),0) as remaining 
from books b
left join orders o on o.book_id=b.book_id
group by b.book_id ;



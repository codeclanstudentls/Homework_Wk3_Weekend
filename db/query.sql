SELECT f.title as film_title, c.name as customer_name, f.price as film_price, c.funds as customer_funds
FROM films f
INNER JOIN customers c
ON f.id = c.id;

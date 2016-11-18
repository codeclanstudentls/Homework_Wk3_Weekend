DROP TABLE IF EXITS films;
DROP TABLE IF EXISTS customers;


CREATE TABLE customers(
  id SERIAL8 primary key,
  name VARCHAR(255),
  funds INT2
);

CREATE TABLE films(
  id SERIAL8 primary key,
  title VARCHAR(255),
  price INT2
);


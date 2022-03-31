CREATE TABLE store (
  store_id integer PRIMARY KEY,
  name varchar(50) NOT NULL,
  description varchar(100) NOT NULL,
  address_id integer REFERENCES addresses(address_id), 
  hours varchar(50),
  phone varchar(15),
  website varchar(25) NOT NULL
);

CREATE TABLE customers (
  customer_id integer PRIMARY KEY,
  name varchar(50) NOT NULL,
  address_id integer REFERENCES addresses(address_id),
  phone varchar(15),
  email varchar(50) NOT NULL,
  payment_info varchar(50)
);

CREATE TABLE addresses (
  address_id integer PRIMARY KEY,
  street_number varchar(10) NOT NULL,
  street_name varchar(50) NOT NULL,
  apt varchar(5) NOT NULL,
  city varchar(50) NOT NULL,
  state char(2) NOT NULL,
  zip_code char(5) NOT NULL
);

CREATE TABLE orders (
  order_id integer PRIMARY KEY,
  order_date date NOT NULL,
  customer_id integer NOT NULL REFERENCES customers(customer_id)
);

CREATE TABLE items (
  item_id integer PRIMARY KEY,
  name varchar(50) NOT NULL,
  price money NOT NULL,
  count integer CHECK (count >= 0),
  in_stock char(2) NOT NULL,
  department varchar(50)
);

CREATE TABLE orders_items (
  order_id integer NOT NULL REFERENCES orders(order_id),
  item_id integer NOT NULL REFERENCES items(item_id),
  quantity integer NOT NULL CHECK (quantity >= 0)
); 

CREATE TABLE totals (
  total_id integer PRIMARY KEY,
  order_id integer UNIQUE NOT NULL REFERENCES orders(order_id),
  subtotal money NOT NULL,
  discount varchar(10),
  subtotal_discount money,
  tax money NOT NULL,
  shipping money NOT NULL,
  total money NOT NULL,
  paid boolean NOT NULL,
  CHECK (subtotal * 0.07 = tax OR (subtotal - subtotal_discount) * 0.07 = tax),
  CHECK (subtotal + tax + shipping = total OR (subtotal - subtotal_discount) + tax + shipping = total)
);

INSERT INTO store (store_id, name, description, hours, phone, website) 
VALUES (1, 'EMart: department shopping online', 
        'Department store selection at better prices than brand name department retailers',
       'Mon-Fri 9am-6pm, Sat-Sun 10am-3pm', '231-535-1652', 'www.emart.com');
       
INSERT INTO addresses VALUES (1, '5940', 'Benton Drive', '', 'El Segundo', 'CA', '92450');

UPDATE store 
SET address_id = 1;

INSERT INTO addresses VALUES (2, '3463', 'Hardy Avenue', '', 'Fort Worth', 'TX', '76106'),
(3, '2723', 'Daylee Lane', '405', 'Levin', 'MI', '48150'), (4, '1232', 'Stout Street', '', 'Harrisburg', 'PA', '17101'),
(5, '2475', 'Seneca Drive', '', 'Portland', 'OR', '97205'), (6, '782', 'Wolf Pen Road', '', 'Oakland', 'CA', '94612'),
(7, '3030', 'Stratford Court', '312', 'Raleigh', 'NC', '27609'), (8, '1011', 'Whitman Street', '', 'Mercantile', 'NJ', '08109'),
(9, '2090', 'Spring Street', '', 'Elvaston', 'IL', '62334'), (10, '3887', 'Walnut Drive', '', 'Jackson', 'MS', '39211');

INSERT INTO customers VALUES (1, 'Victor Burns', 2, '341-726-1243', 'VicBurns@gmail.com', 'XXXXXXXXXXXX9975'),
(2, 'Annabelle Hunter', 3, '225-185-9735', 'AnnaB.Hunter@gmail.com', 'XXXXXXXXXXXX7824'),
(3, 'Rogelio Fio', 4, '390-728-0304', 'RogelioFio@gmail.com', 'XXXXXXXXXXXX3701'),
(4, 'Tommy Doyle', 5, '903-349-0923', 'tommy.doyle@gmail.com', 'XXXXXXXXXXXX5834'),
(5, 'Brenda Garner', 6, '272-410-0869', 'brendaGarner@gmail.com', 'XXXXXXXXXXXX5711'),
(6, 'Deborah McDonnahugh', 7, '802-644-3465', 'debby.mcdonnahugh@gmail.com', 'XXXXXXXXXXXX6070'),
(7, 'Ruth Vance', 8, '914-229-3270', 'Ruth.Vance@gmail.com', 'XXXXXXXXXXXX5746'),
(8, 'Thomas Kidder', 9, '160-044-0859', 'thomas.kidder@gmail.com', 'XXXXXXXXXXXX8564'),
(9, 'Helen King', 10, '752-030-4594', 'HelenKing@gmail.com', 'XXXXXXXXXXXX0106' ),
(10, 'Frank Johnson', 4, '826-572-5659', 'frank.johnson@gmail.com', 'XXXXXXXXXXXX2912');

INSERT INTO items VALUES (1, 'garment steamer sp-350', 24.99, 15, 'IS', 'appliances'),
(2, 'plush stuff area rug', 12.99,  11, 'IS', 'home decor'), (3, 'airzone carry-on luggage', 28.95, 9, 'IS', 'travel luggage'),
(4, 'nexus ultra media tower', 29.90, 6, 'IS', 'home furniture'), (5, 'coffee-matic espresso machine', 39.99, 12, 'IS', 'appliances'),
(6, 'candle melts wax warmer', 14.99, 15, 'IS', 'home decor'), (7, 'candle melts wax melts', 1.99, 31, 'IS', 'home decor'),
(8, 'airwell humidifier aw-3481', 28.99, 5, 'IS', 'home improvement'), (9, 'for hair facial razor', 5.99, 11, 'IS', 'personal care & beauty'),
(10, 'mediface gua sha & jade roller set', 16.99, 8, 'IS', 'personal care & beauty'), (11, 'bebe dream play yard', 28.99, 10, 'IS', 'baby'),
(12, 'plume dome bird bath fountain', 29.99, 4, 'IS', 'outdoor & garden'), (13, 'grow green turf grass seed', 11.99, 10, 'IS', 'outdoor & garden'),
(14, 'flo & glo hair rollers', 3.99, 12, 'IS', 'personal care & beauty'), (15, 'furry paw pet grooming gloves', 5.99, 12, 'IS', 'pet care'),
(16, 'office space desk organizer', 6.99, 15, 'IS', 'office supplies'), (17, 'knit craft sewing thread', 1.99, 50, 'IS', 'arts & crafts'),
(18, 'idxtab ereader', 45.95, 5, 'IS', 'electronics'), (19, 'telegear phone case', 4.99, 25, 'IS', 'electronics'),
(20, 'torrent wrist watch', 33.99, 4, 'IS', 'clothing & accessories'), (21, 'cray tops graphic t-shirt', 6.99, 15, 'IS', 'clothing & accessories'),
(22, 'aero works sweatpant', 7.99, 20, 'IS', 'clothing & accessories'), (23, 'aero works sweatshirt', 8.99, 20, 'IS', 'clothing & accessories'),
(24, 'boost fit tank top', 3.99, 20, 'IS', 'clothing & accessories'), (25, 'firefly midi shorts', 5.99, 10, 'IS', 'clothing & accessories');

INSERT INTO orders VALUES (1, '2022-01-20', 1), (2, '2022-01-21', 2), (3, '2022-01-23', 3), (4, '2022-01-24', 4), (5, '2022-01-26', 5), 
(6, '2022-01-27', 6), (7, '2022-01-28', 7), (8, '2022-01-29', 8), (9, '2022-01-30', 9), (10, '2022-01-31', 10), (11, '2022-01-28', 2), 
(12, '2022-01-31', 4), (13, '2022-01-28', 6), (14, '2022-01-30', 8), (15, '2022-01-31', 10);

INSERT INTO orders_items VALUES (1, 20, 1), (2, 5, 1), (2, 9, 1), (3, 8, 1), (4, 16, 1), (5, 3, 1), (5, 4, 1), (5, 24, 2), (6, 11, 1), (6, 12, 1), 
(7, 6, 1), (7, 7, 3), (7, 14, 2), (7, 17, 1), (8, 13, 3), (9, 10, 1), (9, 21, 1), (9, 25, 2), (10, 22, 2), (10, 23, 3), (11, 2, 1), (12, 1, 1), 
(13, 18, 1), (14, 15, 2), (15, 19, 1);

SELECT * FROM items
ORDER BY department;

INSERT INTO totals VALUES (1, 1, 33.99, '20%', 6.8, 1.9, 0, 29.09, true), (2, 2, 45.98, '20%', 9.2, 2.57, 0, 39.35, true), 
(3, 3, 26.99, '20%', 5.4, 1.51, 3.5, 26.6, true), (4, 4, 6.99, '20%', 1.4, .39, 3.5, 9.48, true), (5, 5, 52.92, '20%', 10.59, 2.96, 0, 45.29, true), 
(6, 6, 58.98, '20%', 11.8, 3.3, 0, 50.48, true), (7, 7, 30.93, '20%', 6.19, 1.73, 3.5, 29.97, true), (8, 8, 35.97, '20%', 7.2, 2.01, 0, 30.78, true), 
(9, 9, 35.96, '20%', 7.2, 2.01, 0, 30.77, true), (10, 10, 42.95, '20%', 8.59, 2.41, 0, 36.77, true), (11, 11, 12.99, '', 0, .91, 3.5, 17.4, true), 
(12, 12, 24.99, '', 0, 1.75, 3.5, 30.24, true), (13, 13, 45.95, '', 0, 3.22, 0, 49.17, true), (14, 14, 11.98, '', 0, .84, 3.5, 16.32, true), 
(15, 15, 4.99, '', 0, .35, 3.5, 8.84, true);

SELECT SUM(total) FROM totals;

UPDATE items
SET count = count - 1
WHERE item_id IN (1, 2, 3, 4, 5, 6);

UPDATE items
SET count = count - 3
WHERE item_id = 7;

UPDATE items
SET count = count - 1
WHERE item_id IN (8, 9, 10, 11, 12);

UPDATE items
SET count = count - 3
WHERE item_id = 13;

UPDATE items
SET count = count - 2
WHERE item_id IN (14, 15);

UPDATE items
SET count = count - 1
WHERE item_id IN (16, 17, 18, 19, 20, 21);

UPDATE items
SET count = count - 2
WHERE item_id IN (22);

UPDATE items
SET count = count - 3
WHERE item_id = 23;

UPDATE items
SET count = count - 2
WHERE item_id IN (24, 25);

ALTER TABLE orders
ADD ship_date date;

UPDATE orders
SET ship_date = '2022-01-23'
WHERE order_id = 1;

UPDATE orders
SET ship_date = '2022-01-24'
WHERE order_id = 2;

UPDATE orders
SET ship_date = '2022-01-26'
WHERE order_id = 3;

UPDATE orders
SET ship_date = '2022-01-27'
WHERE order_id = 4;

UPDATE orders
SET ship_date = '2022-01-29'
WHERE order_id = 5;

UPDATE orders
SET ship_date = '2022-01-30'
WHERE order_id = 6;

UPDATE orders
SET ship_date = '2022-01-31'
WHERE order_id = 7;

UPDATE orders
SET ship_date = '2022-02-01'
WHERE order_id = 8;

UPDATE orders
SET ship_date = '2022-02-02'
WHERE order_id = 9;

UPDATE orders
SET ship_date = '2022-02-03'
WHERE order_id = 10;

UPDATE orders
SET ship_date = '2022-01-31'
WHERE order_id = 11;

UPDATE orders
SET ship_date = '2022-02-03'
WHERE order_id = 12;

UPDATE orders
SET ship_date = '2022-01-31'
WHERE order_id = 13;

UPDATE orders
SET ship_date = '2022-02-02'
WHERE order_id = 14;

UPDATE orders
SET ship_date = '2022-02-03'
WHERE order_id = 15;

SELECT schemaname, relname, n_dead_tup, n_live_tup
FROM pg_catalog.pg_stat_all_tables
WHERE schemaname = 'public';

SELECT pg_size_pretty(pg_table_size('addresses')) AS addresses_size,
pg_size_pretty(pg_table_size('customers')) AS customers_size, 
pg_size_pretty(pg_table_size('items')) AS items_size, 
pg_size_pretty(pg_table_size('orders')) AS orders_size, 
pg_size_pretty(pg_table_size('orders_items')) AS orders_items_size, 
pg_size_pretty(pg_table_size('phone_numbers')) AS phone_numbers_size,
pg_size_pretty(pg_table_size('store')) AS store_size, 
pg_size_pretty(pg_table_size('store_hours')) AS store_hours_size,
pg_size_pretty(pg_table_size('totals')) AS totals_size;

SELECT pg_size_pretty(pg_indexes_size('addresses')) AS addresses_size,
pg_size_pretty(pg_indexes_size('customers')) AS customers_size, 
pg_size_pretty(pg_indexes_size('items')) AS items_size, 
pg_size_pretty(pg_indexes_size('orders')) AS orders_size, 
pg_size_pretty(pg_indexes_size('orders_items')) AS orders_items_size,
pg_size_pretty(pg_indexes_size('phone_numbers')) AS phone_numbers_size,
pg_size_pretty(pg_indexes_size('store')) AS store_size, 
pg_size_pretty(pg_indexes_size('store_hours')) AS store_hours_size,
pg_size_pretty(pg_indexes_size('totals')) AS totals_size;

SELECT pg_size_pretty(pg_total_relation_size('addresses')) AS addresses_size,
pg_size_pretty(pg_total_relation_size('customers')) AS customers_size, 
pg_size_pretty(pg_total_relation_size('items')) AS items_size, 
pg_size_pretty(pg_total_relation_size('orders')) AS orders_size, 
pg_size_pretty(pg_total_relation_size('orders_items')) AS orders_items_size, 
pg_size_pretty(pg_total_relation_size('phone_numbers')) AS phone_numbers_size,
pg_size_pretty(pg_total_relation_size('store')) AS store_size, 
pg_size_pretty(pg_total_relation_size('store_hours')) AS store_hours_size,
pg_size_pretty(pg_total_relation_size('totals')) AS totals_size;

VACUUM public.addresses;
VACUUM public.items;
VACUUM public.orders;
VACUUM public.store;

SELECT * FROM pg_catalog.pg_roles;

SELECT grantor, grantee, table_schema, table_name, privilege_type
FROM information_schema.table_privileges
WHERE table_schema = 'public';

CREATE ROLE employee;

GRANT SELECT ON items TO employee;

GRANT UPDATE (count, in_stock) ON public.items TO employee;

SET ROLE employee;

SELECT current_user;

SELECT * FROM items
ORDER BY count ASC;

SELECT * FROM orders;

SET ROLE postgres;

GRANT SELECT ON addresses, customers, orders, orders_items, store, totals TO employee;

ALTER TABLE store_hours OWNER TO postgres;
ALTER TABLE phone_numbers OWNER TO postgres;

REASSIGN OWNED BY employee to postgres;
DROP OWNED BY employee;
DROP USER employee;
DROP ROLE manager;

CREATE TABLE store_hours (
  day_of_week char(3) UNIQUE NOT NULL,
  start_hour varchar(5) NOT NULL,
  end_hour varchar(5) NOT NULL
);

INSERT INTO store_hours VALUES ('Mon', '9 AM', '6 PM'), ('Tue', '9 AM', '6 PM'), ('Wed', '9 AM', '6 PM'), ('Thu', '9 AM', '6 PM'), 
('Fri', '9 AM', '6 PM'), ('Sat', '10 AM', '3 PM'), ('Sun', '10 AM', '3 PM');

CREATE TABLE phone_numbers (
  phone_id integer PRIMARY KEY, 
  area_code char(5) NOT NULL, 
  number char(8) NOT NULL
);

INSERT INTO phone_numbers VALUES (1, '310', '535-1652'), (2, '817', '726-4087'), (3, '734', '448-9735'), (4, '717', '728-3304'), 
(5, '971', '439-9032'), (6, '510', '410-6869'), (7, '919', '644-3465'), (8, '856', '229-3270'), (9, '217', '945-3859'), 
(10, '601', '338-4594'), (11, '717', '572-5612'); 

ALTER TABLE store
DROP COLUMN hours;

ALTER TABLE store
RENAME phone TO phone_id;

UPDATE store
SET phone_id = 1;

ALTER TABLE store
ADD FOREIGN KEY (phone_id) REFERENCES phone_numbers(phone_id);

ALTER TABLE customers
RENAME phone TO phone_id;

ALTER TABLE customers
ADD FOREIGN KEY (phone_id) REFERENCES phone_numbers(phone_id);

ANALYZE public.items;
ANALYZE public.addresses;
ANALYZE public.customers;
ANALYZE public.orders;
ANALYZE public.orders_items;
ANALYZE public.phone_numbers;
ANALYZE public.store;
ANALYZE public.store_hours;
ANALYZE public.totals;

ALTER TABLE orders_items
ADD UNIQUE (order_id, item_id);

CREATE ROLE manager;

GRANT SELECT ON addresses, customers, items, orders, orders_items, phone_numbers, store, store_hours, totals TO manager;

GRANT UPDATE (name, description, website) ON public.store TO manager;

SET ROLE manager;

GRANT SELECT ON store_hours, phone_numbers TO employee;

VACUUM public.store_hours;
VACUUM public.phone_numbers;
VACUUM public.customers;

EXPLAIN ANALYZE SELECT SUM(total), discount FROM totals
GROUP BY discount;

EXPLAIN ANALYZE SELECT department, discount, SUM(quantity) AS count FROM items, orders_items, totals
WHERE items.item_id = orders_items.item_id AND orders_items.order_id = totals.order_id
GROUP BY 1, 2
ORDER BY 1; 

EXPLAIN ANALYZE SELECT SUM(quantity) FROM orders_items;

EXPLAIN ANALYZE SELECT item_id, SUM(quantity) AS count FROM orders_items
WHERE order_id BETWEEN 1 AND 10
GROUP BY 1
ORDER BY 1;

CREATE INDEX orders_items_order_id_item_id_quantity_idx ON orders_items(order_id, item_id, quantity);

DROP INDEX orders_items_order_id_item_id_quantity_idx;

SELECT * FROM pg_catalog.pg_stat_all_tables
WHERE schemaname = 'public';

VACUUM FULL;

SELECT * FROM pg_indexes
WHERE schemaname = 'public';

EXPLAIN ANALYZE SELECT * FROM items
ORDER BY count;
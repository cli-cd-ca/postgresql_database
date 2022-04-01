# Online Store Database
I chose an online store for my databases final project. I made the entity-relationship diagram on [dbdiagram.io](http://dbdiagram.io) and the database using
PostgreSQL through Postbird.

This is the database schema and data. The `CHECK` constraints were for numerical columns other than keys, like count and quantity, and calculated columns,
like tax and total. I created the employee and manager roles to define user access to the database and added the addresses, phone_numbers, and store_hours
tables to normalize the database. Indexes for the `EXPLAIN ANALYZE` queries in the sql file made the queries take longer, so I did not add more than `UNIQUE`
column indexes. The queries included the sum of order totals grouped by discount and the number of purchased items grouped by department and discount. I
used `VACUUM` and `VACUUM FULL` to remove dead tuples and unused space because the online store would have temporarily used this database to gather information
about new customers.

https://user-images.githubusercontent.com/88470982/161219062-76b4fe82-0397-4363-b8b6-71d34daf6977.mp4

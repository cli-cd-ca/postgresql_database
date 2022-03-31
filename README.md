# Online Store Database
I chose an online store for my databases final project. I made the entity-relationship diagram on [dbdiagram.io](http://dbdiagram.io) and the database using
PostgreSQL through Postbird.

This is the database with table schemas and data. The check constraints were for numerical columns other than keys, like count and quantity, and for calculated
columns, like tax and total. I created the employee and manager roles to define user access to the database and added the addresses, phone numbers and store
hours tables to normalize the database. Indexes for the explain analyze queries in the sql file made the queries take longer, so I did not add more than key and
unique column indexes. The queries included total revenue grouped by discount and number of purchased items grouped by department and discount. I used vacuum
and vacuum full to remove dead tuples and unused space because the online store would have temporarily used this database to gather information about new
customers.

https://user-images.githubusercontent.com/88470982/161003957-47285ffc-dc01-4d95-8c5c-344ca4981c2f.mp4

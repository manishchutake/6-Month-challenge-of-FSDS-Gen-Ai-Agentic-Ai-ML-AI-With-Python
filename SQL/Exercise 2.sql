Last login: Wed Sep 10 17:37:40 on ttys001
/usr/local/bin/mysql -u root -p                                                 
(base) manishuxuid@Manishs-MacBook-Pro ~ % /usr/local/bin/mysql -u root -p
zsh: no such file or directory: /usr/local/bin/mysql
(base) manishuxuid@Manishs-MacBook-Pro ~ % mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 22
Server version: 9.4.0 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| company            |
| information_schema |
| mysql              |
| nit                |
| performance_schema |
| sys                |
| testDB             |
+--------------------+
7 rows in set (0.001 sec)

mysql> use testDB;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> select * from class;
+----+----------+------+-----------+----------+
| ID | NAME     | AGE  | ADDRESS   | SALARY   |
+----+----------+------+-----------+----------+
|  1 | Ramesh   |   32 | Ahmedabad |  2000.00 |
|  2 | Khilan   |   25 | Delhi     |  1500.00 |
|  3 | Kaushik  |   23 | Kota      |  2000.00 |
|  4 | Chaitali |   25 | Mumbai    |  6500.00 |
|  5 | Hardik   |   27 | Bhopal    |  8500.00 |
|  6 | Komal    |   22 | MP        |  4500.00 |
|  7 | Muffy    |   24 | Indore    | 10000.00 |
+----+----------+------+-----------+----------+
7 rows in set (0.000 sec)

mysql> CREATE TABLE orders (
    ->     oid INT PRIMARY KEY AUTO_INCREMENT,  -- Order ID, auto-increment
    ->     order_date DATE,                     -- Order date (YYYY-MM-DD)
    ->     customerid INT NOT NULL,             -- Customer ID (linked to customers table)
    ->     amount DECIMAL(10,2)                 -- Order amount with 2 decimals
    -> );
Query OK, 0 rows affected (0.018 sec)

mysql> insert into orders( OID , DATE,CUSTOMER_ID, AMOUNT) values(102, 2009-10-08 00:00:00, 3,3000),(100,2009-10-08 00:00:00, 3, 1500),(101,2009-10-08 00:00:00,2, 1560),(103,2009-10-08 00:00:00,4, 2060);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '00:00:00, 3,3000),(100,2009-10-08 00:00:00, 3, 1500),(101,2009-10-08 00:00:00,2,' at line 1
mysql> INSERT INTO orders (oid, order_date, customer_id, amount)
    -> VALUES
    -> (102, '2009-10-08 00:00:00', 3, 3000.00),
    -> (100, '2009-10-08 00:00:00', 3, 1500.00),
    -> (101, '2009-10-08 00:00:00', 2, 1560.00),
    -> (103, '2009-10-08 00:00:00', 4, 2060.00);
ERROR 1054 (42S22): Unknown column 'customer_id' in 'field list'
mysql> DESCRIBE orders;
+------------+---------------+------+-----+---------+----------------+
| Field      | Type          | Null | Key | Default | Extra          |
+------------+---------------+------+-----+---------+----------------+
| oid        | int           | NO   | PRI | NULL    | auto_increment |
| order_date | date          | YES  |     | NULL    |                |
| customerid | int           | NO   |     | NULL    |                |
| amount     | decimal(10,2) | YES  |     | NULL    |                |
+------------+---------------+------+-----+---------+----------------+
4 rows in set (0.001 sec)

mysql> INSERT INTO orders (oid, order_date, customerid, amount)
    -> VALUES
    -> (102, '2009-10-08 00:00:00', 3, 3000.00),
    -> (100, '2009-10-08 00:00:00', 3, 1500.00),
    -> (101, '2009-10-08 00:00:00', 2, 1560.00),
    -> (103, '2009-10-08 00:00:00', 4, 2060.00);
Query OK, 4 rows affected (0.010 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE orders CHANGE customerid customer_id INT;
Query OK, 0 rows affected (0.020 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from orders;
+-----+------------+-------------+---------+
| oid | order_date | customer_id | amount  |
+-----+------------+-------------+---------+
| 100 | 2009-10-08 |           3 | 1500.00 |
| 101 | 2009-10-08 |           2 | 1560.00 |
| 102 | 2009-10-08 |           3 | 3000.00 |
| 103 | 2009-10-08 |           4 | 2060.00 |
+-----+------------+-------------+---------+
4 rows in set (0.000 sec)

mysql> select  id, name, age, amount from customer orders where customer.id = orders.customer_id;
ERROR 1146 (42S02): Table 'testdb.customer' doesn't exist
mysql> id, name, age, amount from customers orders where customer.id = orders.customer_id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'id, name, age, amount from customers orders where customer.id = orders.customer_' at line 1
mysql> SELECT c.id, c.name, c.age, o.amount
    -> FROM customers c
    -> JOIN orders o
    ->     ON c.id = o.customerid;
ERROR 1146 (42S02): Table 'testdb.customers' doesn't exist
mysql> SELECT c.id, c.name, c.age, o.amount
    -> FROM class c
    -> JOIN orders o
    ->     ON c.id = o.customerid;
ERROR 1054 (42S22): Unknown column 'o.customerid' in 'on clause'
mysql> SELECT c.id, c.name, c.age, o.amount
    -> FROM class c
    -> JOIN orders o
    ->     ON c.id = o.customer_id;
+----+----------+------+---------+
| id | name     | age  | amount  |
+----+----------+------+---------+
|  3 | Kaushik  |   23 | 1500.00 |
|  2 | Khilan   |   25 | 1560.00 |
|  3 | Kaushik  |   23 | 3000.00 |
|  4 | Chaitali |   25 | 2060.00 |
+----+----------+------+---------+
4 rows in set (0.000 sec)

mysql> select id, name, amount, date from customers inner join orderson customers.id = orders.customer_id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '.id = orders.customer_id' at line 1
mysql> SELECT c.id, c.name, o.amount, o.order_date
    -> FROM class c
    -> INNER JOIN orders o
    ->     ON c.id = o.customer_id;
+----+----------+---------+------------+
| id | name     | amount  | order_date |
+----+----------+---------+------------+
|  3 | Kaushik  | 1500.00 | 2009-10-08 |
|  2 | Khilan   | 1560.00 | 2009-10-08 |
|  3 | Kaushik  | 3000.00 | 2009-10-08 |
|  4 | Chaitali | 2060.00 | 2009-10-08 |
+----+----------+---------+------------+
4 rows in set (0.000 sec)

mysql> select id,name, amount, date from customers left join orders on customer.id = orders.customer_id;
ERROR 1146 (42S02): Table 'testdb.customers' doesn't exist
mysql> SELECT c.id, c.name, o.amount, o.order_date
    -> FROM class c
    -> LEFT JOIN orders o
    ->     ON c.id = o.customer_id;
+----+----------+---------+------------+
| id | name     | amount  | order_date |
+----+----------+---------+------------+
|  1 | Ramesh   |    NULL | NULL       |
|  2 | Khilan   | 1560.00 | 2009-10-08 |
|  3 | Kaushik  | 3000.00 | 2009-10-08 |
|  3 | Kaushik  | 1500.00 | 2009-10-08 |
|  4 | Chaitali | 2060.00 | 2009-10-08 |
|  5 | Hardik   |    NULL | NULL       |
|  6 | Komal    |    NULL | NULL       |
|  7 | Muffy    |    NULL | NULL       |
+----+----------+---------+------------+
8 rows in set (0.000 sec)

mysql> SELECT c.id, c.name, c.age, o.oid, o.amount, o.order_date
    -> FROM class c
    -> RIGHT JOIN orders o
    ->     ON c.id = o.customer_id;
+------+----------+------+-----+---------+------------+
| id   | name     | age  | oid | amount  | order_date |
+------+----------+------+-----+---------+------------+
|    3 | Kaushik  |   23 | 100 | 1500.00 | 2009-10-08 |
|    2 | Khilan   |   25 | 101 | 1560.00 | 2009-10-08 |
|    3 | Kaushik  |   23 | 102 | 3000.00 | 2009-10-08 |
|    4 | Chaitali |   25 | 103 | 2060.00 | 2009-10-08 |
+------+----------+------+-----+---------+------------+
4 rows in set (0.000 sec)

mysql> SELECT c.id, c.name, c.age, o.oid, o.amount, o.order_date
    -> FROM class c
    -> LEFT JOIN orders o
    ->     ON c.id = o.customer_id
    -> 
    -> UNION
    -> 
    -> SELECT c.id, c.name, c.age, o.oid, o.amount, o.order_date
    -> FROM class c
    -> RIGHT JOIN orders o
    ->     ON c.id = o.customer_id;
+------+----------+------+------+---------+------------+
| id   | name     | age  | oid  | amount  | order_date |
+------+----------+------+------+---------+------------+
|    1 | Ramesh   |   32 | NULL |    NULL | NULL       |
|    2 | Khilan   |   25 |  101 | 1560.00 | 2009-10-08 |
|    3 | Kaushik  |   23 |  102 | 3000.00 | 2009-10-08 |
|    3 | Kaushik  |   23 |  100 | 1500.00 | 2009-10-08 |
|    4 | Chaitali |   25 |  103 | 2060.00 | 2009-10-08 |
|    5 | Hardik   |   27 | NULL |    NULL | NULL       |
|    6 | Komal    |   22 | NULL |    NULL | NULL       |
|    7 | Muffy    |   24 | NULL |    NULL | NULL       |
+------+----------+------+------+---------+------------+
8 rows in set (0.013 sec)

mysql> SELECT a.column_name, b.column_name
    -> FROM table_name a
    -> JOIN table_name b
    ->     ON a.common_field = b.common_field;
ERROR 1146 (42S02): Table 'testdb.table_name' doesn't exist
mysql> SELECT c1.id AS Person1_ID, c1.name AS Person1,
    ->        c2.id AS Person2_ID, c2.name AS Person2,
    ->        c1.address
    -> FROM class c1
    -> JOIN class c2
    ->     ON c1.address = c2.address
    ->    AND c1.id < c2.id;
Empty set (0.012 sec)

mysql> SELECT c1.name AS Employee1, c2.name AS Employee2, c1.salary
    -> FROM class c1
    -> JOIN class c2
    ->     ON c1.salary = c2.salary
    ->    AND c1.id < c2.id;
+-----------+-----------+---------+
| Employee1 | Employee2 | salary  |
+-----------+-----------+---------+
| Ramesh    | Kaushik   | 2000.00 |
+-----------+-----------+---------+
1 row in set (0.000 sec)

mysql> 

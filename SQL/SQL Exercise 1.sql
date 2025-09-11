Last login: Wed Sep 10 14:53:47 on ttys001
/usr/local/bin/mysql -u root -p                                                 
(base) manishuxuid@Manishs-MacBook-Pro ~ % /usr/local/bin/mysql -u root -p
zsh: no such file or directory: /usr/local/bin/mysql
(base) manishuxuid@Manishs-MacBook-Pro ~ % mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 20
Server version: 9.4.0 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE company;
ERROR 1007 (HY000): Can't create database 'company'; database exists
mysql> use company database
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> CREATE TABLE CUSTOMERS (
    ->     ID INT PRIMARY KEY AUTO_INCREMENT,
    ->     NAME VARCHAR(50) NOT NULL,
    ->     AGE INT,
    ->     ADDRESS VARCHAR(100),
    ->     SALARY DECIMAL(10,2)
    -> );
ERROR 1050 (42S01): Table 'customers' already exists
mysql> insertINSERT INTO CUSTOMERS (NAME, AGE, ADDRESS, SALARY)
    -> VALUES 
    -> ('Ramesh', 32, 'Ahmedabad', 2000.00),('Khilan', 25, 'Delhi', 1500.00),('kaushik', 23, 'Kota', 2000.00),('Chaitali', 25, 'Mumbai', 6500.00),('Hardik',27,'Bhopal',8500,00),('Komal', 22, 'MP', 4500.00),('Muffy', 24, 'Indore', 10000.00); 
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'insertINSERT INTO CUSTOMERS (NAME, AGE, ADDRESS, SALARY)
VALUES 
('Ramesh', 32, ' at line 1
mysql> INSERT INTO CUSTOMERS (NAME, AGE, ADDRESS, SALARY)
    -> VALUES 
    -> ('Ramesh', 32, 'Ahmedabad', 2000.00),
    -> ('Khilan', 25, 'Delhi', 1500.00),
    -> ('Kaushik', 23, 'Kota', 2000.00),
    -> ('Chaitali', 25, 'Mumbai', 6500.00),
    -> ('Hardik', 27, 'Bhopal', 8500.00),
    -> ('Komal', 22, 'MP', 4500.00),
    -> ('Muffy', 24, 'Indore', 10000.00);
Query OK, 7 rows affected (0.017 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> select * from customers;
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

mysql> select * from customers where salary > 5000.00;
+----+----------+------+---------+----------+
| ID | NAME     | AGE  | ADDRESS | SALARY   |
+----+----------+------+---------+----------+
|  4 | Chaitali |   25 | Mumbai  |  6500.00 |
|  5 | Hardik   |   27 | Bhopal  |  8500.00 |
|  7 | Muffy    |   24 | Indore  | 10000.00 |
+----+----------+------+---------+----------+
3 rows in set (0.009 sec)

mysql> select * from customers where salary = 2000.00;
+----+---------+------+-----------+---------+
| ID | NAME    | AGE  | ADDRESS   | SALARY  |
+----+---------+------+-----------+---------+
|  1 | Ramesh  |   32 | Ahmedabad | 2000.00 |
|  3 | Kaushik |   23 | Kota      | 2000.00 |
+----+---------+------+-----------+---------+
2 rows in set (0.000 sec)

mysql> select * from customers where != 2000;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '!= 2000' at line 1
mysql> select * from customers where salary != 2000;
+----+----------+------+---------+----------+
| ID | NAME     | AGE  | ADDRESS | SALARY   |
+----+----------+------+---------+----------+
|  2 | Khilan   |   25 | Delhi   |  1500.00 |
|  4 | Chaitali |   25 | Mumbai  |  6500.00 |
|  5 | Hardik   |   27 | Bhopal  |  8500.00 |
|  6 | Komal    |   22 | MP      |  4500.00 |
|  7 | Muffy    |   24 | Indore  | 10000.00 |
+----+----------+------+---------+----------+
5 rows in set (0.008 sec)

mysql> select * from customers where salary <> 2000;
+----+----------+------+---------+----------+
| ID | NAME     | AGE  | ADDRESS | SALARY   |
+----+----------+------+---------+----------+
|  2 | Khilan   |   25 | Delhi   |  1500.00 |
|  4 | Chaitali |   25 | Mumbai  |  6500.00 |
|  5 | Hardik   |   27 | Bhopal  |  8500.00 |
|  6 | Komal    |   22 | MP      |  4500.00 |
|  7 | Muffy    |   24 | Indore  | 10000.00 |
+----+----------+------+---------+----------+
5 rows in set (0.000 sec)

mysql> select * from customers where salary >= 6500;
+----+----------+------+---------+----------+
| ID | NAME     | AGE  | ADDRESS | SALARY   |
+----+----------+------+---------+----------+
|  4 | Chaitali |   25 | Mumbai  |  6500.00 |
|  5 | Hardik   |   27 | Bhopal  |  8500.00 |
|  7 | Muffy    |   24 | Indore  | 10000.00 |
+----+----------+------+---------+----------+
3 rows in set (0.000 sec)

mysql> select * from customers;
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

mysql> SQL> SELECT * FROM CUSTOMERS WHERE AGE >= 25 AND SALARY >= 6500;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SQL> SELECT * FROM CUSTOMERS WHERE AGE >= 25 AND SALARY >= 6500' at line 1
mysql> select * from customers where AGE >= 25 and salary >= 6500;
+----+----------+------+---------+---------+
| ID | NAME     | AGE  | ADDRESS | SALARY  |
+----+----------+------+---------+---------+
|  4 | Chaitali |   25 | Mumbai  | 6500.00 |
|  5 | Hardik   |   27 | Bhopal  | 8500.00 |
+----+----------+------+---------+---------+
2 rows in set (0.000 sec)

mysql> select * from customers where age is not null;
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

mysql> select * from customers where name like 'ko%';
+----+-------+------+---------+---------+
| ID | NAME  | AGE  | ADDRESS | SALARY  |
+----+-------+------+---------+---------+
|  6 | Komal |   22 | MP      | 4500.00 |
+----+-------+------+---------+---------+
1 row in set (0.009 sec)

mysql> select * from customers where age between 25 and 27;
+----+----------+------+---------+---------+
| ID | NAME     | AGE  | ADDRESS | SALARY  |
+----+----------+------+---------+---------+
|  2 | Khilan   |   25 | Delhi   | 1500.00 |
|  4 | Chaitali |   25 | Mumbai  | 6500.00 |
|  5 | Hardik   |   27 | Bhopal  | 8500.00 |
+----+----------+------+---------+---------+
3 rows in set (0.009 sec)

mysql> select age from customerswhere exists (select age from customers where salary >6500);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'exists (select age from customers where salary >6500)' at line 1
mysql> select age from customers where exists (select age from customers where salary >6500);
+------+
| age  |
+------+
|   32 |
|   25 |
|   23 |
|   25 |
|   27 |
|   22 |
|   24 |
+------+
7 rows in set (0.013 sec)

mysql> select * from customers where age > all (select age from customers where salary > 6500);
+----+--------+------+-----------+---------+
| ID | NAME   | AGE  | ADDRESS   | SALARY  |
+----+--------+------+-----------+---------+
|  1 | Ramesh |   32 | Ahmedabad | 2000.00 |
+----+--------+------+-----------+---------+
1 row in set (0.010 sec)

mysql> select * from customers where age > any (select age from customers where salary > 6500);
+----+----------+------+-----------+---------+
| ID | NAME     | AGE  | ADDRESS   | SALARY  |
+----+----------+------+-----------+---------+
|  1 | Ramesh   |   32 | Ahmedabad | 2000.00 |
|  2 | Khilan   |   25 | Delhi     | 1500.00 |
|  4 | Chaitali |   25 | Mumbai    | 6500.00 |
|  5 | Hardik   |   27 | Bhopal    | 8500.00 |
+----+----------+------+-----------+---------+
4 rows in set (0.011 sec)

mysql> select * from customers;
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

mysql> select * from customers where salary = 10000;
+----+-------+------+---------+----------+
| ID | NAME  | AGE  | ADDRESS | SALARY   |
+----+-------+------+---------+----------+
|  7 | Muffy |   24 | Indore  | 10000.00 |
+----+-------+------+---------+----------+
1 row in set (0.000 sec)

mysql> select (15 + 6) as addition
    -> ;
+----------+
| addition |
+----------+
|       21 |
+----------+
1 row in set (0.000 sec)

mysql> select count(*) as 'records' from customers;
+---------+
| records |
+---------+
|       7 |
+---------+
1 row in set (0.018 sec)

mysql> select current_timestamp;
+---------------------+
| current_timestamp   |
+---------------------+
| 2025-09-10 16:05:23 |
+---------------------+
1 row in set (0.000 sec)

mysql> select getdate();
ERROR 1305 (42000): FUNCTION company.getdate does not exist
mysql> select getdate();;
ERROR 1305 (42000): FUNCTION company.getdate does not exist
ERROR: 
No query specified

mysql> select now();
+---------------------+
| now()               |
+---------------------+
| 2025-09-10 16:07:42 |
+---------------------+
1 row in set (0.000 sec)

mysql> create database testDB;
Query OK, 1 row affected (0.011 sec)

mysql> show database;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'database' at line 1
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
Database changed
mysql> create table class(ID int not null, NAME varchar(20) not null, AGE int not null, ADDRESS char (25), SALARY DECIMAL (18, 2),PRIMARY KEY(ID));
Query OK, 0 rows affected (0.019 sec)

mysql> desc class
    -> ;
+---------+---------------+------+-----+---------+-------+
| Field   | Type          | Null | Key | Default | Extra |
+---------+---------------+------+-----+---------+-------+
| ID      | int           | NO   | PRI | NULL    |       |
| NAME    | varchar(20)   | NO   |     | NULL    |       |
| AGE     | int           | NO   |     | NULL    |       |
| ADDRESS | char(25)      | YES  |     | NULL    |       |
| SALARY  | decimal(18,2) | YES  |     | NULL    |       |
+---------+---------------+------+-----+---------+-------+
5 rows in set (0.021 sec)

mysql> drop table class;
Query OK, 0 rows affected (0.027 sec)

mysql> desc class;
ERROR 1146 (42S02): Table 'testdb.class' doesn't exist
mysql> insert into class(ID, NAME, AGE, ADDRESS, SALARY) values(('Ramesh', 32, 'Ahmedabad', 2000.00),
    ->     -> ('Khilan', 25, 'Delhi', 1500.00),
    ->     -> ('Kaushik', 23, 'Kota', 2000.00),
    ->     -> ('Chaitali', 25, 'Mumbai', 6500.00),
    ->     -> ('Hardik', 27, 'Bhopal', 8500.00),
    ->     -> ('Komal', 22, 'MP', 4500.00),
    ->     -> ('Muffy', 24, 'Indore', 10000.00);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '-> ('Khilan', 25, 'Delhi', 1500.00),
    -> ('Kaushik', 23, 'Kota', 2000.00),
  ' at line 2
mysql> ('Ramesh', 32, 'Ahmedabad', 2000.00),
    ->     -> ('Khilan', 25, 'Delhi', 1500.00),
    ->     -> ('Kaushik', 23, 'Kota', 2000.00),
    ->     -> ('Chaitali', 25, 'Mumbai', 6500.00),
    ->     -> ('Hardik', 27, 'Bhopal', 8500.00),
    ->     -> ('Komal', 22, 'MP', 4500.00),
    ->     -> ('Muffy', 24, 'Indore', 10000.00);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''Ramesh', 32, 'Ahmedabad', 2000.00),
    -> ('Khilan', 25, 'Delhi', 1500.00),
  ' at line 1
mysql> insert into class values(('Ramesh', 32, 'Ahmedabad', 2000.00),('Khilan', 25, 'Delhi', 1500.00),('Kaushik', 23, 'Kota', 2000.00),('Chaitali', 25, 'Mumbai', 6500.00),('Hardik', 27, 'Bhopal', 8500.00),('Komal', 22, 'MP', 4500.00),('Muffy', 24, 'Indore', 10000.00);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> insert into class values('Ramesh', 32, 'Ahmedabad', 2000.00),('Khilan', 25, 'Delhi', 1500.00),('Kaushik', 23, 'Kota', 2000.00),('Chaitali', 25, 'Mumbai', 6500.00),('Hardik', 27, 'Bhopal', 8500.00),('Komal', 22, 'MP', 4500.00),('Muffy', 24, 'Indore', 10000.00);
ERROR 1146 (42S02): Table 'testdb.class' doesn't exist
mysql> CREATE TABLE class (
    ->     NAME VARCHAR(50) NOT NULL,
    ->     AGE INT,
    ->     ADDRESS VARCHAR(100),
    ->     SALARY DECIMAL(10,2)
    -> );
Query OK, 0 rows affected (0.015 sec)

mysql> INSERT INTO class (NAME, AGE, ADDRESS, SALARY)
    -> VALUES
    -> ('Ramesh', 32, 'Ahmedabad', 2000.00),
    -> ('Khilan', 25, 'Delhi', 1500.00),
    -> ('Kaushik', 23, 'Kota', 2000.00),
    -> ('Chaitali', 25, 'Mumbai', 6500.00),
    -> ('Hardik', 27, 'Bhopal', 8500.00),
    -> ('Komal', 22, 'MP', 4500.00),
    -> ('Muffy', 24, 'Indore', 10000.00);
Query OK, 7 rows affected (0.019 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM class;
+----------+------+-----------+----------+
| NAME     | AGE  | ADDRESS   | SALARY   |
+----------+------+-----------+----------+
| Ramesh   |   32 | Ahmedabad |  2000.00 |
| Khilan   |   25 | Delhi     |  1500.00 |
| Kaushik  |   23 | Kota      |  2000.00 |
| Chaitali |   25 | Mumbai    |  6500.00 |
| Hardik   |   27 | Bhopal    |  8500.00 |
| Komal    |   22 | MP        |  4500.00 |
| Muffy    |   24 | Indore    | 10000.00 |
+----------+------+-----------+----------+
7 rows in set (0.000 sec)

mysql> CREATE TABLE class (
    ->     ID INT PRIMARY KEY AUTO_INCREMENT,
    ->     NAME VARCHAR(50) NOT NULL,
    ->     AGE INT,
    ->     ADDRESS VARCHAR(100),
    ->     SALARY DECIMAL(10,2)
    -> );
ERROR 1050 (42S01): Table 'class' already exists
mysql> ALTER TABLE class
    -> ADD COLUMN ID INT PRIMARY KEY AUTO_INCREMENT FIRST;
Query OK, 0 rows affected (0.056 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE class;
+---------+---------------+------+-----+---------+----------------+
| Field   | Type          | Null | Key | Default | Extra          |
+---------+---------------+------+-----+---------+----------------+
| ID      | int           | NO   | PRI | NULL    | auto_increment |
| NAME    | varchar(50)   | NO   |     | NULL    |                |
| AGE     | int           | YES  |     | NULL    |                |
| ADDRESS | varchar(100)  | YES  |     | NULL    |                |
| SALARY  | decimal(10,2) | YES  |     | NULL    |                |
+---------+---------------+------+-----+---------+----------------+
5 rows in set (0.009 sec)

mysql> INSERT INTO class (NAME, AGE, ADDRESS, SALARY)
    -> VALUES
    -> ('Ramesh', 32, 'Ahmedabad', 2000.00),
    -> ('Khilan', 25, 'Delhi', 1500.00),
    -> ('Kaushik', 23, 'Kota', 2000.00),
    -> ('Chaitali', 25, 'Mumbai', 6500.00),
    -> ('Hardik', 27, 'Bhopal', 8500.00),
    -> ('Komal', 22, 'MP', 4500.00),
    -> ('Muffy', 24, 'Indore', 10000.00);
Query OK, 7 rows affected (0.010 sec)
Records: 7  Duplicates: 0  Warnings: 0

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
|  8 | Ramesh   |   32 | Ahmedabad |  2000.00 |
|  9 | Khilan   |   25 | Delhi     |  1500.00 |
| 10 | Kaushik  |   23 | Kota      |  2000.00 |
| 11 | Chaitali |   25 | Mumbai    |  6500.00 |
| 12 | Hardik   |   27 | Bhopal    |  8500.00 |
| 13 | Komal    |   22 | MP        |  4500.00 |
| 14 | Muffy    |   24 | Indore    | 10000.00 |
+----+----------+------+-----------+----------+
14 rows in set (0.000 sec)

mysql> INSERT INTO class (NAME, AGE, ADDRESS, SALARY)
    -> VALUES
    -> ('Ramesh', 32, 'Ahmedabad', 2000.00),
    -> ('Khilan', 25, 'Delhi', 1500.00),
    -> ('Kaushik', 23, 'Kota', 2000.00),
    -> ('Chaitali', 25, 'Mumbai', 6500.00),
    -> ('Hardik', 27, 'Bhopal', 8500.00),
    -> ('Komal', 22, 'MP', 4500.00),
    -> ('Muffy', 24, 'Indore', 10000.00);
Query OK, 7 rows affected (0.009 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> INSERT INTO class (NAME, AGE, ADDRESS, SALARY)
    -> VALUES
    -> ('Ramesh', 32, 'Ahmedabad', 2000.00),
    -> ('Khilan', 25, 'Delhi', 1500.00),
    -> ('Kaushik', 23, 'Kota', 2000.00),
    -> ('Chaitali', 25, 'Mumbai', 6500.00),
    -> ('Hardik', 27, 'Bhopal', 8500.00),
    -> ('Komal', 22, 'MP', 4500.00),
    -> ('Muffy', 24, 'Indore', 10000.00);
Query OK, 7 rows affected (0.009 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> TRUNCATE TABLE class;
Query OK, 0 rows affected (0.019 sec)

mysql> select * from table;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'table' at line 1
mysql> select * from class;
Empty set (0.001 sec)

mysql> CREATE TABLE class (
    ->     ID INT PRIMARY KEY AUTO_INCREMENT,
    ->     NAME VARCHAR(50) NOT NULL,
    ->     AGE INT,
    ->     ADDRESS VARCHAR(100),
    ->     SALARY DECIMAL(10,2)
    -> );
ERROR 1050 (42S01): Table 'class' already exists
mysql> INSERT INTO class (NAME, AGE, ADDRESS, SALARY)
    -> VALUES
    -> ('Ramesh', 32, 'Ahmedabad', 2000.00),
    -> ('Khilan', 25, 'Delhi', 1500.00),
    -> ('Kaushik', 23, 'Kota', 2000.00),
    -> ('Chaitali', 25, 'Mumbai', 6500.00),
    -> ('Hardik', 27, 'Bhopal', 8500.00),
    -> ('Komal', 22, 'MP', 4500.00),
    -> ('Muffy', 24, 'Indore', 10000.00);
Query OK, 7 rows affected (0.011 sec)
Records: 7  Duplicates: 0  Warnings: 0

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

mysql> select * from customers;
ERROR 1146 (42S02): Table 'testdb.customers' doesn't exist
mysql> select id, name, salary from customers;
ERROR 1146 (42S02): Table 'testdb.customers' doesn't exist
mysql> select is, name, salary from class;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'is, name, salary from class' at line 1
mysql> select id , name, salary from class;
+----+----------+----------+
| id | name     | salary   |
+----+----------+----------+
|  1 | Ramesh   |  2000.00 |
|  2 | Khilan   |  1500.00 |
|  3 | Kaushik  |  2000.00 |
|  4 | Chaitali |  6500.00 |
|  5 | Hardik   |  8500.00 |
|  6 | Komal    |  4500.00 |
|  7 | Muffy    | 10000.00 |
+----+----------+----------+
7 rows in set (0.000 sec)

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

mysql> select id , name, salary from customers where salary >2000;
ERROR 1146 (42S02): Table 'testdb.customers' doesn't exist
mysql> select id, name, salary from class where salary > 2000;
+----+----------+----------+
| id | name     | salary   |
+----+----------+----------+
|  4 | Chaitali |  6500.00 |
|  5 | Hardik   |  8500.00 |
|  6 | Komal    |  4500.00 |
|  7 | Muffy    | 10000.00 |
+----+----------+----------+
4 rows in set (0.000 sec)

mysql> select id, name, salary from class where name = 'Hardik';
+----+--------+---------+
| id | name   | salary  |
+----+--------+---------+
|  5 | Hardik | 8500.00 |
+----+--------+---------+
1 row in set (0.025 sec)

mysql> 

Last login: Tue Oct 14 12:05:50 on ttys000
/usr/local/bin/mysql -u root -p                                                 
(base) manishuxuid@Manishs-MBP ~ % /usr/local/bin/mysql -u root -p
zsh: no such file or directory: /usr/local/bin/mysql
(base) manishuxuid@Manishs-MBP ~ % mysql -u root -p

Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
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
| pythondb           |
| sys                |
| testDB             |
+--------------------+
8 rows in set (0.308 sec)

mysql> CREATE DATABASE mydatabase;
Query OK, 1 row affected (0.062 sec)

mysql> CREATE DATABASE data_science_project;
Query OK, 1 row affected (0.002 sec)

mysql> Create DATABASE webgui;
Query OK, 1 row affected (0.016 sec)

mysql> show databases;
+----------------------+
| Database             |
+----------------------+
| company              |
| data_science_project |
| information_schema   |
| mydatabase           |
| mysql                |
| nit                  |
| performance_schema   |
| pythondb             |
| sys                  |
| testDB               |
| webgui               |
+----------------------+
11 rows in set (0.001 sec)

mysql> use webgui;
Database changed
mysql> system cls;
ERROR: 
'system' command received, but the --system-command option is off. Skipping.
mysql> CREATE TABLE registration(
    -> id INT AUTO INCREMENT PRIMARY KEY,
    -> name VARCHAR 100)NOT NULL,
    -> 
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'AUTO INCREMENT PRIMARY KEY,
name VARCHAR 100)NOT NULL,' at line 2
mysql> CREATE TABLE registration(
    -> id INT AUTO_INCREMENT PRIMARY KEY,
    -> name VARCHAR(100) NOT NULL,
    -> course VARCHAR(100) NOT NULL,
    -> fee DECIMAL(10, 2) NOT NULL
    -> );
Query OK, 0 rows affected (0.108 sec)

mysql> desc registration;
+--------+---------------+------+-----+---------+----------------+
| Field  | Type          | Null | Key | Default | Extra          |
+--------+---------------+------+-----+---------+----------------+
| id     | int           | NO   | PRI | NULL    | auto_increment |
| name   | varchar(100)  | NO   |     | NULL    |                |
| course | varchar(100)  | NO   |     | NULL    |                |
| fee    | decimal(10,2) | NO   |     | NULL    |                |
+--------+---------------+------+-----+---------+----------------+
4 rows in set (0.024 sec)

mysql> show databases,
    -> show databases;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',
show databases' at line 1
mysql> show databases;
+----------------------+
| Database             |
+----------------------+
| company              |
| data_science_project |
| information_schema   |
| mydatabase           |
| mysql                |
| nit                  |
| performance_schema   |
| pythondb             |
| sys                  |
| testDB               |
| webgui               |
+----------------------+
11 rows in set (0.002 sec)

mysql> use webgui;
Database changed
mysql> CREATE TABLE registration(
    ->     -> id INT AUTO_INCREMENT PRIMARY KEY,
    ->     -> name VARCHAR(100) NOT NULL,
    ->     -> course VARCHAR(100) NOT NULL,
    ->     -> fee DECIMAL(10, 2) NOT NULL
    ->     -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '-> id INT AUTO_INCREMENT PRIMARY KEY,
    -> name VARCHAR(100) NOT NULL,
    -> ' at line 2
mysql> CREATE TABLE registration(
    -> id INT AUTO_INCREMENT PRIMARY KEY,
    -> name VARCHAR(100) NOT NULL,
    -> course VARCHAR(100) NOT NULL,
    -> fee DECIMAL(10, 2) NOT NULL
    -> );
ERROR 1050 (42S01): Table 'registration' already exists
mysql> which python3
    -> 
    -> ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'YourNewPassword';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'which python3

ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_passwo' at line 1
mysql> FLUSH PRIVILEGES;
Query OK, 0 rows affected, 1 warning (0.017 sec)

mysql> EXIT;
Bye
(base) manishuxuid@Manishs-MBP ~ % mysql -u root -p

Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 14
Server version: 9.4.0 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+----------------------+
| Database             |
+----------------------+
| company              |
| data_science_project |
| information_schema   |
| mydatabase           |
| mysql                |
| nit                  |
| performance_schema   |
| pythondb             |
| sys                  |
| testDB               |
| webgui               |
+----------------------+
11 rows in set (0.003 sec)

mysql> use webgui;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show registration TABLE;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'registration TABLE' at line 1
mysql> show table;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> desc registration;
+--------+---------------+------+-----+---------+----------------+
| Field  | Type          | Null | Key | Default | Extra          |
+--------+---------------+------+-----+---------+----------------+
| id     | int           | NO   | PRI | NULL    | auto_increment |
| name   | varchar(100)  | NO   |     | NULL    |                |
| course | varchar(100)  | NO   |     | NULL    |                |
| fee    | decimal(10,2) | NO   |     | NULL    |                |
+--------+---------------+------+-----+---------+----------------+
4 rows in set (0.009 sec)

mysql> select * from registration;
Empty set (0.001 sec)

mysql> use webgui
Database changed
mysql> desc registration;
+--------+---------------+------+-----+---------+----------------+
| Field  | Type          | Null | Key | Default | Extra          |
+--------+---------------+------+-----+---------+----------------+
| id     | int           | NO   | PRI | NULL    | auto_increment |
| name   | varchar(100)  | NO   |     | NULL    |                |
| course | varchar(100)  | NO   |     | NULL    |                |
| fee    | decimal(10,2) | NO   |     | NULL    |                |
+--------+---------------+------+-----+---------+----------------+
4 rows in set (0.004 sec)

mysql> ALTER TABLE registration
    -> ADD COLUMN branch VARCHAR(50),
    -> ADD COLUMN gender VARCHAR(10),
    -> ADD COLUMN age INT;
Query OK, 0 rows affected (0.077 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc registration;
+--------+---------------+------+-----+---------+----------------+
| Field  | Type          | Null | Key | Default | Extra          |
+--------+---------------+------+-----+---------+----------------+
| id     | int           | NO   | PRI | NULL    | auto_increment |
| name   | varchar(100)  | NO   |     | NULL    |                |
| course | varchar(100)  | NO   |     | NULL    |                |
| fee    | decimal(10,2) | NO   |     | NULL    |                |
| branch | varchar(50)   | YES  |     | NULL    |                |
| gender | varchar(10)   | YES  |     | NULL    |                |
| age    | int           | YES  |     | NULL    |                |
+--------+---------------+------+-----+---------+----------------+
7 rows in set (0.003 sec)

mysql> select * registration
    -> select * from registration;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'registration
select * from registration' at line 1
mysql> select * from registration;
+----+--------+--------+----------+--------+--------+------+
| id | name   | course | fee      | branch | gender | age  |
+----+--------+--------+----------+--------+--------+------+
|  1 | Manish | FSDS   | 32000.00 | SC     | Male   |   29 |
|  2 | Shweta | AI     | 25000.00 | AC     | Female |   27 |
+----+--------+--------+----------+--------+--------+------+
2 rows in set (0.001 sec)

mysql> 

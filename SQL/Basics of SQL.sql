Last login: Tue Sep  9 02:29:42 on ttys003
/usr/local/bin/mysql -u root -p                                                 
(base) manishuxuid@Manishs-MacBook-Pro ~ % /usr/local/bin/mysql -u root -p
zsh: no such file or directory: /usr/local/bin/mysql
(base) manishuxuid@Manishs-MacBook-Pro ~ % show databses;
zsh: command not found: show
(base) manishuxuid@Manishs-MacBook-Pro ~ % mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 18
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
| information_schema |
| mysql              |
| nit                |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.001 sec)

mysql> use nit
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> create table Student(
    -> name varchar(30),
    -> id int not null primary key,
    -> adress varchar(50),
    -> marks int);
ERROR 1050 (42S01): Table 'student' already exists
mysql> DROP TABLE IF EXISTS student;
Query OK, 0 rows affected (0.005 sec)

mysql> 
mysql> CREATE TABLE student (
    ->     name VARCHAR(30),
    ->     id INT NOT NULL PRIMARY KEY,
    ->     address VARCHAR(50),
    ->     marks INT
    -> );
Query OK, 0 rows affected (0.007 sec)

mysql> insert into student(marks,id,name, address)values(78,12,'prakash','hyd');
Query OK, 1 row affected (0.010 sec)

mysql> insert into student values('kodi',40,'bng',66);
Query OK, 1 row affected (0.009 sec)

mysql> insert into student values('alex',45,'hyd',79),('cathy',17,'delhi',90),('dolly',48,'pune',67),('chancy',78,'mumbai',34);
Query OK, 4 rows affected (0.009 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from student;
+---------+----+---------+-------+
| name    | id | address | marks |
+---------+----+---------+-------+
| prakash | 12 | hyd     |    78 |
| cathy   | 17 | delhi   |    90 |
| kodi    | 40 | bng     |    66 |
| alex    | 45 | hyd     |    79 |
| dolly   | 48 | pune    |    67 |
| chancy  | 78 | mumbai  |    34 |
+---------+----+---------+-------+
6 rows in set (0.000 sec)

mysql> select name from student;
+---------+
| name    |
+---------+
| prakash |
| cathy   |
| kodi    |
| alex    |
| dolly   |
| chancy  |
+---------+
6 rows in set (0.000 sec)

mysql> select name,id from student;
+---------+----+
| name    | id |
+---------+----+
| prakash | 12 |
| cathy   | 17 |
| kodi    | 40 |
| alex    | 45 |
| dolly   | 48 |
| chancy  | 78 |
+---------+----+
6 rows in set (0.000 sec)

mysql> select * fromstudent where id= 12;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'fromstudent where id= 12' at line 1
mysql> select * from student where id = 12;
+---------+----+---------+-------+
| name    | id | address | marks |
+---------+----+---------+-------+
| prakash | 12 | hyd     |    78 |
+---------+----+---------+-------+
1 row in set (0.000 sec)

mysql> selct * from student;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'selct * from student' at line 1
mysql> select * from student;
+---------+----+---------+-------+
| name    | id | address | marks |
+---------+----+---------+-------+
| prakash | 12 | hyd     |    78 |
| cathy   | 17 | delhi   |    90 |
| kodi    | 40 | bng     |    66 |
| alex    | 45 | hyd     |    79 |
| dolly   | 48 | pune    |    67 |
| chancy  | 78 | mumbai  |    34 |
+---------+----+---------+-------+
6 rows in set (0.000 sec)

mysql> insert into student values('sam',12,'hyd',56);
ERROR 1062 (23000): Duplicate entry '12' for key 'student.PRIMARY'
mysql> update students set address = 'chennai' where id = 45;
ERROR 1146 (42S02): Table 'nit.students' doesn't exist
mysql> update student set address = 'chennai' where id = 45;
Query OK, 1 row affected (0.010 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from student
    -> 
    -> swele
    -> sdd;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'sdd' at line 4
mysql> select * from student;
+---------+----+---------+-------+
| name    | id | address | marks |
+---------+----+---------+-------+
| prakash | 12 | hyd     |    78 |
| cathy   | 17 | delhi   |    90 |
| kodi    | 40 | bng     |    66 |
| alex    | 45 | chennai |    79 |
| dolly   | 48 | pune    |    67 |
| chancy  | 78 | mumbai  |    34 |
+---------+----+---------+-------+
6 rows in set (0.000 sec)

mysql> alter table student add phoneNo int;
Query OK, 0 rows affected (0.009 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from student
    -> df;
+---------+----+---------+-------+---------+
| name    | id | address | marks | phoneNo |
+---------+----+---------+-------+---------+
| prakash | 12 | hyd     |    78 |    NULL |
| cathy   | 17 | delhi   |    90 |    NULL |
| kodi    | 40 | bng     |    66 |    NULL |
| alex    | 45 | chennai |    79 |    NULL |
| dolly   | 48 | pune    |    67 |    NULL |
| chancy  | 78 | mumbai  |    34 |    NULL |
+---------+----+---------+-------+---------+
6 rows in set (0.000 sec)

mysql> select * from student;
+---------+----+---------+-------+---------+
| name    | id | address | marks | phoneNo |
+---------+----+---------+-------+---------+
| prakash | 12 | hyd     |    78 |    NULL |
| cathy   | 17 | delhi   |    90 |    NULL |
| kodi    | 40 | bng     |    66 |    NULL |
| alex    | 45 | chennai |    79 |    NULL |
| dolly   | 48 | pune    |    67 |    NULL |
| chancy  | 78 | mumbai  |    34 |    NULL |
+---------+----+---------+-------+---------+
6 rows in set (0.000 sec)

mysql> update student set phoneNo = 123;
Query OK, 6 rows affected (0.009 sec)
Rows matched: 6  Changed: 6  Warnings: 0

mysql> select * from student;
+---------+----+---------+-------+---------+
| name    | id | address | marks | phoneNo |
+---------+----+---------+-------+---------+
| prakash | 12 | hyd     |    78 |     123 |
| cathy   | 17 | delhi   |    90 |     123 |
| kodi    | 40 | bng     |    66 |     123 |
| alex    | 45 | chennai |    79 |     123 |
| dolly   | 48 | pune    |    67 |     123 |
| chancy  | 78 | mumbai  |    34 |     123 |
+---------+----+---------+-------+---------+
6 rows in set (0.000 sec)

mysql> update student set phoneNo = 456 where id = 12;
Query OK, 1 row affected (0.009 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from student;
+---------+----+---------+-------+---------+
| name    | id | address | marks | phoneNo |
+---------+----+---------+-------+---------+
| prakash | 12 | hyd     |    78 |     456 |
| cathy   | 17 | delhi   |    90 |     123 |
| kodi    | 40 | bng     |    66 |     123 |
| alex    | 45 | chennai |    79 |     123 |
| dolly   | 48 | pune    |    67 |     123 |
| chancy  | 78 | mumbai  |    34 |     123 |
+---------+----+---------+-------+---------+
6 rows in set (0.000 sec)

mysql> desc student;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| name    | varchar(30) | YES  |     | NULL    |       |
| id      | int         | NO   | PRI | NULL    |       |
| address | varchar(50) | YES  |     | NULL    |       |
| marks   | int         | YES  |     | NULL    |       |
| phoneNo | int         | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
5 rows in set (0.011 sec)

mysql> altar table student modify column name varchar
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'altar table student modify column name varchar' at line 1
mysql> altar table student modify column name varchar(60);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'altar table student modify column name varchar(60)' at line 1
mysql> alter table student modify column name varchar(60);
Query OK, 0 rows affected (0.014 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc student;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| name    | varchar(60) | YES  |     | NULL    |       |
| id      | int         | NO   | PRI | NULL    |       |
| address | varchar(50) | YES  |     | NULL    |       |
| marks   | int         | YES  |     | NULL    |       |
| phoneNo | int         | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
5 rows in set (0.002 sec)

mysql> alter table student drop column phoneNo;
Query OK, 0 rows affected (0.015 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from student;
+---------+----+---------+-------+
| name    | id | address | marks |
+---------+----+---------+-------+
| prakash | 12 | hyd     |    78 |
| cathy   | 17 | delhi   |    90 |
| kodi    | 40 | bng     |    66 |
| alex    | 45 | chennai |    79 |
| dolly   | 48 | pune    |    67 |
| chancy  | 78 | mumbai  |    34 |
+---------+----+---------+-------+
6 rows in set (0.000 sec)

mysql> 

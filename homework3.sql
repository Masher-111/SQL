-- создаем и заполняем таблицы salespeople, customers, customers
USE Lesson3;
CREATE TABLE salespeople
(
snum INT PRIMARY KEY,
sname VARCHAR(45),
city VARCHAR(45),
comm VARCHAR(45));
INSERT INTO salespeople (snum, sname, city, comm)
VALUES
(1001, 'Peel', 'London', '.12'),
(1002, 'Serres', 'San Jose', '.13'),
(1004, 'Motika', 'London', '.11'),
(1007, 'Rifkin', 'Barcelona', '.15'),
(1003, 'Axelrod', 'New York', '.10');
CREATE TABLE customers
(
cnum INT PRIMARY KEY,
cname VARCHAR(45),
city VARCHAR(45),
rating INT,
snum INT,
FOREIGN KEY (snum) REFERENCES salespeople (snum));
 INSERT INTO customers (cnum, cname, city, rating, snum)
 VALUES
 (2001, 'Hoffman', 'London', 100, 1001),
 (2002, 'Giovanni', 'Rome',  200, 1003),
 (2003, 'Liu', 'SanJose', 200, 1002),
 (2004, 'Grass', 'Berlin', 300, 1002),
 (2006, 'Clemens', 'London', 100, 1001),
 (2008, 'Cisneros', 'SanJose', 300, 1007),
 (2007, 'Pereira', 'Rome', 100, 1004);
 CREATE TABLE orders
 (
 onum INT PRIMARY KEY,
 amt DECIMAL(10,2),
 odate DATE,
 cnum INT,
 FOREIGN KEY (cnum) REFERENCES customers (cnum),
 snum INT,
 FOREIGN KEY (snum) REFERENCES salespeople (snum));
 INSERT INTO orders (onum, amt, odate, cnum, snum)
 VALUES
 (3001, '18.69', '1990-03-10', 2008, 1007),
 (3003, '767.19', '1990-03-10', 2001, 1001),
 (3002, '1900.10', '1990-03-10', 2007, 1004),
 (3005, '5160.45', '1990-03-10', 2003, 1002),
 (3006, '1098.16', '1990-03-10', 2008, 1007),
 (3009, '1713.23', '1990-04-10', 2002, 1003),
 (3007, '75.75', '1990-04-10', 2004, 1002),
 (3008, '4723.00', '1990-05-10', 2006, 1001),
 (3010, '1309.95', '1990-06-10', 2004, 1002),
 (3011, '9891.88', '1990-06-10', 2006, 1001);
-- Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum, comm.
SELECT city, sname, snum, comm FROM  salespeople;
-- Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем каждого заказчика
-- в городе San Jose. 
SELECT rating, cname FROM  customers
WHERE city = 'SanJose';
-- Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов 
-- без каких бы то ни было повторений. 
SELECT DISTINCT snum FROM  salespeople;
-- Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. 
-- Используется оператор "LIKE"
SELECT cname FROM  customers
WHERE cname LIKE 'G%';
-- Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000
SELECT * FROM orders WHERE amt > 1000;
-- Напишите запрос который выбрал бы наименьшую сумму заказа.
SELECT MIN(amt) FROM orders; 
-- Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков,
--  у которых рейтинг больше 100 и они находятся не в Риме.
SELECT * FROM customers
WHERE rating > 100 AND city != 'Rome';
-- Содаем и заполняем таблицу staff
CREATE TABLE staff
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name varchar(45),
    surname varchar(45),
    specialty varchar(45),
    seniority INT,
    salary INT,
    age INT
);
INSERT INTO staff (name, surname, specialty, seniority,salary, age)
VALUES
	('Вася', 'Васькин', 'начальник', 40, 100000, 60),
    ('Петя', 'Васькин', 'начальник', 8, 100000, 30),
    ('Екатерина', 'Катькина', 'инженер', 2, 70000, 30),
    ('Екатерина', 'Сашкина', 'инженер', 6, 80000, 40),
    ('Антон', 'Катькин', 'сотрудник', 1, 30000, 23),
    ('Юра', 'Галкин', 'рабочий', 5, 30000, 28);
INSERT INTO staff (name, surname, specialty, seniority,salary, age)
VALUES
	('Олег', 'Рогов', 'рабочий', 15, 10000, 41),
    ('Егор', 'Иванов', 'рабочий', 10, 25000, 36),
    ('Игорь', 'Есенин', 'рабочий', 5, 15000, 30),
    ('Валерий', 'Леонтьев', 'рабочий', 7, 30000, 40),
    ('Нколай', 'Ермолов', 'рабочий', 25, 26000, 45);
-- сортировка зарплаты по возрастанию
SELECT *
FROM staff
ORDER BY salary;
-- сортировка зарплаты по убыванию  и вывод 5 строк с наибольшей зарплатой
SELECT *
FROM staff
ORDER BY salary DESC
LIMIT 5;
-- группировка сотрудников со специальностью рабочий, зарплата котоых больше 20000.
SELECT *
FROM staff 
WHERE specialty = 'рабочий' AND salary > 20000;


   

USE lesson4;
-- Выбрать код , название города и популяцию , код , города и популяцию где код города больше текущего кода города на 2
SELECT *
FROM city c1
LEFT JOIN city c2 
ON c1.citycode + 2 = c2.citycode; 

-- Вывести марку авто - а так же сколько авто такой марки в таблице , вывести записи где количество авто такой марки больше 2, записи на должны дублироваться
SELECT mark, COUNT(mark)
FROM auto a
GROUP BY mark HAVING COUNT(mark) > 1;

-- Вывести Марку и цвет автомобиля - имя и фамилию покупателя, для всех покупателей, которые живут в городе с населением больше 1 млн человек.
SELECT mark, color, firstname, lastname 
FROM auto a
INNER JOIN man m
ON a.phonenum  = m.phonenum
WHERE m.citycode IN 
(SELECT citycode
FROM city c
WHERE peoples > 1000000
);

-- Вывести на экран людей которые живут в городах с населением больше 1000000 , если людей с таким же именем нет в таблице MAN
SELECT *
FROM man m
WHERE m.citycode IN
(
SELECT citycode
FROM city c
WHERE peoples > 1000000
)
AND  EXISTS
(
SELECT firstname, COUNT(*)
FROM man
GROUP BY firstname
HAVING COUNT(*) = 1
);

-- Вывести на экран, сколько машин каждого цвета  для машин марок BMW и LADA
SELECT mark, color, COUNT(color)
FROM auto
WHERE mark IN ('BMW', 'LADA')
GROUP BY mark, color;

-- Вывести на экран марку авто(количество) и количество авто не этой марки.
-- 100 машин, их них 20 - BMW и 80 машин другой марки ,  AUDI - 30 и 70 машин другой марки, LADA - 15, 85 авто другой марки
SELECT DISTINCT mark, COUNT(mark),
(SELECT COUNT(mark)
FROM auto a1 
WHERE a1.mark != a.mark)
AS other  
FROM auto a
GROUP BY mark;

create table test_a (id INT, test varchar(10));
create table test_b (id INT);
insert into test_a(id, test) values
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');
insert into test_b(id) values
(10),
(30),
(50);

-- Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.
SELECT * 
FROM test_a
LEFT JOIN test_b
ON test_a.id = test_b.id
WHERE test_b.id IS NULL;



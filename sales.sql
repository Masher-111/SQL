USE lesson_2;
CREATE TABLE sales 
(id INT AUTO_INCREMENT PRIMARY KEY,
 order_date DATE NOT NULL, 
 bucket INT NOT NULL);
INSERT INTO sales (order_date, bucket)
	VALUES
	('2021-01-01', 101),
	('2021-01-02', 153),
	('2021-01-03', 98),
	('2021-01-04', 205),
	('2021-01-05', 314);
 SELECT order_date, bucket,
	CASE
	WHEN bucket <= 100 THEN 'Маленький заказ'
	WHEN bucket > 100 AND bucket <=300 THEN 'Средний заказ'
	WHEN bucket > 300 THEN 'Большой заказ'
	END AS size_of_order
	FROM sales;

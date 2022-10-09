USE lesson_2;
CREATE TABLE orders
(id INT AUTO_INCREMENT PRIMARY KEY,
employeeid VARCHAR(10) NOT NULL,
amount DECIMAL(10,2) NOT NULL,
orderstatus VARCHAR(10) NOT NULL);
INSERT INTO orders (employeeid, amount, orderstatus)
VALUES
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED'),
('e04', 99.99, 'OPEN');
SELECT * FROM orders;
SELECT id, orderstatus,
CASE 
WHEN orderstatus = 'OPEN' THEN 'order is in open state'
WHEN orderstatus = 'CLOSED' THEN 'order is closed'
WHEN orderstatus = 'CANCELLED' THEN 'order is cancelled'
END AS order_summary
FROM orders;
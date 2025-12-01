--Creacion base de datos--
CREATE DATABASE firstdb;

--Asignacion de permisos--
GRANT ALL ON firstdb.*
TO guru2b@localhost
IDENTIFIED BY 'contraseña';

--Creacion de la Tabla--
CREATE TABLE sales_rep(
employee_number INT,
surname VARCHAR(40),
first_name VARCHAR(30),
commission TINYINT
);

--Insertar un dato a la Tabla--
INSERT INTO sales_rep
VALUES
(1,'Rive','Sol',10);

--Insertar varios datos a la Tabla --
INSERT INTO sales_rep
VALUES
(1,'Rive','Sol',10),
(2,'Gordimer','Charlene',
15);

--Carga desde el archivo--
LOAD DATA LOCAL
INFILE
'datos.txt' INTO TABLE
sales_rep;

--Metodo where
SELECT commission
FROM sales_rep
WHERE surname='Gordimer';

--otros metodos de consulta
WHERE surname LIKE 'Sero%'
WHERE surname LIKE '%se%'
WHERE surname LIKE '%ote'

--Ordenar de manera asendiente
SELECT * FROM sales_rep
ORDER BY surname ASC,
first_name ASC;

--Ordenar de manera desendiente
SELECT * FROM sales_rep
ORDER BY commission DESC;

--Calculando edades por precision
SELECT
surname,
first_name,
(YEAR(CURRENT_DATE) - YEAR(birthday))
- (RIGHT(CURRENT_DATE,5) < RIGHT(birthday,5))
AS age
FROM sales_rep;

--Update y delate
UPDATE sales_rep
SET commission = 12
WHERE employee_number=1;

DELETE FROM sales_rep
WHERE employee_number = 5;

ALTER TABLE sales_rep
ADD date_joined DATE;

SELECT
first_name,
surname,
value
FROM sales_rep, sales
WHERE sales.sales_rep = sales_rep.employee_number
AND first_name='Sol'
AND surname='Rive'; 

SELECT
sales_rep,
SUM(value) AS total
FROM sales
GROUP BY sales_rep
ORDER BY total DESC;

CREATE TABLE products(
id INT UNSIGNED,
code INT(6) ZEROFILL
);

gender ENUM('M','F','Other')

skills SET('PHP','MySQL','Java')

SELECT DATE_FORMAT(date_joined, '%W, %M %d, %Y')
FROM sales_rep;

mysql -H -e "SELECT * FROM users"

mysql -E -e "SELECT * FROM users"

--"DELETE FROM users;" - ¡Elimina TODA la tabla!

--Con Modo Seguro "ERROR 1175: Debes usar WHERE con una clave"

mysql --safe-updates -u root -p

--Esta opción es especialmente valiosa para administradores que ejecutan
--mantenimientos en producción o para usuarios que están aprendiendo y son
--propensos a errores costosos.

mysql --pager=less

EXPLAIN SELECT * FROM sales_rep
WHERE surname = 'Rive';

START TRANSACTION;
UPDATE accounts SET balance = balance - 100
WHERE account_id = 1;
UPDATE accounts SET balance = balance + 100
WHERE account_id = 2;
COMMIT;

CREATE USER 'developer'@'localhost'
IDENTIFIED BY 'secure_password';
GRANT SELECT, INSERT, UPDATE ON myapp.*
TO 'developer'@'localhost';
FLUSH PRIVILEGES;

CREATE TABLE orders (
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT NOT NULL,
order_date DATE,
FOREIGN KEY (customer_id)
REFERENCES customers(id)
ON DELETE RESTRICT
ON UPDATE CASCADE
);

SELECT name, salary
FROM employees
WHERE salary > (
SELECT AVG(salary)
FROM employees
);

SELECT name FROM customers
WHERE id IN (
SELECT customer_id
FROM orders
WHERE total > 1000
);

SELECT name FROM customers c
WHERE EXISTS (
SELECT 1 FROM orders o
WHERE o.customer_id = c.id
AND o.total > 1000
);

SELECT name, 'Customer' as type FROM customers
UNION
SELECT name, 'Employee' as type FROM employees
ORDER BY name;

CREATE VIEW high_value_customers AS
SELECT c.name, c.email, SUM(o.total) as lifetime_value
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.id
HAVING lifetime_value > 5000;

SELECT name,
IF(salary > 50000,
'High',
'Normal') as level
FROM employees;

SELECT name,
CASE
WHEN salary > 70000 THEN 'Senior'
WHEN salary > 50000 THEN 'Mid'
ELSE 'Junior'
END as level
FROM employees;

SELECT * FROM products
WHERE name REGEXP '^[A-Z].*Pro$';

SET @total = 0;
SELECT @total := @total + price as running_total, product
FROM orders
ORDER BY order_date;

DELIMITER //

CREATE PROCEDURE GetCustomerOrders(IN
customer_id INT)
BEGIN
SELECT * FROM orders
WHERE customer_id = customer_id;
END //

DELIMITER ;
CALL GetCustomerOrders(42);

CREATE TABLE orders (
id INT,
order_date DATE,
...
) PARTITION BY RANGE (YEAR(order_date)) (
PARTITION p2020 VALUES LESS THAN (2021),
PARTITION p2021 VALUES LESS THAN (2022),
PARTITION p2022 VALUES LESS THAN (2023),
PARTITION p2023 VALUES LESS THAN MAXVALUE
);



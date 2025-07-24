CREATE TABLE employee (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  age INT,
  salary INT
);

INSERT INTO employee (name, age, salary) VALUES
('Alice', 25, 5000),
('Bob', 30, 6000),
('Charlie', 35, 9000);

/*
UPDATE table_name
SET col1 = val1, col2 = val2
WHERE condition
*/

-- UPDATE employee SET salary = 10000 WHERE name = 'Alice';
-- UPDATE employee SET salary = 8000 WHERE salary < 8000;
-- UPDATE employee SET salary = 0;
-- UPDATE employee SET salary = age * 1000 WHERE salary > 6000 RETURNING *;
-- SELECT * FROM employee;

/*
DELETE FROM table_name WHERE condition
*/
-- DELETE FROM employee WHERE id = 2;
DELETE FROM employee WHERE age > 25 RETURNING *;
SELECT * FROM employee;

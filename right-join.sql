/* JOIN */
CREATE TABLE department (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  city VARCHAR(50)
);

CREATE TABLE employee (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  age INT,
  salary INT,
  department_id INT REFERENCES department(id)
);

INSERT INTO department(name, city) VALUES
('HR', 'New York'),
('IT', 'San Francisco'),
('Finance', 'Chicago'),
('Marketing', 'Los Angeles');

INSERT INTO employee (name, age, salary, department_id) VALUES
('John Doe', 30, 60000, 1),
('Alice Smith', 25, 55000, 2),
('Bob Johnson', 35, 70000, 3),
('Emma Lee', 28, 62000, 4),
('Michael Brown', 40, 75000, 1),
('Sarah Wilson', 27, 50000, 2),
('David Garcia', 33, 60000, 3),
('Jennifer Martinez', 29, 63000, 4),
('James Taylor', 45, 80000, 1),
('Olivia Moore', 31, 66000, 2);

INSERT INTO department(name, city) VALUES
  ('Customer Support', 'Istanbul');

-- SELECT * FROM department;
-- SELECT * FROM employee;
-- INNER JOIN : val1 = val2
-- SELECT * FROM employee INNER JOIN department ON employee.department_id = department.id;

/*
SELECT e.name AS employee_name, d.name AS department_name, city 
FROM employee AS e 
INNER JOIN department AS d ON e.department_id = d.id;
*/

-- without allias
/* SELECT e.name, d.name, city 
FROM employee e
JOIN department d ON e.department_id = d.id;*/

/*
SELECT department.name, SUM(employee.salary)  
FROM department 
JOIN employee ON employee.department_id = department.id
GROUP BY department.name;
*/

/* SELECT department.name AS dept_name, employee.name AS emp_name
FROM employee
INNER JOIN department ON employee.department_id = department.id; */

INSERT INTO employee(name, age, salary, department_id) VALUES
('The Boss', 44, NULL, NULL);

-- SELECT * FROM employee;

-- SELECT * FROM employee INNER JOIN department ON employee.department_id = department.id;

-- LEFT JOIN or LEFT OUTER JOIN
/* SELECT employee.name AS emp_name, department.name AS dept_name 
FROM department 
LEFT JOIN employee ON employee.department_id = department.id;*/

-- Right Join, Full Join
SELECT employee.name AS emp_name, department.name AS dept_name
FROM department
RIGHT JOIN employee ON employee.department_id = department.id;

-- Full or Full Outer Join
SELECT employee.name AS emp_name, department.name AS dept_name
FROM department
FULL JOIN employee ON employee.department_id = department.id;

-- Cross Join
SELECT employee.name AS emp_name, department.name AS dept_name
FROM department
CROSS JOIN employee;



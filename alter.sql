-- ALTER
CREATE TABLE employee (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  age INT,
  salary INT
);

INSERT INTO employee (name, age, salary) VALUES
('Alice', 25, 5000),
('Bob', 30, 6000),
('Charlie', 35, 7000);

ALTER TABLE employee ADD email VARCHAR(200);
ALTER TABLE employee ALTER COLUMN email TYPE VARCHAR(100); 
ALTER TABLE employee ADD CONSTRAINT unique_email UNIQUE(email);

INSERT INTO employee (name, age, salary, email) VALUES
('Alice', 25, 5000, 'test@gmail.com'),
('Bob', 30, 6000, 'test2@gmail.com'),
('Charlie', 35, 7000, 'test3@gmail.com');

ALTER TABLE employee DROP CONSTRAINT unique_email;
-- ALTER TABLE employee ALTER COLUMN email SET NOT NULL;
UPDATE employee SET email = 'temp@gmail.com' WHERE email IS NULL;
-- ALTER TABLE employee ALTER COLUMN email TYPE INTEGER;

INSERT INTO employee (name, age, salary, email) VALUES
('Alice', 25, 5000, 'test@gmail.com'),
('Bob', 30, 6000, 'test@gmail.com'),
('Charlie', 35, 7000, 'test3@gmail.com');

INSERT INTO employee (age, salary, email) VALUES
(25, 5000, 'test4@gmail.com');

ALTER TABLE employee RENAME COLUMN "name" TO full_name;
ALTER TABLE employee ALTER COLUMN full_name SET DEFAULT 'Unknown';

ALTER TABLE employee DROP COLUMN email;
ALTER TABLE employee DROP COLUMN IF EXISTS email;
ALTER TABLE employee 
DROP COLUMN IF EXISTS age,
DROP COLUMN IF EXISTS salary;

ALTER TABLE employee RENAME TO employee_update;

-- SELECT * FROM employee;
SELECT * FROM employee_update;

DROP TABLE employee_update;







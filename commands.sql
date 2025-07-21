
-- create
CREATE TABLE EMPLOYEE (
  empId INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  surname TEXT NULL,
  dept TEXT NOT NULL,
  age INTEGER NOT NULL,
  salary FLOAT NOT NULL,
  nationality TEXT NOT NULL
);

CREATE TABLE films (
    film_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    release_year INT CHECK (release_year >= 1888),
    language VARCHAR(50) NOT NULL,
    duration_minutes INT CHECK (duration_minutes > 0),
    rating VARCHAR(10),
    genre VARCHAR(100),
    director VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    hire_date DATE NOT NULL,
    job_title VARCHAR(100) NOT NULL,
    department VARCHAR(100),
    salary NUMERIC(10, 2) CHECK (salary >= 0),
    manager_id INT,
    city VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE order_details (
    order_detail_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    quantity INT CHECK (quantity > 0),
    unit_price NUMERIC(10, 2) CHECK (unit_price >= 0),
    discount NUMERIC(5, 2) DEFAULT 0.00 CHECK (discount >= 0 AND discount <= 100),
    total_price NUMERIC(12, 2) GENERATED ALWAYS AS (quantity * unit_price * (1 - discount / 100)) STORED,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- insert
INSERT INTO EMPLOYEE VALUES (0001, 'Clark', null, 'Sales', 23, 1.3, 'az');
INSERT INTO EMPLOYEE VALUES (0002, 'Dave', null, 'Accounting', 35, 2.5, 'az');
INSERT INTO EMPLOYEE VALUES (0003, 'Ava', null, 'Sales', 27, 1.5, 'tr');
INSERT INTO EMPLOYEE VALUES (0004, 'Test 1', 'Desc 1', 'Sales', 40, 1.1, 'tr');
INSERT INTO EMPLOYEE VALUES (0005, 'Test 2', 'Desc 2', 'Sales', 27, 0.8, 'ru');
INSERT INTO EMPLOYEE VALUES (0006, 'Clarker', null, 'CEO', 50, 5.2, 'en');

INSERT INTO films (title, description, release_year, language, duration_minutes, rating, genre, director) VALUES
('The Shawshank Redemption', 'Two imprisoned men bond over a number of years.', 1994, 'English', 142, 'R', 'Drama', 'Frank Darabont'),
('The Godfather', 'The aging patriarch of an organized crime dynasty transfers control to his reluctant son.', 1972, 'English', 175, 'R', 'Crime', 'Francis Ford Coppola'),
('The Dark Knight', 'Batman faces the Joker, a criminal mastermind.', 2008, 'English', 152, 'PG-13', 'Action', 'Christopher Nolan'),
('Pulp Fiction', 'The lives of two mob hitmen, a boxer, and others intertwine in crime stories.', 1994, 'English', 154, 'R', 'Crime', 'Quentin Tarantino'),
('Schindler''s List', 'In German-occupied Poland, Oskar Schindler saves Jews.', 1993, 'English', 195, 'R', 'History', 'Steven Spielberg'),
('Inception', 'A thief plants an idea into the mind of a C.E.O.', 2010, 'English', 148, 'PG-13', 'Sci-Fi', 'Christopher Nolan'),
('Fight Club', 'An insomniac and a soap maker form an underground club.', 1999, 'English', 139, 'R', 'Drama', 'David Fincher'),
('Forrest Gump', 'Forrest Gump, a slow-witted man, witnesses historic events.', 1994, 'English', 142, 'PG-13', 'Drama', 'Robert Zemeckis'),
('The Matrix', 'A hacker learns about the true nature of reality.', 1999, 'English', 136, 'R', 'Sci-Fi', 'The Wachowskis'),
('Goodfellas', 'The rise and fall of a mob associate.', 1990, 'English', 146, 'R', 'Crime', 'Martin Scorsese'),
('Se7en', 'Two detectives hunt a serial killer who uses seven deadly sins.', 1995, 'English', 127, 'R', 'Thriller', 'David Fincher'),
('Gladiator', 'A Roman general seeks revenge after being betrayed.', 2000, 'English', 155, 'R', 'Action', 'Ridley Scott'),
('Interstellar', 'Explorers travel through a wormhole in space.', 2014, 'English', 169, 'PG-13', 'Sci-Fi', 'Christopher Nolan'),
('The Green Mile', 'Guards at a death row prison witness supernatural events.', 1999, 'English', 189, 'R', 'Fantasy', 'Frank Darabont'),
('The Silence of the Lambs', 'An FBI trainee seeks help from Hannibal Lecter.', 1991, 'English', 118, 'R', 'Thriller', 'Jonathan Demme'),
('Saving Private Ryan', 'A group of soldiers search for a paratrooper in WWII.', 1998, 'English', 169, 'R', 'War', 'Steven Spielberg'),
('The Prestige', 'Two rival magicians battle in 19th century London.', 2006, 'English', 130, 'PG-13', 'Mystery', 'Christopher Nolan'),
('Whiplash', 'A music student is pushed by an abusive teacher.', 2014, 'English', 107, 'R', 'Drama', 'Damien Chazelle'),
('The Departed', 'An undercover cop and a mole in the police force try to identify each other.', 2006, 'English', 151, 'R', 'Crime', 'Martin Scorsese'),
('Django Unchained', 'A freed slave sets out to rescue his wife.', 2012, 'English', 165, 'R', 'Western', 'Quentin Tarantino');

INSERT INTO employees (first_name, last_name, email, phone_number, hire_date, job_title, department, salary, manager_id, city) VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '2020-01-15', 'Software Engineer', 'IT', 75000.00, NULL, 'New York'),
('Jane', 'Smith', 'jane.smith@example.com', '123-456-7891', '2019-06-01', 'Project Manager', 'IT', 90000.00, 1, 'Los Angeles'),
('Alice', 'Johnson', 'alice.johnson@example.com', '123-456-7892', '2021-03-10', 'UI/UX Designer', 'Design', 65000.00, 2, 'Chicago'),
('Bob', 'Williams', 'bob.williams@example.com', '123-456-7893', '2018-11-20', 'HR Manager', 'HR', 82000.00, NULL, 'Houston'),
('Charlie', 'Brown', 'charlie.brown@example.com', '123-456-7894', '2022-05-05', 'QA Engineer', 'IT', 60000.00, 1, 'Phoenix'),
('Diana', 'Evans', 'diana.evans@example.com', '123-456-7895', '2021-08-18', 'DevOps Engineer', 'IT', 77000.00, 2, 'Philadelphia'),
('Ethan', 'Moore', 'ethan.moore@example.com', '123-456-7896', '2017-10-30', 'Finance Analyst', 'Finance', 70000.00, NULL, 'San Antonio'),
('Fiona', 'Clark', 'fiona.clark@example.com', '123-456-7897', '2016-02-12', 'Accountant', 'Finance', 68000.00, 7, 'San Diego'),
('George', 'Taylor', 'george.taylor@example.com', '123-456-7898', '2023-01-01', 'Junior Developer', 'IT', 52000.00, 1, 'Dallas'),
('Hannah', 'White', 'hannah.white@example.com', '123-456-7899', '2020-07-22', 'Recruiter', 'HR', 58000.00, 4, 'San Jose'),
('Ian', 'Lee', 'ian.lee@example.com', '123-456-7800', '2021-09-09', 'Security Analyst', 'IT', 73000.00, 2, 'Austin'),
('Julia', 'Harris', 'julia.harris@example.com', '123-456-7801', '2022-12-01', 'Data Scientist', 'Data', 88000.00, NULL, 'Jacksonville'),
('Kevin', 'Martin', 'kevin.martin@example.com', '123-456-7802', '2019-04-17', 'Marketing Specialist', 'Marketing', 62000.00, NULL, 'Fort Worth'),
('Laura', 'Adams', 'laura.adams@example.com', '123-456-7803', '2018-09-23', 'Content Writer', 'Marketing', 58000.00, 13, 'Columbus'),
('Michael', 'Baker', 'michael.baker@example.com', '123-456-7804', '2015-06-10', 'Senior Developer', 'IT', 95000.00, 2, 'Charlotte'),
('Nina', 'Carter', 'nina.carter@example.com', '123-456-7805', '2020-10-10', 'Product Manager', 'Product', 92000.00, NULL, 'San Francisco'),
('Oscar', 'Davis', 'oscar.davis@example.com', '123-456-7806', '2023-03-15', 'Business Analyst', 'Product', 70000.00, 16, 'Indianapolis'),
('Paula', 'Nelson', 'paula.nelson@example.com', '123-456-7807', '2019-12-12', 'Support Engineer', 'Customer Support', 62000.00, NULL, 'Seattle'),
('Quincy', 'Owens', 'quincy.owens@example.com', '123-456-7808', '2018-03-01', 'Customer Success Manager', 'Customer Support', 80000.00, 18, 'Denver'),
('Rachel', 'Perez', 'rachel.perez@example.com', '123-456-7809', '2020-04-04', 'Graphic Designer', 'Design', 60000.00, 3, 'Boston');

INSERT INTO order_details (order_id, product_name, quantity, unit_price, discount) VALUES
(101, 'Wireless Mouse', 2, 25.00, 10.00),
(101, 'Keyboard', 1, 45.00, 5.00),
(102, 'USB-C Cable', 3, 10.00, 0.00),
(102, 'Laptop Stand', 1, 30.00, 15.00),
(103, 'Monitor 24-inch', 2, 150.00, 10.00),
(104, 'Headphones', 1, 70.00, 0.00),
(105, 'External SSD 500GB', 1, 90.00, 5.00),
(105, 'HDMI Cable', 2, 12.50, 0.00),
(106, 'Webcam', 1, 55.00, 20.00),
(106, 'Microphone', 1, 80.00, 10.00),
(107, 'Desk Lamp', 2, 35.00, 0.00),
(108, 'Wireless Charger', 1, 40.00, 5.00),
(109, 'Laptop Backpack', 1, 60.00, 10.00),
(110, 'Bluetooth Speaker', 1, 85.00, 15.00),
(111, 'Graphics Tablet', 1, 120.00, 0.00),
(111, 'Stylus Pen', 1, 25.00, 0.00),
(112, 'Surge Protector', 3, 18.00, 0.00),
(113, 'Smartphone Stand', 2, 14.00, 10.00),
(114, 'Ergonomic Chair', 1, 250.00, 20.00),
(115, 'Foot Rest', 1, 35.00, 0.00);


-- fetch 
/* Multiple Comment */

/* Lesson 4, 5  */
-- SELECT * FROM EMPLOYEE;
-- SELECT empId, name FROM EMPLOYEE;
-- SELECT "empId" name FROM EMPLOYEE;
-- SELECT name || ' ' || dept AS position from EMPLOYEE;
-- SELECT CONCAT(name, ' ', dept) AS position from EMPLOYEE;
-- SELECT UPPER(name) AS upper_name from EMPLOYEE;
-- SELECT LOWER(name) AS lower_name from EMPLOYEE;
-- SELECT UPPER(SUBSTRING(name, 1, 2)) AS short_title FROM EMPLOYEE;
-- SELECT LENGTH(name) AS name_len FROM EMPLOYEE;

/* Lesson 6  */
-- SELECT name, dept FROM EMPLOYEE WHERE dept = 'Sales';
-- SELECT * FROM EMPLOYEE WHERE age <= 27;
-- SELECT * FROM EMPLOYEE WHERE salary != 1.3;
-- SELECT * FROM EMPLOYEE WHERE salary <> 2.5;

/* Lesson 7 */
-- SELECT col1, col2... FROM table_name WHERE col_name BETWEEN value1 AND value2;
-- SELECT * FROM EMPLOYEE WHERE age BETWEEN 20 AND 30;
-- SELECT * FROM EMPLOYEE WHERE age NOT BETWEEN 25 AND 30;
-- SELECT * FROM EMPLOYEE WHERE salary IN (2.5, 1.3);

-- SELECT col1, col2... FROM table_name WHERE col_name (NOT) IN (VALUE1, VALUE2);
-- SELECT * FROM EMPLOYEE WHERE salary NOT IN (2.5, 1.3);

/* Lesson 8  */
-- SELECT col1, col2... FROM table_name WHERE condition1 AND condition2...;
-- SELECT * FROM EMPLOYEE WHERE salary IN (1.3, 2.5) AND age BETWEEN 18 AND 30 AND nationality = 'az'; 
-- SELECT * FROM EMPLOYEE WHERE nationality = 'tr' AND salary = 1.1;
-- SELECT * FROM EMPLOYEE WHERE nationality = 'az' OR age = 27;

/* Lesson 10 - WILDCARD  */
-- '%' : 0 ve ya daha fazla character
-- '_' : Yalnız 1 character
-- SELECT * FROM EMPLOYEE WHERE name LIKE 'T%';
-- LIKE case sensetivy-dir
-- SELECT * FROM EMPLOYEE WHERE dept LIKE 'S_%';
-- SELECT * FROM EMPLOYEE WHERE dept ILIKE 's_%L%';
-- SELECT * FROM EMPLOYEE WHERE name SIMILAR TO 'A%|T%';
-- SELECT * FROM EMPLOYEE WHERE name SIMILAR TO '[A-Z, a-z]{6,7}';

/* LESSON 11 - Count/Distinct function  */
-- DISTINCT: delete same value, select unique values
-- SELECT * FROM EMPLOYEE WHERE name LIKE 'C%' AND dept LIKE 'S%';
-- SELECT COUNT(*) FROM EMPLOYEE;
-- SELECT COUNT(salary) FROM EMPLOYEE;
-- SELECT COUNT(*) FROM EMPLOYEE WHERE name LIKE 'C%' AND dept LIKE 'S%';
-- SELECT COUNT(surname) FROM EMPLOYEE;
-- SELECT COUNT(DISTINCT(age)) FROM EMPLOYEE;

-- SUBQUERY
-- SELECT DISTINCT age, salary FROM EMPLOYEE;
-- SELECT COUNT (*) FROM (SELECT DISTINCT age, salary FROM EMPLOYEE) AS subquery;

/* LESSON 12 - ORDER BY / LIMIT / OFFSET  */
-- SELECT * FROM films;
-- SELECT * FROM films ORDER BY "duration_minutes" ASC;
-- SELECT * FROM films ORDER BY "duration_minutes" DESC;
-- SELECT * FROM films ORDER BY "title" DESC;
-- SELECT * FROM films ORDER BY "title" LIMIT 10;
-- SELECT * FROM films ORDER BY "title" LIMIT 10 OFFSET 5; -- after first 5 row, select 10
-- SELECT * FROM films WHERE title LIKE 'S%' ORDER BY "duration_minutes" DESC;
-- SELECT * FROM films WHERE title LIKE 'S%' ORDER BY "duration_minutes" DESC;

/* LESSON 13 - Practice II  */
-- SELECT * FROM employees;
-- SELECT * FROM order_details;
-- SELECT COUNT(*) FROM employees WHERE city = 'New York';
-- SELECT * FROM employees WHERE department = 'IT' ORDER BY "salary" DESC LIMIT 1 OFFSET 1;
-- SELECT COUNT(DISTINCT department) FROM employees;
-- SELECT unit_price * quantity AS total_price FROM order_details ORDER BY total_price ASC LIMIT 1;

/* LESSON 14 - Aggregate Functions, Max, Min, Sum, Avg, Count */
-- SELECT AVG(duration_minutes) FROM films WHERE rating = 'R';
-- SELECT MAX(duration_minutes) FROM films WHERE rating = 'R';
-- SELECT MAX(duration_minutes), MIN(release_year) FROM films WHERE rating = 'R';
-- SELECT SUM(duration_minutes) FROM films WHERE title LIKE 'Th%';
-- SELECT COUNT(*) FROM films WHERE title LIKE 'Th%';





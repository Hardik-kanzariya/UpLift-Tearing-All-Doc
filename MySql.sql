create database if not exists c1;

use c1;

create table if not exists sal(
	id int primary key,
    salary varchar(50)
);

create table if not exists emp(
	id int primary key,
    name varchar(50),
    email varchar(50) unique,
    password varchar(10),
    salary_id int,
	foreign key (salary_id) REFERENCES sal(id) ON DELETE CASCADE
);

insert into sal (id, salary) values(1,25000),(2,35000),(3,45000);
select * from sal;
insert into sal (id, salary) values(4,55000);

INSERT INTO emp (id, name, email, password, salary_id)
VALUES
(1, 'Vivek_Kanzariya', 'vk1@test.in', 'VK@123', 1),
(2, 'Hardik_Kanzariya', 'hk@gmail.com', 'Hk@123', 2),
(3, 'VK', 'vnk@gmail.com', 'Vnk@123', 3);
select * from emp;

INSERT INTO emp (id, name, email, password, salary_id)
VALUES (4, 'Rahul', 'rahul@test.com', 'rahul123', 2); 

INSERT INTO emp (id, name, email, password, salary_id)
VALUES (5, 'Amit', 'amit@test.com', 'amit123', NULL);

ALTER TABLE emp 
MODIFY password VARCHAR(50);

	

SELECT emp.id, emp.name, emp.email, sal.salary
FROM emp
INNER JOIN sal 
ON emp.salary_id = sal.id;

SELECT *
FROM sal
left JOIN emp
ON emp.salary_id = sal.id;

SELECT *
FROM sal
right JOIN emp
ON emp.salary_id = sal.id;

SELECT *
FROM sal
left JOIN emp
ON emp.salary_id = sal.id
UNION
SELECT *
FROM sal
right JOIN emp
ON emp.salary_id = sal.id;

SELECT *
FROM sal
left JOIN emp
ON emp.salary_id = sal.id
WHERE emp.id IS NULL;


SELECT *
FROM sal
RIGHT JOIN emp
ON emp.salary_id = sal.id
WHERE sal.id IS NULL;

ALTER TABLE emp
DROP COLUMN manager_id;





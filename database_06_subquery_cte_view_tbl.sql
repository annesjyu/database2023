-- Subquey

SELECT instructor.`name`
FROM instructor
WHERE instructor.salary >=
    (SELECT MAX(salary)
     FROM instructor);

-- CTE
WITH max_salary_emp (max_salary) AS
  (SELECT MAX(salary)
   FROM instructor)
SELECT instructor.`name`
FROM instructor,
     max_salary_emp
WHERE instructor.salary >= max_salary_emp.max_salary;

-- View

DROP VIEW IF EXISTS max_salary_emp_view;


CREATE VIEW max_salary_emp_view AS
  (SELECT MAX(salary) AS max_salary
   FROM instructor);


SELECT instructor.`name`
FROM instructor,
     max_salary_emp_view
WHERE instructor.salary >= max_salary_emp_view.max_salary;

-- Physical table

DROP TABLE IF EXISTS max_salary_emp_tb;


CREATE TABLE max_salary_emp_tb AS
  (SELECT MAX(salary) AS max_salary
   FROM instructor);


SELECT instructor.`name`
FROM instructor,
     max_salary_emp_tb
WHERE instructor.salary >= max_salary_emp_tb.max_salary;
# Create the join query
SELECT
    s.name AS student_name,
    c.title AS course_title,
    d.dept_name AS department_name,
    i.`name` AS instructor_name,
    t.semester,
    t.year
FROM
    student s
JOIN
    takes t ON s.ID = t.ID
JOIN
    section sec ON t.course_id = sec.course_id
               AND t.sec_id = sec.sec_id
               AND t.semester = sec.semester
               AND t.year = sec.year
JOIN
    course c ON sec.course_id = c.course_id
JOIN 
    teaches tea ON tea.course_id = sec.course_id 
	 AND tea.sec_id = sec.sec_id
	 AND tea.semester = sec.semester
	 AND tea.year = sec.year
JOIN
    department d ON c.dept_name = d.dept_name
JOIN instructor i ON i.ID = tea.ID
WHERE t.year = 2010 AND t.semester = 'Fall'
ORDER BY
    s.name, c.title;

#################################################################


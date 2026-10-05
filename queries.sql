-- ==========================================
-- CAMPUSCONNECT - SQL QUERIES
-- ==========================================


-- 1. Find all CSE students

SELECT *
FROM students
WHERE department = 'CSE';


-- 2. Find students in 3rd or 4th year

SELECT *
FROM students
WHERE year IN (3, 4);


-- 3. Find students with their enrolled courses

SELECT
    students.name,
    courses.course_name
FROM enrollments
JOIN students
    ON enrollments.student_id = students.student_id
JOIN courses
    ON enrollments.course_id = courses.course_id;


-- 4. Find students with their marks

SELECT
    students.name,
    courses.course_name,
    marks.marks
FROM marks
JOIN students
    ON marks.student_id = students.student_id
JOIN courses
    ON marks.course_id = courses.course_id;


-- 5. Find the average marks of all students

SELECT AVG(marks)
FROM marks;


-- 6. Find the highest marks

SELECT MAX(marks)
FROM marks;


-- 7. Find the lowest marks

SELECT MIN(marks)
FROM marks;


-- 8. Count students in each department

SELECT
    department,
    COUNT(*) AS total_students
FROM students
GROUP BY department;


-- 9. Count students enrolled in each course

SELECT
    courses.course_name,
    COUNT(enrollments.student_id) AS total_students
FROM enrollments
JOIN courses
    ON enrollments.course_id = courses.course_id
GROUP BY courses.course_name;


-- 10. Find courses having more than 2 students

SELECT
    courses.course_name,
    COUNT(enrollments.student_id) AS total_students
FROM enrollments
JOIN courses
    ON enrollments.course_id = courses.course_id
GROUP BY courses.course_name
HAVING COUNT(enrollments.student_id) > 2;


-- 11. Find students scoring above the overall average

SELECT
    students.name,
    marks.marks
FROM marks
JOIN students
    ON marks.student_id = students.student_id
WHERE marks.marks > (
    SELECT AVG(marks)
    FROM marks
);


-- 12. Find the student(s) with the highest marks

SELECT
    students.name,
    marks.marks
FROM marks
JOIN students
    ON marks.student_id = students.student_id
WHERE marks.marks = (
    SELECT MAX(marks)
    FROM marks
);


-- 13. Find students who scored between 80 and 90

SELECT
    students.name,
    courses.course_name,
    marks.marks
FROM marks
JOIN students
    ON marks.student_id = students.student_id
JOIN courses
    ON marks.course_id = courses.course_id
WHERE marks.marks BETWEEN 80 AND 90;


-- 14. Display students ordered by year (highest first)

SELECT
    name,
    department,
    year
FROM students
ORDER BY year DESC;

-- 15. Display all students and their marks, including students who have no marks

SELECT
    students.name,
    marks.marks
FROM students
LEFT JOIN marks
    ON students.student_id = marks.student_id;

-- 16. Display all unique departments

SELECT DISTINCT department
FROM students;

-- 17. Find students who scored 80 or above

SELECT
    students.name,
    marks.marks
FROM marks
JOIN students
    ON marks.student_id = students.student_id
WHERE marks.marks >= 80;


-- 18. Find students who scored below 50

SELECT
    students.name,
    marks.marks
FROM marks
JOIN students
    ON marks.student_id = students.student_id
WHERE marks.marks < 50;


-- 19. Find the average marks for each student

SELECT
    students.name,
    AVG(marks.marks) AS average_marks
FROM marks
JOIN students
    ON marks.student_id = students.student_id
GROUP BY students.name;


-- 20. Find the highest marks in each course

SELECT
    courses.course_name,
    MAX(marks.marks) AS highest_marks
FROM marks
JOIN courses
    ON marks.course_id = courses.course_id
GROUP BY courses.course_name;


-- 21. Find the average marks in each course

SELECT
    courses.course_name,
    AVG(marks.marks) AS average_marks
FROM marks
JOIN courses
    ON marks.course_id = courses.course_id
GROUP BY courses.course_name;


-- 22. Find departments having more than 2 students

SELECT
    department,
    COUNT(*) AS total_students
FROM students
GROUP BY department
HAVING COUNT(*) > 2;


-- 23. Find students who have no marks

SELECT
    students.name
FROM students
LEFT JOIN marks
    ON students.student_id = marks.student_id
WHERE marks.student_id IS NULL;


-- 24. Find students enrolled in more than one course

SELECT
    students.name,
    COUNT(enrollments.course_id) AS total_courses
FROM students
JOIN enrollments
    ON students.student_id = enrollments.student_id
GROUP BY students.name
HAVING COUNT(enrollments.course_id) > 1;


-- 25. Display all students with their department and enrolled courses

SELECT
    students.name,
    students.department,
    courses.course_name
FROM students
JOIN enrollments
    ON students.student_id = enrollments.student_id
JOIN courses
    ON enrollments.course_id = courses.course_id;


-- 26. Find the student with the highest marks in each course

SELECT
    courses.course_name,
    students.name,
    marks.marks
FROM marks
JOIN students
    ON marks.student_id = students.student_id
JOIN courses
    ON marks.course_id = courses.course_id
WHERE marks.marks = (
    SELECT MAX(m2.marks)
    FROM marks m2
    WHERE m2.course_id = marks.course_id
);

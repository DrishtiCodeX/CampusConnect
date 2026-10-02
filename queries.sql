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
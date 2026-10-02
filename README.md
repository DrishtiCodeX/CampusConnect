# CampusConnect — College Management Database

CampusConnect is a **College Management Database System** built using **PostgreSQL**. It manages student information, courses, instructors, enrollments, and academic marks through a relational database.

## 🛠️ Technologies Used

* PostgreSQL
* SQL
* pgAdmin 4

## 📊 Database Structure

The database contains five main tables:

### 1. Students

Stores student information such as:

* Student ID
* Name
* Email
* Department
* Year

### 2. Courses

Stores:

* Course ID
* Course Name
* Department
* Credits

### 3. Instructors

Stores:

* Instructor ID
* Name
* Department
* Email

### 4. Enrollments

Connects students with the courses they are enrolled in.

### 5. Marks

Stores marks obtained by students in different courses.

## 🔗 Relationships

* One student can have multiple enrollments.
* One course can have multiple enrollments.
* One student can have marks for multiple courses.
* One course can have marks for multiple students.

The complete database structure is available in the **ER Diagram**.

## 💡 SQL Concepts Implemented

This project demonstrates:

* SELECT
* WHERE
* AND / OR
* IN
* BETWEEN
* ORDER BY
* JOIN
* Aggregate Functions

  * COUNT
  * AVG
  * MAX
  * MIN
  * SUM
* GROUP BY
* HAVING
* UPDATE
* DELETE
* Subqueries
* Views

## 🔎 Example Queries

The project includes queries for:

* Finding students by department
* Finding students by year
* Displaying students with their courses
* Displaying students with their marks
* Calculating average, highest, and lowest marks
* Counting students by department
* Counting enrollments by course
* Finding courses with more than two students
* Finding students scoring above the overall average
* Finding the student(s) with the highest marks

All queries are available in **`queries.sql`**.

## 📁 Project Files

```text
CampusConnect/
│
├── queries.sql
├── ER-Diagram.png
└── README.md
```

## 🎯 Project Objective

The objective of CampusConnect is to demonstrate the practical use of **relational database design and SQL** for managing college-related data.

The project focuses on database relationships, data retrieval, aggregation, filtering, and analysis using PostgreSQL.

## 👩‍💻 Author

**Drishti Verma**

BTech CSE

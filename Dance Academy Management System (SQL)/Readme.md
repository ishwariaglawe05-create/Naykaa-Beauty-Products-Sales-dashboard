Dance Academy Management System
Project Overview
The Dance Academy Management System is a SQL-based database project designed to manage the daily activities of a dance academy. It stores information about students, dance styles, instructors, classes, class schedules, enrollments, attendance, and payments.

This project helps demonstrate how SQL can be used to organize relational data and answer useful business questions.
Objectives
- Manage student and instructor information.
- Maintain dance styles and class details.
- Track student enrollments and enrollment status.
- Store class schedules and attendance records.
- Record student payments and payment methods.
- Generate insights using SQL queries.
Database Tables
The project contains 8 tables:
Table	Description
dance_styles	Stores dance style names and difficulty levels.
instructors	Stores instructor details, experience, and specialty.
students	Stores student details such as age, city, and joining date.
dance_classes	Stores class names, monthly fees, capacity, and assigned instructor.
class_schedule	Stores class days, timings, and studio rooms.
enrollments	Connects students with classes and tracks enrollment status.
attendance	Records whether students attended scheduled classes.
payments	Stores payment amounts, dates, and payment modes.


SQL Concepts Used
- CREATE TABLE and DROP TABLE
- INSERT INTO
- Primary keys and foreign keys
- Joins and aggregate functions
- GROUP BY, ORDER BY, and HAVING
- CASE statements
- Subqueries and Common Table Expressions (CTEs)
- Window functions and ranking
Sample Business Questions
The SQL script includes practice questions such as:
1. List students enrolled in Hip-Hop classes.
2. Calculate total revenue collected per class.
3. Identify the instructor with the most students.
4. Find students with paused or dropped enrollments.
5. Display each class with its weekly schedule.
6. Calculate attendance percentage for each student.
7. Find classes operating at or above 80% capacity.
8. Identify students enrolled in more than one class.
9. Display instructors and their specialty dance styles.
10. Calculate average student age per dance style.
11. Rank classes by enrollment count.
12. Find students who have never attended a class.
13. Find the top three highest-earning classes.
14. Calculate each instructor's weekly teaching hours using a CTE.
15. Find recently joined students who have no payment record.
Tools
- Database: MySQL / SQLite (the script may need minor adjustments depending on the database engine)
- Language: SQL
Project Files
- dance_academy_system.sql — SQL script containing table creation, sample records, and practice questions.
How to Run
1. Download or clone this repository.
2. Open the .sql file in MySQL Workbench or a compatible SQL editor.
3. Execute the script to create the tables and insert the sample data.
4. Run SQL queries to explore the database and solve the practice questions.
Note
This repository's SQL script contains sample data for practice and learning. It is a learning project, not a production-ready application.
Author
Ishwari Aglawe

-- ============================================================
-- SQL PRACTICE DATASET: "Rhythm & Rhyme" Dance Academy System
-- ============================================================
-- Works in MySQL / SQLite (minor tweaks needed for PostgreSQL
-- SERIAL vs INTEGER PRIMARY KEY autoincrement).
-- ============================================================

DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS attendance;
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS class_schedule;
DROP TABLE IF EXISTS dance_classes;
DROP TABLE IF EXISTS instructors;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS dance_styles;

-- ============================================================
-- TABLE: dance_styles
-- ============================================================
CREATE TABLE dance_styles (
    style_id        INTEGER PRIMARY KEY,
    style_name      VARCHAR(50) NOT NULL,
    difficulty      VARCHAR(20)  -- Beginner / Intermediate / Advanced
);

INSERT INTO dance_styles (style_id, style_name, difficulty) VALUES
(1, 'Bharatanatyam', 'Intermediate'),
(2, 'Hip-Hop', 'Beginner'),
(3, 'Salsa', 'Beginner'),
(4, 'Contemporary', 'Advanced'),
(5, 'Kathak', 'Intermediate'),
(6, 'Ballet', 'Advanced'),
(7, 'Bollywood Fusion', 'Beginner');

-- ============================================================
-- TABLE: instructors
-- ============================================================
CREATE TABLE instructors (
    instructor_id   INTEGER PRIMARY KEY,
    first_name      VARCHAR(50) NOT NULL,
    last_name       VARCHAR(50) NOT NULL,
    specialty_style_id INTEGER,
    years_experience INTEGER,
    email           VARCHAR(100) UNIQUE,
    FOREIGN KEY (specialty_style_id) REFERENCES dance_styles(style_id)
);

INSERT INTO instructors (instructor_id, first_name, last_name, specialty_style_id, years_experience, email) VALUES
(1, 'Meera', 'Iyer', 1, 12, 'meera.iyer@rhythmacademy.com'),
(2, 'Jason', 'Cole', 2, 6, 'jason.cole@rhythmacademy.com'),
(3, 'Sofia', 'Ramirez', 3, 9, 'sofia.ramirez@rhythmacademy.com'),
(4, 'Ananya', 'Ghosh', 5, 15, 'ananya.ghosh@rhythmacademy.com'),
(5, 'Olivia', 'Bennett', 6, 20, 'olivia.bennett@rhythmacademy.com'),
(6, 'Ravi', 'Kulkarni', 7, 5, 'ravi.kulkarni@rhythmacademy.com'),
(7, 'Daniel', 'Foster', 4, 8, 'daniel.foster@rhythmacademy.com');

-- ============================================================
-- TABLE: students
-- ============================================================
CREATE TABLE students (
    student_id      INTEGER PRIMARY KEY,
    first_name      VARCHAR(50) NOT NULL,
    last_name       VARCHAR(50) NOT NULL,
    age             INTEGER,
    gender          VARCHAR(10),
    city            VARCHAR(50),
    join_date       DATE,
    phone           VARCHAR(20)
);

INSERT INTO students (student_id, first_name, last_name, age, gender, city, join_date, phone) VALUES
(1, 'Ishita', 'Rao', 14, 'F', 'Pune', '2023-01-10', '9800011111'),
(2, 'Kabir', 'Malhotra', 21, 'M', 'Mumbai', '2023-01-15', '9800011112'),
(3, 'Grace', 'Thompson', 17, 'F', 'London', '2023-02-01', '9800011113'),
(4, 'Aryan', 'Joshi', 19, 'M', 'Pune', '2023-02-05', '9800011114'),
(5, 'Zara', 'Sheikh', 25, 'F', 'Bengaluru', '2023-02-20', '9800011115'),
(6, 'Liam', 'Walker', 16, 'M', 'Sydney', '2023-03-01', '9800011116'),
(7, 'Diya', 'Patel', 12, 'F', 'Ahmedabad', '2023-03-10', '9800011117'),
(8, 'Noah', 'Garcia', 22, 'M', 'Madrid', '2023-03-18', '9800011118'),
(9, 'Ananya', 'Das', 18, 'F', 'Kolkata', '2023-04-02', '9800011119'),
(10, 'Ethan', 'Brown', 27, 'M', 'New York', '2023-04-15', '9800011120'),
(11, 'Meher', 'Kaur', 15, 'F', 'Chandigarh', '2023-05-01', '9800011121'),
(12, 'Oscar', 'Nguyen', 20, 'M', 'Sydney', '2023-05-12', '9800011122');

-- ============================================================
-- TABLE: dance_classes
-- ============================================================
CREATE TABLE dance_classes (
    class_id        INTEGER PRIMARY KEY,
    style_id        INTEGER,
    instructor_id   INTEGER,
    class_name      VARCHAR(100),
    fee_per_month   DECIMAL(10,2),
    capacity        INTEGER,
    FOREIGN KEY (style_id) REFERENCES dance_styles(style_id),
    FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id)
);

INSERT INTO dance_classes (class_id, style_id, instructor_id, class_name, fee_per_month, capacity) VALUES
(101, 1, 1, 'Bharatanatyam - Beginners Batch', 2000.00, 20),
(102, 2, 2, 'Hip-Hop - Teens', 1500.00, 25),
(103, 3, 3, 'Salsa - Couples Batch', 1800.00, 16),
(104, 5, 4, 'Kathak - Foundation', 2200.00, 18),
(105, 6, 5, 'Ballet - Advanced', 3000.00, 12),
(106, 7, 6, 'Bollywood Fusion - Weekend Batch', 1600.00, 30),
(107, 4, 7, 'Contemporary - Advanced Technique', 2500.00, 15),
(108, 2, 2, 'Hip-Hop - Adults', 1500.00, 20);

-- ============================================================
-- TABLE: class_schedule (day/time slots for each class)
-- ============================================================
CREATE TABLE class_schedule (
    schedule_id     INTEGER PRIMARY KEY,
    class_id        INTEGER,
    day_of_week     VARCHAR(15),
    start_time      TIME,
    end_time        TIME,
    room            VARCHAR(20),
    FOREIGN KEY (class_id) REFERENCES dance_classes(class_id)
);

INSERT INTO class_schedule (schedule_id, class_id, day_of_week, start_time, end_time, room) VALUES
(1, 101, 'Monday', '16:00', '17:30', 'Studio A'),
(2, 101, 'Thursday', '16:00', '17:30', 'Studio A'),
(3, 102, 'Tuesday', '18:00', '19:00', 'Studio B'),
(4, 102, 'Friday', '18:00', '19:00', 'Studio B'),
(5, 103, 'Wednesday', '19:00', '20:30', 'Studio C'),
(6, 104, 'Monday', '17:30', '19:00', 'Studio A'),
(7, 105, 'Saturday', '10:00', '12:00', 'Studio D'),
(8, 106, 'Saturday', '13:00', '14:30', 'Studio B'),
(9, 107, 'Sunday', '11:00', '13:00', 'Studio D'),
(10, 108, 'Wednesday', '20:00', '21:00', 'Studio B');

-- ============================================================
-- TABLE: enrollments (which student is in which class)
-- ============================================================
CREATE TABLE enrollments (
    enrollment_id   INTEGER PRIMARY KEY,
    student_id      INTEGER,
    class_id        INTEGER,
    enrollment_date DATE,
    status          VARCHAR(20) DEFAULT 'Active',  -- Active / Paused / Dropped
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (class_id) REFERENCES dance_classes(class_id)
);

INSERT INTO enrollments (enrollment_id, student_id, class_id, enrollment_date, status) VALUES
(1, 1, 101, '2023-01-12', 'Active'),
(2, 2, 103, '2023-01-20', 'Active'),
(3, 3, 105, '2023-02-05', 'Active'),
(4, 4, 102, '2023-02-10', 'Dropped'),
(5, 5, 106, '2023-02-22', 'Active'),
(6, 6, 102, '2023-03-05', 'Active'),
(7, 7, 101, '2023-03-12', 'Active'),
(8, 8, 103, '2023-03-20', 'Paused'),
(9, 9, 104, '2023-04-05', 'Active'),
(10, 10, 107, '2023-04-18', 'Active'),
(11, 11, 106, '2023-05-03', 'Active'),
(12, 12, 108, '2023-05-15', 'Active'),
(13, 1, 106, '2023-06-01', 'Active'),
(14, 9, 101, '2023-06-10', 'Active'),
(15, 5, 104, '2023-06-20', 'Dropped');

-- ============================================================
-- TABLE: attendance
-- ============================================================
CREATE TABLE attendance (
    attendance_id   INTEGER PRIMARY KEY,
    enrollment_id   INTEGER,
    class_date      DATE,
    present         BOOLEAN,
    FOREIGN KEY (enrollment_id) REFERENCES enrollments(enrollment_id)
);

INSERT INTO attendance (attendance_id, enrollment_id, class_date, present) VALUES
(1, 1, '2023-07-03', 1),
(2, 1, '2023-07-06', 1),
(3, 1, '2023-07-10', 0),
(4, 2, '2023-07-05', 1),
(5, 2, '2023-07-12', 1),
(6, 3, '2023-07-08', 1),
(7, 3, '2023-07-15', 0),
(8, 5, '2023-07-08', 1),
(9, 6, '2023-07-04', 1),
(10, 6, '2023-07-11', 1),
(11, 7, '2023-07-03', 0),
(12, 7, '2023-07-06', 1),
(13, 9, '2023-07-10', 1),
(14, 10, '2023-07-09', 1),
(15, 11, '2023-07-08', 1),
(16, 12, '2023-07-12', 0),
(17, 13, '2023-07-15', 1),
(18, 14, '2023-07-10', 1);

-- ============================================================
-- TABLE: payments
-- ============================================================
CREATE TABLE payments (
    payment_id      INTEGER PRIMARY KEY,
    enrollment_id   INTEGER,
    amount_paid     DECIMAL(10,2),
    payment_date    DATE,
    payment_mode    VARCHAR(20),  -- Cash / Card / UPI / Bank Transfer
    FOREIGN KEY (enrollment_id) REFERENCES enrollments(enrollment_id)
);

INSERT INTO payments (payment_id, enrollment_id, amount_paid, payment_date, payment_mode) VALUES
(1, 1, 2000.00, '2023-07-01', 'UPI'),
(2, 2, 1800.00, '2023-07-01', 'Card'),
(3, 3, 3000.00, '2023-07-02', 'Bank Transfer'),
(4, 5, 1600.00, '2023-07-02', 'UPI'),
(5, 6, 1500.00, '2023-07-03', 'Cash'),
(6, 7, 2000.00, '2023-07-03', 'UPI'),
(7, 8, 1800.00, '2023-07-04', 'Card'),
(8, 9, 2200.00, '2023-07-05', 'UPI'),
(9, 10, 2500.00, '2023-07-05', 'Bank Transfer'),
(10, 11, 1600.00, '2023-07-06', 'Cash'),
(11, 12, 1500.00, '2023-07-06', 'UPI'),
(12, 13, 1600.00, '2023-07-07', 'Card'),
(13, 14, 2000.00, '2023-07-08', 'UPI');

-- ============================================================
-- PRACTICE QUESTIONS
-- ============================================================
-- 1.  List all students enrolled in 'Hip-Hop' classes.
-- 2.  Find the total revenue collected per class.
-- 3.  Which instructor has the most students across all their classes?
-- 4.  Find students who have 'Dropped' or 'Paused' enrollments.
-- 5.  List each class with its weekly schedule (day + time).
-- 6.  Calculate the attendance percentage for each student.
-- 7.  Find classes that are at or above 80% of their capacity.
-- 8.  Find students enrolled in more than one class.
-- 9.  List instructors along with the dance style they specialize in.
-- 10. Find the average age of students per dance style.
-- 11. Use a window function to rank classes by total enrollment count.
-- 12. Find students who never attended a single class (0% attendance).
-- 13. Find the top 3 highest-earning classes by total payments received.
-- 14. Use a CTE to find each instructor's total number of teaching hours per week.
-- 15. Find students who joined in the last 6 months but have no payment record.
-- ============================================================

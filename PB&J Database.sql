-- Creating PB&J database
DROP DATABASE IF EXISTS PBJ_Database;
CREATE DATABASE PBJ_Database;

-- Use the PB&J database
USE PBJ_Database;

-- Creating Majors table
CREATE TABLE Majors (
    majorID INT PRIMARY KEY,
    MajorName ENUM('Computer Science', 'Business Administration', 
    'Management Information Systems', 'Civil Engineering', 'Mechanical Engineering', 
    'Electrical and Electronics Engineering', 'Mechatronics'),
    TotalCreditRequired FLOAT,
    DegreeType ENUM('Bachelor of Science', 'Master of Science')
);

-- Creating the Students table
CREATE TABLE Students (
    studentID INT PRIMARY KEY,
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    DateOfBirth DATE,
    Gender ENUM('male', 'female'),
    Email VARCHAR(30),
    PhoneNumber CHAR(13),
    CountryOfOrigin VARCHAR(20),
    YearGroup CHAR(4),
    isUnderGrad ENUM('yes', 'no'),
    cGPA FLOAT,
    majorID INT,
    FOREIGN KEY (majorID) REFERENCES Majors(majorID)
);

-- Creating the Courses table
CREATE TABLE Courses (
    courseID INT PRIMARY KEY,
    CourseName VARCHAR(30),
    NumberOfCredits ENUM('1.0', '0.5'),
    SemesterOffered ENUM('Fall', 'Spring', 'Summer'),
    Department ENUM('Business Administration', 'Humanities and Social Sciences', 
    'Computer Science/Information Systems', 'Engineering')
);

-- Creating the Course_Taken table
CREATE TABLE Course_Taken (
    courseID INT,
    studentID INT,
    PRIMARY KEY (courseID, studentID),
    FOREIGN KEY (courseID) REFERENCES Courses(courseID),
    FOREIGN KEY (studentID) REFERENCES Students(studentID)
);

-- Creating the Degree_Requirements table
CREATE TABLE Degree_Requirements (
    courseID INT,
    majorID INT,
    PRIMARY KEY (courseID, majorID),
    FOREIGN KEY (courseID) REFERENCES Courses(courseID),
    FOREIGN KEY (majorID) REFERENCES Majors(majorID)
);

-- Inserting values into Majors table
INSERT INTO Majors (majorID, MajorName, TotalCreditRequired, DegreeType)
VALUES
(1, 'Computer Science', 120.0, 'Bachelor of Science'),
(2, 'Business Administration', 90.0, 'Bachelor of Science'),
(3, 'Management Information Systems', 110.0, 'Bachelor of Science'),
(4, 'Civil Engineering', 130.0, 'Bachelor of Science'),
(5, 'Mechanical Engineering', 140.0, 'Bachelor of Science'),
(6, 'Electrical and Electronics Engineering', 130.0, 'Bachelor of Science'),
(7, 'Mechatronics', 120.0, 'Bachelor of Science'),
(8, 'Computer Science', 45.0, 'Master of Science'),
(9, 'Management Information Systems', 40.0, 'Master of Science'),
(10, 'Civil Engineering', 50.0, 'Master of Science');

-- Inserting values into Students table
INSERT INTO Students (studentID, FirstName, LastName, DateOfBirth, Gender, Email, PhoneNumber, CountryOfOrigin, YearGroup, isUnderGrad, cGPA, majorID)
VALUES
(1, 'John', 'Odogu', '1995-05-15', 'male', 'john.odogu@ashesi.edu.gh', '+123456789012', 'Nigeria', '2023', 'yes', 3.75, 1),
(2, 'Jane', 'Aboagyi', '1998-08-22', 'female', 'jane.aboagyi@ashesi.edu.gh', '+23354321098', 'Ghana', '2022', 'no', 2.0, 2),
(3, 'Alex', 'Mbabu', '1997-02-10', 'male', 'alex.Mbabu@ashesi.edu.gh', '+112233445566', 'Liberia', '2023', 'yes', 1.8, 1),
(4, 'Emily', 'Kudadu', '1996-11-30', 'female', 'emily.kudadu@ashesi.edu.gh', '+334455667788', 'Zambia', '2022', 'no', 2.6, 4),
(5, 'Michael', 'Mulala', '1999-07-18', 'male', 'michael.mulala@ashesi.edu.gh', '+998877665544', 'Gambia', '2023', 'yes', 1.0, 2),
(6, 'Sarah', 'Jaguda', '1998-04-25', 'female', 'sarah.jaguda@ashesi.edu.gh', '+445566778899', 'Niger', '2022', 'no', 1.3, 1),
(7, 'Daniel', 'Browa', '1997-09-12', 'male', 'daniel.browa@ashesi.edu.gh', '+112233445500', 'Ethopia', '2023', 'yes', 3.5, 3),
(8, 'Eva', 'Malilu', '1996-06-08', 'female', 'eva.malilu@ashesi.edu.gh', '+778899001122', 'DR Congo', '2022', 'no', 3.8, 4),
(9, 'Christopher', 'Lekwada', '1999-01-17', 'male', 'chris.lekwada@ashesi.edu.gh', '+334455667700', 'Zimbabwe', '2023', 'yes', 1.8, 1),
(10, 'Sophia', 'Chemeni', '1997-12-05', 'female', 'sophia.chemeni@ashesi.edu.gh', '+112233445511', 'Burundi', '2022', 'no', 3.9, 2);

-- Inserting values into Courses table
INSERT INTO Courses (courseID, CourseName, NumberOfCredits, SemesterOffered, Department)
VALUES
(1, 'Introduction to Programming', '1.0', 'Fall', 'Computer Science/Information Systems'),
(2, 'Microeconomics', '0.5', 'Spring', 'Business Administration'),
(3, 'Database Management', '1.0', 'Fall', 'Computer Science/Information Systems'),
(4, 'Digital Circuits', '1.0', 'Spring', 'Engineering'),
(5, 'Macroeconomics', '0.5', 'Summer', 'Business Administration'),
(6, 'Software Engineering', '1.0', 'Fall', 'Computer Science/Information Systems'),
(7, 'Machine Learning', '1.0', 'Spring', 'Computer Science/Information Systems'),
(8, 'Business Analytics', '0.5', 'Summer', 'Computer Science/Information Systems'),
(9, 'Civil Engineering Design', '1.0', 'Fall', 'Engineering'),
(10, 'Advanced Algorithms', '1.0', 'Spring', 'Computer Science/Information Systems'),
(11, 'Power Systems', '1.0', 'Fall', 'Engineering'),
(12, 'Mechanical Design', '1.0', 'Spring', 'Engineering');

-- Inserting values into Course_Taken table
INSERT INTO Course_Taken (courseID, studentID)
VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 3),
(7, 3),
(8, 4),
(9, 4),
(10, 5);

-- Inserting values into Degree_Requirements table
INSERT INTO Degree_Requirements (courseID, majorID)
VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 4),
(5, 2),
(6, 1),
(7, 1),
(8, 9),
(9, 4),
(10, 1);

-- Creating a view for Students
CREATE VIEW Students_View AS
SELECT * FROM Students;

-- Creating a view for Majors
CREATE VIEW Majors_View AS
SELECT * FROM Majors;

-- Creating a view for Degree_Requirements
CREATE VIEW Degree_Requirements_View AS
SELECT * FROM Degree_Requirements;

-- Query 1: Retrieve personal details, major, year group, courses taken, and grades for each student
-- Retrieve personal details, major, year group, and courses taken for a specific student (e.g., studentID = 1)
SELECT s.studentID, s.FirstName, s.LastName, s.DateOfBirth, s.Gender, s.Email, s.PhoneNumber, s.CountryOfOrigin, s.YearGroup, s.isUnderGrad, s.cGPA, m.MajorName
FROM Students s
INNER JOIN Majors m ON m.majorID = s.majorID;

-- Query 2:
-- Retrieve a list of courses per major
SELECT Majors_View.MajorName, Courses.CourseName
FROM Majors_View
INNER JOIN Degree_Requirements ON Majors_View.majorID = Degree_Requirements.majorID
INNER JOIN Courses ON Degree_Requirements.courseID = Courses.courseID
ORDER BY Majors_View.MajorName, Courses.CourseName
LIMIT 0, 1000;

-- Query 3:
-- Display detailed breakdown of major requirements for a specific major (e.g., MajorName = 'Computer Science')
SELECT Majors_View.MajorName, Courses.CourseName
FROM Majors_View
INNER JOIN Degree_Requirements_View ON Majors_View.majorID = Degree_Requirements_View.majorID
INNER JOIN Courses ON Degree_Requirements_View.courseID = Courses.courseID
WHERE Majors_View.MajorName = 'Computer Science';

-- Query 4:
-- Identify students with CGPA > 3.50 as Dean's List
SELECT CONCAT(s.FirstName, ' ', s.LastName) AS StudentName, s.cGPA, m.MajorName
FROM Students s
JOIN Majors m ON s.majorID = m.majorID
WHERE s.cGPA > 3.50;

-- Query 5:
-- Identify students with CGPA < 2.0 as Probation List
SELECT CONCAT(s.FirstName, ' ', s.LastName) AS StudentName, s.cGPA, m.MajorName
FROM Students s
JOIN Majors m ON s.majorID = m.majorID
WHERE s.cGPA < 2.0;

-- Query 6:
-- Count the number of courses a student is currently enrolled in (e.g., studentID = 1)
SELECT CONCAT(Students_View.FirstName, ' ', Students_View.LastName) AS StudentName, COUNT(Course_Taken.courseID) AS NumberOfCourses
FROM Students_View
LEFT JOIN Course_Taken ON Students_View.studentID = Course_Taken.studentID
WHERE Students_View.studentID = 1;

-- Query 7:
-- Query to monitor courses completed and those required for graduation for a specific student (e.g., studentID = 1)
SELECT
    s.studentID,
    CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
    m.MajorName,
    c.CourseName,
    c.NumberOfCredits,
    c.SemesterOffered
FROM
    Students s
JOIN
    Majors m ON s.majorID = m.majorID
LEFT JOIN
    Degree_Requirements dr ON s.majorID = dr.majorID
LEFT JOIN
    Courses c ON dr.courseID = c.courseID
WHERE
    s.studentID = 1;
    
-- Query 8:
-- Query to identify students with CGPA < 2.0 as potential course failures
SELECT
    CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
    s.cGPA,
    m.MajorName,
    ct.courseID,
    c.CourseName,
    c.NumberOfCredits,
    c.SemesterOffered
FROM
    Students s
JOIN
    Majors m ON s.majorID = m.majorID
JOIN
    Course_Taken ct ON s.studentID = ct.studentID
JOIN
    Courses c ON ct.courseID = c.courseID
WHERE
    s.cGPA < 2.0;

-- Query 9:
-- Query to monitor courses completed and those required for graduation for a specific student using LIKE
SELECT
    s.studentID,
    CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
    m.MajorName,
    c.CourseName,
    c.NumberOfCredits,
    c.SemesterOffered
FROM
    Students s
JOIN
    Majors m ON s.majorID = m.majorID
LEFT JOIN
    Degree_Requirements dr ON s.majorID = dr.majorID
LEFT JOIN
    Courses c ON dr.courseID = c.courseID
WHERE
    s.studentID = 1
    AND c.CourseName LIKE '%';  -- Using LIKE with wildcard to match all courses

-- Query to identify students with CGPA < 2.0 as potential course failures using IN
SELECT
    CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
    s.cGPA,
    m.MajorName,
    ct.courseID,
    c.CourseName,
    c.NumberOfCredits,
    c.SemesterOffered
FROM
    Students s
JOIN
    Majors m ON s.majorID = m.majorID
JOIN
    Course_Taken ct ON s.studentID = ct.studentID
JOIN
    Courses c ON ct.courseID = c.courseID
WHERE
    s.cGPA < 2.0
    AND s.majorID IN (1, 2, 3);  -- Using IN condition to filter specific majors

-- Query to display a detailed breakdown of major requirements for a specific major using NOT NULL
SELECT
    m.MajorName,
    c.CourseName,
    c.NumberOfCredits,
    c.SemesterOffered
FROM
    Majors m
JOIN
    Degree_Requirements dr ON m.majorID = dr.majorID
JOIN
    Courses c ON dr.courseID = c.courseID
WHERE
    m.MajorName = 'Computer Science'
    AND c.NumberOfCredits IS NOT NULL;  -- Using NOT NULL to filter courses with defined credits

-- Query to track progress toward meeting degree requirements for a specific student using CTE
WITH StudentProgress AS (
    SELECT
        s.studentID,
        CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
        m.MajorName,
        c.CourseName,
        c.NumberOfCredits,
        c.SemesterOffered,
        ct.courseID AS CompletedCourseID
    FROM
        Students s
    JOIN
        Majors m ON s.majorID = m.majorID
    LEFT JOIN
        Degree_Requirements dr ON m.majorID = dr.majorID
    LEFT JOIN
        Courses c ON dr.courseID = c.courseID
    LEFT JOIN
        Course_Taken ct ON s.studentID = ct.studentID AND dr.courseID = ct.courseID
    WHERE
        s.studentID = 1
)
SELECT *
FROM StudentProgress
ORDER BY StudentProgress.studentID, StudentProgress.SemesterOffered;


-- Query 11:
-- Generating a transcript report for a specific student (e.g., studentID = 1)
-- Monitoring the courses a student is currently enrolled in (e.g., studentID = 1)
-- Monitoring the courses a student is currently enrolled in (e.g., studentID = 1)
SELECT
    CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
    ct.courseID,
    c.CourseName,
    c.NumberOfCredits,
    c.SemesterOffered,
    c.Department,
    COUNT(ct.courseID) AS TotalCourses,
    MAX(c.NumberOfCredits) AS MaxCredits,
    MIN(c.NumberOfCredits) AS MinCredits
FROM
    Students s
LEFT JOIN
    Course_Taken ct ON s.studentID = ct.studentID
JOIN
    Courses c ON ct.courseID = c.courseID
WHERE
    s.studentID = 1
    AND c.SemesterOffered = 'Fall'  -- A fail condition
GROUP BY
    s.studentID, ct.courseID, c.CourseName
ORDER BY
    c.SemesterOffered DESC, c.CourseName ASC;  -- Sorting by semester and course name









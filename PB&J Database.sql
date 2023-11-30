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

-- Creating Students table
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
    GPA FLOAT,
    majorID INT,
    INDEX (majorID),  -- Ensure there is an index on majorID
    FOREIGN KEY (majorID) REFERENCES Majors(majorID)

);

-- Creating the Department table
CREATE TABLE Department(
    departmentID INT PRIMARY KEY,
    departmentName VARCHAR(50),
    departmentHead VARCHAR(50)
);


-- Creating the Courses table
CREATE TABLE Courses (
    courseID INT,
    CourseName VARCHAR(30),
    NumberOfCredits ENUM('1.0', '0.5'),
    SemesterOffered ENUM('Fall', 'Spring', 'Summer'),
    departmentID INT,
	PRIMARY KEY (courseID),
    FOREIGN KEY (departmentID) REFERENCES Department(departmentID)

);
-- Creating the grad_Students table
CREATE TABLE grad_Students(
       studentID INT,
       GMAT_Score INT,
       PRIMARY KEY (studentID),
	   FOREIGN KEY (studentID) REFERENCES Students(studentID)
);
-- Creating the undergrad_Students table
CREATE TABLE Undergrad_Students(
        studentID INT,
        WASSCE_Score INT,
		PRIMARY KEY (studentID),
		FOREIGN KEY (studentID) REFERENCES Students(studentID)
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
INSERT INTO Students (studentID, FirstName, LastName, DateOfBirth, Gender, Email, PhoneNumber, CountryOfOrigin, YearGroup, isUnderGrad, GPA, majorID)
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

-- Inserting records into grad_Students table
INSERT INTO grad_Students (studentID, GMAT_Score)
VALUES
  (1, 700),
  (2, 720),
  (3, 680),
  (4, 750),
  (5, 690);
 

-- Inserting records into Undergrad_Students table
INSERT INTO Undergrad_Students (studentID, WASSCE_Score)
VALUES
  (6, 08),
  (7, 13),
  (8, 22),
  (9, 07),
  (10, 17);
 
  -- Inserting records into the Department table
INSERT INTO Department (departmentID, departmentName, departmentHead)
VALUES
  (1, 'Business Administration', 'John Kwaku'),
  (2, 'Computer Science & MIS', 'Jane Kofi'),
  (3, 'Humanities', 'Robert Kakira'),
  (4, 'Engineering', 'Emily Brobeyy'),
  (5, 'Computer Science', 'Michael Nelson'),
  (6, 'Marketing', 'Sarah Mensah'),
  (7, 'Chemical Engineering', 'David Musa'),
  (8, 'Political Science', 'Godwin Tukina'),
  (9, 'Economics', 'Daniel Cladura'),
  (10, 'Biomedical Engineering', 'Olivia Welbeck');

  
  #Error Code: 1265. Data truncated for column 'departmentName' at row 1
  
-- Inserting 10 records into the Courses table
-- Assuming Department table already contains the specified departmentID values
INSERT INTO Courses (courseID, CourseName, NumberOfCredits, SemesterOffered, departmentID)
VALUES
  (1, 'Intro to Computer Science', '1.0', 'Fall', 1),
  (2, 'Calculus I', '1.0', 'Fall', 2),
  (3, 'English Composition', '1.0', 'Spring', 3),
  (4, 'History of Art', '0.5', 'Summer', 4),
  (5, 'Statistics', '1.0', 'Spring', 1),
  (6, 'Microeconomics', '1.0', 'Fall', 2),
  (7, 'Organic Chemistry', '1.0', 'Spring', 3),
  (8, 'Introduction to Psychology', '0.5', 'Summer', 4),
  (9, 'Linear Algebra', '1.0', 'Fall', 1),
  (10, 'Principles of Marketing', '1.0', 'Spring', 2);


-- Inserting records into the Courses table
INSERT INTO Courses (courseID, CourseName, NumberOfCredits, SemesterOffered, departmentID)
VALUES
  (13, 'Introduction to Programming', '1.0', 'Fall', 1), -- Business Administration
  (14, 'Microeconomics', '0.5', 'Spring', 2), -- Computer Science & MIS
  (15, 'Database Management', '1.0', 'Fall', 1), -- Business Administration
  (16, 'Digital Circuits', '1.0', 'Spring', 4), -- Engineering
  (17, 'Macroeconomics', '0.5', 'Summer', 2), -- Computer Science & MIS
  (18, 'Software Engineering', '1.0', 'Fall', 1), -- Business Administration
  (19, 'Machine Learning', '1.0', 'Spring', 1), -- Computer Science & MIS
  (20, 'Business Analytics', '0.5', 'Summer', 1), -- Computer Science & MIS
  (21, 'Civil Engineering Design', '1.0', 'Fall', 4), -- Engineering
  (22, 'Advanced Algorithms', '1.0', 'Spring', 1), -- Computer Science & MIS
  (23, 'Power Systems', '1.0', 'Fall', 4), -- Engineering
  (24, 'Mechanical Design', '1.0', 'Spring', 4); -- Engineering




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

# Query1: 
-- Creating a view for Students
CREATE VIEW Students_View AS
SELECT * FROM Students;

# Query 2: 
-- Creating a view for Majors
CREATE VIEW Majors_View AS
SELECT * FROM Majors;

# Query 3: 
-- Inner join to list students by major
SELECT Students.FirstName, Students.LastName, Majors.MajorName
FROM Students
INNER JOIN Majors ON Students.majorID = Majors.majorID;

# Query 4: 
-- Aggregate function to calculate overall GPA for a student
-- Identify students with overallGPA > 3.50 as Dean's List
SELECT CONCAT(s.FirstName, ' ', s.LastName) AS StudentName, s.OverallGPA, m.MajorName
FROM (
    SELECT studentID, FirstName, LastName, majorID, AVG(GPA) AS OverallGPA
    FROM Students
    GROUP BY studentID, FirstName, LastName, majorID
) s
JOIN Majors m ON s.majorID = m.majorID
WHERE s.OverallGPA > 3.50;




# Query 5: 
-- Creating a view for Degree_Requirements
CREATE VIEW Degree_Requirements_View AS
SELECT * FROM Degree_Requirements;

-- # Query 7: 
-- Retrieve personal details, major, year group, and courses taken for a specific student (e.g., studentID = 1)
SELECT s.studentID, s.FirstName, s.LastName, s.DateOfBirth, s.Gender, s.Email, s.PhoneNumber, s.CountryOfOrigin, s.YearGroup, s.isUnderGrad, s.GPA, m.MajorName
FROM Students s
INNER JOIN Majors m ON m.majorID = s.majorID;

-- Query 8:
-- Retrieve a list of courses per major
SELECT Majors_View.MajorName, Courses.CourseName
FROM Majors_View
INNER JOIN Degree_Requirements ON Majors_View.majorID = Degree_Requirements.majorID
INNER JOIN Courses ON Degree_Requirements.courseID = Courses.courseID
ORDER BY Majors_View.MajorName, Courses.CourseName
LIMIT 0, 1000;

-- Query 9:
-- Display detailed breakdown of major requirements for a specific major (e.g., MajorName = 'Computer Science')
SELECT Majors_View.MajorName, Courses.CourseName
FROM Majors_View
INNER JOIN Degree_Requirements_View ON Majors_View.majorID = Degree_Requirements_View.majorID
INNER JOIN Courses ON Degree_Requirements_View.courseID = Courses.courseID
WHERE Majors_View.MajorName = 'Computer Science';

-- Query 10:
-- Condition to identify undergraduate and graduate students
SELECT Students.FirstName, Students.LastName, Students.isUnderGrad
FROM Students
WHERE Students.isUnderGrad = 'yes';

-- Query 11:
-- Inner join to list departments and heads
SELECT Department.departmentName, Department.departmentHead
FROM Department;

-- Query 12:
-- Inner join to identify courses offered by a department
SELECT Courses.CourseName, Courses.SemesterOffered
FROM Courses
INNER JOIN Department ON Courses.departmentID = Department.departmentID
WHERE Department.departmentName = 'Computer Science & Management Information System';


-- Query 13:
-- Identify students with overallGPA > 3.50 as Dean's List
SELECT CONCAT(s.FirstName, ' ', s.LastName) AS StudentName, AVG(s.GPA) AS OverallGPA, m.MajorName
FROM Students s
JOIN Majors m ON s.majorID = m.majorID
GROUP BY s.studentID, s.FirstName, s.LastName, m.MajorName
HAVING OverallGPA > 3.50;


-- Query 14:
-- Identify students with CGPA < 2.0 as Probation List
SELECT CONCAT(s.FirstName, ' ', s.LastName) AS StudentName, AVG(s.GPA) AS OverallGPA, m.MajorName
FROM Students s
JOIN Majors m ON s.majorID = m.majorID
GROUP BY s.studentID, s.FirstName, s.LastName, m.MajorName
HAVING OverallGPA < 2.0;


-- Query 15:
-- Count the number of courses a student is currently enrolled in (e.g., studentID = 1)
SELECT CONCAT(Students_View.FirstName, ' ', Students_View.LastName) AS StudentName, COUNT(Course_Taken.courseID) AS NumberOfCourses
FROM Students_View
LEFT JOIN Course_Taken ON Students_View.studentID = Course_Taken.studentID
WHERE Students_View.studentID = 1;

-- Query 16:
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
-- Identify students with CGPA < 2.0 as Probation List
SELECT
    CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
    AVG(s.GPA) AS OverallGPA,
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
GROUP BY
    s.studentID, s.FirstName, s.LastName, m.MajorName, ct.courseID, c.CourseName, c.NumberOfCredits, c.SemesterOffered
HAVING
    OverallGPA < 2.0;


-- Query 17:
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

-- Query 18:
-- Query to identify students with CGPA < 2.0 as potential course failures using IN
-- Identify students with CGPA < 2.0 and majorID in (1, 2, 3) as Probation List
SELECT
    CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
    AVG(s.GPA) AS OverallGPA,
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
    s.majorID IN (1, 2, 3)  -- Using IN condition to filter specific majors
GROUP BY
    s.studentID, s.FirstName, s.LastName, m.MajorName, ct.courseID, c.CourseName, c.NumberOfCredits, c.SemesterOffered
HAVING
    OverallGPA < 2.0;
 
    
-- Query 19:
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
    
-- Query 20:
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


-- Query 21:
-- Generating a transcript report for a specific student (e.g., studentID = 1)
SELECT
    CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
    ct.courseID,
    c.CourseName,
    c.NumberOfCredits,
    c.SemesterOffered,
    d.departmentName,  -- Use the departmentName from the Department table
    COUNT(ct.courseID) AS TotalCourses,
    MAX(c.NumberOfCredits) AS MaxCredits,
    MIN(c.NumberOfCredits) AS MinCredits
FROM
    Students s
LEFT JOIN
    Course_Taken ct ON s.studentID = ct.studentID
JOIN
    Courses c ON ct.courseID = c.courseID
LEFT JOIN
    Department d ON c.departmentID = d.departmentID  -- Join with the Department table
WHERE
    s.studentID = 1
    AND c.SemesterOffered = 'Fall'  -- A fail condition
GROUP BY
    s.studentID, ct.courseID, c.CourseName, d.departmentName
ORDER BY
    c.SemesterOffered DESC, c.CourseName ASC;  -- Sorting by semester and course name










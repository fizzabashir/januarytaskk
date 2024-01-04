create database january;
use january;

Create table Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(255),
    StartDate DATE
);


 Create table departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(255)
);

INSERT INTO Departments VALUES
(1, 'IT'),
(2, 'Finance'),
(3, 'HR');
Create table Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Salary DECIMAL(10, 2),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
SELECT*FROM EMPLOYEEs;

Insert into Employees VALUES
(1, 'John', 'Doe', 60000, 1),
(2, 'Jane', 'Smith', 55000, 2),
  (3, 'Mike', 'Johnson', 65000,1),
    (4, 'Emily', 'Williams', 70000,3),
    (5, 'David', 'Brown', 50000,2);

Update Employees SET DepartmentID = 1 WHERE EmployeeID IN (1, 3);
Update Employees SET DepartmentID = 2 WHERE EmployeeID IN (2, 5);
update Employees SET DepartmentID = 3 WHERE EmployeeID = 4;

Select*from Employees WHERE Salary > 50000;

Select Employees.*, Departments.DepartmentName FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

select*from Employees WHERE LastName LIKE 'S%';

 select*from Projects WHERE ProjectName LIKE '%Database%';

SELECT DepartmentID, AVG(Salary) AS AvgSalary FROM Employees GROUP BY DepartmentID
ORDER BY AvgSalary DESC;


2nd task

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    GPA DECIMAL(3, 2)
);

INSERT INTO Students (StudentID, FirstName, LastName, Age, GPA)
VALUES
    (1, 'Alice', 'Johnson', 20, 3.75),
    (2, 'Bob', 'Smith', 22, 3.50),
    (3, 'Charlie', 'Davis', 21, 3.80),
    (4, 'Diana', 'Brown', 23, 3.90),
    (5, 'Eva', 'Miller', 20, 3.65),
    (6, 'Frank', 'Jones', 22, 3.70),
    (7, 'Grace', 'Wilson', 21, 3.85),
    (8, 'Henry', 'Anderson', 23, 3.95),
    (9, 'Ivy', 'Taylor', 20, 3.60),
    (10, 'Jack', 'Clark', 22, 3.75);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

-- Inserting 10 sample records into Courses table
INSERT INTO Courses (CourseID, CourseName)
VALUES
    (1, 'Introduction to Programming'),
    (2, 'Web Development Basics'),
    (3, 'Database Management'),
    (4, 'Data Structures and Algorithms'),
    (5, 'JavaScript Fundamentals'),
    (6, 'Mobile App Development'),
    (7, 'Software Engineering Principles'),
    (8, 'Networking Essentials'),
    (9, 'Artificial Intelligence Basics'),
    (10, 'Cybersecurity Fundamentals');

	Create table Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
INSERT into Enrollments (EnrollmentID, StudentID, CourseID)VALUES
   (1, 1, 2),
   (2, 2, 3),
    (3, 3, 1),
   (4, 4, 5),
   (5, 5, 2),
    (6, 6, 7),
    (7, 7, 4),
    (8, 8, 9),
    (9, 9, 6),
    (10, 10, 8);

	Select Students.*, Courses.CourseName From Students
LEFT JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
LEFT JOIN Courses ON Enrollments.CourseID = Courses.CourseID;
Select Students.*From Students JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
JOIN Courses ON Enrollments.CourseID = Courses.CourseID Where Courses.CourseName = 'Web Development Basics';
Select Courses.*From Courses LEFT JOIN Enrollments ON Courses.CourseID = Enrollments.CourseID
Where Enrollments.StudentID IS NULL;
SELECT Students.*, Courses.CourseName FROM Students
JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
JOIN Courses ON Enrollments.CourseID = Courses.CourseID;

Select Courses.*, COUNT(Enrollments.StudentID) AS NumEnrolledStudents FROM Courses
LEFT JOIN Enrollments ON Courses.CourseID = Enrollments.CourseID
GROUP BY Courses.CourseID, Courses.CourseName;



CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

-- Create Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Department VARCHAR(50) NOT NULL,
    ContactNumber VARCHAR(15)
);

-- Create Books Table
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(150) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Status VARCHAR(20) DEFAULT 'Available' CHECK (Status IN ('Available', 'Issued'))
);

-- Create Book_Issue Table
CREATE TABLE Book_Issue (
    IssueID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT NOT NULL,
    BookID INT NOT NULL,
    IssueDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE
);


-- Insert 5 Students
INSERT INTO Students (Name, Email, Department, ContactNumber) VALUES
('Aditya Pathania', 'dhroov@example.com', 'CSE', '9876543210'),
('Aman Sharma', 'aman@example.com', 'CSE', '9876543211'),
('Priya Singh', 'priya@example.com', 'ECE', '9876543212'),
('Rohan Verma', 'rohan@example.com', 'ME', '9876543213'),
('Sneha Patel', 'sneha@example.com', 'IT', '9876543214');

-- Insert 10 Books
INSERT INTO Books (Title, Author, Category, Status) VALUES
('Database System Concepts', 'Silberschatz', 'Computer Science', 'Issued'),
('Operating System Concepts', 'Galvin', 'Computer Science', 'Available'),
('Clean Code', 'Robert C. Martin', 'Software Development', 'Issued'),
('Introduction to Algorithms', 'Cormen', 'Computer Science', 'Available'),
('Computer Networks', 'Tanenbaum', 'Computer Science', 'Available'),
('Digital Logic Design', 'M. Mano', 'Electronics', 'Available'),
('Engineering Mechanics', 'Bhattacharyya', 'Mechanical', 'Available'),
('Let Us C', 'Yashavant Kanetkar', 'Programming', 'Available'),
('Java: The Complete Reference', 'Herbert Schildt', 'Programming', 'Available'),
('Web Development with Spring Boot', 'John Doe', 'Web Development', 'Available');

-- Insert Issue Records
INSERT INTO Book_Issue (StudentID, BookID, IssueDate, ReturnDate) VALUES
(1, 1, '2026-10-01', NULL),
(1, 3, '2026-10-05', NULL);


-- Cmds
SELECT BookID, Title, Author, Category FROM Books WHERE Status = 'Available';


SELECT * FROM Students;


SELECT s.Name AS StudentName, b.Title AS BookTitle, bi.IssueDate
FROM Book_Issue bi
JOIN Students s ON bi.StudentID = s.StudentID
JOIN Books b ON bi.BookID = b.BookID
WHERE s.StudentID = 1 AND bi.ReturnDate IS NULL;
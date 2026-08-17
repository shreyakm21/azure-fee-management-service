/*===========================================================
  Fee Management System
  Database Setup Script
  Author : Shreya
===========================================================*/

-- Create Database
CREATE DATABASE FeeManagementDB;
GO

USE FeeManagementDB;
GO

------------------------------------------------------------
-- Students Table
------------------------------------------------------------
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Course NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    TotalFee DECIMAL(10,2) NOT NULL,
    PaidAmount DECIMAL(10,2) NOT NULL,
    DueDate DATE NOT NULL
);
GO

------------------------------------------------------------
-- Administrators Table
------------------------------------------------------------
CREATE TABLE Administrators (
    AdminID INT PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Role NVARCHAR(50) NOT NULL
);
GO

------------------------------------------------------------
-- Sample Student Records
------------------------------------------------------------
INSERT INTO Students VALUES
(1,'Rahul Sharma','Computer Science','rahul@gmail.com',100000,0,'2026-07-15'),
(2,'Priya Patel','Information Technology','priya@gmail.com',95000,50000,'2026-09-10'),
(3,'Amit Verma','Mechanical','amit@gmail.com',85000,85000,'2026-08-01'),
(4,'Sneha Kulkarni','Electronics','sneha@gmail.com',90000,45000,'2026-09-05'),
(5,'Rohan Gupta','Civil','rohan@gmail.com',80000,20000,'2026-06-20'),
(6,'Neha Joshi','Computer Science','neha@gmail.com',100000,100000,'2026-08-30'),
(7,'Karan Singh','Electrical','karan@gmail.com',88000,40000,'2026-07-25'),
(8,'Pooja Desai','Information Technology','pooja@gmail.com',95000,95000,'2026-09-01'),
(9,'Vikram Nair','Mechanical','vikram@gmail.com',87000,30000,'2026-07-18'),
(10,'Anjali Mehta','Computer Science','anjali@gmail.com',105000,60000,'2026-08-20'),
(11,'Deepak Rao','Civil','deepak@gmail.com',78000,78000,'2026-07-10'),
(12,'Meera Iyer','Electronics','meera@gmail.com',91000,50000,'2026-08-15'),
(13,'Sanjay Kumar','Electrical','sanjay@gmail.com',92000,92000,'2026-08-05'),
(14,'Kavya Reddy','Computer Science','kavya@gmail.com',98000,45000,'2026-07-28'),
(15,'Arjun Shah','Information Technology','arjun@gmail.com',97000,30000,'2026-06-30'),
(16,'Nisha Kapoor','Mechanical','nisha@gmail.com',86000,86000,'2026-09-12'),
(17,'Harsh Jain','Civil','harsh@gmail.com',79000,25000,'2026-07-22'),
(18,'Ritika Bose','Computer Science','ritika@gmail.com',102000,60000,'2026-08-18'),
(19,'Aditya Mishra','Electronics','aditya@gmail.com',93000,20000,'2026-07-14'),
(20,'Simran Kaur','Information Technology','simran@gmail.com',96000,96000,'2026-09-15');
GO

------------------------------------------------------------
-- Sample Administrators
------------------------------------------------------------
INSERT INTO Administrators VALUES
(1,'Admin User','Super Admin'),
(2,'Finance Officer','Finance');
GO

------------------------------------------------------------
-- Verify Data
------------------------------------------------------------
SELECT * FROM Students;
SELECT * FROM Administrators;
GO
DROP DATABASE IF EXISTS `EIS`;
CREATE DATABASE `EIS`; 
USE `EIS`;

CREATE TABLE Accounts
(
  Account_ID INT NOT NULL AUTO_INCREMENT,
  Email VARCHAR(100) NOT NULL,
  Password VARCHAR(20) NOT NULL,
  Account_type VARCHAR(10) NOT NULL,
  PRIMARY KEY (Account_ID),
  UNIQUE (Email)
);

CREATE TABLE Lecturers
(
  Lecturer_ID INT NOT NULL AUTO_INCREMENT,
  First_name VARCHAR(50) NOT NULL,
  Last_name VARCHAR(50) NOT NULL,
  Account_ID INT NOT NULL,
  PRIMARY KEY (Lecturer_ID),
  FOREIGN KEY (Account_ID) REFERENCES Accounts(Account_ID)
);

CREATE TABLE Departments
(
  Department_ID INT NOT NULL AUTO_INCREMENT,
  Department_name VARCHAR(200) NOT NULL,
  Head_of_department INT NOT NULL,
  PRIMARY KEY (Department_ID),
  FOREIGN KEY (Head_of_department) REFERENCES Lecturers(Lecturer_ID)
);

CREATE TABLE Programs
(
  Program_ID INT NOT NULL AUTO_INCREMENT,
  Program_name VARCHAR(100) NOT NULL,
  Tuition_fee INT NOT NULL,
  Department_ID INT NOT NULL,
  PRIMARY KEY (Program_ID),
  FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID),
  UNIQUE (Program_name)
);

CREATE TABLE Department_Lecturers
(
  Department_ID INT NOT NULL,
  Lecturer_ID INT NOT NULL,
  PRIMARY KEY (Department_ID, Lecturer_ID),
  FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID),
  FOREIGN KEY (Lecturer_ID) REFERENCES Lecturers(Lecturer_ID)
);

CREATE TABLE Students
(
  Student_ID INT NOT NULL AUTO_INCREMENT,
  First_name VARCHAR(50) NOT NULL,
  Last_name VARCHAR(50) NOT NULL,
  Personal_ID VARCHAR(10) NOT NULL,
  Birthday DATE NOT NULL,
  Registration_date DATE NOT NULL,
  Scholarship INT,
  Payment_status VARCHAR(5) NOT NULL,
  Department_ID INT NOT NULL,
  Program_ID INT NOT NULL,
  Account_ID INT NOT NULL,
  Advisor INT NOT NULL,
  PRIMARY KEY (Student_ID),
  FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID),
  FOREIGN KEY (Program_ID) REFERENCES Programs(Program_ID),
  FOREIGN KEY (Account_ID) REFERENCES Accounts(Account_ID) ON DELETE CASCADE,
  FOREIGN KEY (Advisor) REFERENCES Lecturers(Lecturer_ID),
  UNIQUE (Personal_ID)
);

CREATE TABLE Courses
(
  Academic_year INT NOT NULL,
  Course_Code VARCHAR(7) NOT NULL,
  Course_name VARCHAR(100) NOT NULL,
  Course_credit INT NOT NULL,
  Program_ID INT NOT NULL,
  PRIMARY KEY (Course_Code, Academic_year),
  FOREIGN KEY (Program_ID) REFERENCES Programs(Program_ID)
);

CREATE TABLE Participants
(
  Academic_year INT NOT NULL,
  Course_Code VARCHAR(7) NOT NULL,
  Student_ID INT NOT NULL,
  Attendance_percent INT NOT NULL,
  Retake_status CHAR(1) NOT NULL,
  PRIMARY KEY (Course_Code, Academic_year, Student_ID),
  FOREIGN KEY (Course_Code, Academic_year) REFERENCES Courses(Course_Code, Academic_year),
  FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID) ON DELETE CASCADE
);

CREATE TABLE Course_Lecturers
(
  Academic_year INT NOT NULL,
  Course_Code VARCHAR(7) NOT NULL,
  Lecturer_ID INT NOT NULL,
  PRIMARY KEY (Course_Code, Academic_year, Lecturer_ID),
  FOREIGN KEY (Course_Code, Academic_year) REFERENCES Courses(Course_Code, Academic_year),
  FOREIGN KEY (Lecturer_ID) REFERENCES Lecturers(Lecturer_ID)
);

CREATE TABLE Assignments
(
  Academic_year INT NOT NULL,
  Course_Code VARCHAR(7) NOT NULL,
  Assignment_type VARCHAR(20) NOT NULL,
  Assignment_percent INT NOT NULL,
  PRIMARY KEY (Assignment_type, Course_Code, Academic_year),
  FOREIGN KEY (Course_Code, Academic_year) REFERENCES Courses(Course_Code, Academic_year)
);


CREATE TABLE Student_Assignments
(
  Academic_year INT NOT NULL,
  Course_Code VARCHAR(7) NOT NULL,
  Assignment_type VARCHAR(20) NOT NULL,
  Student_ID INT NOT NULL,
  Grade INT NOT NULL,
  PRIMARY KEY (Assignment_type, Course_Code, Academic_year,Student_ID),
  FOREIGN KEY (Course_Code, Academic_year) REFERENCES Courses(Course_Code, Academic_year),
  FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID) ON DELETE CASCADE
);

CREATE TABLE Books
(
  ISBN NUMERIC(13,0) NOT NULL,
  Title VARCHAR(100) NOT NULL,
  Author VARCHAR(100) NOT NULL,
  Quantity INT NOT NULL,
  PRIMARY KEY (ISBN)
);

CREATE TABLE Reserves
(
  Student_ID INT NOT NULL,
  ISBN NUMERIC(13,0) NOT NULL,
  PRIMARY KEY (ISBN, Student_ID),
  FOREIGN KEY (ISBN) REFERENCES Books(ISBN),
  FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID) ON DELETE CASCADE
);

CREATE TABLE Messages (
    Message_ID INT NOT NULL AUTO_INCREMENT,
    Sent_date DATE NOT NULL,
    Content VARCHAR(2000) NOT NULL,
    Status VARCHAR(10) NOT NULL DEFAULT 'Sent',
    Sender_ID INT NOT NULL,
    Receiver_ID INT NOT NULL,
    PRIMARY KEY (Message_ID),
    FOREIGN KEY (Sender_ID) REFERENCES Accounts(Account_ID) ON DELETE CASCADE,
    FOREIGN KEY (Receiver_ID) REFERENCES Accounts(Account_ID) ON DELETE CASCADE
);
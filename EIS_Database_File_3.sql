INSERT INTO Accounts (email,password,account_type)
VALUES
("jdoe@epoka.edu.al","Jdoe1234","Lecturer"),
("mjohnson@epoka.edu.al","Mjohnson1234","Lecturer"),
("asmith@epoka.edu.al","Asmith1234","Lecturer"),
("sanderson@epoka.edu.al","Sanderson1234","Lecturer"),
("wmartinez@epoka.edu.al","Wmartinez1234","Lecturer"),
("ewilliams@epoka.edu.al","Ewilliams1234","Lecturer"),
("ogarcia@epoka.edu.al","Ogarcia1234","Lecturer"),
("dbrown@epoka.edu.al","Dbrown1234","Lecturer"),
("drobinson@epoka.edu.al","Drobinson1234","Lecturer"),
("athompson@epoka.edu.al","Athompson1234","Lecturer"),
("ljohnson23@epoka.edu.al","Ljohnson1234","Student"),
("esmith23@epoka.edu.al","Esmith1234","Student"),
("mgarcia23@epoka.edu.al","Mgarcia1234","Student"),
("lmartinez23@epoka.edu.al","Lmartinez1234","Student"),
("sbrown23@epoka.edu.al","Sbrown1234","Student"),
("ewilson23@epoka.edu.al","Ewilson1234","Student"),
("agray23@epoka.edu.al","Agray1234","Student"),
("hlee23@epoka.edu.al","Hlee1234","Student"),
("bwright23@epoka.edu.al","Bwright1234","Student"),
("cdavis23@epoka.edu.al","Cdavis1234","Student");

INSERT INTO Lecturers (first_name,last_name,account_id)
VALUES
( "John", "Doe", 1),
( "Alice", "Smith", 3),
( "Michael", "Johnson", 2),
( "Emily", "Williams", 6),
( "David", "Brown", 8),
( "Sophia", "Anderson", 4),
( "William", "Martinez", 5),
( "Olivia", "Garcia", 7),
( "Daniel", "Robinson", 9),
( "Ava", "Thompson", 10);

INSERT INTO Departments (department_name,head_of_department)
VALUES
("Department of Banking and Finance",2),
("Department of business Administration",8),
("Department of Economics",6),
("Department of Architecture",1), 
("Department of Civil Engineeering",7),
("Department of Computer Engineering",3),
("Department of Political Science and International Relations",5),
("Department of Law",10);

INSERT INTO Programs (program_name,tuition_fee,department_id)
VALUES
("Banking and Finance",2500,1),
("Banking and Finance (Albanian)",2500,1),
("Business Administration",2500,2),
("Business Informatics",3000,2),
("International Marketing & Logistics Management",2500,2),
("Economics",2500,3),
("Architecture",3800,4),
("Civil Engineering",3500,5),
("Electronics and Digital Communication Engineering",3500,6),
("Computer Engineering",3500,6),
("Software Engineering",4000,6),
("Political Science and International Relations",2500,7),
("Law",2800,8);

INSERT INTO Books (isbn,title,author,quantity)
VALUES
(9780262033848, "Artificial Intelligence: A Modern Approach", "Stuart Russell", 45),
(9780262531962, "Introduction to the Theory of Computation", "Michael Sipser", 20),
(9780321616956, "Computer Organization and Design", "David A. Patterson", 38),
(9780262533058, "Pattern Recognition and Machine Learning", "Christopher M. Bishop", 28),
(9780132149181, "Introduction to Information Retrieval", "Christopher D. Manning", 42),
(9781580934954, "Architecture: Form, Space, and Order", "Francis D.K. Ching", 30),
(9780471752165, "A Global History of Architecture", "Francis D.K. Ching", 25),
(9781118745083, "Architectural Graphics", "Francis D.K. Ching", 40),
(9780470289499, "Building Construction Illustrated", "Francis D.K. Ching", 35),
(9781119035664, "Design Drawing", "Francis D.K. Ching", 28),
(9780140182742, "Brave New World", "Aldous Huxley", 28),
(9780062561029, "The Lord of the Rings", "J.R.R. Tolkien", 45),
(9780062315007, "Pride and Prejudice", "Jane Austen", 33),
(9780679783268, "The Picture of Dorian Gray", "Oscar Wilde", 20),
(9780743273565, "The Alchemist", "Paulo Coelho", 22);

INSERT INTO Department_Lecturers (department_id,lecturer_id)
VALUES
(1,1),
(2,2),
(2,1),
(3,3),
(3,4),
(4,4),
(5,5),
(6,7),
(6,8),
(6,9),
(6,3),
(6,5),
(6,2),
(7,6),
(7,10),
(8,4),
(8,6);

INSERT INTO Students (department_id,program_id,Registration_date,first_name,last_name,
                      personal_id,birthday,scholarship,payment_status,advisor,account_id)
VALUES
(6,11,"2023-09-01","Liam","Johnson","D43895671Y","2003-11-12",NULL,"PAID",9,11),
(6,11,"2023-09-01","Emily","Smith","R72503149Z","2002-01-13",100,"PAID",9,12),
(6,11,"2023-09-01","Maria","Garcia","A89975283E","2004-06-14",75,"PAID",9,13),
(6,11,"2023-09-01","Lucas","Martinez","G10324567N","2000-12-30",NULL,"PAID",9,14),  
(6,11,"2023-09-01","Sofia","Brown","H67129835S","2005-08-16",NULL,"PAID",9,15),
(6,11,"2023-09-01","Ethan","Wilson","T57392048X","2003-07-16",50,"PAID",9,16),
(6,11,"2023-09-01","Ava","Gray","L80236591Q","2004-03-18",25,"PAID",9,17),
(6,11,"2023-09-01","Harper","Lee ","M45678923V","2004-04-18",100,"PAID",9,18),
(6,11,"2023-09-01","Benjamin","Wright","S12345678K","2004-06-20",NULL,"PAID",9,19),
(6,11,"2023-09-01","Chloe","Davis","B98765432F","2004-11-20",NULL,"PAID",9,20);

INSERT INTO Courses (academic_year,course_code,course_name,course_credit,program_id)
VALUES
(23,"CEN105","Linear Algebra",5,11),
(23,"CEN109","Introduction to Algorithms & Programming",7,11),
(23,"ENG103","Development of Reading and Writing Skills in English I",4,11),
(23,"MTH101","Calculus I",7,11),
(23,"PHY101","General Physics I",7,11);

INSERT INTO Course_Lecturers (academic_year,course_code,lecturer_id)
VALUES
(23,"CEN105",7),
(23,"PHY101",3),
(23,"ENG103",8),
(23,"MTH101",5),
(23,"MTH101",2),
(23,"CEN109",9);

INSERT INTO Participants (student_id,academic_year,course_code,attendance_percent,retake_status)
VALUES
(1,23,"CEN105",100,"F"),
(2,23,"CEN105",100,"F"),
(3,23,"CEN105",100,"F"),
(4,23,"CEN105",100,"F"),
(5,23,"CEN105",100,"F"),
(6,23,"CEN105",100,"F"),
(7,23,"CEN105",100,"F"),
(8,23,"CEN105",100,"F"),
(9,23,"CEN105",100,"F"),
(10,23,"CEN105",100,"F"),

(1,23,"PHY101",100,"F"),
(2,23,"PHY101",100,"F"),
(3,23,"PHY101",100,"F"),
(4,23,"PHY101",100,"F"),
(5,23,"PHY101",100,"F"),
(6,23,"PHY101",100,"F"),
(7,23,"PHY101",100,"F"),
(8,23,"PHY101",100,"F"),
(9,23,"PHY101",100,"F"),
(10,23,"PHY101",100,"F"),

(1,23,"ENG103",100,"F"),
(2,23,"ENG103",100,"F"),
(3,23,"ENG103",100,"F"),
(4,23,"ENG103",100,"F"),
(5,23,"ENG103",100,"F"),
(6,23,"ENG103",100,"F"),
(7,23,"ENG103",100,"F"),
(8,23,"ENG103",100,"F"),
(9,23,"ENG103",100,"F"),
(10,23,"ENG103",100,"F"),

(1,23,"MTH101",100,"F"),
(2,23,"MTH101",100,"F"),
(3,23,"MTH101",100,"F"),
(4,23,"MTH101",100,"F"),
(5,23,"MTH101",100,"F"),
(6,23,"MTH101",100,"F"),
(7,23,"MTH101",100,"F"),
(8,23,"MTH101",100,"F"),
(9,23,"MTH101",100,"F"),
(10,23,"MTH101",100,"F"),

(1,23,"CEN109",100,"F"),
(2,23,"CEN109",100,"F"),
(3,23,"CEN109",100,"F"),
(4,23,"CEN109",100,"F"),
(5,23,"CEN109",100,"F"),
(6,23,"CEN109",100,"F"),
(7,23,"CEN109",100,"F"),
(8,23,"CEN109",100,"F"),
(9,23,"CEN109",100,"F"),
(10,23,"CEN109",100,"F");

INSERT INTO Assignments (academic_year,course_code,assignment_type,assignment_percent)
VALUES
(23,"CEN105","Midterm",35),
(23,"CEN105","Final",45),
(23,"CEN105","Quiz",10),
(23,"CEN105","Homework",10),
(23,"PHY101","Midterm",40),
(23,"PHY101","Final",60),
(23,"ENG103","Midterm",30),
(23,"ENG103","Final",50),
(23,"ENG103","Project",20),
(23,"MTH101","Midterm",30),
(23,"MTH101","Final",70),
(23,"CEN109","Midterm",40),
(23,"CEN109","Final",60);

INSERT INTO Student_Assignments (academic_year,course_code,student_id,assignment_type,grade)
VALUES 
(23,"CEN105",1,"Midterm",80),
(23,"CEN105",1,"Final",99),
(23,"CEN105",1,"Quiz",60),
(23,"CEN105",1,"Homework",100),
(23,"CEN105",2,"Midterm",88),
(23,"CEN105",2,"Final",94),
(23,"CEN105",2,"Quiz",99),
(23,"CEN105",2,"Homework",96),
(23,"CEN105",3,"Midterm",77),
(23,"CEN105",3,"Final",100),
(23,"CEN105",3,"Quiz",89),
(23,"CEN105",3,"Homework",99),
(23,"CEN105",4,"Midterm",57),
(23,"CEN105",4,"Final",77),
(23,"CEN105",4,"Quiz",68),
(23,"CEN105",4,"Homework",80),
(23,"CEN105",5,"Midterm",92),
(23,"CEN105",5,"Final",88),
(23,"CEN105",5,"Quiz",80),
(23,"CEN105",5,"Homework",100),
(23,"CEN105",6,"Midterm",89),
(23,"CEN105",6,"Final",95),
(23,"CEN105",6,"Quiz",95),
(23,"CEN105",6,"Homework",98),
(23,"CEN105",7,"Midterm",66),
(23,"CEN105",7,"Final",79),
(23,"CEN105",7,"Quiz",84),
(23,"CEN105",7,"Homework",97),
(23,"CEN105",8,"Midterm",94),
(23,"CEN105",8,"Final",97),
(23,"CEN105",8,"Quiz",98),
(23,"CEN105",8,"Homework",100),
(23,"CEN105",9,"Midterm",58),
(23,"CEN105",9,"Final",65),
(23,"CEN105",9,"Quiz",43),
(23,"CEN105",9,"Homework",86),
(23,"CEN105",10,"Midterm",78),
(23,"CEN105",10,"Final",94),
(23,"CEN105",10,"Quiz",98),
(23,"CEN105",10,"Homework",100),

(23,"PHY101",1,"Midterm",79),
(23,"PHY101",1,"Final",99),
(23,"PHY101",2,"Midterm",68),
(23,"PHY101",2,"Final",88),
(23,"PHY101",3,"Midterm",95),
(23,"PHY101",3,"Final",78),
(23,"PHY101",4,"Midterm",100),
(23,"PHY101",4,"Final",100),
(23,"PHY101",5,"Midterm",90),
(23,"PHY101",5,"Final",95),
(23,"PHY101",6,"Midterm",87),
(23,"PHY101",6,"Final",94),
(23,"PHY101",7,"Midterm",79),
(23,"PHY101",7,"Final",92),
(23,"PHY101",8,"Midterm",93),
(23,"PHY101",8,"Final",88),
(23,"PHY101",9,"Midterm",100),
(23,"PHY101",9,"Final",94),
(23,"PHY101",10,"Midterm",80),
(23,"PHY101",10,"Final",97),

(23,"ENG103",1,"Midterm",100),
(23,"ENG103",1,"Final",100),
(23,"ENG103",1,"Project",100),
(23,"ENG103",2,"Midterm",100),
(23,"ENG103",2,"Final",90),
(23,"ENG103",2,"Project",95),
(23,"ENG103",3,"Midterm",85),
(23,"ENG103",3,"Final",99),
(23,"ENG103",3,"Project",100),
(23,"ENG103",4,"Midterm",78),
(23,"ENG103",4,"Final",100),
(23,"ENG103",4,"Project",100),
(23,"ENG103",5,"Midterm",97),
(23,"ENG103",5,"Final",90),
(23,"ENG103",5,"Project",100),
(23,"ENG103",6,"Midterm",96),
(23,"ENG103",6,"Final",100),
(23,"ENG103",6,"Project",90),
(23,"ENG103",7,"Midterm",77),
(23,"ENG103",7,"Final",80),
(23,"ENG103",7,"Project",92),
(23,"ENG103",8,"Midterm",83),
(23,"ENG103",8,"Final",88),
(23,"ENG103",8,"Project",99),
(23,"ENG103",9,"Midterm",99),
(23,"ENG103",9,"Final",100),
(23,"ENG103",9,"Project",98),
(23,"ENG103",10,"Midterm",94),
(23,"ENG103",10,"Final",96),
(23,"ENG103",10,"Project",100),

(23,"MTH101",1,"Midterm",78),
(23,"MTH101",1,"Final",89),
(23,"MTH101",2,"Midterm",100),
(23,"MTH101",2,"Final",79),
(23,"MTH101",3,"Midterm",90),
(23,"MTH101",3,"Final",95),
(23,"MTH101",4,"Midterm",96),
(23,"MTH101",4,"Final",100),
(23,"MTH101",5,"Midterm",83),
(23,"MTH101",5,"Final",90),
(23,"MTH101",6,"Midterm",60),
(23,"MTH101",6,"Final",77),
(23,"MTH101",7,"Midterm",79),
(23,"MTH101",7,"Final",56),
(23,"MTH101",8,"Midterm",84),
(23,"MTH101",8,"Final",100),
(23,"MTH101",9,"Midterm",92),
(23,"MTH101",9,"Final",84),
(23,"MTH101",10,"Midterm",99),
(23,"MTH101",10,"Final",100),

(23,"CEN109",1,"Midterm",64),
(23,"CEN109",1,"Final",88),
(23,"CEN109",2,"Midterm",95),
(23,"CEN109",2,"Final",100),
(23,"CEN109",3,"Midterm",100),
(23,"CEN109",3,"Final",100),
(23,"CEN109",4,"Midterm",100),
(23,"CEN109",4,"Final",94),
(23,"CEN109",5,"Midterm",78),
(23,"CEN109",5,"Final",93),
(23,"CEN109",6,"Midterm",89),
(23,"CEN109",6,"Final",100),
(23,"CEN109",7,"Midterm",97),
(23,"CEN109",7,"Final",99),
(23,"CEN109",8,"Midterm",81),
(23,"CEN109",8,"Final",98),
(23,"CEN109",9,"Midterm",70),
(23,"CEN109",9,"Final",64),
(23,"CEN109",10,"Midterm",85),
(23,"CEN109",10,"Final",100);

CALL ReserveBook(9780471752165,1);
CALL ReserveBook(9781580934954,6);
CALL ReserveBook(9780471752165,2);
CALL ReserveBook(9780471752165,3);
CALL ReserveBook(9781580934954,7);
CALL ReserveBook(9780471752165,4);
CALL ReserveBook(9781580934954,8);
CALL ReserveBook(9780471752165,5);
CALL ReserveBook(9780132149181,1);
CALL ReserveBook(9780132149181,9);
CALL ReserveBook(9780132149181,10);
CALL ReserveBook(9780262531962,1);
CALL ReserveBook(9780262033848,8);
CALL ReserveBook(9780321616956,9);


CALL SendNewMessage('Hello! Welcome to the course.', 1, 11);
CALL SendNewMessage('Reminder: Assignment due next week.', 2, 12);
CALL SendNewMessage('Lecture rescheduled to Friday.', 3, 13);
CALL SendNewMessage('Meeting at 3 PM tomorrow.', 4, 14);
CALL SendNewMessage('Important announcement: Exam dates changed.', 5, 15);
CALL SendNewMessage('Reminder: Submit your project proposals.', 6, 16);
CALL SendNewMessage('Class canceled for today.', 18, 17);
CALL SendNewMessage('Welcome back! New semester starts next week.', 8, 18);
CALL SendNewMessage('Final submission deadline extended.', 9, 19);
CALL SendNewMessage('Information session on internship opportunities.', 10, 20);
CALL SendNewMessage('Your project proposal has been approved.', 14, 4);
CALL SendNewMessage('Exam dates finalized. Check the schedule.', 15, 5);
CALL SendNewMessage('Reminder: Submit your assignments by Friday.', 16, 6);
CALL SendNewMessage('Class notes for last week uploaded.', 18, 17);
CALL SendNewMessage('Orientation session for new students tomorrow.', 18, 8);
CALL SendNewMessage('Internship applications open next week.', 19, 9);
CALL SendNewMessage('Workshop on research methodologies this Friday.', 20, 10);
CALL SendNewMessage('Good morning!', 1, 11);
CALL SendNewMessage('How are you?', 13, 12);
CALL SendNewMessage('What are your plans for today?', 12, 13);
CALL SendNewMessage('I have a question for you.', 4, 14);
CALL SendNewMessage('Can we meet tomorrow?', 5, 15);
CALL SendNewMessage('Important notice!', 6, 16);
CALL SendNewMessage('Interesting idea!', 7, 17);
CALL SendNewMessage('Let\'s discuss the project.', 8, 18);
CALL SendNewMessage('Deadline approaching.', 9, 19);
CALL SendNewMessage('Any updates on the assignment?', 10, 20);
CALL SendNewMessage('Did you understand the topic?', 1, 11);
CALL SendNewMessage('Need help with the assignment?', 2, 12);

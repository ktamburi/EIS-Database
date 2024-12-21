

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

/*!50003 DROP PROCEDURE IF EXISTS `AcademicYearPaymentTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AcademicYearPaymentTable`()
BEGIN
SELECT 
    S.Student_ID,
    S.First_name,
    S.Last_name,
    P.Program_name,
    P.Tuition_fee - (P.Tuition_fee * (IFNULL(S.Scholarship, 0) / 100)) AS Amount_to_Pay,
    S.Payment_status
FROM 
    Students S
JOIN 
    Programs P ON S.Program_ID = P.Program_ID;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BookAvailability` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BookAvailability`(
    IN bookISBN NUMERIC(13, 0)
)
BEGIN
    DECLARE bookExists INT;
    SELECT COUNT(*) INTO bookExists FROM Books WHERE ISBN = bookISBN;

    IF bookExists = 0 THEN
        SELECT 'Book does not exist.' AS Message;
    ELSE
        SELECT 
            B.ISBN,
            B.Title,
            B.Author,
            B.Quantity,
            (B.Quantity - COUNT(R.ISBN)) AS Availability
        FROM 
            Books B
        LEFT JOIN 
            Reserves R ON B.ISBN = R.ISBN
        WHERE 
            B.ISBN = bookISBN
        GROUP BY 
            B.ISBN, B.Title, B.Author, B.Quantity;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BookAvailabilityTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BookAvailabilityTable`()
BEGIN
SELECT 
    B.ISBN,
    B.Title,
    B.Author,
    B.Quantity,
    (B.Quantity - COUNT(R.ISBN)) AS Availability
FROM 
    Books B
LEFT JOIN 
    Reserves R ON B.ISBN = R.ISBN
GROUP BY 
    B.ISBN, B.Title, B.Author, B.Quantity;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CGPATable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CGPATable`()
BEGIN
SELECT 
    S.Student_ID,
    S.First_name,
    S.Last_name,
    ROUND((SUM(CourseGrades.Final_Grade * Courses.Course_credit) / SUM(Courses.Course_credit)) / 25, 2) AS CGPA
FROM (
    SELECT 
        SA.Student_ID,
        SA.Course_Code,
        SUM(SA.Grade * ASG.Assignment_percent / 100.0) AS Final_Grade
    FROM 
        Student_Assignments SA
    JOIN 
        Assignments ASG ON SA.Course_Code = ASG.Course_Code 
                        AND SA.Academic_year = ASG.Academic_year 
                        AND SA.Assignment_type = ASG.Assignment_type
    GROUP BY 
        SA.Student_ID, SA.Course_Code
) AS CourseGrades
JOIN 
    Courses ON CourseGrades.Course_Code = Courses.Course_Code
JOIN 
    Students S ON CourseGrades.Student_ID = S.Student_ID
GROUP BY 
    S.Student_ID, S.First_name, S.Last_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConversationMessages` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConversationMessages`(
    IN account1 INT,
    IN account2 INT
)
BEGIN
    SELECT *
    FROM Messages
    WHERE (Sender_ID = account1 AND Receiver_ID = account2)
       OR (Sender_ID = account2 AND Receiver_ID = account1)
    ORDER BY Sent_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteStudentData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteStudentData`(IN studentID INT)
BEGIN
    DECLARE accountID INT;

    SELECT Account_ID INTO accountID
    FROM Students
    WHERE Student_ID = studentID;

    IF accountID IS NOT NULL THEN
        DELETE FROM Accounts 
        WHERE Account_ID = accountID;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FinalGradeTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `FinalGradeTable`()
BEGIN
SELECT 
    S.Student_ID,
    S.First_name,
    S.Last_name,
    C.Course_Code,
    SUM(SA.Grade * ASG.Assignment_percent / 100.0) AS Final_Grade
FROM 
    Student_Assignments SA
JOIN 
    Assignments ASG ON SA.Course_Code = ASG.Course_Code 
                    AND SA.Academic_year = ASG.Academic_year 
                    AND SA.Assignment_type = ASG.Assignment_type
JOIN 
    Courses C ON SA.Course_Code = C.Course_Code 
             AND SA.Academic_year = C.Academic_year
JOIN 
    Students S ON SA.Student_ID = S.Student_ID
GROUP BY 
    S.Student_ID, S.First_name, S.Last_name, C.Course_Code;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReserveBook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReserveBook`(
    IN bookISBN NUMERIC(13,0),
    IN studentID INT
)
BEGIN
    DECLARE availability INT;
    SELECT (B.Quantity - COUNT(R.ISBN)) INTO availability
    FROM Books B
    LEFT JOIN Reserves R ON B.ISBN = R.ISBN
    WHERE B.ISBN = bookISBN
    GROUP BY B.ISBN, B.Title, B.Author, B.Quantity;
    IF availability > 0 THEN
        IF NOT EXISTS (
            SELECT 1 
            FROM Reserves 
            WHERE ISBN = bookISBN AND Student_ID = studentID
        ) THEN
            INSERT INTO Reserves (ISBN, Student_ID) VALUES (bookISBN, studentID);
        ELSE
            SELECT 'Student has already reserved this book.' AS Message;
        END IF;
    ELSEIF availability=0 THEN
        SELECT 'Book not available for reservation.' AS Message;
	ELSE
		SELECT 'Student ID and/or book ISBN is incorrect.' AS Message;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReservedBooksByStudent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReservedBooksByStudent`(IN studentID INT)
BEGIN
    SELECT S.First_name, S.Last_name, B.ISBN, B.Title, B.Author  
    FROM Books B, Reserves R, Students S
	WHERE R.Student_ID = studentID AND B.ISBN = R.ISBN AND S.Student_ID=studentID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReturnBook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReturnBook`(
    IN bookISBN NUMERIC(13,0),
    IN studentID INT
)
BEGIN
    DELETE FROM Reserves
    WHERE ISBN = bookISBN
    AND Student_ID = studentID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SendNewMessage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SendNewMessage`(
    IN messageContent VARCHAR(2000),
    IN senderID INT,
    IN receiverID INT
)
BEGIN
    DECLARE existingSentMessages INT;

    INSERT INTO Messages (Sent_date, Content, Sender_ID, Receiver_ID)
    VALUES (CURRENT_TIMESTAMP(), messageContent, senderID, receiverID);

    SELECT COUNT(*)
    INTO existingSentMessages
    FROM Messages
    WHERE Sender_ID = receiverID
          AND Receiver_ID = senderID
          AND Status = 'Sent';

    IF existingSentMessages > 0 THEN
        UPDATE Messages
        SET Status = 'Seen'
        WHERE Sender_ID = receiverID
              AND Receiver_ID = senderID
              AND Status = 'Sent';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `StudentCGPA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `StudentCGPA`(
	IN studentID INT
)
BEGIN
	DECLARE studentExists INT;
    SELECT COUNT(*) INTO studentExists FROM Students WHERE Student_ID = studentID;
    IF studentExists = 0 THEN
        SELECT 'Student does not exist.' AS Message;
	ELSE
		SELECT 
        S.Student_ID,
        S.First_name,
        S.Last_name,
        ROUND((SUM(CourseGrades.Final_Grade * Courses.Course_credit) / SUM(Courses.Course_credit)) / 25, 2) AS CGPA
    FROM (
        SELECT 
            SA.Student_ID,
            SA.Course_Code,
            SUM(SA.Grade * ASG.Assignment_percent / 100.0) AS Final_Grade
        FROM 
            Student_Assignments SA
        JOIN 
            Assignments ASG ON SA.Course_Code = ASG.Course_Code 
                            AND SA.Academic_year = ASG.Academic_year 
                            AND SA.Assignment_type = ASG.Assignment_type
        WHERE SA.Student_ID = studentID
        GROUP BY 
            SA.Student_ID, SA.Course_Code
    ) AS CourseGrades
    JOIN 
        Courses ON CourseGrades.Course_Code = Courses.Course_Code
    JOIN 
        Students S ON CourseGrades.Student_ID = S.Student_ID
    WHERE 
        S.Student_ID = studentID
    GROUP BY 
        S.Student_ID, S.First_name, S.Last_name;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `StudentCourseGrade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `StudentCourseGrade`(
    IN studentID INT,
    IN courseCode VARCHAR(7),
    IN academicYear INT
)
BEGIN
    DECLARE studentExists INT;
    DECLARE courseExists INT;
    SELECT COUNT(*) INTO studentExists FROM Students WHERE Student_ID = studentID;
    SELECT COUNT(*) INTO courseExists FROM Courses WHERE Course_Code = courseCode AND Academic_year = academicYear;

    IF studentExists = 0 THEN
        SELECT 'Student does not exist.' AS Message;
    ELSEIF courseExists = 0 THEN
        SELECT 'Course does not exist for the specified academic year.' AS Message;
    ELSE
		SELECT 
			S.Student_ID,
			S.First_name,
			S.Last_name,
			C.Course_Code,
			SUM(SA.Grade * ASG.Assignment_percent / 100.0) AS Final_Grade
		FROM 
			Student_Assignments SA
		JOIN 
        Assignments ASG ON SA.Course_Code = ASG.Course_Code 
                        AND SA.Academic_year = ASG.Academic_year 
                        AND SA.Assignment_type = ASG.Assignment_type
    JOIN 
        Courses C ON SA.Course_Code = C.Course_Code 
                 AND SA.Academic_year = C.Academic_year
    JOIN 
        Students S ON SA.Student_ID = S.Student_ID
    WHERE 
        S.Student_ID = studentID
        AND C.Course_Code = courseCode
        AND SA.Academic_year = academicYear
    GROUP BY 
        S.Student_ID, S.First_name, S.Last_name, C.Course_Code;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `StudentPayment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `StudentPayment`(
    IN studentID INT
)
BEGIN
    DECLARE studentExists INT;
    SELECT COUNT(*) INTO studentExists FROM Students WHERE Student_ID = studentID;

    IF studentExists = 0 THEN
        SELECT 'Student does not exist.' AS Message;
    ELSE
        SELECT 
			S.Student_ID,
			S.First_name,
			S.Last_name,
			P.Program_name,
			P.Tuition_fee - (P.Tuition_fee * (IFNULL(S.Scholarship, 0) / 100)) AS Amount_to_Pay,
			S.Payment_status
		FROM 
			Students S
		JOIN 
			Programs P ON S.Program_ID = P.Program_ID
		WHERE 
			S.Student_ID = studentID;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `StudentsEnrolledInProgramsTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `StudentsEnrolledInProgramsTable`()
BEGIN
    SELECT P.Program_name, COUNT(S.Student_ID) AS Enrolled_Students
    FROM Programs P
    LEFT JOIN Students S ON P.Program_ID = S.Program_ID
    GROUP BY P.Program_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `StudentsInCourse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `StudentsInCourse`(IN courseCode VARCHAR(7), IN academicYear INT)
BEGIN
    SELECT s.First_name, s.Last_name
    FROM Students s
    JOIN Participants p ON s.Student_ID = p.Student_ID
    WHERE p.Course_Code = courseCode AND p.Academic_year = academicYear;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `StudentUniversityYear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `StudentUniversityYear`(
    IN studentID INT
)
BEGIN
    DECLARE studentExists INT;
    SELECT COUNT(*) INTO studentExists FROM Students WHERE Student_ID = studentID;

    IF studentExists = 0 THEN
        SELECT 'Student does not exist.' AS Message;
    ELSE
        SELECT 
            S.First_name,
            S.Last_name,
            TIMESTAMPDIFF(YEAR, S.Registration_date, CURDATE()) + 1 AS Years_of_Study
        FROM 
            Students S
        WHERE 
            S.Student_ID = studentID;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TopStudentInProgram` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TopStudentInProgram`(IN programID INT)
BEGIN
    SELECT 
        S.Student_ID,
        S.First_name,
        S.Last_name,
        ROUND((SUM(CourseGrades.Final_Grade * Courses.Course_credit) / SUM(Courses.Course_credit)) / 25, 2) AS CGPA
    FROM 
        Students S
    JOIN 
        Student_Assignments SA ON SA.Student_ID = S.Student_ID
    JOIN 
        Assignments ASG ON SA.Course_Code = ASG.Course_Code 
                        AND SA.Academic_year = ASG.Academic_year 
                        AND SA.Assignment_type = ASG.Assignment_type
    JOIN 
        Courses ON Courses.Course_Code = SA.Course_Code
    WHERE 
        S.Program_ID = programID
    GROUP BY 
        S.Student_ID, S.First_name, S.Last_name
    ORDER BY 
        CGPA DESC
    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UniversityYearTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UniversityYearTable`()
BEGIN
SELECT 
    S.First_name,
    S.Last_name,
    TIMESTAMPDIFF(YEAR, S.Registration_date, CURDATE())+1 AS Years_of_Study
FROM 
    Students S;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateAttendance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateAttendance`(IN studentID INT, IN courseCode VARCHAR(7), IN academicYear INT, IN newAttendancePercent INT)
BEGIN
    UPDATE Participants
    SET Attendance_percent = newAttendancePercent
    WHERE Student_ID = studentID
    AND Course_Code = courseCode
    AND Academic_year = academicYear;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

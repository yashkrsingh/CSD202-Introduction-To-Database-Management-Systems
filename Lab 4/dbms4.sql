/*
Name		  : Yash Kumar Singh
Roll Number	  : 1310110373
Program Title : MySQL L4
*/


/* Problem 1 */

/* (a) */

DELIMITER //
CREATE PROCEDURE numberOfStudents(IN PARAM1 VARCHAR(6))
BEGIN
SELECT COUNT(*) FROM STUDENT WHERE courseID = PARAM1;
END
//
DELIMITER ;

CALL numberOfStudents('CSD101');
DROP PROCEDURE numberOfStudents;

/* (b) */

DELIMITER //
CREATE PROCEDURE facultyNames(IN PARAM1 CHAR(1))
BEGIN
SELECT DISTINCT facultyName FROM FACULTY WHERE facultyName LIKE CONCAT(PARAM1,'%');
END 
//
DELIMITER ;

CALL facultyNames('D');
DROP PROCEDURE facultyNames;

/* (c) */

DELIMITER //
CREATE PROCEDURE subjectExchange(IN PARAM1 VARCHAR(30), IN PARAM2 VARCHAR(30))
BEGIN
DECLARE A VARCHAR(6);
DECLARE B VARCHAR(6);
SELECT courseID INTO A FROM FACULTY WHERE facultyName = PARAM1;
SELECT courseID INTO B FROM FACULTY WHERE facultyName = PARAM2;
UPDATE FACULTY SET courseID = B WHERE facultyName = PARAM1;
UPDATE FACULTY SET courseID = A WHERE facultyName = PARAM2;
END 
//
DELIMITER ;

CALL subjectExchange('NIRMALA SHENOY','DIVYA LOHANI');
CALL subjectExchange('DIVYA LOHANI','NIRMALA SHENOY');
DROP PROCEDURE facultyNames;

/* (d) */

DELIMITER //
CREATE PROCEDURE standardDeviation()
BEGIN
SELECT STDDEV(studentCount) AS standardDeviation FROM (SELECT COUNT(*) AS studentCount FROM STUDENT GROUP BY courseID) AS TEMP;
END 
//
DELIMITER ;

CALL standardDeviation();
DROP PROCEDURE standardDeviation;











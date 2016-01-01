/*
Name		  : Yash Kumar Singh
Roll Number	  : 1310110373
Program Title : MySQL L3
*/


/* Problem 1 */

/* (a) */

SELECT courseName,studentName 
FROM STUDENT 
FULL JOIN COURSES;

/* (b) */

SELECT facultyQualification,courseName
FROM FACULTY 
INNER JOIN COURSES
ON COURSES.courseID = FACULTY.courseID;

/* (c) */

SELECT * FROM COURSES
LEFT JOIN STUDENT
ON COURSES.courseID = STUDENT.courseID;

/* Problem 2 */

/* (a) */

SELECT courseName,STUDENT.courseID
FROM STUDENT,COURSES
WHERE COURSES.courseID = STUDENT.courseID
GROUP BY (courseID)
HAVING COUNT(STUDENT.courseID) >= 1;

/* (b) */

SELECT courseName,STUDENT.courseID,COUNT(STUDENT.courseID) AS numberOfStudents
FROM STUDENT,COURSES
WHERE COURSES.courseID = STUDENT.courseID
GROUP BY (courseID)
HAVING numberOfStudents >= 1
ORDER BY numberOfStudents DESC;

/* (c) */

SELECT * 
FROM FACULTY
GROUP BY (facultyName)
HAVING COUNT(facultyName) = (SELECT MAX(A) FROM (SELECT COUNT(facultyName) AS A FROM FACULTY GROUP BY (facultyName)) AS TEMP);

/* (d) */

SELECT ROUND(AVG(A.NUMBER)) AS averageStudentsEnrolled FROM (SELECT COUNT(studentName) AS NUMBER FROM STUDENT GROUP BY courseID) AS A,STUDENT;
SELECT MAX(A.NUMBER) AS maximumStudentsEnrolled FROM (SELECT COUNT(studentName) AS NUMBER FROM STUDENT GROUP BY courseID) AS A,STUDENT;
SELECT MIN(A.NUMBER) AS minimumStudentsEnrolled FROM (SELECT COUNT(studentName) AS NUMBER FROM STUDENT GROUP BY courseID) AS A,STUDENT;

/* (e) */

SELECT SUM(studentYear) 
FROM STUDENT 
GROUP BY (studentMajor) 
HAVING studentMajor = 'MTECH';


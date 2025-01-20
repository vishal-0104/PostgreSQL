CREATE TABLE
CREATE TABLE
CREATE TABLE
CREATE TABLE

Q1: Create a stored procedure named EnrollStudent
Query: CREATE OR REPLACE PROCEDURE enroll_student (IN student_id int,IN course_id int, IN grade decimal(3,2)) LANGUAGE plpgsql AS $$
 BEGIN 
 IF EXISTS (SELECT 1 FROM enrollments WHERE StudentID = student_id AND CourseId = course_id)
 THEN
 IF grade IS NOT NULL THEN UPDATE enrollments SET Grade = grade WHERE StudentID = student_id AND CourseId = course_id;
 END IF; ELSE INSERT INTO enrollments (StudentID, CourseId, Grade) VALUES ( student_id, course_id, grade); END IF; 
 END; $$;

CREATE PROCEDURE

Query: call enroll_student(1,1,4.00);

CALL

Q3: Subquery

Query: select * from students where StudentID = (select StudentID from enrollments group by StudentID having count(CourseId) >= 3);

 studentid | firstname | lastname | enrollentdate | email 
-----------+-----------+----------+---------------+-------
(0 rows)


Query: select * from students where StudentID = (select StudentID from enrollments group by StudentID having avg(Grade) >= 8);

 studentid | firstname | lastname | enrollentdate | email 
-----------+-----------+----------+---------------+-------
(0 rows)

Q4: Indexing:

Query: create index idx_student_course on enrollments(StudentID,CourseId);

CREATE INDEX


Query: select * from enrollments where StudentID = 1 and CourseId = 1;

 enrollmentid | studentid | courseid | grade 
--------------+-----------+----------+-------
            2 |         1 |        1 |  4.00
(1 row)


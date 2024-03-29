use lauramahmoudhass;

CREATE TABLE PROGRAM (
	PROGRAMNAME VARCHAR(50) PRIMARY KEY,
    PROGRAMFACULTY VARCHAR(100),
    NUM_OF_STUDENTS INT
);

INSERT INTO PROGRAM (PROGRAMNAME, PROGRAMFACULTY, NUM_OF_STUDENTS)
VALUES
('MPAD', 'Public Affairs', 30),
('Journalism', 'Public Affairs', 500),
('Criminology', 'Social Sciences', 900),
('Gender Studies', 'Social Sciences', 10);

CREATE TABLE COURSE_NAME (
	COURSEID CHAR(8) PRIMARY KEY,
    COURSENAME VARCHAR(50),
    INSTITUTION CHAR(8)
);

INSERT INTO COURSE_NAME (COURSEID, COURSENAME, INSTITUTION)
VALUES
('MPAD2004', 'Writing', 'Carleton'),
('JOUR2001', 'Media Law', 'Carleton'),
('CRIM1001', 'Law', 'Carleton'),
('GEND3003', 'Protesting', 'Carleton');

CREATE TABLE STUDENT (
	STUDENTID INT PRIMARY KEY,
    NUMBER_OF_CLASSES INT,
    PROGRAMNAME VARCHAR(50),
    FOREIGN KEY (PROGRAMNAME) REFERENCES PROGRAM(PROGRAMNAME)
);

INSERT INTO STUDENT (STUDENTID, NUMBER_OF_CLASSES)
VALUES
(10001, 5),
(10345, 2),
(14670, 3),
(12345, 4);

CREATE TABLE PROF (
	PROFID INT PRIMARY KEY,
    PROFEMAIL VARCHAR(100),
    CONTRACTLENGTH INT,
    COURSEID CHAR(8),
    FOREIGN KEY (COURSEID) REFERENCES COURSE_NAME(COURSEID)
);

INSERT INTO PROF (PROFID, PROFEMAIL, CONTRACTLENGTH, COURSEID)
VALUES
(3568, 'jessy@cmail.ca', 1, 'MPAD2004'),
(2985, 'candice@cmail.ca', 10, 'JOUR2001'),
(9203, 'khalid@cmail.ca', 5, 'CRIM1001'),
(4915, 'mo@cmail.ca', 7, 'GEND3003');

CREATE TABLE TUTORIAL (
	TUTCODE INT PRIMARY KEY,
    NUM_OF_STUDENTS INT,
    BUILDING VARCHAR(20)
);

INSERT INTO TUTORIAL (TUTCODE, NUM_OF_STUDENTS, BUILDING)
VALUES
(289563, 20, 'AZRIELI'),
(287456, 27, 'SOUTHAM HALL'),
(109835, 33, 'RESIDENCE COMMONS'),
(387265, 16, 'UNIVERSITY CENTRE');

CREATE TABLE TA (
	TAID INT PRIMARY KEY,
    TAEMAIL VARCHAR(100),
    TUTCODE INT,
    COURSEID CHAR(8),
    FOREIGN KEY (TUTCODE) REFERENCES TUTORIAL(TUTCODE)
);

INSERT INTO TA (TAID, TAEMAIL, TUTCODE, COURSEID)
VALUES
(3985, 'john@cmail.ca', 289563, 'MPAD2004'),
(2908, 'mike@cmail.ca', 287456, 'JOUR2001'),
(2746, 'tyson@cmail.ca', 109835, 'CRIM1001'),
(1294, 'chris@cmail.ca', 387265, 'GEND3003');

CREATE TABLE PERSON (
	SIN INT PRIMARY KEY,
    FNAME VARCHAR(50),
    LNAME VARCHAR(100),
    MNAME VARCHAR(20),
    BDATE DATE,
    STUDENTID INT,
    PROFID INT,
    TAID INT,
    FOREIGN KEY (STUDENTID) REFERENCES STUDENT(STUDENTID),
    FOREIGN KEY (PROFID) REFERENCES PROF(PROFID),
    FOREIGN KEY (TAID) REFERENCES TA(TAID)
);

INSERT INTO PERSON (SIN, FNAME, LNAME, MNAME, BDATE, STUDENTID,PROFID, TAID)
VALUES 
(001, 'HERBERT', 'SMITH', 'ABACUS', '2000-01-02', 10001, NULL, NULL),
(010, 'SHAWN', 'JOHNSON', 'BAIRD', '2001-05-14', 10345, NULL, NULL),
(100, 'TAYLOR', 'DAVIS', 'HERON', '1999-10-28', 14670, NULL, NULL),
(201, 'BONNIE', 'MILLER', 'LONDON', '1998-12-25', 12345, NULL, NULL),
(202, 'JOHN', 'SAGE', 'BIRD', '1990-02-05', NULL, NULL, 3985),
(220, 'MIKE', 'WALKER', 'NIKE', '1989-03-01', NULL, NULL, 2908),
(223, 'TYSON', 'JACOBS', 'AK', '1991-06-23', NULL, NULL, 2746),
(345, 'CHRIS', 'MORRIS', 'MAKO', '1992-11-05', NULL, NULL, 1294),
(891, 'JESSY', 'WINSTON', 'FAITH', '1974-04-07', NULL, 3568, NULL),
(245, 'CANDICE', 'MOUF', 'DICKINSON', '1966-09-09', NULL, 2985, NULL),
(961, 'KHALID', 'FOX', 'JEAN', '1959-01-08', NULL, 9203, NULL),
(613, 'MO', 'BAMBA', 'REAL', '1968-07-06', NULL, 4915, NULL);

CREATE TABLE ADDRESS (
	POSTALCODE CHAR(3) PRIMARY KEY,
    CITY VARCHAR(20),
    STREETNAME VARCHAR(30),
    STREETNUMBER INT,
    SIN INT,
    FOREIGN KEY (SIN) REFERENCES PERSON(SIN)
);

INSERT INTO ADDRESS (POSTALCODE, CITY, STREETNAME, STREETNUMBER, SIN)
VALUES
('1K2', 'OTTAWA', 'ALBA ROAD', 13, 001),
('2N3', 'TORONTO', 'MERRY WAY', 49, 010),
('4P9', 'MONTREAL', 'REED AVENUE', 23, 100),
('2V7', 'EDMONTON', 'CHERRY ROAD', 184, 201),
('4G0', 'CALGARY', 'JAHSEH AVENUE', 69, 202),
('J7S', 'VICTORIA', 'LINCOLN STREET', 54, 220),
('9HT', 'YANKSVILLE', 'PUSHA PLACE', 25, 223),
('L0L', 'YURI', 'NEVERS ROAD', 68, 345),
('B4U', 'WACKI', 'WAYSIDE AVENUE', 14, 891),
('8SW', 'PEWDA', 'NOTUR ROAD', 8, 245),
('9ER', 'NASHTON', 'FILY WAY', 142, 961),
('0V0', 'PERTH', 'MARIOT ROAD', 166, 613);

CREATE TABLE POSTAL_CODE (
	SIN INT PRIMARY KEY,
    POSTALCODE CHAR(3),
    FOREIGN KEY (POSTALCODE) REFERENCES ADDRESS(POSTALCODE)
);

INSERT INTO POSTAL_CODE (SIN, POSTALCODE)
VALUES
(001, '1K2'),
(010, '2N3'),
(100, '4P9'),
(201, '2V7'),
(202, '4G0'),
(220, 'J7S'),
(223, '9HT'),
(345, 'L0L'),
(891, 'B4U'),
(245, '8SW'),
(961, '9ER'),
(613, '0V0');

CREATE TABLE STUDENT_PROGRESS (
	YEAR_STANDING INT PRIMARY KEY,
    STUDENTID INT,
    PROGRESS VARCHAR(10),
    FOREIGN KEY (STUDENTID) REFERENCES STUDENT(STUDENTID)
);

INSERT INTO STUDENT_PROGRESS (YEAR_STANDING, STUDENTID, PROGRESS)
VALUES
(2, 10001, 'UNDERGRAD'),
(5, 10345, 'POST-GRAD'),
(1, 14670, 'UNDERGRAD'),
(3, 12345, 'UNDERGRAD');

CREATE TABLE PROF_LOCATION (
	BUILDING VARCHAR(20) PRIMARY KEY,
    FLOOR INT,
    ROOMNUM INT,
    PROFID INT,
    FOREIGN KEY (PROFID) REFERENCES PROF(PROFID)
);

INSERT INTO PROF_LOCATION (BUILDING, FLOOR, ROOMNUM, PROFID)
VALUES
('STEACIE', 1, 333, 3568),
('RICHCRAFT', 4, 666, 2985),
('TORY', 3, 069, 9203),
('HERZBERG', 5, 420, 4915);

CREATE TABLE TUTORIAL_LOCATION (
	BUILDING VARCHAR(20) PRIMARY KEY,
    FLOOR INT,
    ROOMNUM INT,
    TUTCODE INT,
    FOREIGN KEY (TUTCODE) REFERENCES TUTORIAL(TUTCODE)
);

INSERT INTO TUTORIAL_LOCATION (BUILDING, FLOOR, ROOMNUM, TUTCODE)
VALUES
('AZRIELI', 2, 762, 289563),
('SOUTHAM HALL', 4, 987, 287456),
('RESIDENCE COMMONS', 1, 345, 109835),
('UNIVERSITY CENTRE', 5,  927, 387265);

CREATE TABLE ENROLLMENT_TYPE (
	PROGRAMNAME VARCHAR(50) PRIMARY KEY,
    STUDENTID INT,
    STUDENT_TYPE VARCHAR(30),
    FOREIGN KEY (STUDENTID) REFERENCES STUDENT(STUDENTID)
);

INSERT INTO ENROLLMENT_TYPE (PROGRAMNAME, STUDENTID, STUDENT_TYPE)
VALUES 
('MPAD', 10001, 'CANADIAN RESIDENT'),
('Journalism', 10345, 'INTERNATIONAL STUDENT'),
('Criminology', 14670,  'CANADIAN RESIDENT'),
('Gender Studies', 12345, 'INTERNATIONAL STUDENT');


CREATE TABLE MANDATORY_COURSE (
	PROGRAMNAME VARCHAR(50) PRIMARY KEY,
    MANDATORYCOURSE VARCHAR(50),
    COURSEID CHAR(8),
    FOREIGN KEY (COURSEID) REFERENCES COURSE_NAME(COURSEID)
);

INSERT INTO MANDATORY_COURSE (PROGRAMNAME, MANDATORYCOURSE, COURSEID)
VALUES
('MPAD', 'Writing', 'MPAD2004'),
('Journalism', 'Media Law', 'JOUR2001'),
('Crimonology', 'Law', 'CRIM1001'),
('Gender Studies', 'Protesting', 'GEND3003');

CREATE TABLE COURSE_LOCATION (
	BUILDING VARCHAR(20) PRIMARY KEY,
    FLOOR INT,
    ROOMNUM INT,
    COURSEID CHAR(8),
    FOREIGN KEY (COURSEID) REFERENCES COURSE_NAME(COURSEID)
);

INSERT INTO COURSE_LOCATION (BUILDING, FLOOR, ROOMNUM, COURSEID)
VALUES
('RICHCRAFT', 4, 444, 'MPAD2004'),
('AZRIELI', 3, 320, 'JOUR2001'),
('SOUTHAM', 2, 219, 'CRIM1001'),
('MACKENZIE', 1, 139, 'GEND3003');

CREATE TABLE GRADES (
	COURSEID CHAR(8) PRIMARY KEY,
    STUDENTID INT,
    GRADE CHAR(1),
    FOREIGN KEY (STUDENTID) REFERENCES STUDENT(STUDENTID)
);

INSERT INTO GRADES (COURSEID, STUDENTID, GRADE)
VALUES
('MPAD2004', 10001, 'C'),
('JOUR2001', 10345, 'A'),
('CRIM1001', 14670, 'D'),
('GEND3003', 12345, 'F');

/*Commands used are: CREATE TABLE and INSERT INTO*/
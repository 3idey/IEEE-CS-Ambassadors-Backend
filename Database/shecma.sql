-- Subjects
CREATE TABLE Subjects (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  description TEXT
);

-- Teachers
CREATE TABLE Teachers (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  hire_date DATE NOT NULL
);

-- TeacherSubject
CREATE TABLE TeacherSubject (
  teacher_id INT,
  subject_id INT,
  PRIMARY KEY (teacher_id, subject_id),
  FOREIGN KEY (teacher_id) REFERENCES Teachers(id),
  FOREIGN KEY (subject_id) REFERENCES Subjects(id)
);

-- Classes
CREATE TABLE Classes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  academic_year VARCHAR(20) NOT NULL
);

-- Students
CREATE TABLE Students (
  id INT PRIMARY KEY AUTO_INCREMENT,
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  date_birth DATE NOT NULL,
  class_id INT,
  FOREIGN KEY (class_id) REFERENCES Classes(id)
);

-- Enrollments
CREATE TABLE Enrollments (
  student_id INT,
  subject_id INT,
  grade DECIMAL(5,2),
  PRIMARY KEY (student_id, subject_id),
  FOREIGN KEY (student_id) REFERENCES Students(id),
  FOREIGN KEY (subject_id) REFERENCES Subjects(id)
);

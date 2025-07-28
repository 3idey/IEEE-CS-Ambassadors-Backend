-- Classes
INSERT INTO Classes (name, academic_year) VALUES
('Grade 10-A', '2024-2025'),
('Grade 10-B', '2024-2025'),
('Grade 11-A', '2024-2025'),
('Grade 11-B', '2024-2025'),
('Grade 12-A', '2024-2025');

-- Students
INSERT INTO Students (full_name, email, date_birth, class_id) VALUES
('Ali Mostafa', 'ali.mostafa@example.com', '2008-03-15', 1),
('Sara Adel', 'sara.adel@example.com', '2008-06-22', 2),
('Omar Hassan', 'omar.hassan@example.com', '2007-01-09', 3),
('Mona Sameh', 'mona.sameh@example.com', '2007-11-30', 4),
('Hana Ahmed', 'hana.ahmed@example.com', '2006-07-25', 5);

-- Subjects
INSERT INTO Subjects (name, description) VALUES
('Math', 'Mathematics core course'),
('English', 'English language and literature'),
('Science', 'General science course'),
('History', 'World history and civilizations'),
('Computer', 'Basics of computer science');

-- Teachers
INSERT INTO Teachers (name, email, hire_date) VALUES
('Mr. Tarek Youssef', 'tarek@example.com', '2018-09-01'),
('Ms. Dina Fathy', 'dina@example.com', '2019-02-15'),
('Mr. Hany Magdy', 'hany@example.com', '2020-08-20'),
('Ms. Rana Samir', 'rana@example.com', '2017-11-10'),
('Mr. Amr Khaled', 'amr@example.com', '2021-03-03');

-- TeacherSubject
INSERT INTO TeacherSubject (teacher_id, subject_id) VALUES
(1, 1), -- Mr. Tarek teaches Math
(2, 2), -- Ms. Dina teaches English
(3, 3), -- Mr. Hany teaches Science
(4, 4), -- Ms. Rana teaches History
(5, 5); -- Mr. Amr teaches Computer

-- Enrollments
INSERT INTO Enrollments (student_id, subject_id, grade) VALUES
(1, 1, 88.5),
(1, 2, 75.0),
(2, 1, 92.0),
(2, 3, 81.0),
(3, 2, 79.5),
(3, 4, 85.0),
(4, 5, 91.5),
(5, 1, 87.0),
(5, 3, 89.5),
(5, 5, 93.0);

-- Select all students with their class names

SELECT 
  s.full_name AS student_name,
  c.name AS class_name,
  c.academic_year
FROM Students s
JOIN Classes c ON s.class_id = c.id;

-- Select all students enrolled in a specific subject (using JOIN)

SELECT 
  s.full_name AS student_name,
  sub.name AS subject_name
FROM Enrollments e
JOIN Students s ON e.student_id = s.id
JOIN Subjects sub ON e.subject_id = sub.id
WHERE sub.name = 'Math';

-- Select the grades of all students in a specific subject

SELECT 
  s.full_name AS student_name,
  sub.name AS subject_name,
  e.grade
FROM Enrollments e
JOIN Students s ON e.student_id = s.id
JOIN Subjects sub ON e.subject_id = sub.id
WHERE sub.name = 'Math';

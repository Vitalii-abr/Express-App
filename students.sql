--творення таблиці
CREATE TAB
id SERIAL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
birthday DATE NOT NULL,
phone_number CHAR(13) UNIQUE,
"group" VARCHAR(20) NOT NULL,
avg_mark NUMERIC(4,2) NOT NULL CHECK (avg_mark >= 0 AND avg_mark <= 100),
gender VARCHAR(10) NOT NULL CHECK (gender IN ('male', 'female')),
entered_at INTEGER NOT NULL CHECK (entered_at >= 2000 AND entered_at <= EXTRACT(YEAR FROM CURRENT_DATE)),
department VARCHAR(100) NOT NULL
);

DROP TABLE students;
--заповнення таблиці
INSERT INTO students
(id, first_name, last_name, birthday, phone_number, "group", avg_mark, gender, entered_at, department)
VALUES
(0, 'Petro', 'Petrenko', '2020-05-12', '+380501112233', 'CS-101', 87.50, 'male', 2025, 'Computer Science'),
(2, 'Olena', 'Petrenko', '2021-05-12', '+380661112233', 'CS-100', 87.60, 'female', 2025, 'Computer'),
(3, 'Oleg', 'Olegov', '2019-05-12', '+380951112233', 'CS-100', 87.50, 'male', 2025, 'Computer' ),
(4, 'Anna', 'Petrenko', '2020-05-12', '+380961112233', 'CS-100', 87.70, 'female', 2025, 'Computer');

--перевірка структкри таблиці
SELECT column_name, data_type,is_nullable
FROM information_schema.COLUMNS
WHERE table_name = 'students';

--перевірка ключа
INSERT INTO students
(id, first_name, last_name, birthday, phone_number, "group", avg_mark, gender, entered_at, department)
VALUES
( 'Petro', 'Petrenko', '2020-05-12', '+380501112233', 'CS-101', 87.50, 'male', 2025, 'Computer Science'),
( 'Olena', 'Petrenko', '2021-05-12', '+380661112233', 'CS-100', 87.60, 'female', 2025, 'Computer'),
(1, 'Oleg', 'Olegov', '2019-05-12', '+380951112233', 'CS-100', 87.50, 'male', 2025, 'Computer' ),
(1, 'Anna', 'Petrenko', '2020-05-12', '+380961112233', 'CS-100', 87.70, 'female', 2025, 'Computer');


TRUNCATE students RESTART IDENTITY;

SELECT * FROM students;

INSERT INTO students
(id, first_name, last_name, birthday, phone_number, "group", avg_mark, gender, entered_at, department)
VALUES
(1, 'Petro', 'Petrenko', '2020-05-12', '+380501112233', 'CS-101', 87.50, 'male', 2025, 'Computer Science'),
(1, 'Olena', 'Petrenko', '2021-05-12', '+380661112233', 'CS-100', 87.60, 'female', 2025, 'Computer');


INSERT INTO students
(first_name, last_name, birthday, phone_number, "group", avg_mark, gender, entered_at, department)
VALUES
( 'Petro', 'Petrenko', '2020-05-12', '+380501112233', 'CS-101', 87.50, 'male', 2025, 'Computer Science'),
( 'Olena', 'Petrenko', '2021-05-12', '+380661112233', 'CS-100', 87.60, 'female', 2025, 'Computer');

UPDATE students
SET avg_mark = 10
WHERE id = 1;
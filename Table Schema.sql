CREATE TABLE Departments (
    dept_no VARCHAR NOT NULL,
    dept_name VARCHAR NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE Titles (
    title_id VARCHAR NOT NULL,
    title VARCHAR NOT NULL,
    PRIMARY KEY (title_id)
);

CREATE TABLE Employees (
    emp_no VARCHAR NOT NULL,
    emp_title VARCHAR NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR NOT NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title) REFERENCES Titles(title_id)
);

CREATE TABLE DepartmentEmployees (
    emp_no VARCHAR NOT NULL,
    dept_no VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

CREATE TABLE DepartmentManager (
    dept_no VARCHAR NOT NULL,
    emp_no VARCHAR NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE Salaries (
    emp_no VARCHAR NOT NULL,
    salary MONEY NOT NULL,
	FOREIGN KEY (emp_NO) REFERENCES Employees(emp_no)
);
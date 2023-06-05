CREATE TABLE "Department" (
    "dep_no" varchar(10)   NOT NULL,
    "dep_name" varchar(255)   NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "dep_no"
     ),
    CONSTRAINT "uc_Department_dep_name" UNIQUE (
        "dep_name"
    )
);

CREATE TABLE "Title" (
    "title_id" varchar(10)   NOT NULL,
    "title" varchar   NOT NULL,
    CONSTRAINT "pk_Title" PRIMARY KEY (
        "title_id"
     ),
    CONSTRAINT "uc_Title_title" UNIQUE (
        "title"
    )
);

CREATE TABLE "Employee" (
    "emp_no" int   NOT NULL,
    "emp_title" varchar(10)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "sex" varchar   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employee" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Dep_Emp" (
    "emp_no" int   NOT NULL,
    "dep_no" varchar(10)   NOT NULL,
    CONSTRAINT "pk_Dep_Emp" PRIMARY KEY (
        "emp_no","dep_no"
     )
);

CREATE TABLE "Dep_Manager" (
    "dep_no" varchar(10)   NOT NULL,
    "emp_no" int   NOT NULL,
    CONSTRAINT "pk_Dep_Manager" PRIMARY KEY (
        "dep_no","emp_no"
     )
);

CREATE TABLE "Salary" (
    "emp_no" int   NOT NULL,
    "salary" float   NOT NULL,

    CONSTRAINT "uc_Salary_emp_no" UNIQUE (
        "emp_no"
    )
);

ALTER TABLE "Employee" ADD CONSTRAINT "fk_Employee_emp_title" FOREIGN KEY("emp_title")
REFERENCES "Title" ("title_id");

ALTER TABLE "Dep_Emp" ADD CONSTRAINT "fk_Dep_Emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("emp_no");

ALTER TABLE "Dep_Emp" ADD CONSTRAINT "fk_Dep_Emp_dep_no" FOREIGN KEY("dep_no")
REFERENCES "Department" ("dep_no");

ALTER TABLE "Dep_Manager" ADD CONSTRAINT "fk_Dep_Manager_dep_no" FOREIGN KEY("dep_no")
REFERENCES "Department" ("dep_no");

ALTER TABLE "Dep_Manager" ADD CONSTRAINT "fk_Dep_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("emp_no");

ALTER TABLE "Salary" ADD CONSTRAINT "fk_Salary_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("emp_no");


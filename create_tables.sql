USE practicaSQL;

CREATE TABLE Company(
    PK_CompanyID INT IDENTITY(1,1),
    Names VARCHAR (150) UNIQUE,
    Adress TEXT,
    PRIMARY KEY (PK_CompanyID)
);


CREATE TABLE "Status"(
    PK_StatusID INT IDENTITY(1,1),
    Names VARCHAR (50),
    PRIMARY KEY (PK_StatusID)
);

CREATE TABLE Projects(
    PK_ProjectsID INT IDENTITY(1,1),
    Names VARCHAR (150),
    StartDate DATE,
    DeadLine DATE,
    FinishedOn DATE,
    FK_StatusID INT,
    PRIMARY KEY (PK_ProjectsID),
    CONSTRAINT Projects_Status FOREIGN KEY (FK_StatusID) REFERENCES "Status"(PK_StatusID)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Employees(
    PK_EmployeesID INT IDENTITY(1,1),
    FirstName VARCHAR (50),
    LastName VARCHAR (50),
    Email VARCHAR (100),
    Phone VARCHAR (12),
    Salary FLOAT,
    PRIMARY KEY (PK_EmployeesID)
);
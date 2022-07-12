USE practicaSQL;

ALTER TABLE Employees ADD FK_CompanyID INT;

ALTER TABLE Employees
ADD CONSTRAINT Employees_Company FOREIGN KEY (FK_CompanyID)
REFERENCES Company(PK_CompanyID)
ON DELETE CASCADE
ON UPDATE CASCADE;


CREATE TABLE Employees_Projects(
    PK_Employee_ProjectsID INT IDENTITY(1,1),
	FK_EmployeesID INT,
	FK_ProjectsID INT,
    PRIMARY KEY (PK_Employee_ProjectsID),
	CONSTRAINT Employee_Projects FOREIGN KEY (FK_EmployeesID) REFERENCES Employees (PK_EmployeesID)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
	CONSTRAINT Projects_Employee FOREIGN KEY (FK_ProjectsID) REFERENCES Projects (PK_ProjectsID)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);

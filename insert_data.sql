
USE practicaSQL;

INSERT INTO "Status" (Names) VALUES ('Pendiente');
INSERT INTO "Status" (Names) VALUES ('En proceso');
INSERT INTO "Status" (Names) VALUES ('Cancelado');
INSERT INTO "Status" (Names) VALUES ('Finalizado');
INSERT INTO "Status" (Names) VALUES ('En Pausa');
SELECT * FROM "Status";

INSERT INTO Company (Names, Adress) VALUES ('IMC','5151 W 29th St #2201 Greeley, Colorado(CO), 80634');
INSERT INTO Company (Names, Adress) VALUES ('Atoz','2007 Ardmore Hwy Ardmore, Tennessee(TN), 38449');
INSERT INTO Company (Names, Adress) VALUES ('Disnei','4226 Highgate Dr Horn Lake, Mississippi(MS), 38637');
SELECT * FROM Company;

INSERT INTO Projects (Names, StartDate, DeadLine, FK_StatusID) VALUES ('Dainler Learning', '2/7/1995', '2/22/2050', 2);
INSERT INTO Projects (Names, StartDate, DeadLine, FK_StatusID) VALUES ('Provident Software', '9/15/2022', '2/28/2023', 1);
INSERT INTO Projects (Names, StartDate, DeadLine, FK_StatusID) VALUES ('DataAnlysis', '1/31/2023 ', '10/5/2023', 1);
INSERT INTO Projects (Names) VALUES ('SoftCentral');
INSERT INTO Projects (Names, StartDate, DeadLine, FinishedOn, FK_StatusID) VALUES ('Migration', '5/2/2021', '7/25/2022', '1/1/2022', 4);
INSERT INTO Projects (Names, StartDate, DeadLine, FK_StatusID) VALUES ('Atoz Insight', '12/30/2022', '10/1/2024', 3);
SELECT * FROM projects;
SELECT * FROM "Status";

INSERT INTO Employees (FirstName, LastName, Email, Phone, Salary) VALUES ('Juan', 'Perez', 'juan@jmail.com', '9991808182', 9500);
INSERT INTO Employees (FirstName, LastName, Email, Phone, Salary) VALUES ('Paco', 'Ochoe', 'paco@jmail.com', '9991808183', 800);
INSERT INTO Employees (FirstName, LastName, Email, Phone, Salary) VALUES ('Pedro', 'Fernandez', 'pedro@jmail.com', '9991808184', 12500);
INSERT INTO Employees (FirstName, LastName, Email, Phone, Salary) VALUES ('Sofi', 'Hernandez', 'sofi@jmail.com', '9991808185', 11000);
INSERT INTO Employees (FirstName, LastName, Email, Phone, Salary) VALUES ('Isabella', 'Smith', 'isabella@jmail.com', '9991808186', 9000);
INSERT INTO Employees (FirstName, LastName, Email, Phone, Salary) VALUES ('Eduardo', 'Jimenez', 'eduardo@jmail.com', '9991808187', 11000);
INSERT INTO Employees (FirstName, LastName, Email, Phone, Salary) VALUES ('Jose', 'Pavon', 'jose@jmail.com', '9991808188', 12000);
INSERT INTO Employees (FirstName, LastName, Email, Phone, Salary) VALUES ('Pancho', 'Fernandez', 'pancho@jmail.com', '9991808189', 12500);
INSERT INTO Employees (FirstName, LastName, Email, Phone, Salary) VALUES ('Francisco', 'Fernandez', 'francisco@jmail.com', '9991808190', 25000);
INSERT INTO Employees (FirstName, LastName, Email, Phone, Salary) VALUES ('Diego', 'Olivarez', 'diego@jmail.com', '9991808191', 9000);
SELECT * FROM Employees;
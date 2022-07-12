use practicaSQL;

/*4.1*/
SELECT Names FROM Company;

/*4.2*/
SELECT FirstName, LastName FROM Employees;

/*
SELECT * FROM Projects left join "Status" ON FK_StatusID=PK_StatusID;
*/

/*4.3*/
SELECT Names FROM Projects WHERE FinishedOn < DeadLine;

/*4.4*/
SELECT P.Names FROM Projects P left join "Status" S ON FK_StatusID=PK_StatusID where S.Names='Pendiente' AND StartDate>GETDATE();

/*4.5*/
SELECT FirstName, LastName FROM Employees WHERE Salary>10000;

/*4.6*/
SELECT E.FirstName, E.LastName, C.Names FROM Employees E LEFT JOIN Company C ON FK_CompanyID=PK_CompanyID WHERE C.Names='Atoz';

/*4.7*/
SELECT E.FirstName, E.LastName, C.Names FROM Employees E LEFT JOIN Company C ON FK_CompanyID=PK_CompanyID WHERE C.Names!='Disnei';

/*4.8*/
SELECT E.FirstName, E.LastName, C.Names FROM Employees E LEFT JOIN Company C ON FK_CompanyID=PK_CompanyID ORDER BY C.Names, E.LastName;

/*4.9*/
--SELECT * FROM Projects P left join "Status" S ON FK_StatusID=PK_StatusID;
--SELECT * FROM Projects;
--SELECT * FROM Employees_Projects;
--SELECT * FROM Projects P left join "Status" S ON FK_StatusID=PK_StatusID where S.Names='En Proceso';
--INSERT INTO Employees_Projects (FK_EmployeesID, FK_ProjectsID) VALUES (1,1);
--INSERT INTO Employees_Projects (FK_EmployeesID, FK_ProjectsID) VALUES (1,1);
--INSERT INTO Employees_Projects (FK_EmployeesID, FK_ProjectsID) VALUES (3,5);
--DELETE FROM Employees WHERE PK_EmployeesID=2;

SELECT E.FirstName, E.LastName, S.Names FROM Employees E LEFT JOIN Employees_Projects EP ON FK_EmployeesID=PK_EmployeesID LEFT JOIN Projects P ON FK_ProjectsID=PK_ProjectsID left join "Status" S ON FK_StatusID=PK_StatusID  WHERE S.Names='En Proceso';

/*4.10*/
SELECT E.FirstName, E.LastName, S.Names FROM Employees E LEFT JOIN Employees_Projects EP ON FK_EmployeesID=PK_EmployeesID LEFT JOIN Projects P ON FK_ProjectsID=PK_ProjectsID left join "Status" S ON FK_StatusID=PK_StatusID WHERE S.Names!='En Proceso' AND S.Names!='Pendiente';
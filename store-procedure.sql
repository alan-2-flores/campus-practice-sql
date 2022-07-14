USE practicaSQL
GO

ALTER PROCEDURE assignCompanyProject(@CompanyName varchar(150), @ProjectName varchar(150))
	AS
		DECLARE
		@CompanyID int = (SELECT PK_CompanyID FROM Company WHERE Names=@CompanyName),
		@ProjectID int = (SELECT PK_ProjectsID FROM Projects WHERE Names=@ProjectName),
		@EmployeeID int,
		@EmployeeName varchar(150);

		DECLARE Company_Cursor CURSOR FOR
		SELECT DISTINCT PK_EmployeesID, FirstName FROM Employees INNER JOIN Company ON FK_CompanyID=PK_CompanyID WHERE PK_CompanyID=@CompanyID;
			OPEN Company_Cursor
				FETCH NEXT From Company_Cursor INTO @EmployeeID, @EmployeeName;
				 WHILE @@FETCH_STATUS = 0
					BEGIN
						IF(dbo.HasAnyProject(@EmployeeName)=1)
							BEGIN
								DELETE FROM Employees_Projects WHERE FK_EmployeesID = @EmployeeID;
								INSERT INTO Employees_Projects (FK_EmployeesID, FK_ProjectsID) VALUES (@EmployeeID, @ProjectID);
							END
						ELSE 
							INSERT INTO Employees_Projects (FK_EmployeesID, FK_ProjectsID) VALUES (@EmployeeID, @ProjectID); 
					FETCH NEXT FROM Company_Cursor INTO @EmployeeID, @EmployeeName;
					END
			CLOSE Company_Cursor
			DEALLOCATE Company_Cursor
GO

EXEC assignCompanyProject 'Disnei','Migration';
GO
use practicaSQL
go

CREATE FUNCTION GetLastProjetIdByEmployeeName 
(
	@EmployeeName VARCHAR(50)
)
RETURNS INT
AS
BEGIN
	-- Declare the return variable here
	-- Return the result of the function
	RETURN (select TOP(1) FK_ProjectsID from Employees left join Employees_Projects on FK_EmployeesID=PK_EmployeesID WHERE FirstName=@EmployeeName ORDER BY FK_ProjectsID DESC)
END
GO

CREATE FUNCTION HasAnyProject 
(
	@EmployeeName VARCHAR(50)
)
RETURNS INT
AS
BEGIN
	-- Declare the return variable here
	DECLARE
	@hasAny BIT,
	@COUNT INT = (SELECT COUNT(FK_ProjectsID) from Employees left join Employees_Projects on FK_EmployeesID=PK_EmployeesID WHERE FirstName=@EmployeeName)
	-- Return the result of the function
	IF(@COUNT>=1)
		RETURN 1
	RETURN 0
END
GO


select FirstName, FK_ProjectsID from Employees left join Employees_Projects on FK_EmployeesID=PK_EmployeesID;
SELECT dbo.GetLastProjetIdByEmployeeName('Sofi');
SELECT dbo.HasAnyProject('Juan');
SELECT dbo.HasAnyProject('Pedro');

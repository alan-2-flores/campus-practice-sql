-- SQL Server Syntax  
-- Trigger on an INSERT, UPDATE, or DELETE statement to a table or view (DML Trigger)  

USE practicaSQL
GO

CREATE TRIGGER TR_projectStartDead
ON Projects
INSTEAD OF INSERT
AS
BEGIN
	DECLARE
		@Names varchar(150),
		@StartDate date,
		@DeadLine date,
		@FinishedOn date
	SELECT @StartDate= INSERTED.[StartDate],
		   @DeadLine= INSERTED.[DeadLine]
		   FROM INSERTED
		IF (@StartDate>@DeadLine)
			PRINT('La fecha limite es menor que la fecha de inicio')
		ELSE
			INSERT INTO Projects(
				[Names], [StartDate], [DeadLine], [FinishedOn])
			VALUES(@Names, @StartDate, @DeadLine, @FinishedOn)
END

INSERT INTO Projects (Names, StartDate, DeadLine) VALUES ('Prueba', '7/12/2022', '7/11/2022');

SELECT * FROM Projects;
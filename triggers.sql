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
	SELECT @Names= INSERTED.[Names],
		   @StartDate= INSERTED.[StartDate],
		   @DeadLine= INSERTED.[DeadLine],
		   @FinishedOn= INSERTED.[FinishedOn]
		   FROM INSERTED
		IF (@StartDate>@DeadLine)
			PRINT('La fecha limite es menor que la fecha de inicio')
		ELSE
			INSERT INTO Projects(
				[Names], [StartDate], [DeadLine], [FinishedOn])
			VALUES(@Names, @StartDate, @DeadLine, @FinishedOn)
END

CREATE TRIGGER TR_projectStatus
ON Projects
FOR INSERT
AS
BEGIN
	DECLARE
		@Names varchar(150),
		@StartDate date,
		@DeadLine date,
		@FinishedOn date
	SELECT @Names= INSERTED.[Names],
		   @StartDate= INSERTED.[StartDate],
		   @DeadLine= INSERTED.[DeadLine],
		   @FinishedOn= INSERTED.[FinishedOn]
		   FROM INSERTED
		IF (@StartDate>GETDATE())
			BEGIN
				ROLLBACK;
				INSERT INTO Projects(
				[Names], [StartDate], [DeadLine], [FinishedOn], FK_StatusID)
				VALUES(@Names, @StartDate, @DeadLine, @FinishedOn,1)
			END
		ELSE
			BEGIN
				ROLLBACK;
				INSERT INTO Projects(
				[Names], [StartDate], [DeadLine], [FinishedOn], FK_StatusID)
				VALUES(@Names, @StartDate, @DeadLine, @FinishedOn,2)
			END
END

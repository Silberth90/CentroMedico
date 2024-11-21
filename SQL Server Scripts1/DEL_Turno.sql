
--EXEC DEL_Turno 6

/*
SELECT * FROM Turno
SELECT * FROM TurnoPaciente
*/

ALTER PROC DEL_Turno(@idTurno Turno)

AS

SET NOCOUNT ON

IF EXISTS(SELECT* FROM Turno
						WHERE idTurno = @idTurno)
BEGIN
	DELETE FROM TurnoPaciente WHERE idTurno = @idTurno
	DELETE FROM Turno WHERE idTurno = @idTurno
END
ELSE
	SELECT 0 AS RESULTADO
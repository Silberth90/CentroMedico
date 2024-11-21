

/*
SELECT * FROM Turno
SELECT * FROM TurnoPaciente

*/
--agrega los valores al tabla turno
--EXEC UPD_Turno 4,1,'el paciente a sido atendido'

ALTER PROC UPD_Turno(
				@idTurno turno,
				@estado tinyint,
				@odservacion odservacion)
AS
SET NOCOUNT ON

IF EXISTS (SELECT * FROM Turno
			WHERE idTurno = @idTurno)
	UPDATE Turno SET estado = @estado,
					odservacion = @odservacion
-- NUNCA OLVIDAR LA CLAUSULA WHERE 
	WHERE idTurno = @idTurno
ELSE
	SELECT 0 AS RESULTADO
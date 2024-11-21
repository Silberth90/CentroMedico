--EXEC SELECT_TurnosPaciente 4

CREATE PROC SELECT_TurnosPaciente(
				@idPaciente paciente
				)
AS
SET  NOCOUNT ON
/*
SELECT * FROM Turno
SELECT * FROM TurnoPaciente
SELECT * FROM MedicoEspecialidad
INSERT INTO MedicoEspecialidad VALUES (2,3,'Medico Clinico')
*/
-- para retornar los turnos de un paciente
SELECT * FROM paciente P
INNER JOIN TurnoPaciente TP
ON TP.idPaciente = P.IdPaciente
INNER JOIN  Turno T
ON T.idTurno =  TP.idTurno
INNER JOIN MedicoEspecialidad M
ON M.idMedico = TP.idMedico
WHERE P.IdPaciente = @idPaciente



--SELECT * FROM PacienteTurnosPendientes
--SELECT * FROM vistaprueba
--guarda consultas especificas

CREATE VIEW PacienteTurnosPendientes AS

SELECT p.IdPaciente, p.nombre, p.Apellido,T.idTurno,T.estado
FROM paciente P
	INNER JOIN TurnoPaciente TP
	ON TP.idPaciente = P.IdPaciente
	INNER JOIN Turno T
	ON T.idTurno = TP.idTurno
WHERE  ISNULL (T.estado ,0) = 1
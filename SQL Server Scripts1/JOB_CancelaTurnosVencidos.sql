

USE CentroMedico
GO
UPDATE turno SET estado = 2 
WHERE CONVERT(CHAR(8),FechaTurno,112) < CONVERT(CHAR(8),GETDATE(),112)
AND estado = 1


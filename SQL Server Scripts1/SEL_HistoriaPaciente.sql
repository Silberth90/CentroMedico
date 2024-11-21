EXEC SEL_HistoriaPaciente 6

CREATE PROC SEL_HistoriaPaciente(
				@idpaciente paciente)
AS
SET NOCOUNT ON
/*
SELECT * FROM historia
SELECT * FROM HistoriaPaciente
*/
IF EXISTS(SELECT * FROM paciente P
					INNER JOIN HistoriaPaciente HP
					ON HP.idPaciente = P.IdPaciente
					INNER JOIN historia H
					ON H.idHistoria = HP.IdHistoria
					INNER JOIN MedicoEspecialidad ME
					ON ME.idMedico = HP.idMedico
					INNER JOIN Medico M
					ON M.idMedico = ME.idMedico
					WHERE P.IdPaciente = @idpaciente)
	SELECT * FROM paciente P
	INNER JOIN HistoriaPaciente HP
	ON HP.idPaciente = P.IdPaciente
	INNER JOIN historia H
	ON H.idHistoria = HP.IdHistoria
	INNER JOIN MedicoEspecialidad ME
	ON ME.idMedico = HP.idMedico
	INNER JOIN Medico M
	ON M.idMedico = ME.idMedico
	WHERE P.IdPaciente = @idpaciente

ELSE
	--PRINT 'NO EXISTE  HISTORIAS  CLINICAS  PARA EL PACIENTE'
	SELECT 0 AS RESULTADO
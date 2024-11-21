/*
SELECT * FROM Paciente
*/

--EXEC UPD_Paciente 4,'jean','Darros','Montes 435','jeand@gmail.com'

ALTER PROC UPD_Paciente(
						@idpaciente paciente,
						@nombre varchar(50),
						@apellido varchar(50),
						@domicilio varchar(50),
						@email varchar(30))
AS

SET NOCOUNT ON

IF EXISTS(SELECT * FROM paciente
				WHERE IdPaciente = @idpaciente)
		UPDATE Paciente SET Nombre = @nombre,
							Apellido = @apellido,
							Domicilio = @domicilio,
							Email = @email
				WHERE IdPaciente = @idpaciente
ELSE
	SELECT 0 AS RESULTADO
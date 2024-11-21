
SELECT * FROM PacienteLog
--CREA UNA TRIGGER CUANDO UN PACIENTE SE AGREGA DE LA SECCION EN IDPAIS = MEX
CREATE TRIGGER PacientesCreados ON Paciente
AFTER INSERT
AS

IF (SELECT idpais FROM inserted) = 'MEX'
	INSERT INTO PacienteLog (idpaciente,idpais,fechaAlta)
		SELECT i.idpaciente,i.IdPais,GETDATE() FROM inserted i

--modifica e imprime la fecha actualizada
ALTER TABLE PacienteLog ADD fechaModificacion DATETIME
SELECT * FROM PacienteLog

--modifica automáticamente después de que se realiza una actualización en la tabla Paciente
CREATE TRIGGER PacientesModificados ON Paciente
AFTER UPDATE
AS
IF EXISTS (SELECT idpaciente FROM PacienteLog
			WHERE idpaciente = (SELECT idpaciente FROM inserted))

	UPDATE PacienteLog SET fechaModificacion = GETDATE()
		WHERE idpaciente = (SELECT idpaciente FROM inserted)
ELSE
	INSERT INTO PacienteLog (idpaciente,idpais,fechaModificacion)
	SELECT idPaciente,idpais,GETDATE() FROM inserted

--BUSCA EN LA TABLA PACIENTE ID = 7
SELECT * FROM paciente WHERE IdPaciente = 7

--ACTUALIZA LA TABLA ID = 7 
UPDATE paciente SET Nombre = 'Marcela Lorena' WHERE IdPaciente = 7

--TRIGGER DEL TIPO DELETE
CREATE TRIGGER PacientesEliminados ON PacienteLog
FOR DELETE
AS
IF EXISTS (SELECT idpaciente FROM pacienteLog
				WHERE idpaciente = (SELECT idpaciente FROM deleted))

		UPDATE pacienteLog SET fechabaja = GETDATE()
			WHERE IdPaciente = (SELECT IdPaciente FROM deleted)
ELSE
	INSERT INTO pacienteLog (idpaciente,idpais,fechabaja)
	SELECT idPaciente,idpais,GETDATE() FROM deleted


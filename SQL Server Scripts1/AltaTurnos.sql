/*
SELECT * FROM Turno
SELECT * FROM TurnoPaciente
select * from paciente
INSERT INTO medico VALUES (2,'pablo','Ramirez')
*/

EXEC AltaTurnos '20190420 09:15',8,2,'nada'

ALTER PROC AltaTurnos(
			@fechaTurno char(14), --20190215 12:00
			@idpaciente paciente,
			@idmedico medico,
			@Odservacion Odservacion=''
			)

AS

/*
ESTADO = 0 (PENDIENTE)
ESTADO = 1 (REALIZADO)
ESTADO = 2 (CANCELADO)
*/
set nocount on

IF NOT EXISTS(SELECT TOP 1 idTurno FROM Turno WHERE fecha = @fecha)
BEGIN
	INSERT INTO Turno(fecha,estado,odservacion)
	VALUES(@fecha,0,@Odservacion)

	DECLARE @auxidTurno Turno
	SET @auxidTurno = @@IDENTITY

	INSERT INTO TurnoPaciente(idTurno,idPaciente,idMedico)
	VALUES (@auxidTurno,@idpaciente,@idmedico)

	print'el turno se agruego correctamente'
	RETURN
END
ELSE
BEGIN

PRINT 'EL turno YA EXISTE'
RETURN
END
go 

EXEC AltaTurnos '20190218 08:15',1,2,'el paciente tiene que estar en ayudas'

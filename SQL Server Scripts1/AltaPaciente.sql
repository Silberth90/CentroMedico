--SELECT * FROM Paciente

--EXEC AltaPaciente '77673324','jorge','lopez','20180518','calle1','MEX','','jorgelopez@gmail.com',''

ALTER PROC AltaPaciente(
			@dni varchar(20),
			@nombre varchar(50),
			@Apellido varchar (50),
			@fnacimiento varchar(8),
			@Domicilio varchar(50),
			@IdPais char(3),
			@telefono varchar(20)='',
			@Email varchar(30),
			@Odservacion Odservacion=''
			)

AS

IF NOT EXISTS(SELECT * FROM paciente WHERE dni = @dni)
BEGIN
	INSERT INTO paciente (dni,nombre,Apellido,fnacimiento,Domicilio,IdPais,telefono,Email,Odservacion)
	VALUES(@dni,@nombre,@Apellido,@fnacimiento,@Domicilio,@IdPais,@telefono,@Email,@Odservacion)

	print'el paciente se agruego correctamente'
	RETURN
END
ELSE
BEGIN

PRINT 'EL PACIENTE YA EXISTE'
RETURN
END
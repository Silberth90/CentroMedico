-- variable case
DECLARE @valor int
DECLARE @resultado char(10)=''
SET @valor = 10

set @resultado = (CASE WHEN @valor = 10  THEN 'ROJO'
						WHEN @valor = 20 THEN 'VERDE'
						WHEN @valor = 30 THEN 'AZUL'
						END)
PRINT @resultado

SELECT *,(CASE WHEN estado = 1 THEN 'VERDE'
				WHEN estado = 2 THEN 'ROJO'
				WHEN estado = 3 THEN 'AZUL'
				ELSE 'GRIS'
				END) AS ColorTurno FROM Turno

/*
declare @idpaciente int
declare @idturno int

set @idpaciente = 7


IF @idpaciente = 7
BEGIN
	set @idturno = 20
	SELECT  * FROM  paciente WHERE  IdPaciente = @idpaciente
	print @idturno

	IF EXISTS(SELECT * FROM paciente WHERE  IdPaciente = 2)
	PRINT 'EXISTE'

END*/

DECLARE @contador int = 0
WHILE @contador <= 10
BEGIN
	PRINT @contador
	SET @contador = @contador + 1
--RETURN SALE DE MANERA FORSADA
	IF @contador = 3
	BREAK 
--	HACE QUE SIGA EJECUTANDO LA SIGUENTE LINEA
--	RETURN
--	PRINT 'HOLA'
END
PRINT 'SIGUE EJECUTANDO'



BEGIN TRY
	SET @contador = 'TEXTO'
END TRY

BEGIN  CATCH
	PRINT 'no es posible asignar un texto a la variable @contador'
END CATCH
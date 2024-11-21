--FUNCIONES ESCALARES

CREATE FUNCTION nombrefun (@var INT)
RETURNS INT

AS

BEGIN

	SET @var = @var * 5
	RETURN @var
END

--llamamos a la funcion
SELECT dbo.concatenar('Lopez','Roberto')
SELECT dbo.odtenerPais(3)

--funcion de concatenar
CREATE FUNCTION concatenar (
				@apellido varchar(50),
				@nombre varchar(50)
				)
RETURNS VARCHAR(100)

AS
BEGIN
	DECLARE @resultado VARCHAR(100)
	SET @resultado = @apellido + ', ' + @nombre
	RETURN @resultado
END
-- funcion para odtener el pais del paciente
CREATE FUNCTION odtenerPais(
				@idpaciente paciente
				)
RETURNS VARCHAR(50)

--SELECT * FROM Paciente
AS
BEGIN
	DECLARE @pais varchar(50)
	SET @pais = (SELECT PA.Pais FROM paciente P
					INNER JOIN Pais PA
					ON PA.idPais = P.IdPais
					WHERE idPaciente = @idpaciente)
RETURN @Pais
END
--FUNCIONES TIPO TABLA
--SELECT * FROM dbo.listaPaises()
 CREATE FUNCTION ListaPaises()
 RETURNS @paises TABLE(idpais char(3), pais varchar(50))
 AS
 BEGIN
	INSERT INTO @paises VALUES('ESP','ESPAÑA')
	INSERT INTO @paises VALUES('MEX','MEXICO')
	INSERT INTO @paises VALUES('CHI','CHILE')
	INSERT INTO @paises VALUES('PER','PERU')
	INSERT INTO @paises VALUES('ARG','ARGENTINA')
	RETURN
 END
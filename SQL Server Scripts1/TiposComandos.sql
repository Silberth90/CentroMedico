--proceso el contenido para modificar el texto
sp_help paciente
--sp_helpText AltaTurnos

--BORRAR TABLA
ALTER TABLE paciente DROP COLUMN estado


EXEC S_paciente 3

--FUNCION DE AGRAGADO
SELECT AVG (idpaciente) FROM paciente;

SELECT COUNT(idpaciente) FROM paciente WHERE  Apellido = 'Perez';

SELECT estado FROM Turno GROUP BY estado HAVING COUNT (estado) > 2

--DELETE
DELETE FROM  paciente WHERE  Nombre = 'Claudio' AND  Apellido = 'Lopez'

--UPDATE
UPDATE paciente SET  Odservacion 'Odservacion modificada' WHERE IdPaciente = 8

--INSERT
INSERT INTO paciente (dni, Nombre, Apellido,Fnacimiento, Domicilio, IdPais, telefono, Email, Odservacion)
VALUES ('33578126', 'Jose', 'Perez', '1999-04-15', 'lavalle 2563', 'COL', NULL,'jose@gmail.com', 'paciente derivado')

INSERT INTO Turno VALUES ('20200101 17:00',2,'OBS');

--OPERADOR LOGICO
SELECT *  FROM paciente WHERE Apellido = 'Perez' AND Nombre = 'Roberto' OR IdPaciente = 7

SELECT * FROM Turno WHERE estado IN(2,1,3)

SELECT * FROM paciente WHERE Apellido NOT IN('Perez','Ramirez','Gonzales')
--OPERADOR COMODIN POR PALABRA
SELECT * FROM paciente WHERE Nombre LIKE 'ma%' 

--OPERADOR NOT
SELECT * FROM paciente WHERE Nombre NOT LIKE 'ma%'

--OPERADOR BETWEEN
SELECT * FROM Turno WHERE fecha BETWEEN '20150102' AND '20190106'
SELECT * FROM Turno WHERE estado BETWEEN 3 AND 7

--LOS VALORES QUE ESTEN EN NULL NO LOS TOME
SET ANSI_NULLS ON
SELECT * FROM Paciente where telefono = NULL

--SE USA PARA USAR PALABRAS RESERVADAS(NO RECOMENDABLE)
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE "SELECT" (campo1 varchar(50))

--CREAR LLAVES FORANEAS
ALTER TABLE paciente
ADD FOREIGN KEY (idPais) REFERENCES Pais(idPais)

ALTER TABLE HistoriaPaciente
ADD FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente)

--crea una funcion
CREATE FUNCTION nombrefun (@var int)
RETURNS INT

AS

BEGIN
	SET @var = @var *  5
	RETURN @var
END

--llama a la funcion
SELECT dbo.nombrefun (256)

-- CREA UNA TABLA
CREATE TABLE ejemplo(campo0 int IDENTITY(1,1),campo1 int,campo2 int)

INSERT INTO ejemplo VALUES(2,3) --INCERTAR VALORES

TRUNCATE TABLE ejemplo -- borra todos los valores de la tabla desde 0

--FERIFICA Q SE CREO
SELECT * FROM ejemplo
--DROP ELIMINAR LA TABLA
DROP TABLE ejemplo
--funcion left y right
DECLARE @var1  varchar(20)
set @var1 = 'ramiro'

print left(@var1,2)




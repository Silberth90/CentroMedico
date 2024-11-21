/*SELECT * FROM paciente

ALTER TABLE paciente ADD  estado  smallint
ALTER TABLE paciente ALTER  COLUMN  estado  bit*/
--FUNCION HORA
SELECT GETDATE()
SELECT GETUTCDATE()
SELECT DATEADD(mm,-2,getdate())

SELECT DATEDIFF(year,getdate(),'20170120')
--FUNCION QUE DA EL MES DEL AÑO
SELECT DATEPART(MONTH,GETDATE())
--FUNCION TRUE O FALSE
IF ISDATE('20190130') = 1
	PRINT 'ES UNA FECHA'
ELSE
	PRINT'FECHA INCORRECTA'

declare @var1 varchar(20)
declare @var2 varchar(20)

set @var1 = '    Silver  '
set @var2 = 'Garcia   '
--FUNCION QUE SACA LOS ESPACIOS
PRINT LTRIM(RTRIM(@var1)) +' '+LTRIM(RTRIM(@var2))

--funcion concadenar
SELECT CONCAT(@var1,@var2)

--print REPLICATE ('R',5)
--remplaza con 3 parametros (donde,que hay que cambiar,con que se remplaza)
SELECT REPLACE (@var1,'"','')

--print LEFT (@var1,1) + LEFT (@VAR2,1)

PRINT UPPER(LEFT(@var1,1)) + LOWER(RIGHT(@var1,LEN(@var1)-1))

--inciales de la columna nombres y apellido
SELECT LEFT(Nombre, 1) + LEFT(Apellido, 1)
FROM paciente;
--ODTIENE LOS CARACTERES DE LA SECCION DOMICILIO
SELECT LEN(Domicilio)
FROM paciente
--CAST CONVIERTE EL VALOR EN EL MOMENTO
DECLARE @numero money
set @numero = 500.40
PRINT @numero
select cast(idpaciente as money) from paciente
SELECT cast(@numero as INT) AS numero

select CONVERT (INT,@numero)

select * from paciente
--actualiza el número de teléfono del paciente cuyo IdPaciente es 8
BEGIN TRAN
	UPDATE paciente SET  telefono = 444 WHERE IdPaciente = 8
	--comprueba cuántas filas fueron afectadas por la última operación
IF @@ROWCOUNT = 1
	COMMIT TRAN
ELSE
	ROLLBACK TRAN

SELECT * FROM Turno
--elimina todos los registros de la tabla Turno donde la columna estado es igual a 1
BEGIN TRAN
	DELETE FROM  Turno WHERE estado = 1
if @@ROWCOUNT = 1
	COMMIT TRAN
ELSE
	ROLLBACK TRAN
		
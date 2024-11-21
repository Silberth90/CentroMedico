--VERIFICA QUE SE CREO EL STORED PROCEDURE
--EXEC SEL_EspecialidadesMedicas

CREATE PROC SEL_EspecialidadesMedicas


AS
SET NOCOUNT ON

--SELECT * FROM especialidad
IF EXISTS(SELECT* FROM especialidad)
	SELECT* FROM especialidad
ELSE
	SELECT 0 AS resultado
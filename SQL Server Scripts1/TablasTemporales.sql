--TABLA TEMPORAL EN MEMORIA
DECLARE @mitabla table (id INT IDENTITY (1,1), pais varchar(50))

INSERT INTO @mitabla VALUES('MEXICO')
INSERT INTO @mitabla VALUES('PERU')
INSERT INTO @mitabla VALUES('ARGENTINA')
INSERT INTO @mitabla VALUES('COLOMBIA')
INSERT INTO @mitabla VALUES('ECUADOR')

SELECT * FROM @mitabla

--TABLA TEMPORAL FISICA

CREATE TABLE #mitabla (id INT IDENTITY(1,1),
						nombre varchar(50),
						apelldio varchar(50))

INSERT INTO  #mitabla VALUES('alejandro','Lopez')
INSERT INTO  #mitabla VALUES('rafael','Castillo')
INSERT INTO  #mitabla VALUES('fernando','Gonzalez')

SELECT * FROM #mitabla
DROP TABLE #mitabla

--SCRIPT
--SELECT * FROM TurnoPaciente
DECLARE @turnos table(id INT IDENTITY(1,1),idturno turno,idpaciente paciente)
DECLARE @idpaciente paciente
SET @idpaciente = 3
INSERT  INTO @turnos (idTurno,idPaciente)

SELECT TP.idTurno,P.idPaciente FROM paciente P
		INNER JOIN TurnoPaciente TP
		ON TP.idPaciente = P.IdPaciente

DECLARE @i INT,@total INT
SET @i = 1
SET @total = (SELECT COUNT(*) FROM @turnos)

WHILE @i <= @total
BEGIN

	IF (SELECT idpaciente FROM @turnos WHERE id = @i) <> @idpaciente
		DELETE FROM @turnos WHERE id = @i

SET @i = @i +1
END

SELECT * FROM paciente P
	INNER JOIN @turnos T
	ON T.idpaciente = P.idpaciente

 

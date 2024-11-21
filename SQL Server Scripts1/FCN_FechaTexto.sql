
--PRINT dbo.FCN_FechaTexto('20190501')

ALTER FUNCTION FCN_FechaTexto (@fecha datetime)

RETURNS VARCHAR (60)

AS

BEGIN
	DECLARE @dia VARCHAR(20)
	DECLARE @mes VARCHAR(20)
	DECLARE @FechaTexto VARCHAR(50)

	SET @dia = (CASE WHEN DATEPART(DW,@fecha) = 1 THEN 'domingo ' + CONVERT(CHAR(2),DATEPART (dd,@fecha))
					WHEN DATEPART(DW,@fecha) = 2 THEN 'lunes ' + CONVERT(CHAR(2),DATEPART (dd,@fecha))
					WHEN DATEPART(DW,@fecha) = 3 THEN 'martes ' + CONVERT(CHAR(2),DATEPART (dd,@fecha))
					WHEN DATEPART(DW,@fecha) = 4 THEN 'miercoles ' + CONVERT(CHAR(2),DATEPART (dd,@fecha))
					WHEN DATEPART(DW,@fecha) = 5 THEN 'jueves ' + CONVERT(CHAR(2),DATEPART (dd,@fecha))
					WHEN DATEPART(DW,@fecha) = 6 THEN 'viernes ' + CONVERT(CHAR(2),DATEPART (dd,@fecha))
					WHEN DATEPART(DW,@fecha) = 7 THEN 'sabado ' + CONVERT(CHAR(2),DATEPART (dd,@fecha))
				END)

	SET @mes = (CASE WHEN DATEPART(mm,@fecha) = 1 THEN 'enero'
						WHEN DATEPART(mm,@fecha) = 2 THEN 'febrero'
						WHEN DATEPART(mm,@fecha) = 3 THEN 'marzo'
						WHEN DATEPART(mm,@fecha) = 4 THEN 'abril'
						WHEN DATEPART(mm,@fecha) = 5 THEN 'mayo'
						WHEN DATEPART(mm,@fecha) = 6 THEN 'junio'
						WHEN DATEPART(mm,@fecha) = 7 THEN 'julio'
						WHEN DATEPART(mm,@fecha) = 8 THEN 'agosto'
						WHEN DATEPART(mm,@fecha) = 9 THEN 'septiembre'
						WHEN DATEPART(mm,@fecha) = 10 THEN 'octubre'
						WHEN DATEPART(mm,@fecha) = 11 THEN 'noviembre'
						WHEN DATEPART(mm,@fecha) = 12 THEN 'diciembre'
					END)

SET @FechaTexto = @dia +' de '+ @mes

RETURN @FechaTexto

END

CREATE ROLE pagos AUTHORIZATION dbo

ALTER ROLE  pagos ADD MEMBER marcelo
-- altera un esquem para pasarlo a medico
ALTER SCHEMA facturacion transfer Medico

ALTER SCHEMA prueba transfer Especialidad
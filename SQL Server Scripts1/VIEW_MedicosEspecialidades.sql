
-- SELECT * FROM VIEW_MedicosEspecialidades

CREATE VIEW VIEW_MedicosEspecialidades AS

SELECT M.idMedico, M.Nombre, M.Apellido,ME.idEspecialidad, ME.Descripcion FROM Medico M
INNER JOIN MedicoEspecialidad ME
ON ME.idMedico = M.idMedico


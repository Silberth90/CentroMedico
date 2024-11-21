CREATE TABLE MedicoEspecialidad(
		idMedico int NOT NULL,
		idEspecialidad int NOT NULL,
		Descripcion varchar(50) NOT NULL,
		PRIMARY KEY (idMedico,idEspecialidad)
)
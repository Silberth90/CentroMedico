CREATE TABLE TurnoEstado (
		idEstado INT PRIMARY KEY,
		descripcion VARCHAR(50) NOT NULL,
);

CREATE TABLE Turno (
		idTurno INT PRIMARY KEY,
		fecha DATE NOT NULL,
		estado INT,
		ubicacion VARCHAR(100),
		FOREIGN KEY (estado) REFERENCES TurnoEstado (idEstado)
)
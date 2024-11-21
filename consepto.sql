CREATE TABLE Concepto (
		idConcepto INT PRIMARY KEY,
		descripcion VARCHAR(100) NOT NULL
)

CREATE TABLE Pago (
		idPago INT PRIMARY KEY,
		Concepto INT,
		fecha DATETIME NOT NULL,
		monto MONEY NOT NULL,
		estado TINYINT,
		observacion VARCHAR(1000),
		FOREIGN KEY (Concepto) REFERENCES Concepto (idConcepto)
)
CREATE TABLE Pago(
		idPago int IDENTITY(1,1) NOT NULL PRIMARY KEY,
		consecto tinyint NOT NULL,
		fecha datetime NOT NULL,
		monto money NOT NULL,
		estado tinyint NOT NULL,
		odservacion varchar(100)NOT NULL,


)
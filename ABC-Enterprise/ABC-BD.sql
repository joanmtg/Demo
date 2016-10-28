DROP TABLE IF EXISTS Clientes, Empleados, Sedes, Piezas, Automoviles, OrdenesTrabajo, Ventas, PiezasOrden  CASCADE;


CREATE TABLE Sedes (
    cod_sede serial NOT NULL,
    nombre varchar(50) NOT NULL,
    direccion varchar(50) NOT NULL,
    CONSTRAINT pk_sede PRIMARY KEY(cod_sede)
);


CREATE TABLE Clientes (
	id_cliente serial, 
	nombre varchar(80) NOT NULL, 
	direccion varchar(50) NOT NULL,
	telefono varchar(10) NOT NULL,
	email varchar(30) NOT NULL,
	CONSTRAINT pk_cliente PRIMARY KEY(id_cliente)
);

CREATE TABLE Empleados (
	identificacion char(15),
	nombre varchar(80) NOT NULL,
	password varchar(20) NOT NULL,
	edad char(2) NOT NULL,
	estado boolean NOT NULL,
	telefono varchar(10) NOT NULL,
	email varchar(30) NOT NULL,
	titulo varchar(30) NOT NULL,
	direccion varchar(50) NOT NULL,
	tipo varchar(20) NOT NULL,
	cod_sede integer NOT NULL,
	CONSTRAINT fk_sedeG FOREIGN KEY(cod_sede)
	REFERENCES Sedes(cod_sede),
	CONSTRAINT pk_empleado PRIMARY KEY(identificacion)
);


CREATE TABLE Piezas (
	cod_pieza serial,
	nombre varchar(40) NOT NULL,
	precio int NOT NULL,
	cantidad smallint,
	CONSTRAINT pk_pieza PRIMARY KEY(cod_pieza)
);

CREATE TABLE Automoviles (
	cod_auto serial,
	marca varchar(20) NOT NULL,
	modelo varchar(10) NOT NULL,
	precio int NOT NULL,
	color varchar(20) NOT NULL,
	cantidad smallint NOT NULL,
	nombre varchar(20) NOT NULL,
	CONSTRAINT pk_auto PRIMARY KEY(cod_auto)
);

CREATE TABLE OrdenesTrabajo (
	cod_orden char(5),
	estado char(1) NOT NULL,
	descripcion varchar(100),
	cod_empleado char(5),
	CONSTRAINT fk_empleado FOREIGN KEY(cod_empleado)
	REFERENCES Empleados(cod_empleado),
	CONSTRAINT pk_orden PRIMARY KEY(cod_orden)
);

CREATE TABLE Ventas (
	cod_auto char(5),
	cod_empleado char(5),
	id_cliente char(10),
	fecha varchar(10) NOT NULL,
	total int NOT NULL,
	CONSTRAINT fk_ventaA FOREIGN KEY(cod_auto)
	REFERENCES Automoviles(cod_auto),
	CONSTRAINT fk_ventaV FOREIGN KEY(cod_empleado)
	REFERENCES Empleados(cod_empleado),
	CONSTRAINT fk_ventaC FOREIGN KEY(id_cliente)
	REFERENCES Clientes(id_cliente),
	CONSTRAINT pk_venta 
	PRIMARY KEY(cod_auto, cod_empleado, id_cliente)
);

CREATE TABLE PiezasOrden (
	cod_pieza char(5),
	cod_orden char(5),
	CONSTRAINT fk_pieza FOREIGN KEY(cod_pieza)
	REFERENCES Piezas(cod_pieza),
	CONSTRAINT fk_orden FOREIGN KEY(cod_orden)
	REFERENCES OrdenesTrabajo(cod_orden),
	CONSTRAINT pk_piezasO PRIMARY KEY(cod_pieza, cod_orden)
);

INSERT INTO sedes(nombre, direccion) VALUES ('Sede de Cali', 'Univalle');

INSERT INTO Empleados(identificacion, nombre, password, edad, estado, telefono, email, titulo, direccion, tipo, cod_sede) VALUES ('123456789', 'Linus Torvalds', '123456789-30', '30', '1', '3122914869', 'linus@likeaboss.com', 'Doctor', 'Ciudad Jardin', 'Gerente',1);

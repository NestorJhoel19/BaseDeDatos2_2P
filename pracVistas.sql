create database practVistas;
use practVistas;

create table Articulo(
	codigo int identity(1, 1),
	nombre varchar(30) not null,
	precio int,
	fabricante int,
	constraint PK_codArticulo primary key(codigo)
);

create table Fabricante(
	codigo int identity(1, 1),
	nombre varchar(30) not null,
	ciudad varchar(30) not null,
	constraint PK_codFabricante primary key(codigo)
);

create table Cliente(
	codigo int identity(1, 1),
	nombres varchar(30) not null,
	apellidos varchar(30) not null,
	NIT varchar(30),
	constraint PK_codCliente primary key(codigo)
);

create table Venta(
	Num_Venta int identity(1, 1),
	fecha date,
	codCliente int,
	codEmp int,
	constraint PK_numVent primary key(Num_Venta)
);

create table DetalleVenta(
	NumVenta int,
	Cod_Art int,
	PrecioVenta int,
	Cantidad int,
	SubTotal int
);

create table Empleado(
	codigo int identity(1, 1),
	nombres varchar(30) not null,
	apellidos varchar(30) not null,
	telefono varchar(30) not null,
	constraint PK_codEmpleado primary key(codigo)
);

alter table Articulo
add constraint FK_Art_Fab foreign key(fabricante) references fabricante(codigo);

alter table Venta
add constraint FK_Vent_Cli foreign key(CodCliente) references Cliente(codigo);

alter table Venta
add constraint FK_Vent_Emp foreign key(CodEmp) references Empleado(codigo);

alter table DetalleVenta
add constraint FK_DVent_Art foreign key(Cod_Art) references Articulo(codigo);

alter table DetalleVenta
add constraint FK_DVent_Venta foreign key(NumVenta) references Venta(Num_Venta);
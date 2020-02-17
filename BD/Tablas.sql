use proyecto_titulo

create table [Historial Clinico](
[Id HC] int IDENTITY(1,1) not null primary key,
[Peso paciente] decimal (6,3)not null,
[Estatura paciente] decimal (3,2)not null,
[Antecedentes enfermedades Familiares] varchar (500) not null,
[Observaciones del dia] varchar(1000) not null,
[Tratamiento] varchar (500),
[Id_Receta] int,
[Id Certificado] int,
[Id Licencia] int
)

create table Receta (
[Id Receta] int identity (1,1) not null primary key,
[Nombre Medicamento] varchar (150) not null,
Cantidad int,
Indicaciones varchar (150),
[Rut Paciente] varchar (15) not null
)
drop table Receta

create table [Certificado Medico](
[Id Certificado] int identity (1,1) not null primary key,
[Observacion] varchar (150) not null,
Dias int, 
[Rut Paciente] varchar (15) not null,
)

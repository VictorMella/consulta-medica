create database Proyecto_Titulo

create table Paciente(
[Rut Paciente] varchar (15) not null primary key,
[Nombre Paciente] varchar (30) not null,
[Apellido Paterno] varchar (20) Not null,
[Apellido Materno] varchar (20) Not null,
[Fecha de Nacimiento] date Not null,
Direccion varchar (50) not null,
[Telefono Paciente] int not null,
Comuna varchar (20) not null,
Ciudad varchar (20) not null,
Prevision varchar (12) not null,
Email varchar (50) not null unique,
Estado varchar (10) not null,
Perfil varchar (15) not null
)

create table Acceso (
[Id usuario] int IDENTITY(1,1) not null primary key,
[Rut Usuario] varchar (15) not null,
[Pass Usuario] varchar (8) not null
)

use Proyecto_Titulo
create table Medico (
[Rut Medico] varchar (15) not null primary key,
[Nombre Medico] varchar (30) not null,
[AP medico] varchar (20) Not null,
[AM medico] varchar (20) Not null, 
Especialidad varchar (30) not null, 
ICM int not null
)
create table Consultas(
[Id Consultas] int IDENTITY(1,1) not null primary key,
[Hora Consulta] time not null,
[Fecha Consulta] date not null,
[Rut Paciente] varchar (15) not null  foreign key references Paciente ([Rut Paciente]),
[Rut Medico] varchar (15) not null foreign key references Medico ([Rut Medico]),
[Id HC] int not null foreign key references [Historial Clinico] ([Id HC])

)

create table medicamentos(
[Id Medicamento] int not null primary key,
[Nombre Medicamento] varchar (150) not null,
Laboratorio varchar (20) not null
)
use Proyecto_Titulo
alter table medicamentos
drop column Laboratorio
USE [Proyecto_Titulo]
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 29-01-2019 1:08:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico](
	[Rut Medico] [varchar](15) NOT NULL,
	[Especialidad] [varchar](30) NOT NULL,
	[ICM] [int] NOT NULL,
	[Id Empleado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Rut Medico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 29-01-2019 1:08:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[Id Empleado] [int] IDENTITY(1,1) NOT NULL,
	[Rut Empleado] [varchar](15) NOT NULL,
	[Nombre Paciente] [varchar](30) NOT NULL,
	[Apellido Paterno] [varchar](20) NOT NULL,
	[Apellido Materno] [varchar](20) NOT NULL,
	[Direccion Empleado] [varchar](50) NOT NULL,
	[Telefono Paciente] [bigint] NOT NULL,
	[Cargo Empleado] [varchar](20) NOT NULL,
	[Email Empleado] [varchar](50) NOT NULL,
	[Id Usuario] [int] NULL,
	[Id Estado] [int] NULL,
 CONSTRAINT [PK__Empleado__6F3BD736DB06F495] PRIMARY KEY CLUSTERED 
(
	[Id Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Datos Medicos]    Script Date: 29-01-2019 1:08:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Datos Medicos]
as
select [Nombre Paciente] + ' '+[Apellido Paterno] as [Nombre del Medico] ,[Rut Medico],Especialidad from Medico,Empleado where Medico.[Rut Medico]=Empleado.[Rut Empleado] 
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 29-01-2019 1:08:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[Id Paciente] [int] IDENTITY(1,1) NOT NULL,
	[Rut Paciente] [varchar](15) NOT NULL,
	[Nombre Paciente] [varchar](30) NOT NULL,
	[Apellido Paterno] [varchar](20) NOT NULL,
	[Apellido Materno] [varchar](20) NOT NULL,
	[Fecha de Nacimiento] [date] NOT NULL,
	[Direccion Paciente] [varchar](50) NOT NULL,
	[Telefono Paciente] [bigint] NOT NULL,
	[Comuna] [varchar](20) NOT NULL,
	[Prevision] [varchar](12) NOT NULL,
	[Email Paciente] [varchar](50) NOT NULL,
	[Id Estado] [int] NOT NULL,
	[Id Usuario] [int] NULL,
 CONSTRAINT [PK__Paciente__220936F369F4AA1E] PRIMARY KEY CLUSTERED 
(
	[Rut Paciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email Paciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Contador de Pacientes]    Script Date: 29-01-2019 1:08:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Contador de Pacientes]
as
select count (*) as Contador from paciente
GO
/****** Object:  View [dbo].[Contador de Trabajadores]    Script Date: 29-01-2019 1:08:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create view [dbo].[Contador de Trabajadores]
 				as
				select count(*) as Contador from  Empleado 
GO
/****** Object:  Table [dbo].[Acceso]    Script Date: 29-01-2019 1:08:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Acceso](
	[Id usuario] [int] IDENTITY(1,1) NOT NULL,
	[Rut Usuario] [varchar](15) NOT NULL,
	[Pass Usuario] [varchar](8) NOT NULL,
	[Id Perfil] [int] NOT NULL,
	[Estado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Contador de Usuarios]    Script Date: 29-01-2019 1:08:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create view [dbo].[Contador de Usuarios]
				as 
				select count(*) as Contador from Acceso
GO
/****** Object:  Table [dbo].[Cargos]    Script Date: 29-01-2019 1:08:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargos](
	[Id Cargo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre Cargo] [varchar](20) NOT NULL,
 CONSTRAINT [PK__Cargos__60BEC81D88EE9FB9] PRIMARY KEY CLUSTERED 
(
	[Nombre Cargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Certificado Medico]    Script Date: 29-01-2019 1:08:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificado Medico](
	[Id Certificado] [int] IDENTITY(1,1) NOT NULL,
	[Observacion] [varchar](500) NOT NULL,
	[Dias] [int] NULL,
	[Rut Paciente] [varchar](15) NOT NULL,
	[Rut Medico] [varchar](15) NOT NULL,
	[Fecha de Inicio] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id Certificado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comentarios Usuarios]    Script Date: 29-01-2019 1:08:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentarios Usuarios](
	[Id Comentario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre Usuario] [varchar](50) NOT NULL,
	[Comentario] [varchar](1000) NULL,
	[Email Paciente] [varchar](50) NOT NULL,
	[Tipo Comentario] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id Comentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comunas]    Script Date: 29-01-2019 1:08:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comunas](
	[Id Comun] [int] IDENTITY(1,1) NOT NULL,
	[Comuna] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Comuna] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dias Semana]    Script Date: 29-01-2019 1:08:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dias Semana](
	[Id Dias] [int] IDENTITY(1,1) NOT NULL,
	[Nombre Dia] [varchar](10) NOT NULL,
 CONSTRAINT [PK__Dias__BF801B5CF8C1E14C] PRIMARY KEY CLUSTERED 
(
	[Nombre Dia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Disponibilidad]    Script Date: 29-01-2019 1:08:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disponibilidad](
	[Id Disponibilidad] [int] IDENTITY(1,1) NOT NULL,
	[Rut Medico] [varchar](15) NOT NULL,
	[Nombre Dia] [varchar](10) NOT NULL,
	[Hora Inicio] [time](3) NOT NULL,
	[Hora Termino] [time](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id Disponibilidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidad Medico]    Script Date: 29-01-2019 1:08:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidad Medico](
	[Id Especialidad] [int] IDENTITY(1,1) NOT NULL,
	[Especialidad] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Especialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado Paciente]    Script Date: 29-01-2019 1:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado Paciente](
	[Id Estado] [int] IDENTITY(1,1) NOT NULL,
	[Estado Paciente] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado Reserva]    Script Date: 29-01-2019 1:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado Reserva](
	[Id Consulta Medica] [int] IDENTITY(1,1) NOT NULL,
	[Estado Reserva Medica] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Estado Reserva Medica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Historial Clinico]    Script Date: 29-01-2019 1:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historial Clinico](
	[Id HC] [int] IDENTITY(1,1) NOT NULL,
	[Peso paciente] [varchar](10) NULL,
	[Estatura paciente] [varchar](10) NULL,
	[Temperatura paciente] [varchar](10) NULL,
	[Observaciones del dia] [varchar](1000) NOT NULL,
	[Tratamiento] [varchar](500) NULL,
	[Id_Receta] [int] NULL,
	[Id Certificado] [int] NULL,
	[Id Licencia] [int] NULL,
	[Rut Paciente] [varchar](15) NOT NULL,
	[Rut Medico] [varchar](15) NOT NULL,
	[Fecha HC] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id HC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Horarios]    Script Date: 29-01-2019 1:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horarios](
	[Id Horarios] [int] IDENTITY(1,1) NOT NULL,
	[Hora Consulta] [time](3) NOT NULL,
 CONSTRAINT [PK__Horarios__1E5F0C15B4080E56] PRIMARY KEY CLUSTERED 
(
	[Hora Consulta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[medicamentos]    Script Date: 29-01-2019 1:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medicamentos](
	[Id Medicamento] [int] NOT NULL,
	[Nombre Medicamento] [varchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Nombre Medicamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu Usuario]    Script Date: 29-01-2019 1:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu Usuario](
	[Id Menu] [int] IDENTITY(1,1) NOT NULL,
	[Nombre Menu] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id Menu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfil Usuario]    Script Date: 29-01-2019 1:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfil Usuario](
	[Id Perfil] [int] IDENTITY(1,1) NOT NULL,
	[Perfil Usuario] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id Perfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permisos]    Script Date: 29-01-2019 1:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permisos](
	[Id Permiso] [int] IDENTITY(1,1) NOT NULL,
	[Id Perfil] [int] NOT NULL,
	[Id Menu] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id Permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prevision]    Script Date: 29-01-2019 1:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prevision](
	[Id Prevision] [int] IDENTITY(1,1) NOT NULL,
	[Prevision] [varchar](12) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Prevision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receta]    Script Date: 29-01-2019 1:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receta](
	[Id Receta] [int] IDENTITY(1,1) NOT NULL,
	[Nombre Medicamento] [varchar](150) NULL,
	[Indicaciones] [varchar](500) NULL,
	[Rut Paciente] [varchar](15) NOT NULL,
	[Rut Medico] [varchar](15) NOT NULL,
	[Fecha] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id Receta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserva de Hora]    Script Date: 29-01-2019 1:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva de Hora](
	[Id Reserva] [int] IDENTITY(1,1) NOT NULL,
	[Hora Reserva] [time](3) NOT NULL,
	[Fecha Reserva] [date] NOT NULL,
	[Rut Paciente] [varchar](15) NULL,
	[Rut Medico] [varchar](15) NOT NULL,
	[Estado Reserva] [varchar](20) NOT NULL,
	[Telefono de Contacto] [bigint] NULL,
 CONSTRAINT [PK__Reserva __3DAD5E743A6D1423] PRIMARY KEY CLUSTERED 
(
	[Id Reserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo Comentario]    Script Date: 29-01-2019 1:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo Comentario](
	[Id Comentario] [int] IDENTITY(1,1) NOT NULL,
	[Tipo Comentario] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Tipo Comentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Acceso]  WITH CHECK ADD  CONSTRAINT [FK_Acceso_Estado Paciente] FOREIGN KEY([Estado])
REFERENCES [dbo].[Estado Paciente] ([Id Estado])
GO
ALTER TABLE [dbo].[Acceso] CHECK CONSTRAINT [FK_Acceso_Estado Paciente]
GO
ALTER TABLE [dbo].[Acceso]  WITH CHECK ADD  CONSTRAINT [FK_Acceso_Perfil Usuario] FOREIGN KEY([Id Perfil])
REFERENCES [dbo].[Perfil Usuario] ([Id Perfil])
GO
ALTER TABLE [dbo].[Acceso] CHECK CONSTRAINT [FK_Acceso_Perfil Usuario]
GO
ALTER TABLE [dbo].[Certificado Medico]  WITH CHECK ADD  CONSTRAINT [FK_Certificado Medico_Medico] FOREIGN KEY([Rut Medico])
REFERENCES [dbo].[Medico] ([Rut Medico])
GO
ALTER TABLE [dbo].[Certificado Medico] CHECK CONSTRAINT [FK_Certificado Medico_Medico]
GO
ALTER TABLE [dbo].[Certificado Medico]  WITH CHECK ADD  CONSTRAINT [FK_Certificado Medico_Paciente] FOREIGN KEY([Rut Paciente])
REFERENCES [dbo].[Paciente] ([Rut Paciente])
GO
ALTER TABLE [dbo].[Certificado Medico] CHECK CONSTRAINT [FK_Certificado Medico_Paciente]
GO
ALTER TABLE [dbo].[Comentarios Usuarios]  WITH NOCHECK ADD  CONSTRAINT [FK_Comentarios Usuarios_Paciente] FOREIGN KEY([Email Paciente])
REFERENCES [dbo].[Paciente] ([Email Paciente])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Comentarios Usuarios] NOCHECK CONSTRAINT [FK_Comentarios Usuarios_Paciente]
GO
ALTER TABLE [dbo].[Comentarios Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Comentarios Usuarios_Tipo Comentario] FOREIGN KEY([Tipo Comentario])
REFERENCES [dbo].[Tipo Comentario] ([Tipo Comentario])
GO
ALTER TABLE [dbo].[Comentarios Usuarios] CHECK CONSTRAINT [FK_Comentarios Usuarios_Tipo Comentario]
GO
ALTER TABLE [dbo].[Disponibilidad]  WITH CHECK ADD  CONSTRAINT [FK_Disponibilidad_Dias Semana] FOREIGN KEY([Nombre Dia])
REFERENCES [dbo].[Dias Semana] ([Nombre Dia])
GO
ALTER TABLE [dbo].[Disponibilidad] CHECK CONSTRAINT [FK_Disponibilidad_Dias Semana]
GO
ALTER TABLE [dbo].[Disponibilidad]  WITH CHECK ADD  CONSTRAINT [FK_Disponibilidad_Horarios] FOREIGN KEY([Hora Inicio])
REFERENCES [dbo].[Horarios] ([Hora Consulta])
GO
ALTER TABLE [dbo].[Disponibilidad] CHECK CONSTRAINT [FK_Disponibilidad_Horarios]
GO
ALTER TABLE [dbo].[Disponibilidad]  WITH CHECK ADD  CONSTRAINT [FK_Disponibilidad_Horarios1] FOREIGN KEY([Hora Termino])
REFERENCES [dbo].[Horarios] ([Hora Consulta])
GO
ALTER TABLE [dbo].[Disponibilidad] CHECK CONSTRAINT [FK_Disponibilidad_Horarios1]
GO
ALTER TABLE [dbo].[Disponibilidad]  WITH CHECK ADD  CONSTRAINT [FK_Disponibilidad_Medico] FOREIGN KEY([Rut Medico])
REFERENCES [dbo].[Medico] ([Rut Medico])
GO
ALTER TABLE [dbo].[Disponibilidad] CHECK CONSTRAINT [FK_Disponibilidad_Medico]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Acceso] FOREIGN KEY([Id Usuario])
REFERENCES [dbo].[Acceso] ([Id usuario])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Acceso]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Cargos] FOREIGN KEY([Cargo Empleado])
REFERENCES [dbo].[Cargos] ([Nombre Cargo])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Cargos]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Estado Paciente] FOREIGN KEY([Id Estado])
REFERENCES [dbo].[Estado Paciente] ([Id Estado])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Estado Paciente]
GO
ALTER TABLE [dbo].[Historial Clinico]  WITH NOCHECK ADD  CONSTRAINT [FK_Historial Clinico_Certificado Medico] FOREIGN KEY([Id Certificado])
REFERENCES [dbo].[Certificado Medico] ([Id Certificado])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Historial Clinico] NOCHECK CONSTRAINT [FK_Historial Clinico_Certificado Medico]
GO
ALTER TABLE [dbo].[Historial Clinico]  WITH CHECK ADD  CONSTRAINT [FK_Historial Clinico_Medico] FOREIGN KEY([Rut Medico])
REFERENCES [dbo].[Medico] ([Rut Medico])
GO
ALTER TABLE [dbo].[Historial Clinico] CHECK CONSTRAINT [FK_Historial Clinico_Medico]
GO
ALTER TABLE [dbo].[Historial Clinico]  WITH CHECK ADD  CONSTRAINT [FK_Historial Clinico_Paciente] FOREIGN KEY([Rut Paciente])
REFERENCES [dbo].[Paciente] ([Rut Paciente])
GO
ALTER TABLE [dbo].[Historial Clinico] CHECK CONSTRAINT [FK_Historial Clinico_Paciente]
GO
ALTER TABLE [dbo].[Historial Clinico]  WITH NOCHECK ADD  CONSTRAINT [FK_Historial Clinico_Receta] FOREIGN KEY([Id_Receta])
REFERENCES [dbo].[Receta] ([Id Receta])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Historial Clinico] NOCHECK CONSTRAINT [FK_Historial Clinico_Receta]
GO
ALTER TABLE [dbo].[Medico]  WITH CHECK ADD  CONSTRAINT [FK_Medico_Empleado] FOREIGN KEY([Id Empleado])
REFERENCES [dbo].[Empleado] ([Id Empleado])
GO
ALTER TABLE [dbo].[Medico] CHECK CONSTRAINT [FK_Medico_Empleado]
GO
ALTER TABLE [dbo].[Medico]  WITH CHECK ADD  CONSTRAINT [FK_Medico_Especialidad Medico] FOREIGN KEY([Especialidad])
REFERENCES [dbo].[Especialidad Medico] ([Especialidad])
GO
ALTER TABLE [dbo].[Medico] CHECK CONSTRAINT [FK_Medico_Especialidad Medico]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_Acceso] FOREIGN KEY([Id Usuario])
REFERENCES [dbo].[Acceso] ([Id usuario])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_Acceso]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_Comunas] FOREIGN KEY([Comuna])
REFERENCES [dbo].[Comunas] ([Comuna])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_Comunas]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_Estado Paciente] FOREIGN KEY([Id Estado])
REFERENCES [dbo].[Estado Paciente] ([Id Estado])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_Estado Paciente]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_Prevision] FOREIGN KEY([Prevision])
REFERENCES [dbo].[Prevision] ([Prevision])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_Prevision]
GO
ALTER TABLE [dbo].[Permisos]  WITH CHECK ADD  CONSTRAINT [FK_Permisos_Menu Usuario] FOREIGN KEY([Id Menu])
REFERENCES [dbo].[Menu Usuario] ([Id Menu])
GO
ALTER TABLE [dbo].[Permisos] CHECK CONSTRAINT [FK_Permisos_Menu Usuario]
GO
ALTER TABLE [dbo].[Permisos]  WITH CHECK ADD  CONSTRAINT [FK_Permisos_Perfil Usuario] FOREIGN KEY([Id Perfil])
REFERENCES [dbo].[Perfil Usuario] ([Id Perfil])
GO
ALTER TABLE [dbo].[Permisos] CHECK CONSTRAINT [FK_Permisos_Perfil Usuario]
GO
ALTER TABLE [dbo].[Receta]  WITH CHECK ADD  CONSTRAINT [FK_Receta_medicamentos] FOREIGN KEY([Nombre Medicamento])
REFERENCES [dbo].[medicamentos] ([Nombre Medicamento])
GO
ALTER TABLE [dbo].[Receta] CHECK CONSTRAINT [FK_Receta_medicamentos]
GO
ALTER TABLE [dbo].[Receta]  WITH CHECK ADD  CONSTRAINT [FK_Receta_Medico] FOREIGN KEY([Rut Medico])
REFERENCES [dbo].[Medico] ([Rut Medico])
GO
ALTER TABLE [dbo].[Receta] CHECK CONSTRAINT [FK_Receta_Medico]
GO
ALTER TABLE [dbo].[Receta]  WITH CHECK ADD  CONSTRAINT [FK_Receta_Paciente] FOREIGN KEY([Rut Paciente])
REFERENCES [dbo].[Paciente] ([Rut Paciente])
GO
ALTER TABLE [dbo].[Receta] CHECK CONSTRAINT [FK_Receta_Paciente]
GO
ALTER TABLE [dbo].[Reserva de Hora]  WITH CHECK ADD  CONSTRAINT [FK_Reserva de Hora_Estado Reserva] FOREIGN KEY([Estado Reserva])
REFERENCES [dbo].[Estado Reserva] ([Estado Reserva Medica])
GO
ALTER TABLE [dbo].[Reserva de Hora] CHECK CONSTRAINT [FK_Reserva de Hora_Estado Reserva]
GO
ALTER TABLE [dbo].[Reserva de Hora]  WITH CHECK ADD  CONSTRAINT [FK_Reserva de Hora_Horarios] FOREIGN KEY([Hora Reserva])
REFERENCES [dbo].[Horarios] ([Hora Consulta])
GO
ALTER TABLE [dbo].[Reserva de Hora] CHECK CONSTRAINT [FK_Reserva de Hora_Horarios]
GO
ALTER TABLE [dbo].[Reserva de Hora]  WITH CHECK ADD  CONSTRAINT [FK_Reserva de Hora_Medico] FOREIGN KEY([Rut Medico])
REFERENCES [dbo].[Medico] ([Rut Medico])
GO
ALTER TABLE [dbo].[Reserva de Hora] CHECK CONSTRAINT [FK_Reserva de Hora_Medico]
GO
ALTER TABLE [dbo].[Reserva de Hora]  WITH CHECK ADD  CONSTRAINT [FK_Reserva de Hora_Paciente] FOREIGN KEY([Rut Paciente])
REFERENCES [dbo].[Paciente] ([Rut Paciente])
GO
ALTER TABLE [dbo].[Reserva de Hora] CHECK CONSTRAINT [FK_Reserva de Hora_Paciente]
GO

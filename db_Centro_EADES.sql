USE [master]
GO

--Adicion de borrado de base de datos
DROP DATABASE [Centro-EADES]
go

--Usar centro EADES
USE [Centro-EADES]
GO

/*CREACION DE BASE DE DATOS CLINICA EADES*/

Create Database [Centro-EADES]
GO
/*Containment = None
On Primary
(	Name = N'Centro-EADES', 
	Filename = N'C:\Users\USUARIO\CURSOS_DE_PROGRAMACION\Curso_Aplicaciones_I\BBDD\Centro-EADES.mdf' , 
	Size = 10240KB ,
	Maxsize = Unlimited, 
	Filegrowth = 1024KB)
Log on
(	Name = N'Centro-EADES_log', 
	Filename = N'C:\Users\USUARIO\CURSOS_DE_PROGRAMACION\Curso_Aplicaciones_I\BBDD\Centro-EADES_log.ldf' , 
	Size = 6912KB ,
	Maxsize = 2048GB, 
	Filegrowth = 10%)
With Catalog_Collation = Database_Default
Go*/

use [Centro-EADES]
go


/*CREAMOS LA TABLA Tb_Apoderado*/
CREATE TABLE Tb_Apoderado
(
	Cod_apo [nchar](4) NOT NULL,
	Id_Ubigeo [nchar](6) NOT NULL,
	Nom_apo [nvarchar](25) NULL,
	Ape_apo [nvarchar](25) NULL,
	Dir_apo [nvarchar](50) NULL,
	Dni_apo [nchar](8) NULL,
	Tel_pac [nvarchar](10) NULL,
	Fec_reg [datetime] NOT NULL,
	Usu_Registro [varchar](20) NULL,
	Fech_Ult_Mod [datetime] NULL,
	Usu_Ult_Mod [varchar](20) NULL,
	Est_apo [int] NULL
)
go

/*CREAMOS LA TABLA Tb_Reservacion_Sesion*/
CREATE TABLE Tb_Reservacion_Sesion
(
	Cod_apo [nchar](4) NOT NULL,
	Cod_Horario_Ses [int] NOT NULL,
	Fecha_Reserv [datetime] NOT NULL,
	Est_Reserv [int] NULL,
	Fec_reg [datetime] NOT NULL,
	Usu_Registro [varchar](20) NULL,
	Fech_Ult_Mod [datetime] NULL,
	Usu_Ult_Mod [varchar](20) NULL
)
go



/*CREAMOS LA TABLA Tb_Usuario*/
CREATE TABLE Tb_Usuario
(
	Cod_Usu [nchar](3) NOT NULL,
	Login_Usuario [varchar](20) NOT NULL,
	Pass_Usuario [varchar](20) NOT NULL,
	Niv_Usuario [int] NULL,
	Est_Usuario [int] NULL,
	Fec_Registro [datetime] NULL,
	Usu_Registro [varchar](20) NULL,
)
go



/*CREAMOS LA TABLA Tb_Profesional*/

CREATE TABLE Tb_Profesional
(
	Cod_Pro [nchar](3) NOT NULL,
	Id_Espec [int] NOT NULL,
	Nom_pro [nvarchar](25) NULL,
	Ape_pro [nvarchar](25) NULL,
	Sue_pro [money] NULL,
	Fech_ing [datetime] NULL,
	Dni_pro [nchar](8) NULL,
	Email_pro [nvarchar](50) NULL,
	Fech_Registro [datetime] NULL,
	Usu_Registro [varchar](20) NULL,
	Fech_Ult_Mod [datetime] NULL,
	Usu_Ult_Mod [varchar](20) NULL,
	Est_pro [int] NULL
)
go






/*CREAMOS LA TABLA Tb_Especialidad*/
CREATE TABLE Tb_Especialidad
(
	Id_Espec [int] IDENTITY (1,1) NOT NULL,
	Nom_Espec [varchar](50) NULL,
	Des_Espec [varchar](50) NULL
)
go



/*CREAMOS LA TABLA Tb_Horario_Sesiones*/
CREATE TABLE Tb_Horario_Sesiones
(
	Cod_Horario_Ses [int] IDENTITY (1,1) NOT NULL,
	Cod_Pro [nchar](3) NOT NULL,
	Descrip_dia [nvarchar](50) NOT NULL,
	Est_Hor_Ses [int] NOT NULL
)
go



/*CREAMOS LA TABLA Tb_Ubigeo*/
CREATE TABLE Tb_Ubigeo
(
	Id_Ubigeo [nchar](6) NOT NULL,
	IdDepa [nvarchar](255) NULL,
	IdProv [nvarchar](255) NULL,
	IdDist [nvarchar](255) NULL,
	Departamento [nvarchar](255) NULL,
	Provincia [nvarchar](255) NULL,
	Distrito [nvarchar](255) NULL,
	Cod_Pro [nchar](3) NULL
)
go


/*CREAMOS LA TABLA Tb_Detalle_Sesiones*/
CREATE TABLE Tb_Detalle_Sesiones
(
	Cod_pac [nvarchar](4) NOT NULL,
	Cod_Horario_Ses [int] NOT NULL,
	Hora_Ini [nvarchar](10) NOT NULL,
	Hora_Fin [nvarchar](10) NOT NULL,
	Fec_reg [datetime] NOT NULL,
	Usu_Registro [varchar](20) NULL,
	Fec_Ult_Mod [datetime] NULL,
	Usu_Ult_Mod [varchar](20) NULL,
	Est_Ses_Asig [int] NULL
)
go



/*CREAMOS LA TABLA Tb_Paciente*/
CREATE TABLE Tb_Paciente
(
	Cod_pac [nvarchar](4) NOT NULL,
	Cod_apo [nchar](4) NOT NULL,
	Id_Ubigeo [nchar](6) NOT NULL,
	Nom_pac [nvarchar](25) NULL,
	Ape_pac [nvarchar](25) NULL,
	Dir_pac [nvarchar](50) NULL,
	Dni_pac [nchar](8) NULL,
	Tel_pac [nvarchar](10) NULL,
	Fec_reg [datetime] NOT NULL,
	Usu_Registro [varchar](20) NULL,
	Fech_Ult_Mod [datetime] NULL,
	Usu_Ult_Mod [varchar](20) NULL,
	Est_pac [int] NULL
)
go



/**********************CONSTRAINTS TABLES*****************************/



/*
--exec sp_helpconstraint Tb_Ubigeo
go
--exec sp_helpconstraint Tb_Apoderado
go
--exec sp_helpconstraint Tb_Paciente
go
--exec sp_helpconstraint Tb_Detalle_Sesiones
go
--exec sp_helpconstraint Tb_Horario_Sesiones
go
--exec sp_helpconstraint Tb_Usuario
go
exec sp_helpconstraint Tb_Profesional
go
--exec sp_helpconstraint Tb_Especialidad
go
--exec sp_helpconstraint Tb_Reservacion_Sesion
go

alter table Tb_Ubigeo drop constraint PK_Id_Ubigeo
alter table Tb_Apoderado drop constraint PK_Apoderado

*/

/*PRIMARY KEYS*/
Alter Table Tb_Apoderado Add Constraint PK_Apoderado Primary Key (Cod_apo) 
Alter Table Tb_Usuario Add Constraint PK_Cod_Usu Primary Key (Cod_Usu)
Alter Table Tb_Profesional Add Constraint PK_Cod_Pro Primary Key (Cod_Pro) 
Alter Table Tb_Especialidad Add Constraint PK_Id_Espec Primary Key (Id_Espec) 
Alter Table Tb_Horario_Sesiones Add Constraint PK_Cod_Hor_Ses Primary Key (Cod_Horario_Ses) 
Alter Table Tb_Ubigeo Add Constraint PK_Id_Ubigeo Primary Key (Id_Ubigeo)
Alter Table Tb_Detalle_Sesiones Add Constraint PK_Detall_Ses Primary Key (Cod_Horario_Ses,Cod_pac)
Alter Table Tb_Paciente Add Constraint PK_Cod_pac Primary Key (Cod_pac) 
Alter Table Tb_Reservacion_Sesion Add Constraint PK_Reser_Sess Primary Key (Cod_apo,Cod_Horario_Ses)
go

/*TABLA APODERADO*/

Alter Table Tb_Apoderado With Check Add Constraint FK_Apoderado_Ubigeo Foreign Key (Id_Ubigeo) References Tb_Ubigeo (Id_Ubigeo)
Alter Table Tb_Apoderado With Check Add Constraint Chk_Dni_Apo Check (Dni_Apo like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
Alter Table Tb_Apoderado Add Constraint Def_Fec_Reg Default (getdate()) For Fec_Reg 
go


/*TABLA RESERVACION SESION*/

Alter Table Tb_Reservacion_Sesion With Check Add Constraint FK_ReservacionSesion_Apoderado Foreign Key (Cod_apo) References Tb_Apoderado (Cod_apo) On Delete Cascade
Alter Table Tb_Reservacion_Sesion With Check Add Constraint FK_ReservacionSesion_HorarioSesiones Foreign Key (Cod_Horario_Ses) References Tb_Horario_Sesiones (Cod_Horario_Ses)
Alter Table Tb_Reservacion_Sesion Add Constraint Def_Fec_Reg_Reserv_Ses Default (getdate()) For Fec_Reg 
go

--exec sp_helpconstraint Tb_Reservacion_Sesion
--go

/*TABLA USUARIO*/


/*TABLA PROFESIONAL*/


Alter Table Tb_Profesional With Check Add Constraint FK_Profesional_Especialidad Foreign Key (Id_Espec) References Tb_Especialidad (Id_Espec)
Alter Table Tb_Profesional With Check Add Constraint Chk_Dni_Pro Check (Dni_pro like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
Alter Table Tb_Profesional Add Constraint Def_Pro_Fech_Registro Default (getdate()) For Fech_Registro 


/*TABLA ESPECIALIDAD*/


/*TABLA HORARIO SESIONES*/

Alter Table Tb_Horario_Sesiones With Check Add Constraint FK_Horario_Sesiones_Profesional Foreign Key (Cod_Pro) References Tb_Profesional (Cod_Pro) On Delete Cascade

/*TABLA UBIGEO*/

Alter Table Tb_Ubigeo With Check Add Constraint FK_Ubigeo_Profesional Foreign Key (Cod_Pro) References Tb_Profesional (Cod_Pro)

/*TABLA DETALLES SESIONES*/

Alter Table Tb_Detalle_Sesiones With Check Add Constraint FK_Detalles_Sesiones_Horario_Sesiones Foreign Key (Cod_Horario_Ses) References Tb_Horario_Sesiones (Cod_Horario_Ses)
Alter Table Tb_Detalle_Sesiones With Check Add Constraint FK_Detalles_Sesiones_Paciente Foreign Key (Cod_pac) References Tb_Paciente (Cod_pac) On Delete Cascade
Alter Table Tb_Detalle_Sesiones With Check Add Constraint FK_Detall_Sess_Hor_Sess_Update Foreign Key (Cod_Horario_Ses) References Tb_Horario_Sesiones (Cod_Horario_Ses) On Update Cascade
Alter Table Tb_Detalle_Sesiones Add Constraint Def_Detalle_Sesiones_Fec_reg Default (getdate()) For Fec_reg


/*TABLA PACIENTE*/

Alter Table Tb_Paciente With Check Add Constraint FK_Paciente_Apoderado Foreign Key (Cod_apo) References Tb_Apoderado (Cod_apo)
Alter Table Tb_Paciente With Check Add Constraint FK_Paciente_Ubigeo Foreign Key (Id_Ubigeo) References Tb_Ubigeo (Id_Ubigeo)
Alter Table Tb_Paciente With Check Add Constraint Chk_Dni_Pac Check (Dni_pac like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
Alter Table Tb_Paciente Add Constraint Def_Pac_Fec_Reg Default (getdate()) For Fec_reg



--drop database [Centro-EADES];

/*INSERT TABLE USUARIO*/

Select * From Tb_Usuario

Insert Tb_Usuario Values (N'U01', N'Ximena Diaz', N'pass123', 2 , 1, CAST(N'2022-09-30T00:00:00.000' AS DateTime), N'Admin')
Insert Tb_Usuario Values (N'U02',N'Paola Sifuentes', N'pass456', 2 , 1, CAST(N'2022-09-29T00:00:00.000' AS DateTime), N'Admin')
Insert Tb_Usuario Values (N'U03',N'Admin', N'S0p0rt3', 1 , 1, CAST(N'2022-08-01T00:00:00.000' AS DateTime), N'Admin')

-- cambios al insert de usuario

Insert Tb_Usuario Values (N'U04',N'Lucas Lope', N'pass123', 2 , 1, CAST(N'2022-09-30T00:00:00.000' AS DateTime), N'Admin')
Insert Tb_Usuario Values (N'U05',N'Santiago Queirolo', N'pass456', 2 , 1, CAST(N'2020-08-29T00:00:00.000' AS DateTime), N'Admin')
Insert Tb_Usuario Values (N'U06',N'Alisson Ugarte', N'S0p0rt3', 1 , 1, CAST(N'2022-01-15T00:00:00.000' AS DateTime), N'Admin')
Insert Tb_Usuario Values (N'U07',N'Jesus Maestro', N'pass123', 2 , 1, CAST(N'2022-03-03T00:00:00.000' AS DateTime), N'Admin')
Insert Tb_Usuario Values (N'U08',N'Manuel Arturo', N'pass456', 2 , 1, CAST(N'2021-09-09T00:00:00.000' AS DateTime), N'Admin')
Insert Tb_Usuario Values (N'U09',N'Nicolle Watterson', N'S0p0rt3', 1 , 1, CAST(N'2002-06-03T00:00:00.000' AS DateTime), N'Admin')
Insert Tb_Usuario Values (N'U10',N'Camila Navarrete', N'pass123', 2 , 1, CAST(N'2019-09-18T00:00:00.000' AS DateTime), N'Admin')
Insert Tb_Usuario Values (N'U11',N'Hanna Montana', N'pass456', 2 , 1, CAST(N'2022-09-29T00:00:00.000' AS DateTime), N'Admin')
Insert Tb_Usuario Values (N'U12',N'Candace Ramirez', N'S0p0rt3', 1 , 1, CAST(N'2022-08-01T00:00:00.000' AS DateTime), N'Admin')
Insert Tb_Usuario Values (N'U13',N'Elver Galarga', N'pass123', 2 , 1, CAST(N'2022-09-30T00:00:00.000' AS DateTime), N'Admin')
Insert Tb_Usuario Values (N'U14',N'José Olaya', N'pass456', 2 , 1, CAST(N'2022-09-29T00:00:00.000' AS DateTime), N'Admin')
Insert Tb_Usuario Values (N'U15',N'Carlos Ochoa', N'S0p0rt3', 1 , 1, CAST(N'2022-08-01T00:00:00.000' AS DateTime), N'Admin')
Insert Tb_Usuario Values (N'U16',N'Mauricio Babilonia', N'pass123', 2 , 1, CAST(N'2020-05-05T00:00:00.000' AS DateTime), N'Admin')
Insert Tb_Usuario Values (N'U17',N'Remedios Buen Día', N'pass456', 2 , 1, CAST(N'2022-09-06T00:00:00.000' AS DateTime), N'Admin')
Insert Tb_Usuario Values (N'U18',N'Úrsula Iguarán', N'S0p0rt3', 1 , 1, CAST(N'2022-05-01T00:00:00.000' AS DateTime), N'Admin')
Insert Tb_Usuario Values (N'U19',N'Pietro Crespi', N'pass123', 2 , 1, CAST(N'2022-06-30T00:00:00.000' AS DateTime), N'Admin')
Insert Tb_Usuario Values (N'U20',N'José Ramirez', N'pass456', 2 , 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), N'Admin')

/*INSERT TABLE UBIGEO*/

Select * From Tb_Ubigeo
go
--delete from Tb_Ubigeo where Id_Ubigeo = '010101';

INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010101', N'01', N'01', N'01', N'AMAZONAS', N'CHACHAPOYAS', N'CHACHAPOYAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010102', N'01', N'01', N'02', N'AMAZONAS', N'CHACHAPOYAS', N'ASUNCION', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010103', N'01', N'01', N'03', N'AMAZONAS', N'CHACHAPOYAS', N'BALSAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010104', N'01', N'01', N'04', N'AMAZONAS', N'CHACHAPOYAS', N'CHETO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010105', N'01', N'01', N'05', N'AMAZONAS', N'CHACHAPOYAS', N'CHILIQUIN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010106', N'01', N'01', N'06', N'AMAZONAS', N'CHACHAPOYAS', N'CHUQUIBAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010107', N'01', N'01', N'07', N'AMAZONAS', N'CHACHAPOYAS', N'GRANADA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010108', N'01', N'01', N'08', N'AMAZONAS', N'CHACHAPOYAS', N'HUANCAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010109', N'01', N'01', N'09', N'AMAZONAS', N'CHACHAPOYAS', N'LA JALCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010110', N'01', N'01', N'10', N'AMAZONAS', N'CHACHAPOYAS', N'LEIMEBAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010111', N'01', N'01', N'11', N'AMAZONAS', N'CHACHAPOYAS', N'LEVANTO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010112', N'01', N'01', N'12', N'AMAZONAS', N'CHACHAPOYAS', N'MAGDALENA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010113', N'01', N'01', N'13', N'AMAZONAS', N'CHACHAPOYAS', N'MARISCAL CASTILLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010114', N'01', N'01', N'14', N'AMAZONAS', N'CHACHAPOYAS', N'MOLINOPAMPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010115', N'01', N'01', N'15', N'AMAZONAS', N'CHACHAPOYAS', N'MONTEVIDEO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010116', N'01', N'01', N'16', N'AMAZONAS', N'CHACHAPOYAS', N'OLLEROS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010117', N'01', N'01', N'17', N'AMAZONAS', N'CHACHAPOYAS', N'QUINJALCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010118', N'01', N'01', N'18', N'AMAZONAS', N'CHACHAPOYAS', N'SAN FRANCISCO DE DAGUAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010119', N'01', N'01', N'19', N'AMAZONAS', N'CHACHAPOYAS', N'SAN ISIDRO DE MAINO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010120', N'01', N'01', N'20', N'AMAZONAS', N'CHACHAPOYAS', N'SOLOCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010121', N'01', N'01', N'21', N'AMAZONAS', N'CHACHAPOYAS', N'SONCHE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010201', N'01', N'02', N'01', N'AMAZONAS', N'BAGUA', N'LA PECA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010202', N'01', N'02', N'02', N'AMAZONAS', N'BAGUA', N'ARAMANGO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010203', N'01', N'02', N'03', N'AMAZONAS', N'BAGUA', N'COPALLIN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010204', N'01', N'02', N'04', N'AMAZONAS', N'BAGUA', N'EL PARCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010205', N'01', N'02', N'05', N'AMAZONAS', N'BAGUA', N'BAGUA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010206', N'01', N'02', N'06', N'AMAZONAS', N'BAGUA', N'IMAZA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010301', N'01', N'03', N'01', N'AMAZONAS', N'BONGARA', N'JUMBILLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010302', N'01', N'03', N'02', N'AMAZONAS', N'BONGARA', N'COROSHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010303', N'01', N'03', N'03', N'AMAZONAS', N'BONGARA', N'CUISPES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010304', N'01', N'03', N'04', N'AMAZONAS', N'BONGARA', N'CHISQUILLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010305', N'01', N'03', N'05', N'AMAZONAS', N'BONGARA', N'CHURUJA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010306', N'01', N'03', N'06', N'AMAZONAS', N'BONGARA', N'FLORIDA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010307', N'01', N'03', N'07', N'AMAZONAS', N'BONGARA', N'RECTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010308', N'01', N'03', N'08', N'AMAZONAS', N'BONGARA', N'SAN CARLOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010309', N'01', N'03', N'09', N'AMAZONAS', N'BONGARA', N'SHIPASBAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010310', N'01', N'03', N'10', N'AMAZONAS', N'BONGARA', N'VALERA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010311', N'01', N'03', N'11', N'AMAZONAS', N'BONGARA', N'YAMBRASBAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010312', N'01', N'03', N'12', N'AMAZONAS', N'BONGARA', N'JAZAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010401', N'01', N'04', N'01', N'AMAZONAS', N'LUYA', N'LAMUD', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010402', N'01', N'04', N'02', N'AMAZONAS', N'LUYA', N'CAMPORREDONDO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010403', N'01', N'04', N'03', N'AMAZONAS', N'LUYA', N'COCABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010404', N'01', N'04', N'04', N'AMAZONAS', N'LUYA', N'COLCAMAR', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010405', N'01', N'04', N'05', N'AMAZONAS', N'LUYA', N'CONILA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010406', N'01', N'04', N'06', N'AMAZONAS', N'LUYA', N'INGUILPATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010407', N'01', N'04', N'07', N'AMAZONAS', N'LUYA', N'LONGUITA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010408', N'01', N'04', N'08', N'AMAZONAS', N'LUYA', N'LONYA CHICO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010409', N'01', N'04', N'09', N'AMAZONAS', N'LUYA', N'LUYA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010410', N'01', N'04', N'10', N'AMAZONAS', N'LUYA', N'LUYA VIEJO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010411', N'01', N'04', N'11', N'AMAZONAS', N'LUYA', N'MARIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010412', N'01', N'04', N'12', N'AMAZONAS', N'LUYA', N'OCALLI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010413', N'01', N'04', N'13', N'AMAZONAS', N'LUYA', N'OCUMAL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010414', N'01', N'04', N'14', N'AMAZONAS', N'LUYA', N'PISUQUIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010415', N'01', N'04', N'15', N'AMAZONAS', N'LUYA', N'SAN CRISTOBAL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010416', N'01', N'04', N'16', N'AMAZONAS', N'LUYA', N'SAN FRANCISCO DE YESO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010417', N'01', N'04', N'17', N'AMAZONAS', N'LUYA', N'SAN JERONIMO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010418', N'01', N'04', N'18', N'AMAZONAS', N'LUYA', N'SAN JUAN DE LOPECANCHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010419', N'01', N'04', N'19', N'AMAZONAS', N'LUYA', N'SANTA CATALINA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010420', N'01', N'04', N'20', N'AMAZONAS', N'LUYA', N'SANTO TOMAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010421', N'01', N'04', N'21', N'AMAZONAS', N'LUYA', N'TINGO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010422', N'01', N'04', N'22', N'AMAZONAS', N'LUYA', N'TRITA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010423', N'01', N'04', N'23', N'AMAZONAS', N'LUYA', N'PROVIDENCIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010501', N'01', N'05', N'01', N'AMAZONAS', N'RODRIGUEZ DE MENDOZA', N'SAN NICOLAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010502', N'01', N'05', N'02', N'AMAZONAS', N'RODRIGUEZ DE MENDOZA', N'COCHAMAL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010503', N'01', N'05', N'03', N'AMAZONAS', N'RODRIGUEZ DE MENDOZA', N'CHIRIMOTO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010504', N'01', N'05', N'04', N'AMAZONAS', N'RODRIGUEZ DE MENDOZA', N'HUAMBO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010505', N'01', N'05', N'05', N'AMAZONAS', N'RODRIGUEZ DE MENDOZA', N'LIMABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010506', N'01', N'05', N'06', N'AMAZONAS', N'RODRIGUEZ DE MENDOZA', N'LONGAR', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010507', N'01', N'05', N'07', N'AMAZONAS', N'RODRIGUEZ DE MENDOZA', N'MILPUCC', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010508', N'01', N'05', N'08', N'AMAZONAS', N'RODRIGUEZ DE MENDOZA', N'MARISCAL BENAVIDES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010509', N'01', N'05', N'09', N'AMAZONAS', N'RODRIGUEZ DE MENDOZA', N'OMIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010510', N'01', N'05', N'10', N'AMAZONAS', N'RODRIGUEZ DE MENDOZA', N'SANTA ROSA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010511', N'01', N'05', N'11', N'AMAZONAS', N'RODRIGUEZ DE MENDOZA', N'TOTORA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010512', N'01', N'05', N'12', N'AMAZONAS', N'RODRIGUEZ DE MENDOZA', N'VISTA ALEGRE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010601', N'01', N'06', N'01', N'AMAZONAS', N'CONDORCANQUI', N'NIEVA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010602', N'01', N'06', N'02', N'AMAZONAS', N'CONDORCANQUI', N'RIO SANTIAGO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010603', N'01', N'06', N'03', N'AMAZONAS', N'CONDORCANQUI', N'EL CENEPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010701', N'01', N'07', N'01', N'AMAZONAS', N'UTCUBAMBA', N'BAGUA GRANDE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010702', N'01', N'07', N'02', N'AMAZONAS', N'UTCUBAMBA', N'CAJARURO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010703', N'01', N'07', N'03', N'AMAZONAS', N'UTCUBAMBA', N'CUMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010704', N'01', N'07', N'04', N'AMAZONAS', N'UTCUBAMBA', N'EL MILAGRO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010705', N'01', N'07', N'05', N'AMAZONAS', N'UTCUBAMBA', N'JAMALCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010706', N'01', N'07', N'06', N'AMAZONAS', N'UTCUBAMBA', N'LONYA GRANDE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'010707', N'01', N'07', N'07', N'AMAZONAS', N'UTCUBAMBA', N'YAMON', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020101', N'02', N'01', N'01', N'ANCASH', N'HUARAZ', N'HUARAZ', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020102', N'02', N'01', N'02', N'ANCASH', N'HUARAZ', N'INDEPENDENCIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020103', N'02', N'01', N'03', N'ANCASH', N'HUARAZ', N'COCHABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020104', N'02', N'01', N'04', N'ANCASH', N'HUARAZ', N'COLCABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020105', N'02', N'01', N'05', N'ANCASH', N'HUARAZ', N'HUANCHAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020106', N'02', N'01', N'06', N'ANCASH', N'HUARAZ', N'JANGAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020107', N'02', N'01', N'07', N'ANCASH', N'HUARAZ', N'LA LIBERTAD', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020108', N'02', N'01', N'08', N'ANCASH', N'HUARAZ', N'OLLEROS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020109', N'02', N'01', N'09', N'ANCASH', N'HUARAZ', N'PAMPAS GRANDE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020110', N'02', N'01', N'10', N'ANCASH', N'HUARAZ', N'PARIACOTO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020111', N'02', N'01', N'11', N'ANCASH', N'HUARAZ', N'PIRA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020112', N'02', N'01', N'12', N'ANCASH', N'HUARAZ', N'TARICA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020201', N'02', N'02', N'01', N'ANCASH', N'AIJA', N'AIJA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020203', N'02', N'02', N'03', N'ANCASH', N'AIJA', N'CORIS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020205', N'02', N'02', N'05', N'ANCASH', N'AIJA', N'HUACLLAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020206', N'02', N'02', N'06', N'ANCASH', N'AIJA', N'LA MERCED', NULL)
GO
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020208', N'02', N'02', N'08', N'ANCASH', N'AIJA', N'SUCCHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020301', N'02', N'03', N'01', N'ANCASH', N'BOLOGNESI', N'CHIQUIAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020302', N'02', N'03', N'02', N'ANCASH', N'BOLOGNESI', N'ABELARDO PARDO LEZAMETA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020304', N'02', N'03', N'04', N'ANCASH', N'BOLOGNESI', N'AQUIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020305', N'02', N'03', N'05', N'ANCASH', N'BOLOGNESI', N'CAJACAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020310', N'02', N'03', N'10', N'ANCASH', N'BOLOGNESI', N'HUAYLLACAYAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020311', N'02', N'03', N'11', N'ANCASH', N'BOLOGNESI', N'HUASTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020313', N'02', N'03', N'13', N'ANCASH', N'BOLOGNESI', N'MANGAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020315', N'02', N'03', N'15', N'ANCASH', N'BOLOGNESI', N'PACLLON', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020317', N'02', N'03', N'17', N'ANCASH', N'BOLOGNESI', N'SAN MIGUEL DE CORPANQUI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020320', N'02', N'03', N'20', N'ANCASH', N'BOLOGNESI', N'TICLLOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020321', N'02', N'03', N'21', N'ANCASH', N'BOLOGNESI', N'ANTONIO RAIMONDI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020322', N'02', N'03', N'22', N'ANCASH', N'BOLOGNESI', N'CANIS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020323', N'02', N'03', N'23', N'ANCASH', N'BOLOGNESI', N'COLQUIOC', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020324', N'02', N'03', N'24', N'ANCASH', N'BOLOGNESI', N'LA PRIMAVERA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020325', N'02', N'03', N'25', N'ANCASH', N'BOLOGNESI', N'HUALLANCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020401', N'02', N'04', N'01', N'ANCASH', N'CARHUAZ', N'CARHUAZ', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020402', N'02', N'04', N'02', N'ANCASH', N'CARHUAZ', N'ACOPAMPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020403', N'02', N'04', N'03', N'ANCASH', N'CARHUAZ', N'AMASHCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020404', N'02', N'04', N'04', N'ANCASH', N'CARHUAZ', N'ANTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020405', N'02', N'04', N'05', N'ANCASH', N'CARHUAZ', N'ATAQUERO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020406', N'02', N'04', N'06', N'ANCASH', N'CARHUAZ', N'MARCARA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020407', N'02', N'04', N'07', N'ANCASH', N'CARHUAZ', N'PARIAHUANCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020408', N'02', N'04', N'08', N'ANCASH', N'CARHUAZ', N'SAN MIGUEL DE ACO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020409', N'02', N'04', N'09', N'ANCASH', N'CARHUAZ', N'SHILLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020410', N'02', N'04', N'10', N'ANCASH', N'CARHUAZ', N'TINCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020411', N'02', N'04', N'11', N'ANCASH', N'CARHUAZ', N'YUNGAR', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020501', N'02', N'05', N'01', N'ANCASH', N'CASMA', N'CASMA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020502', N'02', N'05', N'02', N'ANCASH', N'CASMA', N'BUENA VISTA ALTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020503', N'02', N'05', N'03', N'ANCASH', N'CASMA', N'COMANDANTE NOEL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020505', N'02', N'05', N'05', N'ANCASH', N'CASMA', N'YAUTAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020601', N'02', N'06', N'01', N'ANCASH', N'CORONGO', N'CORONGO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020602', N'02', N'06', N'02', N'ANCASH', N'CORONGO', N'ACO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020603', N'02', N'06', N'03', N'ANCASH', N'CORONGO', N'BAMBAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020604', N'02', N'06', N'04', N'ANCASH', N'CORONGO', N'CUSCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020605', N'02', N'06', N'05', N'ANCASH', N'CORONGO', N'LA PAMPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020606', N'02', N'06', N'06', N'ANCASH', N'CORONGO', N'YANAC', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020607', N'02', N'06', N'07', N'ANCASH', N'CORONGO', N'YUPAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020701', N'02', N'07', N'01', N'ANCASH', N'HUAYLAS', N'CARAZ', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020702', N'02', N'07', N'02', N'ANCASH', N'HUAYLAS', N'HUALLANCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020703', N'02', N'07', N'03', N'ANCASH', N'HUAYLAS', N'HUATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020704', N'02', N'07', N'04', N'ANCASH', N'HUAYLAS', N'HUAYLAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020705', N'02', N'07', N'05', N'ANCASH', N'HUAYLAS', N'MATO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020706', N'02', N'07', N'06', N'ANCASH', N'HUAYLAS', N'PAMPAROMAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020707', N'02', N'07', N'07', N'ANCASH', N'HUAYLAS', N'PUEBLO LIBRE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020708', N'02', N'07', N'08', N'ANCASH', N'HUAYLAS', N'SANTA CRUZ', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020709', N'02', N'07', N'09', N'ANCASH', N'HUAYLAS', N'YURACMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020710', N'02', N'07', N'10', N'ANCASH', N'HUAYLAS', N'SANTO TORIBIO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020801', N'02', N'08', N'01', N'ANCASH', N'HUARI', N'HUARI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020802', N'02', N'08', N'02', N'ANCASH', N'HUARI', N'CAJAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020803', N'02', N'08', N'03', N'ANCASH', N'HUARI', N'CHAVIN DE HUANTAR', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020804', N'02', N'08', N'04', N'ANCASH', N'HUARI', N'HUACACHI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020805', N'02', N'08', N'05', N'ANCASH', N'HUARI', N'HUACHIS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020806', N'02', N'08', N'06', N'ANCASH', N'HUARI', N'HUACCHIS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020807', N'02', N'08', N'07', N'ANCASH', N'HUARI', N'HUANTAR', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020808', N'02', N'08', N'08', N'ANCASH', N'HUARI', N'MASIN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020809', N'02', N'08', N'09', N'ANCASH', N'HUARI', N'PAUCAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020810', N'02', N'08', N'10', N'ANCASH', N'HUARI', N'PONTO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020811', N'02', N'08', N'11', N'ANCASH', N'HUARI', N'RAHUAPAMPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020812', N'02', N'08', N'12', N'ANCASH', N'HUARI', N'RAPAYAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020813', N'02', N'08', N'13', N'ANCASH', N'HUARI', N'SAN MARCOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020814', N'02', N'08', N'14', N'ANCASH', N'HUARI', N'SAN PEDRO DE CHANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020815', N'02', N'08', N'15', N'ANCASH', N'HUARI', N'UCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020816', N'02', N'08', N'16', N'ANCASH', N'HUARI', N'ANRA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020901', N'02', N'09', N'01', N'ANCASH', N'MARISCAL LUZURIAGA', N'PISCOBAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020902', N'02', N'09', N'02', N'ANCASH', N'MARISCAL LUZURIAGA', N'CASCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020903', N'02', N'09', N'03', N'ANCASH', N'MARISCAL LUZURIAGA', N'LUCMA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020904', N'02', N'09', N'04', N'ANCASH', N'MARISCAL LUZURIAGA', N'FIDEL OLIVAS ESCUDERO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020905', N'02', N'09', N'05', N'ANCASH', N'MARISCAL LUZURIAGA', N'LLAMA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020906', N'02', N'09', N'06', N'ANCASH', N'MARISCAL LUZURIAGA', N'LLUMPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020907', N'02', N'09', N'07', N'ANCASH', N'MARISCAL LUZURIAGA', N'MUSGA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'020908', N'02', N'09', N'08', N'ANCASH', N'MARISCAL LUZURIAGA', N'ELEAZAR GUZMAN BARRON', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021001', N'02', N'10', N'01', N'ANCASH', N'PALLASCA', N'CABANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021002', N'02', N'10', N'02', N'ANCASH', N'PALLASCA', N'BOLOGNESI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021003', N'02', N'10', N'03', N'ANCASH', N'PALLASCA', N'CONCHUCOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021004', N'02', N'10', N'04', N'ANCASH', N'PALLASCA', N'HUACASCHUQUE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021005', N'02', N'10', N'05', N'ANCASH', N'PALLASCA', N'HUANDOVAL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021006', N'02', N'10', N'06', N'ANCASH', N'PALLASCA', N'LACABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021007', N'02', N'10', N'07', N'ANCASH', N'PALLASCA', N'LLAPO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021008', N'02', N'10', N'08', N'ANCASH', N'PALLASCA', N'PALLASCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021009', N'02', N'10', N'09', N'ANCASH', N'PALLASCA', N'PAMPAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021010', N'02', N'10', N'10', N'ANCASH', N'PALLASCA', N'SANTA ROSA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021011', N'02', N'10', N'11', N'ANCASH', N'PALLASCA', N'TAUCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021101', N'02', N'11', N'01', N'ANCASH', N'POMABAMBA', N'POMABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021102', N'02', N'11', N'02', N'ANCASH', N'POMABAMBA', N'HUAYLLAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021103', N'02', N'11', N'03', N'ANCASH', N'POMABAMBA', N'PAROBAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021104', N'02', N'11', N'04', N'ANCASH', N'POMABAMBA', N'QUINUABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021201', N'02', N'12', N'01', N'ANCASH', N'RECUAY', N'RECUAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021202', N'02', N'12', N'02', N'ANCASH', N'RECUAY', N'COTAPARACO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021203', N'02', N'12', N'03', N'ANCASH', N'RECUAY', N'HUAYLLAPAMPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021204', N'02', N'12', N'04', N'ANCASH', N'RECUAY', N'MARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021205', N'02', N'12', N'05', N'ANCASH', N'RECUAY', N'PAMPAS CHICO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021206', N'02', N'12', N'06', N'ANCASH', N'RECUAY', N'PARARIN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021207', N'02', N'12', N'07', N'ANCASH', N'RECUAY', N'TAPACOCHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021208', N'02', N'12', N'08', N'ANCASH', N'RECUAY', N'TICAPAMPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021209', N'02', N'12', N'09', N'ANCASH', N'RECUAY', N'LLACLLIN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021210', N'02', N'12', N'10', N'ANCASH', N'RECUAY', N'CATAC', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021301', N'02', N'13', N'01', N'ANCASH', N'SANTA', N'CHIMBOTE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021302', N'02', N'13', N'02', N'ANCASH', N'SANTA', N'CACERES DEL PERU', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021303', N'02', N'13', N'03', N'ANCASH', N'SANTA', N'MACATE', NULL)
GO
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021304', N'02', N'13', N'04', N'ANCASH', N'SANTA', N'MORO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021305', N'02', N'13', N'05', N'ANCASH', N'SANTA', N'NEPEÑA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021306', N'02', N'13', N'06', N'ANCASH', N'SANTA', N'SAMANCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021307', N'02', N'13', N'07', N'ANCASH', N'SANTA', N'SANTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021308', N'02', N'13', N'08', N'ANCASH', N'SANTA', N'COISHCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021309', N'02', N'13', N'09', N'ANCASH', N'SANTA', N'NUEVO CHIMBOTE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021401', N'02', N'14', N'01', N'ANCASH', N'SIHUAS', N'SIHUAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021402', N'02', N'14', N'02', N'ANCASH', N'SIHUAS', N'ALFONSO UGARTE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021403', N'02', N'14', N'03', N'ANCASH', N'SIHUAS', N'CHINGALPO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021404', N'02', N'14', N'04', N'ANCASH', N'SIHUAS', N'HUAYLLABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021405', N'02', N'14', N'05', N'ANCASH', N'SIHUAS', N'QUICHES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021406', N'02', N'14', N'06', N'ANCASH', N'SIHUAS', N'SICSIBAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021407', N'02', N'14', N'07', N'ANCASH', N'SIHUAS', N'ACOBAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021408', N'02', N'14', N'08', N'ANCASH', N'SIHUAS', N'CASHAPAMPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021409', N'02', N'14', N'09', N'ANCASH', N'SIHUAS', N'RAGASH', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021410', N'02', N'14', N'10', N'ANCASH', N'SIHUAS', N'SAN JUAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021501', N'02', N'15', N'01', N'ANCASH', N'YUNGAY', N'YUNGAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021502', N'02', N'15', N'02', N'ANCASH', N'YUNGAY', N'CASCAPARA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021503', N'02', N'15', N'03', N'ANCASH', N'YUNGAY', N'MANCOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021504', N'02', N'15', N'04', N'ANCASH', N'YUNGAY', N'MATACOTO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021505', N'02', N'15', N'05', N'ANCASH', N'YUNGAY', N'QUILLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021506', N'02', N'15', N'06', N'ANCASH', N'YUNGAY', N'RANRAHIRCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021507', N'02', N'15', N'07', N'ANCASH', N'YUNGAY', N'SHUPLUY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021508', N'02', N'15', N'08', N'ANCASH', N'YUNGAY', N'YANAMA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021601', N'02', N'16', N'01', N'ANCASH', N'ANTONIO RAIMONDI', N'LLAMELLIN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021602', N'02', N'16', N'02', N'ANCASH', N'ANTONIO RAIMONDI', N'ACZO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021603', N'02', N'16', N'03', N'ANCASH', N'ANTONIO RAIMONDI', N'CHACCHO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021604', N'02', N'16', N'04', N'ANCASH', N'ANTONIO RAIMONDI', N'CHINGAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021605', N'02', N'16', N'05', N'ANCASH', N'ANTONIO RAIMONDI', N'MIRGAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021606', N'02', N'16', N'06', N'ANCASH', N'ANTONIO RAIMONDI', N'SAN JUAN DE RONTOY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021701', N'02', N'17', N'01', N'ANCASH', N'CARLOS FERMIN FITZCARRALD', N'SAN LUIS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021702', N'02', N'17', N'02', N'ANCASH', N'CARLOS FERMIN FITZCARRALD', N'YAUYA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021703', N'02', N'17', N'03', N'ANCASH', N'CARLOS FERMIN FITZCARRALD', N'SAN NICOLAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021801', N'02', N'18', N'01', N'ANCASH', N'ASUNCION', N'CHACAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021802', N'02', N'18', N'02', N'ANCASH', N'ASUNCION', N'ACOCHACA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021901', N'02', N'19', N'01', N'ANCASH', N'HUARMEY', N'HUARMEY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021902', N'02', N'19', N'02', N'ANCASH', N'HUARMEY', N'COCHAPETI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021903', N'02', N'19', N'03', N'ANCASH', N'HUARMEY', N'HUAYAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021904', N'02', N'19', N'04', N'ANCASH', N'HUARMEY', N'MALVAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'021905', N'02', N'19', N'05', N'ANCASH', N'HUARMEY', N'CULEBRAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'022001', N'02', N'20', N'01', N'ANCASH', N'OCROS', N'ACAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'022002', N'02', N'20', N'02', N'ANCASH', N'OCROS', N'CAJAMARQUILLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'022003', N'02', N'20', N'03', N'ANCASH', N'OCROS', N'CARHUAPAMPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'022004', N'02', N'20', N'04', N'ANCASH', N'OCROS', N'COCHAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'022005', N'02', N'20', N'05', N'ANCASH', N'OCROS', N'CONGAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'022006', N'02', N'20', N'06', N'ANCASH', N'OCROS', N'LLIPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'022007', N'02', N'20', N'07', N'ANCASH', N'OCROS', N'OCROS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'022008', N'02', N'20', N'08', N'ANCASH', N'OCROS', N'SAN CRISTOBAL DE RAJAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'022009', N'02', N'20', N'09', N'ANCASH', N'OCROS', N'SAN PEDRO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'022010', N'02', N'20', N'10', N'ANCASH', N'OCROS', N'SANTIAGO DE CHILCAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030101', N'03', N'01', N'01', N'APURIMAC', N'ABANCAY', N'ABANCAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030102', N'03', N'01', N'02', N'APURIMAC', N'ABANCAY', N'CIRCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030103', N'03', N'01', N'03', N'APURIMAC', N'ABANCAY', N'CURAHUASI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030104', N'03', N'01', N'04', N'APURIMAC', N'ABANCAY', N'CHACOCHE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030105', N'03', N'01', N'05', N'APURIMAC', N'ABANCAY', N'HUANIPACA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030106', N'03', N'01', N'06', N'APURIMAC', N'ABANCAY', N'LAMBRAMA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030107', N'03', N'01', N'07', N'APURIMAC', N'ABANCAY', N'PICHIRHUA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030108', N'03', N'01', N'08', N'APURIMAC', N'ABANCAY', N'SAN PEDRO DE CACHORA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030109', N'03', N'01', N'09', N'APURIMAC', N'ABANCAY', N'TAMBURCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030201', N'03', N'02', N'01', N'APURIMAC', N'AYMARAES', N'CHALHUANCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030202', N'03', N'02', N'02', N'APURIMAC', N'AYMARAES', N'CAPAYA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030203', N'03', N'02', N'03', N'APURIMAC', N'AYMARAES', N'CARAYBAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030204', N'03', N'02', N'04', N'APURIMAC', N'AYMARAES', N'COLCABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030205', N'03', N'02', N'05', N'APURIMAC', N'AYMARAES', N'COTARUSE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030206', N'03', N'02', N'06', N'APURIMAC', N'AYMARAES', N'CHAPIMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030207', N'03', N'02', N'07', N'APURIMAC', N'AYMARAES', N'HUAYLLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030208', N'03', N'02', N'08', N'APURIMAC', N'AYMARAES', N'LUCRE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030209', N'03', N'02', N'09', N'APURIMAC', N'AYMARAES', N'POCOHUANCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030210', N'03', N'02', N'10', N'APURIMAC', N'AYMARAES', N'SAÑAYCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030211', N'03', N'02', N'11', N'APURIMAC', N'AYMARAES', N'SORAYA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030212', N'03', N'02', N'12', N'APURIMAC', N'AYMARAES', N'TAPAIRIHUA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030213', N'03', N'02', N'13', N'APURIMAC', N'AYMARAES', N'TINTAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030214', N'03', N'02', N'14', N'APURIMAC', N'AYMARAES', N'TORAYA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030215', N'03', N'02', N'15', N'APURIMAC', N'AYMARAES', N'YANACA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030216', N'03', N'02', N'16', N'APURIMAC', N'AYMARAES', N'SAN JUAN DE CHACÑA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030217', N'03', N'02', N'17', N'APURIMAC', N'AYMARAES', N'JUSTO APU SAHUARAURA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030301', N'03', N'03', N'01', N'APURIMAC', N'ANDAHUAYLAS', N'ANDAHUAYLAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030302', N'03', N'03', N'02', N'APURIMAC', N'ANDAHUAYLAS', N'ANDARAPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030303', N'03', N'03', N'03', N'APURIMAC', N'ANDAHUAYLAS', N'CHIARA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030304', N'03', N'03', N'04', N'APURIMAC', N'ANDAHUAYLAS', N'HUANCARAMA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030305', N'03', N'03', N'05', N'APURIMAC', N'ANDAHUAYLAS', N'HUANCARAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030306', N'03', N'03', N'06', N'APURIMAC', N'ANDAHUAYLAS', N'KISHUARA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030307', N'03', N'03', N'07', N'APURIMAC', N'ANDAHUAYLAS', N'PACOBAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030308', N'03', N'03', N'08', N'APURIMAC', N'ANDAHUAYLAS', N'PAMPACHIRI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030309', N'03', N'03', N'09', N'APURIMAC', N'ANDAHUAYLAS', N'SAN ANTONIO DE CACHI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030310', N'03', N'03', N'10', N'APURIMAC', N'ANDAHUAYLAS', N'SAN JERONIMO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030311', N'03', N'03', N'11', N'APURIMAC', N'ANDAHUAYLAS', N'TALAVERA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030312', N'03', N'03', N'12', N'APURIMAC', N'ANDAHUAYLAS', N'TURPO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030313', N'03', N'03', N'13', N'APURIMAC', N'ANDAHUAYLAS', N'PACUCHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030314', N'03', N'03', N'14', N'APURIMAC', N'ANDAHUAYLAS', N'POMACOCHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030315', N'03', N'03', N'15', N'APURIMAC', N'ANDAHUAYLAS', N'SANTA MARIA DE CHICMO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030316', N'03', N'03', N'16', N'APURIMAC', N'ANDAHUAYLAS', N'TUMAY HUARACA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030317', N'03', N'03', N'17', N'APURIMAC', N'ANDAHUAYLAS', N'HUAYANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030318', N'03', N'03', N'18', N'APURIMAC', N'ANDAHUAYLAS', N'SAN MIGUEL DE CHACCRAMPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030319', N'03', N'03', N'19', N'APURIMAC', N'ANDAHUAYLAS', N'KAQUIABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030401', N'03', N'04', N'01', N'APURIMAC', N'ANTABAMBA', N'ANTABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030402', N'03', N'04', N'02', N'APURIMAC', N'ANTABAMBA', N'EL ORO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030403', N'03', N'04', N'03', N'APURIMAC', N'ANTABAMBA', N'HUAQUIRCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030404', N'03', N'04', N'04', N'APURIMAC', N'ANTABAMBA', N'JUAN ESPINOZA MEDRANO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030405', N'03', N'04', N'05', N'APURIMAC', N'ANTABAMBA', N'OROPESA', NULL)
GO
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030406', N'03', N'04', N'06', N'APURIMAC', N'ANTABAMBA', N'PACHACONAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030407', N'03', N'04', N'07', N'APURIMAC', N'ANTABAMBA', N'SABAINO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030501', N'03', N'05', N'01', N'APURIMAC', N'COTABAMBAS', N'TAMBOBAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030502', N'03', N'05', N'02', N'APURIMAC', N'COTABAMBAS', N'COYLLURQUI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030503', N'03', N'05', N'03', N'APURIMAC', N'COTABAMBAS', N'COTABAMBAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030504', N'03', N'05', N'04', N'APURIMAC', N'COTABAMBAS', N'HAQUIRA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030505', N'03', N'05', N'05', N'APURIMAC', N'COTABAMBAS', N'MARA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030506', N'03', N'05', N'06', N'APURIMAC', N'COTABAMBAS', N'CHALLHUAHUACHO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030601', N'03', N'06', N'01', N'APURIMAC', N'GRAU', N'CHUQUIBAMBILLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030602', N'03', N'06', N'02', N'APURIMAC', N'GRAU', N'CURPAHUASI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030603', N'03', N'06', N'03', N'APURIMAC', N'GRAU', N'HUAILLATI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030604', N'03', N'06', N'04', N'APURIMAC', N'GRAU', N'MAMARA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030605', N'03', N'06', N'05', N'APURIMAC', N'GRAU', N'MARISCAL GAMARRA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030606', N'03', N'06', N'06', N'APURIMAC', N'GRAU', N'MICAELA BASTIDAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030607', N'03', N'06', N'07', N'APURIMAC', N'GRAU', N'PROGRESO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030608', N'03', N'06', N'08', N'APURIMAC', N'GRAU', N'PATAYPAMPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030609', N'03', N'06', N'09', N'APURIMAC', N'GRAU', N'SAN ANTONIO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030610', N'03', N'06', N'10', N'APURIMAC', N'GRAU', N'TURPAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030611', N'03', N'06', N'11', N'APURIMAC', N'GRAU', N'VILCABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030612', N'03', N'06', N'12', N'APURIMAC', N'GRAU', N'VIRUNDO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030613', N'03', N'06', N'13', N'APURIMAC', N'GRAU', N'SANTA ROSA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030614', N'03', N'06', N'14', N'APURIMAC', N'GRAU', N'CURASCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030701', N'03', N'07', N'01', N'APURIMAC', N'CHINCHEROS', N'CHINCHEROS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030702', N'03', N'07', N'02', N'APURIMAC', N'CHINCHEROS', N'ONGOY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030703', N'03', N'07', N'03', N'APURIMAC', N'CHINCHEROS', N'OCOBAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030704', N'03', N'07', N'04', N'APURIMAC', N'CHINCHEROS', N'COCHARCAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030705', N'03', N'07', N'05', N'APURIMAC', N'CHINCHEROS', N'ANCO HUALLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030706', N'03', N'07', N'06', N'APURIMAC', N'CHINCHEROS', N'HUACCANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030707', N'03', N'07', N'07', N'APURIMAC', N'CHINCHEROS', N'URANMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'030708', N'03', N'07', N'08', N'APURIMAC', N'CHINCHEROS', N'RANRACANCHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040101', N'04', N'01', N'01', N'AREQUIPA', N'AREQUIPA', N'AREQUIPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040102', N'04', N'01', N'02', N'AREQUIPA', N'AREQUIPA', N'CAYMA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040103', N'04', N'01', N'03', N'AREQUIPA', N'AREQUIPA', N'CERRO COLORADO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040104', N'04', N'01', N'04', N'AREQUIPA', N'AREQUIPA', N'CHARACATO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040105', N'04', N'01', N'05', N'AREQUIPA', N'AREQUIPA', N'CHIGUATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040106', N'04', N'01', N'06', N'AREQUIPA', N'AREQUIPA', N'LA JOYA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040107', N'04', N'01', N'07', N'AREQUIPA', N'AREQUIPA', N'MIRAFLORES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040108', N'04', N'01', N'08', N'AREQUIPA', N'AREQUIPA', N'MOLLEBAYA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040109', N'04', N'01', N'09', N'AREQUIPA', N'AREQUIPA', N'PAUCARPATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040110', N'04', N'01', N'10', N'AREQUIPA', N'AREQUIPA', N'POCSI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040111', N'04', N'01', N'11', N'AREQUIPA', N'AREQUIPA', N'POLOBAYA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040112', N'04', N'01', N'12', N'AREQUIPA', N'AREQUIPA', N'QUEQUEÑA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040113', N'04', N'01', N'13', N'AREQUIPA', N'AREQUIPA', N'SABANDIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040114', N'04', N'01', N'14', N'AREQUIPA', N'AREQUIPA', N'SACHACA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040115', N'04', N'01', N'15', N'AREQUIPA', N'AREQUIPA', N'SAN JUAN DE SIGUAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040116', N'04', N'01', N'16', N'AREQUIPA', N'AREQUIPA', N'SAN JUAN DE TARUCANI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040117', N'04', N'01', N'17', N'AREQUIPA', N'AREQUIPA', N'SANTA ISABEL DE SIGUAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040118', N'04', N'01', N'18', N'AREQUIPA', N'AREQUIPA', N'SANTA RITA DE SIHUAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040119', N'04', N'01', N'19', N'AREQUIPA', N'AREQUIPA', N'SOCABAYA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040120', N'04', N'01', N'20', N'AREQUIPA', N'AREQUIPA', N'TIABAYA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040121', N'04', N'01', N'21', N'AREQUIPA', N'AREQUIPA', N'UCHUMAYO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040122', N'04', N'01', N'22', N'AREQUIPA', N'AREQUIPA', N'VITOR', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040123', N'04', N'01', N'23', N'AREQUIPA', N'AREQUIPA', N'YANAHUARA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040124', N'04', N'01', N'24', N'AREQUIPA', N'AREQUIPA', N'YARABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040125', N'04', N'01', N'25', N'AREQUIPA', N'AREQUIPA', N'YURA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040126', N'04', N'01', N'26', N'AREQUIPA', N'AREQUIPA', N'MARIANO MELGAR', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040127', N'04', N'01', N'27', N'AREQUIPA', N'AREQUIPA', N'JACOBO HUNTER', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040128', N'04', N'01', N'28', N'AREQUIPA', N'AREQUIPA', N'ALTO SELVA ALEGRE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040129', N'04', N'01', N'29', N'AREQUIPA', N'AREQUIPA', N'JOSE LUIS BUSTAMANTE Y RIVERO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040201', N'04', N'02', N'01', N'AREQUIPA', N'CAYLLOMA', N'CHIVAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040202', N'04', N'02', N'02', N'AREQUIPA', N'CAYLLOMA', N'ACHOMA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040203', N'04', N'02', N'03', N'AREQUIPA', N'CAYLLOMA', N'CABANACONDE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040204', N'04', N'02', N'04', N'AREQUIPA', N'CAYLLOMA', N'CAYLLOMA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040205', N'04', N'02', N'05', N'AREQUIPA', N'CAYLLOMA', N'CALLALLI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040206', N'04', N'02', N'06', N'AREQUIPA', N'CAYLLOMA', N'COPORAQUE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040207', N'04', N'02', N'07', N'AREQUIPA', N'CAYLLOMA', N'HUAMBO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040208', N'04', N'02', N'08', N'AREQUIPA', N'CAYLLOMA', N'HUANCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040209', N'04', N'02', N'09', N'AREQUIPA', N'CAYLLOMA', N'ICHUPAMPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040210', N'04', N'02', N'10', N'AREQUIPA', N'CAYLLOMA', N'LARI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040211', N'04', N'02', N'11', N'AREQUIPA', N'CAYLLOMA', N'LLUTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040212', N'04', N'02', N'12', N'AREQUIPA', N'CAYLLOMA', N'MACA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040213', N'04', N'02', N'13', N'AREQUIPA', N'CAYLLOMA', N'MADRIGAL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040214', N'04', N'02', N'14', N'AREQUIPA', N'CAYLLOMA', N'SAN ANTONIO DE CHUCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040215', N'04', N'02', N'15', N'AREQUIPA', N'CAYLLOMA', N'SIBAYO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040216', N'04', N'02', N'16', N'AREQUIPA', N'CAYLLOMA', N'TAPAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040217', N'04', N'02', N'17', N'AREQUIPA', N'CAYLLOMA', N'TISCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040218', N'04', N'02', N'18', N'AREQUIPA', N'CAYLLOMA', N'TUTI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040219', N'04', N'02', N'19', N'AREQUIPA', N'CAYLLOMA', N'YANQUE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040220', N'04', N'02', N'20', N'AREQUIPA', N'CAYLLOMA', N'MAJES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040301', N'04', N'03', N'01', N'AREQUIPA', N'CAMANA', N'CAMANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040302', N'04', N'03', N'02', N'AREQUIPA', N'CAMANA', N'JOSE MARIA QUIMPER', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040303', N'04', N'03', N'03', N'AREQUIPA', N'CAMANA', N'MARIANO NICOLAS VALCARCEL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040304', N'04', N'03', N'04', N'AREQUIPA', N'CAMANA', N'MARISCAL CACERES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040305', N'04', N'03', N'05', N'AREQUIPA', N'CAMANA', N'NICOLAS DE PIEROLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040306', N'04', N'03', N'06', N'AREQUIPA', N'CAMANA', N'OCOÑA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040307', N'04', N'03', N'07', N'AREQUIPA', N'CAMANA', N'QUILCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040308', N'04', N'03', N'08', N'AREQUIPA', N'CAMANA', N'SAMUEL PASTOR', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040401', N'04', N'04', N'01', N'AREQUIPA', N'CARAVELI', N'CARAVELI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040402', N'04', N'04', N'02', N'AREQUIPA', N'CARAVELI', N'ACARI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040403', N'04', N'04', N'03', N'AREQUIPA', N'CARAVELI', N'ATICO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040404', N'04', N'04', N'04', N'AREQUIPA', N'CARAVELI', N'ATIQUIPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040405', N'04', N'04', N'05', N'AREQUIPA', N'CARAVELI', N'BELLA UNION', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040406', N'04', N'04', N'06', N'AREQUIPA', N'CARAVELI', N'CAHUACHO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040407', N'04', N'04', N'07', N'AREQUIPA', N'CARAVELI', N'CHALA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040408', N'04', N'04', N'08', N'AREQUIPA', N'CARAVELI', N'CHAPARRA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040409', N'04', N'04', N'09', N'AREQUIPA', N'CARAVELI', N'HUANUHUANU', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040410', N'04', N'04', N'10', N'AREQUIPA', N'CARAVELI', N'JAQUI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040411', N'04', N'04', N'11', N'AREQUIPA', N'CARAVELI', N'LOMAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040412', N'04', N'04', N'12', N'AREQUIPA', N'CARAVELI', N'QUICACHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040413', N'04', N'04', N'13', N'AREQUIPA', N'CARAVELI', N'YAUCA', NULL)
GO
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040501', N'04', N'05', N'01', N'AREQUIPA', N'CASTILLA', N'APLAO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040502', N'04', N'05', N'02', N'AREQUIPA', N'CASTILLA', N'ANDAGUA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040503', N'04', N'05', N'03', N'AREQUIPA', N'CASTILLA', N'AYO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040504', N'04', N'05', N'04', N'AREQUIPA', N'CASTILLA', N'CHACHAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040505', N'04', N'05', N'05', N'AREQUIPA', N'CASTILLA', N'CHILCAYMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040506', N'04', N'05', N'06', N'AREQUIPA', N'CASTILLA', N'CHOCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040507', N'04', N'05', N'07', N'AREQUIPA', N'CASTILLA', N'HUANCARQUI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040508', N'04', N'05', N'08', N'AREQUIPA', N'CASTILLA', N'MACHAGUAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040509', N'04', N'05', N'09', N'AREQUIPA', N'CASTILLA', N'ORCOPAMPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040510', N'04', N'05', N'10', N'AREQUIPA', N'CASTILLA', N'PAMPACOLCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040511', N'04', N'05', N'11', N'AREQUIPA', N'CASTILLA', N'TIPAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040512', N'04', N'05', N'12', N'AREQUIPA', N'CASTILLA', N'URACA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040513', N'04', N'05', N'13', N'AREQUIPA', N'CASTILLA', N'UÑON', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040514', N'04', N'05', N'14', N'AREQUIPA', N'CASTILLA', N'VIRACO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040601', N'04', N'06', N'01', N'AREQUIPA', N'CONDESUYOS', N'CHUQUIBAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040602', N'04', N'06', N'02', N'AREQUIPA', N'CONDESUYOS', N'ANDARAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040603', N'04', N'06', N'03', N'AREQUIPA', N'CONDESUYOS', N'CAYARANI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040604', N'04', N'06', N'04', N'AREQUIPA', N'CONDESUYOS', N'CHICHAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040605', N'04', N'06', N'05', N'AREQUIPA', N'CONDESUYOS', N'IRAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040606', N'04', N'06', N'06', N'AREQUIPA', N'CONDESUYOS', N'SALAMANCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040607', N'04', N'06', N'07', N'AREQUIPA', N'CONDESUYOS', N'YANAQUIHUA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040608', N'04', N'06', N'08', N'AREQUIPA', N'CONDESUYOS', N'RIO GRANDE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040701', N'04', N'07', N'01', N'AREQUIPA', N'ISLAY', N'MOLLENDO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040702', N'04', N'07', N'02', N'AREQUIPA', N'ISLAY', N'COCACHACRA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040703', N'04', N'07', N'03', N'AREQUIPA', N'ISLAY', N'DEAN VALDIVIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040704', N'04', N'07', N'04', N'AREQUIPA', N'ISLAY', N'ISLAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040705', N'04', N'07', N'05', N'AREQUIPA', N'ISLAY', N'MEJIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040706', N'04', N'07', N'06', N'AREQUIPA', N'ISLAY', N'PUNTA DE BOMBON', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040801', N'04', N'08', N'01', N'AREQUIPA', N'LA UNION', N'COTAHUASI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040802', N'04', N'08', N'02', N'AREQUIPA', N'LA UNION', N'ALCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040803', N'04', N'08', N'03', N'AREQUIPA', N'LA UNION', N'CHARCANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040804', N'04', N'08', N'04', N'AREQUIPA', N'LA UNION', N'HUAYNACOTAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040805', N'04', N'08', N'05', N'AREQUIPA', N'LA UNION', N'PAMPAMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040806', N'04', N'08', N'06', N'AREQUIPA', N'LA UNION', N'PUYCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040807', N'04', N'08', N'07', N'AREQUIPA', N'LA UNION', N'QUECHUALLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040808', N'04', N'08', N'08', N'AREQUIPA', N'LA UNION', N'SAYLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040809', N'04', N'08', N'09', N'AREQUIPA', N'LA UNION', N'TAURIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040810', N'04', N'08', N'10', N'AREQUIPA', N'LA UNION', N'TOMEPAMPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'040811', N'04', N'08', N'11', N'AREQUIPA', N'LA UNION', N'TORO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050101', N'05', N'01', N'01', N'AYACUCHO', N'HUAMANGA', N'AYACUCHO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050102', N'05', N'01', N'02', N'AYACUCHO', N'HUAMANGA', N'ACOS VINCHOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050103', N'05', N'01', N'03', N'AYACUCHO', N'HUAMANGA', N'CARMEN ALTO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050104', N'05', N'01', N'04', N'AYACUCHO', N'HUAMANGA', N'CHIARA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050105', N'05', N'01', N'05', N'AYACUCHO', N'HUAMANGA', N'QUINUA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050106', N'05', N'01', N'06', N'AYACUCHO', N'HUAMANGA', N'SAN JOSE DE TICLLAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050107', N'05', N'01', N'07', N'AYACUCHO', N'HUAMANGA', N'SAN JUAN BAUTISTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050108', N'05', N'01', N'08', N'AYACUCHO', N'HUAMANGA', N'SANTIAGO DE PISCHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050109', N'05', N'01', N'09', N'AYACUCHO', N'HUAMANGA', N'VINCHOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050110', N'05', N'01', N'10', N'AYACUCHO', N'HUAMANGA', N'TAMBILLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050111', N'05', N'01', N'11', N'AYACUCHO', N'HUAMANGA', N'ACOCRO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050112', N'05', N'01', N'12', N'AYACUCHO', N'HUAMANGA', N'SOCOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050113', N'05', N'01', N'13', N'AYACUCHO', N'HUAMANGA', N'OCROS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050114', N'05', N'01', N'14', N'AYACUCHO', N'HUAMANGA', N'PACAYCASA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050115', N'05', N'01', N'15', N'AYACUCHO', N'HUAMANGA', N'JESUS NAZARENO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050201', N'05', N'02', N'01', N'AYACUCHO', N'CANGALLO', N'CANGALLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050204', N'05', N'02', N'04', N'AYACUCHO', N'CANGALLO', N'CHUSCHI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050206', N'05', N'02', N'06', N'AYACUCHO', N'CANGALLO', N'LOS MOROCHUCOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050207', N'05', N'02', N'07', N'AYACUCHO', N'CANGALLO', N'PARAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050208', N'05', N'02', N'08', N'AYACUCHO', N'CANGALLO', N'TOTOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050211', N'05', N'02', N'11', N'AYACUCHO', N'CANGALLO', N'MARIA PARADO DE BELLIDO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050301', N'05', N'03', N'01', N'AYACUCHO', N'HUANTA', N'HUANTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050302', N'05', N'03', N'02', N'AYACUCHO', N'HUANTA', N'AYAHUANCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050303', N'05', N'03', N'03', N'AYACUCHO', N'HUANTA', N'HUAMANGUILLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050304', N'05', N'03', N'04', N'AYACUCHO', N'HUANTA', N'IGUAIN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050305', N'05', N'03', N'05', N'AYACUCHO', N'HUANTA', N'LURICOCHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050307', N'05', N'03', N'07', N'AYACUCHO', N'HUANTA', N'SANTILLANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050308', N'05', N'03', N'08', N'AYACUCHO', N'HUANTA', N'SIVIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050309', N'05', N'03', N'09', N'AYACUCHO', N'HUANTA', N'LLOCHEGUA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050401', N'05', N'04', N'01', N'AYACUCHO', N'LA MAR', N'SAN MIGUEL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050402', N'05', N'04', N'02', N'AYACUCHO', N'LA MAR', N'ANCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050403', N'05', N'04', N'03', N'AYACUCHO', N'LA MAR', N'AYNA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050404', N'05', N'04', N'04', N'AYACUCHO', N'LA MAR', N'CHILCAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050405', N'05', N'04', N'05', N'AYACUCHO', N'LA MAR', N'CHUNGUI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050406', N'05', N'04', N'06', N'AYACUCHO', N'LA MAR', N'TAMBO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050407', N'05', N'04', N'07', N'AYACUCHO', N'LA MAR', N'LUIS CARRANZA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050408', N'05', N'04', N'08', N'AYACUCHO', N'LA MAR', N'SANTA ROSA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050409', N'05', N'04', N'09', N'AYACUCHO', N'LA MAR', N'SAMUGARI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050501', N'05', N'05', N'01', N'AYACUCHO', N'LUCANAS', N'PUQUIO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050502', N'05', N'05', N'02', N'AYACUCHO', N'LUCANAS', N'AUCARA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050503', N'05', N'05', N'03', N'AYACUCHO', N'LUCANAS', N'CABANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050504', N'05', N'05', N'04', N'AYACUCHO', N'LUCANAS', N'CARMEN SALCEDO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050506', N'05', N'05', N'06', N'AYACUCHO', N'LUCANAS', N'CHAVIÑA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050508', N'05', N'05', N'08', N'AYACUCHO', N'LUCANAS', N'CHIPAO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050510', N'05', N'05', N'10', N'AYACUCHO', N'LUCANAS', N'HUAC-HUAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050511', N'05', N'05', N'11', N'AYACUCHO', N'LUCANAS', N'LARAMATE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050512', N'05', N'05', N'12', N'AYACUCHO', N'LUCANAS', N'LEONCIO PRADO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050513', N'05', N'05', N'13', N'AYACUCHO', N'LUCANAS', N'LUCANAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050514', N'05', N'05', N'14', N'AYACUCHO', N'LUCANAS', N'LLAUTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050516', N'05', N'05', N'16', N'AYACUCHO', N'LUCANAS', N'OCAÑA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050517', N'05', N'05', N'17', N'AYACUCHO', N'LUCANAS', N'OTOCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050520', N'05', N'05', N'20', N'AYACUCHO', N'LUCANAS', N'SANCOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050521', N'05', N'05', N'21', N'AYACUCHO', N'LUCANAS', N'SAN JUAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050522', N'05', N'05', N'22', N'AYACUCHO', N'LUCANAS', N'SAN PEDRO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050524', N'05', N'05', N'24', N'AYACUCHO', N'LUCANAS', N'SANTA ANA DE HUAYCAHUACHO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050525', N'05', N'05', N'25', N'AYACUCHO', N'LUCANAS', N'SANTA LUCIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050529', N'05', N'05', N'29', N'AYACUCHO', N'LUCANAS', N'SAISA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050531', N'05', N'05', N'31', N'AYACUCHO', N'LUCANAS', N'SAN PEDRO DE PALCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050532', N'05', N'05', N'32', N'AYACUCHO', N'LUCANAS', N'SAN CRISTOBAL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050601', N'05', N'06', N'01', N'AYACUCHO', N'PARINACOCHAS', N'CORACORA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050604', N'05', N'06', N'04', N'AYACUCHO', N'PARINACOCHAS', N'CORONEL CASTAÑEDA', NULL)
GO
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050605', N'05', N'06', N'05', N'AYACUCHO', N'PARINACOCHAS', N'CHUMPI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050608', N'05', N'06', N'08', N'AYACUCHO', N'PARINACOCHAS', N'PACAPAUSA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050611', N'05', N'06', N'11', N'AYACUCHO', N'PARINACOCHAS', N'PULLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050612', N'05', N'06', N'12', N'AYACUCHO', N'PARINACOCHAS', N'PUYUSCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050615', N'05', N'06', N'15', N'AYACUCHO', N'PARINACOCHAS', N'SAN FRANCISCO DE RAVACAYCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050616', N'05', N'06', N'16', N'AYACUCHO', N'PARINACOCHAS', N'UPAHUACHO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050701', N'05', N'07', N'01', N'AYACUCHO', N'VICTOR FAJARDO', N'HUANCAPI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050702', N'05', N'07', N'02', N'AYACUCHO', N'VICTOR FAJARDO', N'ALCAMENCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050703', N'05', N'07', N'03', N'AYACUCHO', N'VICTOR FAJARDO', N'APONGO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050704', N'05', N'07', N'04', N'AYACUCHO', N'VICTOR FAJARDO', N'CANARIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050706', N'05', N'07', N'06', N'AYACUCHO', N'VICTOR FAJARDO', N'CAYARA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050707', N'05', N'07', N'07', N'AYACUCHO', N'VICTOR FAJARDO', N'COLCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050708', N'05', N'07', N'08', N'AYACUCHO', N'VICTOR FAJARDO', N'HUALLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050709', N'05', N'07', N'09', N'AYACUCHO', N'VICTOR FAJARDO', N'HUAMANQUIQUIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050710', N'05', N'07', N'10', N'AYACUCHO', N'VICTOR FAJARDO', N'HUANCARAYLLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050713', N'05', N'07', N'13', N'AYACUCHO', N'VICTOR FAJARDO', N'SARHUA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050714', N'05', N'07', N'14', N'AYACUCHO', N'VICTOR FAJARDO', N'VILCANCHOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050715', N'05', N'07', N'15', N'AYACUCHO', N'VICTOR FAJARDO', N'ASQUIPATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050801', N'05', N'08', N'01', N'AYACUCHO', N'HUANCA SANCOS', N'SANCOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050802', N'05', N'08', N'02', N'AYACUCHO', N'HUANCA SANCOS', N'SACSAMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050803', N'05', N'08', N'03', N'AYACUCHO', N'HUANCA SANCOS', N'SANTIAGO DE LUCANAMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050804', N'05', N'08', N'04', N'AYACUCHO', N'HUANCA SANCOS', N'CARAPO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050901', N'05', N'09', N'01', N'AYACUCHO', N'VILCAS HUAMAN', N'VILCAS HUAMAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050902', N'05', N'09', N'02', N'AYACUCHO', N'VILCAS HUAMAN', N'VISCHONGO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050903', N'05', N'09', N'03', N'AYACUCHO', N'VILCAS HUAMAN', N'ACCOMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050904', N'05', N'09', N'04', N'AYACUCHO', N'VILCAS HUAMAN', N'CARHUANCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050905', N'05', N'09', N'05', N'AYACUCHO', N'VILCAS HUAMAN', N'CONCEPCION', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050906', N'05', N'09', N'06', N'AYACUCHO', N'VILCAS HUAMAN', N'HUAMBALPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050907', N'05', N'09', N'07', N'AYACUCHO', N'VILCAS HUAMAN', N'SAURAMA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'050908', N'05', N'09', N'08', N'AYACUCHO', N'VILCAS HUAMAN', N'INDEPENDENCIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'051001', N'05', N'10', N'01', N'AYACUCHO', N'PAUCAR DEL SARA SARA', N'PAUSA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'051002', N'05', N'10', N'02', N'AYACUCHO', N'PAUCAR DEL SARA SARA', N'COLTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'051003', N'05', N'10', N'03', N'AYACUCHO', N'PAUCAR DEL SARA SARA', N'CORCULLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'051004', N'05', N'10', N'04', N'AYACUCHO', N'PAUCAR DEL SARA SARA', N'LAMPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'051005', N'05', N'10', N'05', N'AYACUCHO', N'PAUCAR DEL SARA SARA', N'MARCABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'051006', N'05', N'10', N'06', N'AYACUCHO', N'PAUCAR DEL SARA SARA', N'OYOLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'051007', N'05', N'10', N'07', N'AYACUCHO', N'PAUCAR DEL SARA SARA', N'PARARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'051008', N'05', N'10', N'08', N'AYACUCHO', N'PAUCAR DEL SARA SARA', N'SAN JAVIER DE ALPABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'051009', N'05', N'10', N'09', N'AYACUCHO', N'PAUCAR DEL SARA SARA', N'SAN JOSE DE USHUA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'051010', N'05', N'10', N'10', N'AYACUCHO', N'PAUCAR DEL SARA SARA', N'SARA SARA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'051101', N'05', N'11', N'01', N'AYACUCHO', N'SUCRE', N'QUEROBAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'051102', N'05', N'11', N'02', N'AYACUCHO', N'SUCRE', N'BELEN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'051103', N'05', N'11', N'03', N'AYACUCHO', N'SUCRE', N'CHALCOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'051104', N'05', N'11', N'04', N'AYACUCHO', N'SUCRE', N'SAN SALVADOR DE QUIJE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'051105', N'05', N'11', N'05', N'AYACUCHO', N'SUCRE', N'PAICO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'051106', N'05', N'11', N'06', N'AYACUCHO', N'SUCRE', N'SANTIAGO DE PAUCARAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'051107', N'05', N'11', N'07', N'AYACUCHO', N'SUCRE', N'SAN PEDRO DE LARCAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'051108', N'05', N'11', N'08', N'AYACUCHO', N'SUCRE', N'SORAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'051109', N'05', N'11', N'09', N'AYACUCHO', N'SUCRE', N'HUACAÑA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'051110', N'05', N'11', N'10', N'AYACUCHO', N'SUCRE', N'CHILCAYOC', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'051111', N'05', N'11', N'11', N'AYACUCHO', N'SUCRE', N'MORCOLLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060101', N'06', N'01', N'01', N'CAJAMARCA', N'CAJAMARCA', N'CAJAMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060102', N'06', N'01', N'02', N'CAJAMARCA', N'CAJAMARCA', N'ASUNCION', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060103', N'06', N'01', N'03', N'CAJAMARCA', N'CAJAMARCA', N'COSPAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060104', N'06', N'01', N'04', N'CAJAMARCA', N'CAJAMARCA', N'CHETILLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060105', N'06', N'01', N'05', N'CAJAMARCA', N'CAJAMARCA', N'ENCAÑADA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060106', N'06', N'01', N'06', N'CAJAMARCA', N'CAJAMARCA', N'JESUS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060107', N'06', N'01', N'07', N'CAJAMARCA', N'CAJAMARCA', N'LOS BAÑOS DEL INCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060108', N'06', N'01', N'08', N'CAJAMARCA', N'CAJAMARCA', N'LLACANORA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060109', N'06', N'01', N'09', N'CAJAMARCA', N'CAJAMARCA', N'MAGDALENA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060110', N'06', N'01', N'10', N'CAJAMARCA', N'CAJAMARCA', N'MATARA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060111', N'06', N'01', N'11', N'CAJAMARCA', N'CAJAMARCA', N'NAMORA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060112', N'06', N'01', N'12', N'CAJAMARCA', N'CAJAMARCA', N'SAN JUAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060201', N'06', N'02', N'01', N'CAJAMARCA', N'CAJABAMBA', N'CAJABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060202', N'06', N'02', N'02', N'CAJAMARCA', N'CAJABAMBA', N'CACHACHI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060203', N'06', N'02', N'03', N'CAJAMARCA', N'CAJABAMBA', N'CONDEBAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060205', N'06', N'02', N'05', N'CAJAMARCA', N'CAJABAMBA', N'SITACOCHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060301', N'06', N'03', N'01', N'CAJAMARCA', N'CELENDIN', N'CELENDIN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060302', N'06', N'03', N'02', N'CAJAMARCA', N'CELENDIN', N'CORTEGANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060303', N'06', N'03', N'03', N'CAJAMARCA', N'CELENDIN', N'CHUMUCH', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060304', N'06', N'03', N'04', N'CAJAMARCA', N'CELENDIN', N'HUASMIN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060305', N'06', N'03', N'05', N'CAJAMARCA', N'CELENDIN', N'JORGE CHAVEZ', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060306', N'06', N'03', N'06', N'CAJAMARCA', N'CELENDIN', N'JOSE GALVEZ', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060307', N'06', N'03', N'07', N'CAJAMARCA', N'CELENDIN', N'MIGUEL IGLESIAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060308', N'06', N'03', N'08', N'CAJAMARCA', N'CELENDIN', N'OXAMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060309', N'06', N'03', N'09', N'CAJAMARCA', N'CELENDIN', N'SOROCHUCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060310', N'06', N'03', N'10', N'CAJAMARCA', N'CELENDIN', N'SUCRE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060311', N'06', N'03', N'11', N'CAJAMARCA', N'CELENDIN', N'UTCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060312', N'06', N'03', N'12', N'CAJAMARCA', N'CELENDIN', N'LA LIBERTAD DE PALLAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060401', N'06', N'04', N'01', N'CAJAMARCA', N'CONTUMAZA', N'CONTUMAZA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060403', N'06', N'04', N'03', N'CAJAMARCA', N'CONTUMAZA', N'CHILETE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060404', N'06', N'04', N'04', N'CAJAMARCA', N'CONTUMAZA', N'GUZMANGO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060405', N'06', N'04', N'05', N'CAJAMARCA', N'CONTUMAZA', N'SAN BENITO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060406', N'06', N'04', N'06', N'CAJAMARCA', N'CONTUMAZA', N'CUPISNIQUE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060407', N'06', N'04', N'07', N'CAJAMARCA', N'CONTUMAZA', N'TANTARICA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060408', N'06', N'04', N'08', N'CAJAMARCA', N'CONTUMAZA', N'YONAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060409', N'06', N'04', N'09', N'CAJAMARCA', N'CONTUMAZA', N'SANTA CRUZ DE TOLED', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060501', N'06', N'05', N'01', N'CAJAMARCA', N'CUTERVO', N'CUTERVO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060502', N'06', N'05', N'02', N'CAJAMARCA', N'CUTERVO', N'CALLAYUC', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060503', N'06', N'05', N'03', N'CAJAMARCA', N'CUTERVO', N'CUJILLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060504', N'06', N'05', N'04', N'CAJAMARCA', N'CUTERVO', N'CHOROS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060505', N'06', N'05', N'05', N'CAJAMARCA', N'CUTERVO', N'LA RAMADA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060506', N'06', N'05', N'06', N'CAJAMARCA', N'CUTERVO', N'PIMPINGOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060507', N'06', N'05', N'07', N'CAJAMARCA', N'CUTERVO', N'QUEROCOTILLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060508', N'06', N'05', N'08', N'CAJAMARCA', N'CUTERVO', N'SAN ANDRES DE CUTERVO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060509', N'06', N'05', N'09', N'CAJAMARCA', N'CUTERVO', N'SAN JUAN DE CUTERVO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060510', N'06', N'05', N'10', N'CAJAMARCA', N'CUTERVO', N'SAN LUIS DE LUCMA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060511', N'06', N'05', N'11', N'CAJAMARCA', N'CUTERVO', N'SANTA CRUZ', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060512', N'06', N'05', N'12', N'CAJAMARCA', N'CUTERVO', N'SANTO DOMINGO DE LA CAPILLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060513', N'06', N'05', N'13', N'CAJAMARCA', N'CUTERVO', N'SANTO TOMAS', NULL)
GO
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060514', N'06', N'05', N'14', N'CAJAMARCA', N'CUTERVO', N'SOCOTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060515', N'06', N'05', N'15', N'CAJAMARCA', N'CUTERVO', N'TORIBIO CASANOVA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060601', N'06', N'06', N'01', N'CAJAMARCA', N'CHOTA', N'CHOTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060602', N'06', N'06', N'02', N'CAJAMARCA', N'CHOTA', N'ANGUIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060603', N'06', N'06', N'03', N'CAJAMARCA', N'CHOTA', N'COCHABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060604', N'06', N'06', N'04', N'CAJAMARCA', N'CHOTA', N'CONCHAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060605', N'06', N'06', N'05', N'CAJAMARCA', N'CHOTA', N'CHADIN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060606', N'06', N'06', N'06', N'CAJAMARCA', N'CHOTA', N'CHIGUIRIP', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060607', N'06', N'06', N'07', N'CAJAMARCA', N'CHOTA', N'CHIMBAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060608', N'06', N'06', N'08', N'CAJAMARCA', N'CHOTA', N'HUAMBOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060609', N'06', N'06', N'09', N'CAJAMARCA', N'CHOTA', N'LAJAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060610', N'06', N'06', N'10', N'CAJAMARCA', N'CHOTA', N'LLAMA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060611', N'06', N'06', N'11', N'CAJAMARCA', N'CHOTA', N'MIRACOSTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060612', N'06', N'06', N'12', N'CAJAMARCA', N'CHOTA', N'PACCHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060613', N'06', N'06', N'13', N'CAJAMARCA', N'CHOTA', N'PION', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060614', N'06', N'06', N'14', N'CAJAMARCA', N'CHOTA', N'QUEROCOTO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060615', N'06', N'06', N'15', N'CAJAMARCA', N'CHOTA', N'TACABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060616', N'06', N'06', N'16', N'CAJAMARCA', N'CHOTA', N'TOCMOCHE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060617', N'06', N'06', N'17', N'CAJAMARCA', N'CHOTA', N'SAN JUAN DE LICUPIS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060618', N'06', N'06', N'18', N'CAJAMARCA', N'CHOTA', N'CHOROPAMPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060619', N'06', N'06', N'19', N'CAJAMARCA', N'CHOTA', N'CHALAMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060701', N'06', N'07', N'01', N'CAJAMARCA', N'HUALGAYOC', N'BAMBAMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060702', N'06', N'07', N'02', N'CAJAMARCA', N'HUALGAYOC', N'CHUGUR', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060703', N'06', N'07', N'03', N'CAJAMARCA', N'HUALGAYOC', N'HUALGAYOC', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060801', N'06', N'08', N'01', N'CAJAMARCA', N'JAEN', N'JAEN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060802', N'06', N'08', N'02', N'CAJAMARCA', N'JAEN', N'BELLAVISTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060803', N'06', N'08', N'03', N'CAJAMARCA', N'JAEN', N'COLASAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060804', N'06', N'08', N'04', N'CAJAMARCA', N'JAEN', N'CHONTALI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060805', N'06', N'08', N'05', N'CAJAMARCA', N'JAEN', N'POMAHUACA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060806', N'06', N'08', N'06', N'CAJAMARCA', N'JAEN', N'PUCARA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060807', N'06', N'08', N'07', N'CAJAMARCA', N'JAEN', N'SALLIQUE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060808', N'06', N'08', N'08', N'CAJAMARCA', N'JAEN', N'SAN FELIPE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060809', N'06', N'08', N'09', N'CAJAMARCA', N'JAEN', N'SAN JOSE DEL ALTO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060810', N'06', N'08', N'10', N'CAJAMARCA', N'JAEN', N'SANTA ROSA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060811', N'06', N'08', N'11', N'CAJAMARCA', N'JAEN', N'LAS PIRIAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060812', N'06', N'08', N'12', N'CAJAMARCA', N'JAEN', N'HUABAL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060901', N'06', N'09', N'01', N'CAJAMARCA', N'SANTA CRUZ', N'SANTA CRUZ', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060902', N'06', N'09', N'02', N'CAJAMARCA', N'SANTA CRUZ', N'CATACHE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060903', N'06', N'09', N'03', N'CAJAMARCA', N'SANTA CRUZ', N'CHANCAYBAÑOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060904', N'06', N'09', N'04', N'CAJAMARCA', N'SANTA CRUZ', N'LA ESPERANZA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060905', N'06', N'09', N'05', N'CAJAMARCA', N'SANTA CRUZ', N'NINABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060906', N'06', N'09', N'06', N'CAJAMARCA', N'SANTA CRUZ', N'PULAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060907', N'06', N'09', N'07', N'CAJAMARCA', N'SANTA CRUZ', N'SEXI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060908', N'06', N'09', N'08', N'CAJAMARCA', N'SANTA CRUZ', N'UTICYACU', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060909', N'06', N'09', N'09', N'CAJAMARCA', N'SANTA CRUZ', N'YAUYUCAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060910', N'06', N'09', N'10', N'CAJAMARCA', N'SANTA CRUZ', N'ANDABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'060911', N'06', N'09', N'11', N'CAJAMARCA', N'SANTA CRUZ', N'SAUCEPAMPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061001', N'06', N'10', N'01', N'CAJAMARCA', N'SAN MIGUEL', N'SAN MIGUEL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061002', N'06', N'10', N'02', N'CAJAMARCA', N'SAN MIGUEL', N'CALQUIS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061003', N'06', N'10', N'03', N'CAJAMARCA', N'SAN MIGUEL', N'LA FLORIDA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061004', N'06', N'10', N'04', N'CAJAMARCA', N'SAN MIGUEL', N'LLAPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061005', N'06', N'10', N'05', N'CAJAMARCA', N'SAN MIGUEL', N'NANCHOC', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061006', N'06', N'10', N'06', N'CAJAMARCA', N'SAN MIGUEL', N'NIEPOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061007', N'06', N'10', N'07', N'CAJAMARCA', N'SAN MIGUEL', N'SAN GREGORIO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061008', N'06', N'10', N'08', N'CAJAMARCA', N'SAN MIGUEL', N'SAN SILVESTRE DE COCHAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061009', N'06', N'10', N'09', N'CAJAMARCA', N'SAN MIGUEL', N'EL PRADO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061010', N'06', N'10', N'10', N'CAJAMARCA', N'SAN MIGUEL', N'UNION AGUA BLANCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061011', N'06', N'10', N'11', N'CAJAMARCA', N'SAN MIGUEL', N'TONGOD', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061012', N'06', N'10', N'12', N'CAJAMARCA', N'SAN MIGUEL', N'CATILLUC', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061013', N'06', N'10', N'13', N'CAJAMARCA', N'SAN MIGUEL', N'BOLIVAR', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061101', N'06', N'11', N'01', N'CAJAMARCA', N'SAN IGNACIO', N'SAN IGNACIO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061102', N'06', N'11', N'02', N'CAJAMARCA', N'SAN IGNACIO', N'CHIRINOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061103', N'06', N'11', N'03', N'CAJAMARCA', N'SAN IGNACIO', N'HUARANGO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061104', N'06', N'11', N'04', N'CAJAMARCA', N'SAN IGNACIO', N'NAMBALLE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061105', N'06', N'11', N'05', N'CAJAMARCA', N'SAN IGNACIO', N'LA COIPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061106', N'06', N'11', N'06', N'CAJAMARCA', N'SAN IGNACIO', N'SAN JOSE DE LOURDES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061107', N'06', N'11', N'07', N'CAJAMARCA', N'SAN IGNACIO', N'TABACONAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061201', N'06', N'12', N'01', N'CAJAMARCA', N'SAN MARCOS', N'PEDRO GALVEZ', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061202', N'06', N'12', N'02', N'CAJAMARCA', N'SAN MARCOS', N'ICHOCAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061203', N'06', N'12', N'03', N'CAJAMARCA', N'SAN MARCOS', N'GREGORIO PITA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061204', N'06', N'12', N'04', N'CAJAMARCA', N'SAN MARCOS', N'JOSE MANUEL QUIROZ', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061205', N'06', N'12', N'05', N'CAJAMARCA', N'SAN MARCOS', N'EDUARDO VILLANUEVA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061206', N'06', N'12', N'06', N'CAJAMARCA', N'SAN MARCOS', N'JOSE SABOGAL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061207', N'06', N'12', N'07', N'CAJAMARCA', N'SAN MARCOS', N'CHANCAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061301', N'06', N'13', N'01', N'CAJAMARCA', N'SAN PABLO', N'SAN PABLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061302', N'06', N'13', N'02', N'CAJAMARCA', N'SAN PABLO', N'SAN BERNARDINO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061303', N'06', N'13', N'03', N'CAJAMARCA', N'SAN PABLO', N'SAN LUIS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'061304', N'06', N'13', N'04', N'CAJAMARCA', N'SAN PABLO', N'TUMBADEN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070101', N'07', N'01', N'01', N'CUSCO', N'CUSCO', N'CUSCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070102', N'07', N'01', N'02', N'CUSCO', N'CUSCO', N'CCORCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070103', N'07', N'01', N'03', N'CUSCO', N'CUSCO', N'POROY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070104', N'07', N'01', N'04', N'CUSCO', N'CUSCO', N'SAN JERONIMO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070105', N'07', N'01', N'05', N'CUSCO', N'CUSCO', N'SAN SEBASTIAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070106', N'07', N'01', N'06', N'CUSCO', N'CUSCO', N'SANTIAGO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070107', N'07', N'01', N'07', N'CUSCO', N'CUSCO', N'SAYLLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070108', N'07', N'01', N'08', N'CUSCO', N'CUSCO', N'WANCHAQ', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070201', N'07', N'02', N'01', N'CUSCO', N'ACOMAYO', N'ACOMAYO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070202', N'07', N'02', N'02', N'CUSCO', N'ACOMAYO', N'ACOPIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070203', N'07', N'02', N'03', N'CUSCO', N'ACOMAYO', N'ACOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070204', N'07', N'02', N'04', N'CUSCO', N'ACOMAYO', N'POMACANCHI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070205', N'07', N'02', N'05', N'CUSCO', N'ACOMAYO', N'RONDOCAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070206', N'07', N'02', N'06', N'CUSCO', N'ACOMAYO', N'SANGARARA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070207', N'07', N'02', N'07', N'CUSCO', N'ACOMAYO', N'MOSOC LLACTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070301', N'07', N'03', N'01', N'CUSCO', N'ANTA', N'ANTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070302', N'07', N'03', N'02', N'CUSCO', N'ANTA', N'CHINCHAYPUJIO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070303', N'07', N'03', N'03', N'CUSCO', N'ANTA', N'HUAROCONDO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070304', N'07', N'03', N'04', N'CUSCO', N'ANTA', N'LIMATAMBO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070305', N'07', N'03', N'05', N'CUSCO', N'ANTA', N'MOLLEPATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070306', N'07', N'03', N'06', N'CUSCO', N'ANTA', N'PUCYURA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070307', N'07', N'03', N'07', N'CUSCO', N'ANTA', N'ZURITE', NULL)
GO
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070308', N'07', N'03', N'08', N'CUSCO', N'ANTA', N'CACHIMAYO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070309', N'07', N'03', N'09', N'CUSCO', N'ANTA', N'ANCAHUASI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070401', N'07', N'04', N'01', N'CUSCO', N'CALCA', N'CALCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070402', N'07', N'04', N'02', N'CUSCO', N'CALCA', N'COYA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070403', N'07', N'04', N'03', N'CUSCO', N'CALCA', N'LAMAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070404', N'07', N'04', N'04', N'CUSCO', N'CALCA', N'LARES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070405', N'07', N'04', N'05', N'CUSCO', N'CALCA', N'PISAC', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070406', N'07', N'04', N'06', N'CUSCO', N'CALCA', N'SAN SALVADOR', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070407', N'07', N'04', N'07', N'CUSCO', N'CALCA', N'TARAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070408', N'07', N'04', N'08', N'CUSCO', N'CALCA', N'YANATILE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070501', N'07', N'05', N'01', N'CUSCO', N'CANAS', N'YANAOCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070502', N'07', N'05', N'02', N'CUSCO', N'CANAS', N'CHECCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070503', N'07', N'05', N'03', N'CUSCO', N'CANAS', N'KUNTURKANKI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070504', N'07', N'05', N'04', N'CUSCO', N'CANAS', N'LANGUI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070505', N'07', N'05', N'05', N'CUSCO', N'CANAS', N'LAYO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070506', N'07', N'05', N'06', N'CUSCO', N'CANAS', N'PAMPAMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070507', N'07', N'05', N'07', N'CUSCO', N'CANAS', N'QUEHUE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070508', N'07', N'05', N'08', N'CUSCO', N'CANAS', N'TUPAC AMARU', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070601', N'07', N'06', N'01', N'CUSCO', N'CANCHIS', N'SICUANI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070602', N'07', N'06', N'02', N'CUSCO', N'CANCHIS', N'COMBAPATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070603', N'07', N'06', N'03', N'CUSCO', N'CANCHIS', N'CHECACUPE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070604', N'07', N'06', N'04', N'CUSCO', N'CANCHIS', N'MARANGANI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070605', N'07', N'06', N'05', N'CUSCO', N'CANCHIS', N'PITUMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070606', N'07', N'06', N'06', N'CUSCO', N'CANCHIS', N'SAN PABLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070607', N'07', N'06', N'07', N'CUSCO', N'CANCHIS', N'SAN PEDRO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070608', N'07', N'06', N'08', N'CUSCO', N'CANCHIS', N'TINTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070701', N'07', N'07', N'01', N'CUSCO', N'CHUMBIVILCAS', N'SANTO TOMAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070702', N'07', N'07', N'02', N'CUSCO', N'CHUMBIVILCAS', N'CAPACMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070703', N'07', N'07', N'03', N'CUSCO', N'CHUMBIVILCAS', N'COLQUEMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070704', N'07', N'07', N'04', N'CUSCO', N'CHUMBIVILCAS', N'CHAMACA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070705', N'07', N'07', N'05', N'CUSCO', N'CHUMBIVILCAS', N'LIVITACA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070706', N'07', N'07', N'06', N'CUSCO', N'CHUMBIVILCAS', N'LLUSCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070707', N'07', N'07', N'07', N'CUSCO', N'CHUMBIVILCAS', N'QUIÑOTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070708', N'07', N'07', N'08', N'CUSCO', N'CHUMBIVILCAS', N'VELILLE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070801', N'07', N'08', N'01', N'CUSCO', N'ESPINAR', N'ESPINAR', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070802', N'07', N'08', N'02', N'CUSCO', N'ESPINAR', N'CONDOROMA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070803', N'07', N'08', N'03', N'CUSCO', N'ESPINAR', N'COPORAQUE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070804', N'07', N'08', N'04', N'CUSCO', N'ESPINAR', N'OCORURO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070805', N'07', N'08', N'05', N'CUSCO', N'ESPINAR', N'PALLPATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070806', N'07', N'08', N'06', N'CUSCO', N'ESPINAR', N'PICHIGUA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070807', N'07', N'08', N'07', N'CUSCO', N'ESPINAR', N'SUYCKUTAMBO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070808', N'07', N'08', N'08', N'CUSCO', N'ESPINAR', N'ALTO PICHIGUA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070901', N'07', N'09', N'01', N'CUSCO', N'LA CONVENCION', N'SANTA ANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070902', N'07', N'09', N'02', N'CUSCO', N'LA CONVENCION', N'ECHARATE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070903', N'07', N'09', N'03', N'CUSCO', N'LA CONVENCION', N'HUAYOPATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070904', N'07', N'09', N'04', N'CUSCO', N'LA CONVENCION', N'MARANURA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070905', N'07', N'09', N'05', N'CUSCO', N'LA CONVENCION', N'OCOBAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070906', N'07', N'09', N'06', N'CUSCO', N'LA CONVENCION', N'SANTA TERESA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070907', N'07', N'09', N'07', N'CUSCO', N'LA CONVENCION', N'VILCABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070908', N'07', N'09', N'08', N'CUSCO', N'LA CONVENCION', N'QUELLOUNO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070909', N'07', N'09', N'09', N'CUSCO', N'LA CONVENCION', N'KIMBIRI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'070910', N'07', N'09', N'10', N'CUSCO', N'LA CONVENCION', N'PICHARI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071001', N'07', N'10', N'01', N'CUSCO', N'PARURO', N'PARURO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071002', N'07', N'10', N'02', N'CUSCO', N'PARURO', N'ACCHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071003', N'07', N'10', N'03', N'CUSCO', N'PARURO', N'CCAPI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071004', N'07', N'10', N'04', N'CUSCO', N'PARURO', N'COLCHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071005', N'07', N'10', N'05', N'CUSCO', N'PARURO', N'HUANOQUITE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071006', N'07', N'10', N'06', N'CUSCO', N'PARURO', N'OMACHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071007', N'07', N'10', N'07', N'CUSCO', N'PARURO', N'YAURISQUE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071008', N'07', N'10', N'08', N'CUSCO', N'PARURO', N'PACCARITAMBO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071009', N'07', N'10', N'09', N'CUSCO', N'PARURO', N'PILLPINTO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071101', N'07', N'11', N'01', N'CUSCO', N'PAUCARTAMBO', N'PAUCARTAMBO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071102', N'07', N'11', N'02', N'CUSCO', N'PAUCARTAMBO', N'CAICAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071103', N'07', N'11', N'03', N'CUSCO', N'PAUCARTAMBO', N'COLQUEPATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071104', N'07', N'11', N'04', N'CUSCO', N'PAUCARTAMBO', N'CHALLABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071105', N'07', N'11', N'05', N'CUSCO', N'PAUCARTAMBO', N'KOSÑIPATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071106', N'07', N'11', N'06', N'CUSCO', N'PAUCARTAMBO', N'HUANCARANI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071201', N'07', N'12', N'01', N'CUSCO', N'QUISPICANCHI', N'URCOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071202', N'07', N'12', N'02', N'CUSCO', N'QUISPICANCHI', N'ANDAHUAYLILLAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071203', N'07', N'12', N'03', N'CUSCO', N'QUISPICANCHI', N'CAMANTI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071204', N'07', N'12', N'04', N'CUSCO', N'QUISPICANCHI', N'CCARHUAYO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071205', N'07', N'12', N'05', N'CUSCO', N'QUISPICANCHI', N'CCATCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071206', N'07', N'12', N'06', N'CUSCO', N'QUISPICANCHI', N'CUSIPATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071207', N'07', N'12', N'07', N'CUSCO', N'QUISPICANCHI', N'HUARO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071208', N'07', N'12', N'08', N'CUSCO', N'QUISPICANCHI', N'LUCRE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071209', N'07', N'12', N'09', N'CUSCO', N'QUISPICANCHI', N'MARCAPATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071210', N'07', N'12', N'10', N'CUSCO', N'QUISPICANCHI', N'OCONGATE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071211', N'07', N'12', N'11', N'CUSCO', N'QUISPICANCHI', N'OROPESA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071212', N'07', N'12', N'12', N'CUSCO', N'QUISPICANCHI', N'QUIQUIJANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071301', N'07', N'13', N'01', N'CUSCO', N'URUBAMBA', N'URUBAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071302', N'07', N'13', N'02', N'CUSCO', N'URUBAMBA', N'CHINCHERO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071303', N'07', N'13', N'03', N'CUSCO', N'URUBAMBA', N'HUAYLLABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071304', N'07', N'13', N'04', N'CUSCO', N'URUBAMBA', N'MACHUPICCHU', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071305', N'07', N'13', N'05', N'CUSCO', N'URUBAMBA', N'MARAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071306', N'07', N'13', N'06', N'CUSCO', N'URUBAMBA', N'OLLANTAYTAMBO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'071307', N'07', N'13', N'07', N'CUSCO', N'URUBAMBA', N'YUCAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080101', N'08', N'01', N'01', N'HUANCAVELICA', N'HUANCAVELICA', N'HUANCAVELICA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080102', N'08', N'01', N'02', N'HUANCAVELICA', N'HUANCAVELICA', N'ACOBAMBILLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080103', N'08', N'01', N'03', N'HUANCAVELICA', N'HUANCAVELICA', N'ACORIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080104', N'08', N'01', N'04', N'HUANCAVELICA', N'HUANCAVELICA', N'CONAYCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080105', N'08', N'01', N'05', N'HUANCAVELICA', N'HUANCAVELICA', N'CUENCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080106', N'08', N'01', N'06', N'HUANCAVELICA', N'HUANCAVELICA', N'HUACHOCOLPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080108', N'08', N'01', N'08', N'HUANCAVELICA', N'HUANCAVELICA', N'HUAYLLAHUARA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080109', N'08', N'01', N'09', N'HUANCAVELICA', N'HUANCAVELICA', N'IZCUCHACA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080110', N'08', N'01', N'10', N'HUANCAVELICA', N'HUANCAVELICA', N'LARIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080111', N'08', N'01', N'11', N'HUANCAVELICA', N'HUANCAVELICA', N'MANTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080112', N'08', N'01', N'12', N'HUANCAVELICA', N'HUANCAVELICA', N'MARISCAL CACERES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080113', N'08', N'01', N'13', N'HUANCAVELICA', N'HUANCAVELICA', N'MOYA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080114', N'08', N'01', N'14', N'HUANCAVELICA', N'HUANCAVELICA', N'NUEVO OCCORO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080115', N'08', N'01', N'15', N'HUANCAVELICA', N'HUANCAVELICA', N'PALCA', NULL)
GO
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080116', N'08', N'01', N'16', N'HUANCAVELICA', N'HUANCAVELICA', N'PILCHACA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080117', N'08', N'01', N'17', N'HUANCAVELICA', N'HUANCAVELICA', N'VILCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080118', N'08', N'01', N'18', N'HUANCAVELICA', N'HUANCAVELICA', N'YAULI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080119', N'08', N'01', N'19', N'HUANCAVELICA', N'HUANCAVELICA', N'ASCENSION', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080120', N'08', N'01', N'20', N'HUANCAVELICA', N'HUANCAVELICA', N'HUANDO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080201', N'08', N'02', N'01', N'HUANCAVELICA', N'ACOBAMBA', N'ACOBAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080202', N'08', N'02', N'02', N'HUANCAVELICA', N'ACOBAMBA', N'ANTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080203', N'08', N'02', N'03', N'HUANCAVELICA', N'ACOBAMBA', N'ANDABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080204', N'08', N'02', N'04', N'HUANCAVELICA', N'ACOBAMBA', N'CAJA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080205', N'08', N'02', N'05', N'HUANCAVELICA', N'ACOBAMBA', N'MARCAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080206', N'08', N'02', N'06', N'HUANCAVELICA', N'ACOBAMBA', N'PAUCARA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080207', N'08', N'02', N'07', N'HUANCAVELICA', N'ACOBAMBA', N'POMACOCHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080208', N'08', N'02', N'08', N'HUANCAVELICA', N'ACOBAMBA', N'ROSARIO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080301', N'08', N'03', N'01', N'HUANCAVELICA', N'ANGARAES', N'LIRCAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080302', N'08', N'03', N'02', N'HUANCAVELICA', N'ANGARAES', N'ANCHONGA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080303', N'08', N'03', N'03', N'HUANCAVELICA', N'ANGARAES', N'CALLANMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080304', N'08', N'03', N'04', N'HUANCAVELICA', N'ANGARAES', N'CONGALLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080305', N'08', N'03', N'05', N'HUANCAVELICA', N'ANGARAES', N'CHINCHO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080306', N'08', N'03', N'06', N'HUANCAVELICA', N'ANGARAES', N'HUALLAY-GRANDE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080307', N'08', N'03', N'07', N'HUANCAVELICA', N'ANGARAES', N'HUANCA-HUANCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080308', N'08', N'03', N'08', N'HUANCAVELICA', N'ANGARAES', N'JULCAMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080309', N'08', N'03', N'09', N'HUANCAVELICA', N'ANGARAES', N'SAN ANTONIO DE ANTAPARCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080310', N'08', N'03', N'10', N'HUANCAVELICA', N'ANGARAES', N'SANTO TOMAS DE PATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080311', N'08', N'03', N'11', N'HUANCAVELICA', N'ANGARAES', N'SECCLLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080312', N'08', N'03', N'12', N'HUANCAVELICA', N'ANGARAES', N'CCOCHACCASA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080401', N'08', N'04', N'01', N'HUANCAVELICA', N'CASTROVIRREYNA', N'CASTROVIRREYNA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080402', N'08', N'04', N'02', N'HUANCAVELICA', N'CASTROVIRREYNA', N'ARMA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080403', N'08', N'04', N'03', N'HUANCAVELICA', N'CASTROVIRREYNA', N'AURAHUA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080405', N'08', N'04', N'05', N'HUANCAVELICA', N'CASTROVIRREYNA', N'CAPILLAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080406', N'08', N'04', N'06', N'HUANCAVELICA', N'CASTROVIRREYNA', N'COCAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080408', N'08', N'04', N'08', N'HUANCAVELICA', N'CASTROVIRREYNA', N'CHUPAMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080409', N'08', N'04', N'09', N'HUANCAVELICA', N'CASTROVIRREYNA', N'HUACHOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080410', N'08', N'04', N'10', N'HUANCAVELICA', N'CASTROVIRREYNA', N'HUAMATAMBO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080414', N'08', N'04', N'14', N'HUANCAVELICA', N'CASTROVIRREYNA', N'MOLLEPAMPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080422', N'08', N'04', N'22', N'HUANCAVELICA', N'CASTROVIRREYNA', N'SAN JUAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080427', N'08', N'04', N'27', N'HUANCAVELICA', N'CASTROVIRREYNA', N'TANTARA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080428', N'08', N'04', N'28', N'HUANCAVELICA', N'CASTROVIRREYNA', N'TICRAPO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080429', N'08', N'04', N'29', N'HUANCAVELICA', N'CASTROVIRREYNA', N'SANTA ANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080501', N'08', N'05', N'01', N'HUANCAVELICA', N'TAYACAJA', N'PAMPAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080502', N'08', N'05', N'02', N'HUANCAVELICA', N'TAYACAJA', N'ACOSTAMBO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080503', N'08', N'05', N'03', N'HUANCAVELICA', N'TAYACAJA', N'ACRAQUIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080504', N'08', N'05', N'04', N'HUANCAVELICA', N'TAYACAJA', N'AHUAYCHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080506', N'08', N'05', N'06', N'HUANCAVELICA', N'TAYACAJA', N'COLCABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080509', N'08', N'05', N'09', N'HUANCAVELICA', N'TAYACAJA', N'DANIEL HERNANDEZ', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080511', N'08', N'05', N'11', N'HUANCAVELICA', N'TAYACAJA', N'HUACHOCOLPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080512', N'08', N'05', N'12', N'HUANCAVELICA', N'TAYACAJA', N'HUARIBAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080515', N'08', N'05', N'15', N'HUANCAVELICA', N'TAYACAJA', N'ÑAHUIMPUQUIO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080517', N'08', N'05', N'17', N'HUANCAVELICA', N'TAYACAJA', N'PAZOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080518', N'08', N'05', N'18', N'HUANCAVELICA', N'TAYACAJA', N'QUISHUAR', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080519', N'08', N'05', N'19', N'HUANCAVELICA', N'TAYACAJA', N'SALCABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080520', N'08', N'05', N'20', N'HUANCAVELICA', N'TAYACAJA', N'SAN MARCOS DE ROCCHAC', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080523', N'08', N'05', N'23', N'HUANCAVELICA', N'TAYACAJA', N'SURCUBAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080525', N'08', N'05', N'25', N'HUANCAVELICA', N'TAYACAJA', N'TINTAY PUNCU', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080526', N'08', N'05', N'26', N'HUANCAVELICA', N'TAYACAJA', N'SALCAHUASI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080601', N'08', N'06', N'01', N'HUANCAVELICA', N'HUAYTARA', N'AYAVI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080602', N'08', N'06', N'02', N'HUANCAVELICA', N'HUAYTARA', N'CORDOVA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080603', N'08', N'06', N'03', N'HUANCAVELICA', N'HUAYTARA', N'HUAYACUNDO ARMA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080604', N'08', N'06', N'04', N'HUANCAVELICA', N'HUAYTARA', N'HUAYTARA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080605', N'08', N'06', N'05', N'HUANCAVELICA', N'HUAYTARA', N'LARAMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080606', N'08', N'06', N'06', N'HUANCAVELICA', N'HUAYTARA', N'OCOYO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080607', N'08', N'06', N'07', N'HUANCAVELICA', N'HUAYTARA', N'PILPICHACA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080608', N'08', N'06', N'08', N'HUANCAVELICA', N'HUAYTARA', N'QUERCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080609', N'08', N'06', N'09', N'HUANCAVELICA', N'HUAYTARA', N'QUITO ARMA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080610', N'08', N'06', N'10', N'HUANCAVELICA', N'HUAYTARA', N'SAN ANTONIO DE CUSICANCHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080611', N'08', N'06', N'11', N'HUANCAVELICA', N'HUAYTARA', N'SAN FRANCISCO DE SANGAYAICO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080612', N'08', N'06', N'12', N'HUANCAVELICA', N'HUAYTARA', N'SAN ISIDRO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080613', N'08', N'06', N'13', N'HUANCAVELICA', N'HUAYTARA', N'SANTIAGO DE CHOCORVOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080614', N'08', N'06', N'14', N'HUANCAVELICA', N'HUAYTARA', N'SANTIAGO DE QUIRAHUARA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080615', N'08', N'06', N'15', N'HUANCAVELICA', N'HUAYTARA', N'SANTO DOMINGO DE CAPILLAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080616', N'08', N'06', N'16', N'HUANCAVELICA', N'HUAYTARA', N'TAMBO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080701', N'08', N'07', N'01', N'HUANCAVELICA', N'CHURCAMPA', N'CHURCAMPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080702', N'08', N'07', N'02', N'HUANCAVELICA', N'CHURCAMPA', N'ANCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080703', N'08', N'07', N'03', N'HUANCAVELICA', N'CHURCAMPA', N'CHINCHIHUASI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080704', N'08', N'07', N'04', N'HUANCAVELICA', N'CHURCAMPA', N'EL CARMEN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080705', N'08', N'07', N'05', N'HUANCAVELICA', N'CHURCAMPA', N'LA MERCED', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080706', N'08', N'07', N'06', N'HUANCAVELICA', N'CHURCAMPA', N'LOCROJA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080707', N'08', N'07', N'07', N'HUANCAVELICA', N'CHURCAMPA', N'PAUCARBAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080708', N'08', N'07', N'08', N'HUANCAVELICA', N'CHURCAMPA', N'SAN MIGUEL DE MAYOCC', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080709', N'08', N'07', N'09', N'HUANCAVELICA', N'CHURCAMPA', N'SAN PEDRO DE CORIS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080710', N'08', N'07', N'10', N'HUANCAVELICA', N'CHURCAMPA', N'PACHAMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'080711', N'08', N'07', N'11', N'HUANCAVELICA', N'CHURCAMPA', N'COSME', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090101', N'09', N'01', N'01', N'HUANUCO', N'HUANUCO', N'HUANUCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090102', N'09', N'01', N'02', N'HUANUCO', N'HUANUCO', N'CHINCHAO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090103', N'09', N'01', N'03', N'HUANUCO', N'HUANUCO', N'CHURUBAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090104', N'09', N'01', N'04', N'HUANUCO', N'HUANUCO', N'MARGOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090105', N'09', N'01', N'05', N'HUANUCO', N'HUANUCO', N'QUISQUI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090106', N'09', N'01', N'06', N'HUANUCO', N'HUANUCO', N'SAN FRANCISCO DE CAYRAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090107', N'09', N'01', N'07', N'HUANUCO', N'HUANUCO', N'SAN PEDRO DE CHAULAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090108', N'09', N'01', N'08', N'HUANUCO', N'HUANUCO', N'SANTA MARIA DEL VALLE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090109', N'09', N'01', N'09', N'HUANUCO', N'HUANUCO', N'YARUMAYO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090110', N'09', N'01', N'10', N'HUANUCO', N'HUANUCO', N'AMARILIS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090111', N'09', N'01', N'11', N'HUANUCO', N'HUANUCO', N'PILLCO MARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090112', N'09', N'01', N'12', N'HUANUCO', N'HUANUCO', N'YACUS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090201', N'09', N'02', N'01', N'HUANUCO', N'AMBO', N'AMBO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090202', N'09', N'02', N'02', N'HUANUCO', N'AMBO', N'CAYNA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090203', N'09', N'02', N'03', N'HUANUCO', N'AMBO', N'COLPAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090204', N'09', N'02', N'04', N'HUANUCO', N'AMBO', N'CONCHAMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090205', N'09', N'02', N'05', N'HUANUCO', N'AMBO', N'HUACAR', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090206', N'09', N'02', N'06', N'HUANUCO', N'AMBO', N'SAN FRANCISCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090207', N'09', N'02', N'07', N'HUANUCO', N'AMBO', N'SAN RAFAEL', NULL)
GO
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090208', N'09', N'02', N'08', N'HUANUCO', N'AMBO', N'TOMAY-KICHWA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090301', N'09', N'03', N'01', N'HUANUCO', N'DOS DE MAYO', N'LA UNION', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090307', N'09', N'03', N'07', N'HUANUCO', N'DOS DE MAYO', N'CHUQUIS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090312', N'09', N'03', N'12', N'HUANUCO', N'DOS DE MAYO', N'MARIAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090314', N'09', N'03', N'14', N'HUANUCO', N'DOS DE MAYO', N'PACHAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090316', N'09', N'03', N'16', N'HUANUCO', N'DOS DE MAYO', N'QUIVILLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090317', N'09', N'03', N'17', N'HUANUCO', N'DOS DE MAYO', N'RIPAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090321', N'09', N'03', N'21', N'HUANUCO', N'DOS DE MAYO', N'SHUNQUI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090322', N'09', N'03', N'22', N'HUANUCO', N'DOS DE MAYO', N'SILLAPATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090323', N'09', N'03', N'23', N'HUANUCO', N'DOS DE MAYO', N'YANAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090401', N'09', N'04', N'01', N'HUANUCO', N'HUAMALIES', N'LLATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090402', N'09', N'04', N'02', N'HUANUCO', N'HUAMALIES', N'ARANCAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090403', N'09', N'04', N'03', N'HUANUCO', N'HUAMALIES', N'CHAVIN DE PARIARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090404', N'09', N'04', N'04', N'HUANUCO', N'HUAMALIES', N'JACAS GRANDE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090405', N'09', N'04', N'05', N'HUANUCO', N'HUAMALIES', N'JIRCAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090406', N'09', N'04', N'06', N'HUANUCO', N'HUAMALIES', N'MIRAFLORES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090407', N'09', N'04', N'07', N'HUANUCO', N'HUAMALIES', N'MONZON', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090408', N'09', N'04', N'08', N'HUANUCO', N'HUAMALIES', N'PUNCHAO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090409', N'09', N'04', N'09', N'HUANUCO', N'HUAMALIES', N'PUÑOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090410', N'09', N'04', N'10', N'HUANUCO', N'HUAMALIES', N'SINGA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090411', N'09', N'04', N'11', N'HUANUCO', N'HUAMALIES', N'TANTAMAYO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090501', N'09', N'05', N'01', N'HUANUCO', N'MARAÑON', N'HUACRACHUCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090502', N'09', N'05', N'02', N'HUANUCO', N'MARAÑON', N'CHOLON', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090505', N'09', N'05', N'05', N'HUANUCO', N'MARAÑON', N'SAN BUENAVENTURA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090601', N'09', N'06', N'01', N'HUANUCO', N'LEONCIO PRADO', N'RUPA-RUPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090602', N'09', N'06', N'02', N'HUANUCO', N'LEONCIO PRADO', N'DANIEL ALOMIA ROBLES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090603', N'09', N'06', N'03', N'HUANUCO', N'LEONCIO PRADO', N'HERMILIO VALDIZAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090604', N'09', N'06', N'04', N'HUANUCO', N'LEONCIO PRADO', N'LUYANDO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090605', N'09', N'06', N'05', N'HUANUCO', N'LEONCIO PRADO', N'MARIANO DAMASO BERAUN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090606', N'09', N'06', N'06', N'HUANUCO', N'LEONCIO PRADO', N'JOSE CRESPO Y CASTILLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090701', N'09', N'07', N'01', N'HUANUCO', N'PACHITEA', N'PANAO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090702', N'09', N'07', N'02', N'HUANUCO', N'PACHITEA', N'CHAGLLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090704', N'09', N'07', N'04', N'HUANUCO', N'PACHITEA', N'MOLINO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090706', N'09', N'07', N'06', N'HUANUCO', N'PACHITEA', N'UMARI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090801', N'09', N'08', N'01', N'HUANUCO', N'PUERTO INCA', N'HONORIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090802', N'09', N'08', N'02', N'HUANUCO', N'PUERTO INCA', N'PUERTO INCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090803', N'09', N'08', N'03', N'HUANUCO', N'PUERTO INCA', N'CODO DEL POZUZO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090804', N'09', N'08', N'04', N'HUANUCO', N'PUERTO INCA', N'TOURNAVISTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090805', N'09', N'08', N'05', N'HUANUCO', N'PUERTO INCA', N'YUYAPICHIS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090901', N'09', N'09', N'01', N'HUANUCO', N'HUACAYBAMBA', N'HUACAYBAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090902', N'09', N'09', N'02', N'HUANUCO', N'HUACAYBAMBA', N'PINRA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090903', N'09', N'09', N'03', N'HUANUCO', N'HUACAYBAMBA', N'CANCHABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'090904', N'09', N'09', N'04', N'HUANUCO', N'HUACAYBAMBA', N'COCHABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'091001', N'09', N'10', N'01', N'HUANUCO', N'LAURICOCHA', N'JESUS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'091002', N'09', N'10', N'02', N'HUANUCO', N'LAURICOCHA', N'BAÑOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'091003', N'09', N'10', N'03', N'HUANUCO', N'LAURICOCHA', N'SAN FRANCISCO DE ASIS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'091004', N'09', N'10', N'04', N'HUANUCO', N'LAURICOCHA', N'QUEROPALCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'091005', N'09', N'10', N'05', N'HUANUCO', N'LAURICOCHA', N'SAN MIGUEL DE CAURI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'091006', N'09', N'10', N'06', N'HUANUCO', N'LAURICOCHA', N'RONDOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'091007', N'09', N'10', N'07', N'HUANUCO', N'LAURICOCHA', N'JIVIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'091101', N'09', N'11', N'01', N'HUANUCO', N'YAROWILCA', N'CHAVINILLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'091102', N'09', N'11', N'02', N'HUANUCO', N'YAROWILCA', N'APARICIO POMARES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'091103', N'09', N'11', N'03', N'HUANUCO', N'YAROWILCA', N'CAHUAC', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'091104', N'09', N'11', N'04', N'HUANUCO', N'YAROWILCA', N'CHACABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'091105', N'09', N'11', N'05', N'HUANUCO', N'YAROWILCA', N'JACAS CHICO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'091106', N'09', N'11', N'06', N'HUANUCO', N'YAROWILCA', N'OBAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'091107', N'09', N'11', N'07', N'HUANUCO', N'YAROWILCA', N'PAMPAMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'091108', N'09', N'11', N'08', N'HUANUCO', N'YAROWILCA', N'CHORAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100101', N'10', N'01', N'01', N'ICA', N'ICA', N'ICA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100102', N'10', N'01', N'02', N'ICA', N'ICA', N'LA TINGUIÑA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100103', N'10', N'01', N'03', N'ICA', N'ICA', N'LOS AQUIJES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100104', N'10', N'01', N'04', N'ICA', N'ICA', N'PARCONA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100105', N'10', N'01', N'05', N'ICA', N'ICA', N'PUEBLO NUEVO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100106', N'10', N'01', N'06', N'ICA', N'ICA', N'SALAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100107', N'10', N'01', N'07', N'ICA', N'ICA', N'SAN JOSE DE LOS MOLINOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100108', N'10', N'01', N'08', N'ICA', N'ICA', N'SAN JUAN BAUTISTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100109', N'10', N'01', N'09', N'ICA', N'ICA', N'SANTIAGO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100110', N'10', N'01', N'10', N'ICA', N'ICA', N'SUBTANJALLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100111', N'10', N'01', N'11', N'ICA', N'ICA', N'YAUCA DEL ROSARIO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100112', N'10', N'01', N'12', N'ICA', N'ICA', N'TATE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100113', N'10', N'01', N'13', N'ICA', N'ICA', N'PACHACUTEC', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100114', N'10', N'01', N'14', N'ICA', N'ICA', N'OCUCAJE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100201', N'10', N'02', N'01', N'ICA', N'CHINCHA', N'CHINCHA ALTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100202', N'10', N'02', N'02', N'ICA', N'CHINCHA', N'CHAVIN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100203', N'10', N'02', N'03', N'ICA', N'CHINCHA', N'CHINCHA BAJA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100204', N'10', N'02', N'04', N'ICA', N'CHINCHA', N'EL CARMEN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100205', N'10', N'02', N'05', N'ICA', N'CHINCHA', N'GROCIO PRADO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100206', N'10', N'02', N'06', N'ICA', N'CHINCHA', N'SAN PEDRO DE HUACARPANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100207', N'10', N'02', N'07', N'ICA', N'CHINCHA', N'SUNAMPE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100208', N'10', N'02', N'08', N'ICA', N'CHINCHA', N'TAMBO DE MORA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100209', N'10', N'02', N'09', N'ICA', N'CHINCHA', N'ALTO LARAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100210', N'10', N'02', N'10', N'ICA', N'CHINCHA', N'PUEBLO NUEVO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100211', N'10', N'02', N'11', N'ICA', N'CHINCHA', N'SAN JUAN DE YANAC', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100301', N'10', N'03', N'01', N'ICA', N'NAZCA', N'NAZCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100302', N'10', N'03', N'02', N'ICA', N'NAZCA', N'CHANGUILLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100303', N'10', N'03', N'03', N'ICA', N'NAZCA', N'EL INGENIO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100304', N'10', N'03', N'04', N'ICA', N'NAZCA', N'MARCONA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100305', N'10', N'03', N'05', N'ICA', N'NAZCA', N'VISTA ALEGRE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100401', N'10', N'04', N'01', N'ICA', N'PISCO', N'PISCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100402', N'10', N'04', N'02', N'ICA', N'PISCO', N'HUANCANO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100403', N'10', N'04', N'03', N'ICA', N'PISCO', N'HUMAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100404', N'10', N'04', N'04', N'ICA', N'PISCO', N'INDEPENDENCIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100405', N'10', N'04', N'05', N'ICA', N'PISCO', N'PARACAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100406', N'10', N'04', N'06', N'ICA', N'PISCO', N'SAN ANDRES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100407', N'10', N'04', N'07', N'ICA', N'PISCO', N'SAN CLEMENTE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100408', N'10', N'04', N'08', N'ICA', N'PISCO', N'TUPAC AMARU INCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100501', N'10', N'05', N'01', N'ICA', N'PALPA', N'PALPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100502', N'10', N'05', N'02', N'ICA', N'PALPA', N'LLIPATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100503', N'10', N'05', N'03', N'ICA', N'PALPA', N'RIO GRANDE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100504', N'10', N'05', N'04', N'ICA', N'PALPA', N'SANTA CRUZ', NULL)
GO
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'100505', N'10', N'05', N'05', N'ICA', N'PALPA', N'TIBILLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110101', N'11', N'01', N'01', N'JUNIN', N'HUANCAYO', N'HUANCAYO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110103', N'11', N'01', N'03', N'JUNIN', N'HUANCAYO', N'CARHUACALLANGA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110104', N'11', N'01', N'04', N'JUNIN', N'HUANCAYO', N'COLCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110105', N'11', N'01', N'05', N'JUNIN', N'HUANCAYO', N'CULLHUAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110106', N'11', N'01', N'06', N'JUNIN', N'HUANCAYO', N'CHACAPAMPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110107', N'11', N'01', N'07', N'JUNIN', N'HUANCAYO', N'CHICCHE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110108', N'11', N'01', N'08', N'JUNIN', N'HUANCAYO', N'CHILCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110109', N'11', N'01', N'09', N'JUNIN', N'HUANCAYO', N'CHONGOS ALTO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110112', N'11', N'01', N'12', N'JUNIN', N'HUANCAYO', N'CHUPURO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110113', N'11', N'01', N'13', N'JUNIN', N'HUANCAYO', N'EL TAMBO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110114', N'11', N'01', N'14', N'JUNIN', N'HUANCAYO', N'HUACRAPUQUIO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110116', N'11', N'01', N'16', N'JUNIN', N'HUANCAYO', N'HUALHUAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110118', N'11', N'01', N'18', N'JUNIN', N'HUANCAYO', N'HUANCAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110119', N'11', N'01', N'19', N'JUNIN', N'HUANCAYO', N'HUASICANCHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110120', N'11', N'01', N'20', N'JUNIN', N'HUANCAYO', N'HUAYUCACHI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110121', N'11', N'01', N'21', N'JUNIN', N'HUANCAYO', N'INGENIO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110122', N'11', N'01', N'22', N'JUNIN', N'HUANCAYO', N'PARIAHUANCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110123', N'11', N'01', N'23', N'JUNIN', N'HUANCAYO', N'PILCOMAYO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110124', N'11', N'01', N'24', N'JUNIN', N'HUANCAYO', N'PUCARA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110125', N'11', N'01', N'25', N'JUNIN', N'HUANCAYO', N'QUICHUAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110126', N'11', N'01', N'26', N'JUNIN', N'HUANCAYO', N'QUILCAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110127', N'11', N'01', N'27', N'JUNIN', N'HUANCAYO', N'SAN AGUSTIN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110128', N'11', N'01', N'28', N'JUNIN', N'HUANCAYO', N'SAN JERONIMO DE TUNAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110131', N'11', N'01', N'31', N'JUNIN', N'HUANCAYO', N'SANTO DOMINGO DE ACOBAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110132', N'11', N'01', N'32', N'JUNIN', N'HUANCAYO', N'SAÑO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110133', N'11', N'01', N'33', N'JUNIN', N'HUANCAYO', N'SAPALLANGA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110134', N'11', N'01', N'34', N'JUNIN', N'HUANCAYO', N'SICAYA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110136', N'11', N'01', N'36', N'JUNIN', N'HUANCAYO', N'VIQUES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110201', N'11', N'02', N'01', N'JUNIN', N'CONCEPCION', N'CONCEPCION', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110202', N'11', N'02', N'02', N'JUNIN', N'CONCEPCION', N'ACO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110203', N'11', N'02', N'03', N'JUNIN', N'CONCEPCION', N'ANDAMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110204', N'11', N'02', N'04', N'JUNIN', N'CONCEPCION', N'COMAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110205', N'11', N'02', N'05', N'JUNIN', N'CONCEPCION', N'COCHAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110206', N'11', N'02', N'06', N'JUNIN', N'CONCEPCION', N'CHAMBARA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110207', N'11', N'02', N'07', N'JUNIN', N'CONCEPCION', N'HEROINAS TOLEDO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110208', N'11', N'02', N'08', N'JUNIN', N'CONCEPCION', N'MANZANARES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110209', N'11', N'02', N'09', N'JUNIN', N'CONCEPCION', N'MARISCAL CASTILLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110210', N'11', N'02', N'10', N'JUNIN', N'CONCEPCION', N'MATAHUASI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110211', N'11', N'02', N'11', N'JUNIN', N'CONCEPCION', N'MITO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110212', N'11', N'02', N'12', N'JUNIN', N'CONCEPCION', N'NUEVE DE JULIO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110213', N'11', N'02', N'13', N'JUNIN', N'CONCEPCION', N'ORCOTUNA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110214', N'11', N'02', N'14', N'JUNIN', N'CONCEPCION', N'SANTA ROSA DE OCOPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110215', N'11', N'02', N'15', N'JUNIN', N'CONCEPCION', N'SAN JOSE DE QUERO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110301', N'11', N'03', N'01', N'JUNIN', N'JAUJA', N'JAUJA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110302', N'11', N'03', N'02', N'JUNIN', N'JAUJA', N'ACOLLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110303', N'11', N'03', N'03', N'JUNIN', N'JAUJA', N'APATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110304', N'11', N'03', N'04', N'JUNIN', N'JAUJA', N'ATAURA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110305', N'11', N'03', N'05', N'JUNIN', N'JAUJA', N'CANCHAYLLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110306', N'11', N'03', N'06', N'JUNIN', N'JAUJA', N'EL MANTARO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110307', N'11', N'03', N'07', N'JUNIN', N'JAUJA', N'HUAMALI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110308', N'11', N'03', N'08', N'JUNIN', N'JAUJA', N'HUARIPAMPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110309', N'11', N'03', N'09', N'JUNIN', N'JAUJA', N'HUERTAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110310', N'11', N'03', N'10', N'JUNIN', N'JAUJA', N'JANJAILLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110311', N'11', N'03', N'11', N'JUNIN', N'JAUJA', N'JULCAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110312', N'11', N'03', N'12', N'JUNIN', N'JAUJA', N'LEONOR ORDOÑEZ', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110313', N'11', N'03', N'13', N'JUNIN', N'JAUJA', N'LLOCLLAPAMPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110314', N'11', N'03', N'14', N'JUNIN', N'JAUJA', N'MARCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110315', N'11', N'03', N'15', N'JUNIN', N'JAUJA', N'MASMA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110316', N'11', N'03', N'16', N'JUNIN', N'JAUJA', N'MOLINOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110317', N'11', N'03', N'17', N'JUNIN', N'JAUJA', N'MONOBAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110318', N'11', N'03', N'18', N'JUNIN', N'JAUJA', N'MUQUI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110319', N'11', N'03', N'19', N'JUNIN', N'JAUJA', N'MUQUIYAUYO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110320', N'11', N'03', N'20', N'JUNIN', N'JAUJA', N'PACA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110321', N'11', N'03', N'21', N'JUNIN', N'JAUJA', N'PACCHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110322', N'11', N'03', N'22', N'JUNIN', N'JAUJA', N'PANCAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110323', N'11', N'03', N'23', N'JUNIN', N'JAUJA', N'PARCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110324', N'11', N'03', N'24', N'JUNIN', N'JAUJA', N'POMACANCHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110325', N'11', N'03', N'25', N'JUNIN', N'JAUJA', N'RICRAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110326', N'11', N'03', N'26', N'JUNIN', N'JAUJA', N'SAN LORENZO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110327', N'11', N'03', N'27', N'JUNIN', N'JAUJA', N'SAN PEDRO DE CHUNAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110328', N'11', N'03', N'28', N'JUNIN', N'JAUJA', N'SINCOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110329', N'11', N'03', N'29', N'JUNIN', N'JAUJA', N'TUNAN MARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110330', N'11', N'03', N'30', N'JUNIN', N'JAUJA', N'YAULI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110331', N'11', N'03', N'31', N'JUNIN', N'JAUJA', N'CURICACA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110332', N'11', N'03', N'32', N'JUNIN', N'JAUJA', N'MASMA CHICCHE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110333', N'11', N'03', N'33', N'JUNIN', N'JAUJA', N'SAUSA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110334', N'11', N'03', N'34', N'JUNIN', N'JAUJA', N'YAUYOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110401', N'11', N'04', N'01', N'JUNIN', N'JUNIN', N'JUNIN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110402', N'11', N'04', N'02', N'JUNIN', N'JUNIN', N'CARHUAMAYO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110403', N'11', N'04', N'03', N'JUNIN', N'JUNIN', N'ONDORES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110404', N'11', N'04', N'04', N'JUNIN', N'JUNIN', N'ULCUMAYO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110501', N'11', N'05', N'01', N'JUNIN', N'TARMA', N'TARMA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110502', N'11', N'05', N'02', N'JUNIN', N'TARMA', N'ACOBAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110503', N'11', N'05', N'03', N'JUNIN', N'TARMA', N'HUARICOLCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110504', N'11', N'05', N'04', N'JUNIN', N'TARMA', N'HUASAHUASI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110505', N'11', N'05', N'05', N'JUNIN', N'TARMA', N'LA UNION', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110506', N'11', N'05', N'06', N'JUNIN', N'TARMA', N'PALCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110507', N'11', N'05', N'07', N'JUNIN', N'TARMA', N'PALCAMAYO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110508', N'11', N'05', N'08', N'JUNIN', N'TARMA', N'SAN PEDRO DE CAJAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110509', N'11', N'05', N'09', N'JUNIN', N'TARMA', N'TAPO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110601', N'11', N'06', N'01', N'JUNIN', N'YAULI', N'LA OROYA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110602', N'11', N'06', N'02', N'JUNIN', N'YAULI', N'CHACAPALPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110603', N'11', N'06', N'03', N'JUNIN', N'YAULI', N'HUAY HUAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110604', N'11', N'06', N'04', N'JUNIN', N'YAULI', N'MARCAPOMACOCHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110605', N'11', N'06', N'05', N'JUNIN', N'YAULI', N'MOROCOCHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110606', N'11', N'06', N'06', N'JUNIN', N'YAULI', N'PACCHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110607', N'11', N'06', N'07', N'JUNIN', N'YAULI', N'SANTA BARBARA DE CARHUACAYAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110608', N'11', N'06', N'08', N'JUNIN', N'YAULI', N'SUITUCANCHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110609', N'11', N'06', N'09', N'JUNIN', N'YAULI', N'YAULI', NULL)
GO
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110610', N'11', N'06', N'10', N'JUNIN', N'YAULI', N'SANTA ROSA DE SACCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110701', N'11', N'07', N'01', N'JUNIN', N'SATIPO', N'SATIPO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110702', N'11', N'07', N'02', N'JUNIN', N'SATIPO', N'COVIRIALI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110703', N'11', N'07', N'03', N'JUNIN', N'SATIPO', N'LLAYLLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110704', N'11', N'07', N'04', N'JUNIN', N'SATIPO', N'MAZAMARI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110705', N'11', N'07', N'05', N'JUNIN', N'SATIPO', N'PAMPA HERMOSA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110706', N'11', N'07', N'06', N'JUNIN', N'SATIPO', N'PANGOA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110707', N'11', N'07', N'07', N'JUNIN', N'SATIPO', N'RIO NEGRO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110708', N'11', N'07', N'08', N'JUNIN', N'SATIPO', N'RIO TAMBO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110801', N'11', N'08', N'01', N'JUNIN', N'CHANCHAMAYO', N'CHANCHAMAYO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110802', N'11', N'08', N'02', N'JUNIN', N'CHANCHAMAYO', N'SAN RAMON', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110803', N'11', N'08', N'03', N'JUNIN', N'CHANCHAMAYO', N'VITOC', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110804', N'11', N'08', N'04', N'JUNIN', N'CHANCHAMAYO', N'SAN LUIS DE SHUARO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110805', N'11', N'08', N'05', N'JUNIN', N'CHANCHAMAYO', N'PICHANAQUI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110806', N'11', N'08', N'06', N'JUNIN', N'CHANCHAMAYO', N'PERENE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110901', N'11', N'09', N'01', N'JUNIN', N'CHUPACA', N'CHUPACA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110902', N'11', N'09', N'02', N'JUNIN', N'CHUPACA', N'AHUAC', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110903', N'11', N'09', N'03', N'JUNIN', N'CHUPACA', N'CHONGOS BAJO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110904', N'11', N'09', N'04', N'JUNIN', N'CHUPACA', N'HUACHAC', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110905', N'11', N'09', N'05', N'JUNIN', N'CHUPACA', N'HUAMANCACA CHICO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110906', N'11', N'09', N'06', N'JUNIN', N'CHUPACA', N'SAN JUAN DE YSCOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110907', N'11', N'09', N'07', N'JUNIN', N'CHUPACA', N'SAN JUAN DE JARPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110908', N'11', N'09', N'08', N'JUNIN', N'CHUPACA', N'TRES DE DICIEMBRE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'110909', N'11', N'09', N'09', N'JUNIN', N'CHUPACA', N'YANACANCHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120101', N'12', N'01', N'01', N'LA LIBERTAD', N'TRUJILLO', N'TRUJILLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120102', N'12', N'01', N'02', N'LA LIBERTAD', N'TRUJILLO', N'HUANCHACO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120103', N'12', N'01', N'03', N'LA LIBERTAD', N'TRUJILLO', N'LAREDO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120104', N'12', N'01', N'04', N'LA LIBERTAD', N'TRUJILLO', N'MOCHE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120105', N'12', N'01', N'05', N'LA LIBERTAD', N'TRUJILLO', N'SALAVERRY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120106', N'12', N'01', N'06', N'LA LIBERTAD', N'TRUJILLO', N'SIMBAL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120107', N'12', N'01', N'07', N'LA LIBERTAD', N'TRUJILLO', N'VICTOR LARCO HERRERA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120109', N'12', N'01', N'09', N'LA LIBERTAD', N'TRUJILLO', N'POROTO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120110', N'12', N'01', N'10', N'LA LIBERTAD', N'TRUJILLO', N'EL PORVENIR', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120111', N'12', N'01', N'11', N'LA LIBERTAD', N'TRUJILLO', N'LA ESPERANZA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120112', N'12', N'01', N'12', N'LA LIBERTAD', N'TRUJILLO', N'FLORENCIA DE MORA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120201', N'12', N'02', N'01', N'LA LIBERTAD', N'BOLIVAR', N'BOLIVAR', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120202', N'12', N'02', N'02', N'LA LIBERTAD', N'BOLIVAR', N'BAMBAMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120203', N'12', N'02', N'03', N'LA LIBERTAD', N'BOLIVAR', N'CONDORMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120204', N'12', N'02', N'04', N'LA LIBERTAD', N'BOLIVAR', N'LONGOTEA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120205', N'12', N'02', N'05', N'LA LIBERTAD', N'BOLIVAR', N'UCUNCHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120206', N'12', N'02', N'06', N'LA LIBERTAD', N'BOLIVAR', N'UCHUMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120301', N'12', N'03', N'01', N'LA LIBERTAD', N'SANCHEZ CARRION', N'HUAMACHUCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120302', N'12', N'03', N'02', N'LA LIBERTAD', N'SANCHEZ CARRION', N'COCHORCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120303', N'12', N'03', N'03', N'LA LIBERTAD', N'SANCHEZ CARRION', N'CURGOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120304', N'12', N'03', N'04', N'LA LIBERTAD', N'SANCHEZ CARRION', N'CHUGAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120305', N'12', N'03', N'05', N'LA LIBERTAD', N'SANCHEZ CARRION', N'MARCABAL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120306', N'12', N'03', N'06', N'LA LIBERTAD', N'SANCHEZ CARRION', N'SANAGORAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120307', N'12', N'03', N'07', N'LA LIBERTAD', N'SANCHEZ CARRION', N'SARIN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120308', N'12', N'03', N'08', N'LA LIBERTAD', N'SANCHEZ CARRION', N'SARTIMBAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120401', N'12', N'04', N'01', N'LA LIBERTAD', N'OTUZCO', N'OTUZCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120402', N'12', N'04', N'02', N'LA LIBERTAD', N'OTUZCO', N'AGALLPAMPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120403', N'12', N'04', N'03', N'LA LIBERTAD', N'OTUZCO', N'CHARAT', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120404', N'12', N'04', N'04', N'LA LIBERTAD', N'OTUZCO', N'HUARANCHAL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120405', N'12', N'04', N'05', N'LA LIBERTAD', N'OTUZCO', N'LA CUESTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120408', N'12', N'04', N'08', N'LA LIBERTAD', N'OTUZCO', N'PARANDAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120409', N'12', N'04', N'09', N'LA LIBERTAD', N'OTUZCO', N'SALPO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120410', N'12', N'04', N'10', N'LA LIBERTAD', N'OTUZCO', N'SINSICAP', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120411', N'12', N'04', N'11', N'LA LIBERTAD', N'OTUZCO', N'USQUIL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120413', N'12', N'04', N'13', N'LA LIBERTAD', N'OTUZCO', N'MACHE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120501', N'12', N'05', N'01', N'LA LIBERTAD', N'PACASMAYO', N'SAN PEDRO DE LLOC', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120503', N'12', N'05', N'03', N'LA LIBERTAD', N'PACASMAYO', N'GUADALUPE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120504', N'12', N'05', N'04', N'LA LIBERTAD', N'PACASMAYO', N'JEQUETEPEQUE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120506', N'12', N'05', N'06', N'LA LIBERTAD', N'PACASMAYO', N'PACASMAYO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120508', N'12', N'05', N'08', N'LA LIBERTAD', N'PACASMAYO', N'SAN JOSE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120601', N'12', N'06', N'01', N'LA LIBERTAD', N'PATAZ', N'TAYABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120602', N'12', N'06', N'02', N'LA LIBERTAD', N'PATAZ', N'BULDIBUYO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120603', N'12', N'06', N'03', N'LA LIBERTAD', N'PATAZ', N'CHILLIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120604', N'12', N'06', N'04', N'LA LIBERTAD', N'PATAZ', N'HUAYLILLAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120605', N'12', N'06', N'05', N'LA LIBERTAD', N'PATAZ', N'HUANCASPATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120606', N'12', N'06', N'06', N'LA LIBERTAD', N'PATAZ', N'HUAYO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120607', N'12', N'06', N'07', N'LA LIBERTAD', N'PATAZ', N'ONGON', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120608', N'12', N'06', N'08', N'LA LIBERTAD', N'PATAZ', N'PARCOY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120609', N'12', N'06', N'09', N'LA LIBERTAD', N'PATAZ', N'PATAZ', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120610', N'12', N'06', N'10', N'LA LIBERTAD', N'PATAZ', N'PIAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120611', N'12', N'06', N'11', N'LA LIBERTAD', N'PATAZ', N'TAURIJA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120612', N'12', N'06', N'12', N'LA LIBERTAD', N'PATAZ', N'URPAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120613', N'12', N'06', N'13', N'LA LIBERTAD', N'PATAZ', N'SANTIAGO DE CHALLAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120701', N'12', N'07', N'01', N'LA LIBERTAD', N'SANTIAGO DE CHUCO', N'SANTIAGO DE CHUCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120702', N'12', N'07', N'02', N'LA LIBERTAD', N'SANTIAGO DE CHUCO', N'CACHICADAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120703', N'12', N'07', N'03', N'LA LIBERTAD', N'SANTIAGO DE CHUCO', N'MOLLEBAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120704', N'12', N'07', N'04', N'LA LIBERTAD', N'SANTIAGO DE CHUCO', N'MOLLEPATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120705', N'12', N'07', N'05', N'LA LIBERTAD', N'SANTIAGO DE CHUCO', N'QUIRUVILCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120706', N'12', N'07', N'06', N'LA LIBERTAD', N'SANTIAGO DE CHUCO', N'SANTA CRUZ DE CHUCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120707', N'12', N'07', N'07', N'LA LIBERTAD', N'SANTIAGO DE CHUCO', N'SITABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120708', N'12', N'07', N'08', N'LA LIBERTAD', N'SANTIAGO DE CHUCO', N'ANGASMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120801', N'12', N'08', N'01', N'LA LIBERTAD', N'ASCOPE', N'ASCOPE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120802', N'12', N'08', N'02', N'LA LIBERTAD', N'ASCOPE', N'CHICAMA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120803', N'12', N'08', N'03', N'LA LIBERTAD', N'ASCOPE', N'CHOCOPE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120804', N'12', N'08', N'04', N'LA LIBERTAD', N'ASCOPE', N'SANTIAGO DE CAO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120805', N'12', N'08', N'05', N'LA LIBERTAD', N'ASCOPE', N'MAGDALENA DE CAO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120806', N'12', N'08', N'06', N'LA LIBERTAD', N'ASCOPE', N'PAIJAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120807', N'12', N'08', N'07', N'LA LIBERTAD', N'ASCOPE', N'RAZURI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120808', N'12', N'08', N'08', N'LA LIBERTAD', N'ASCOPE', N'CASA GRANDE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120901', N'12', N'09', N'01', N'LA LIBERTAD', N'CHEPEN', N'CHEPEN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120902', N'12', N'09', N'02', N'LA LIBERTAD', N'CHEPEN', N'PACANGA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'120903', N'12', N'09', N'03', N'LA LIBERTAD', N'CHEPEN', N'PUEBLO NUEVO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'121001', N'12', N'10', N'01', N'LA LIBERTAD', N'JULCAN', N'JULCAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'121002', N'12', N'10', N'02', N'LA LIBERTAD', N'JULCAN', N'CARABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'121003', N'12', N'10', N'03', N'LA LIBERTAD', N'JULCAN', N'CALAMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'121004', N'12', N'10', N'04', N'LA LIBERTAD', N'JULCAN', N'HUASO', NULL)
GO
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'121101', N'12', N'11', N'01', N'LA LIBERTAD', N'GRAN CHIMU', N'CASCAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'121102', N'12', N'11', N'02', N'LA LIBERTAD', N'GRAN CHIMU', N'LUCMA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'121103', N'12', N'11', N'03', N'LA LIBERTAD', N'GRAN CHIMU', N'MARMOT', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'121104', N'12', N'11', N'04', N'LA LIBERTAD', N'GRAN CHIMU', N'SAYAPULLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'121201', N'12', N'12', N'01', N'LA LIBERTAD', N'VIRU', N'VIRU', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'121202', N'12', N'12', N'02', N'LA LIBERTAD', N'VIRU', N'CHAO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'121203', N'12', N'12', N'03', N'LA LIBERTAD', N'VIRU', N'GUADALUPITO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130101', N'13', N'01', N'01', N'LAMBAYEQUE', N'CHICLAYO', N'CHICLAYO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130102', N'13', N'01', N'02', N'LAMBAYEQUE', N'CHICLAYO', N'CHONGOYAPE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130103', N'13', N'01', N'03', N'LAMBAYEQUE', N'CHICLAYO', N'ETEN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130104', N'13', N'01', N'04', N'LAMBAYEQUE', N'CHICLAYO', N'ETEN PUERTO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130105', N'13', N'01', N'05', N'LAMBAYEQUE', N'CHICLAYO', N'LAGUNAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130106', N'13', N'01', N'06', N'LAMBAYEQUE', N'CHICLAYO', N'MONSEFU', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130107', N'13', N'01', N'07', N'LAMBAYEQUE', N'CHICLAYO', N'NUEVA ARICA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130108', N'13', N'01', N'08', N'LAMBAYEQUE', N'CHICLAYO', N'OYOTUN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130109', N'13', N'01', N'09', N'LAMBAYEQUE', N'CHICLAYO', N'PICSI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130110', N'13', N'01', N'10', N'LAMBAYEQUE', N'CHICLAYO', N'PIMENTEL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130111', N'13', N'01', N'11', N'LAMBAYEQUE', N'CHICLAYO', N'REQUE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130112', N'13', N'01', N'12', N'LAMBAYEQUE', N'CHICLAYO', N'JOSE LEONARDO ORTIZ', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130113', N'13', N'01', N'13', N'LAMBAYEQUE', N'CHICLAYO', N'SANTA ROSA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130114', N'13', N'01', N'14', N'LAMBAYEQUE', N'CHICLAYO', N'SAÑA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130115', N'13', N'01', N'15', N'LAMBAYEQUE', N'CHICLAYO', N'LA VICTORIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130116', N'13', N'01', N'16', N'LAMBAYEQUE', N'CHICLAYO', N'CAYALTI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130117', N'13', N'01', N'17', N'LAMBAYEQUE', N'CHICLAYO', N'PATAPO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130118', N'13', N'01', N'18', N'LAMBAYEQUE', N'CHICLAYO', N'POMALCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130119', N'13', N'01', N'19', N'LAMBAYEQUE', N'CHICLAYO', N'PUCALA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130120', N'13', N'01', N'20', N'LAMBAYEQUE', N'CHICLAYO', N'TUMAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130201', N'13', N'02', N'01', N'LAMBAYEQUE', N'FERREÑAFE', N'FERREÑAFE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130202', N'13', N'02', N'02', N'LAMBAYEQUE', N'FERREÑAFE', N'INCAHUASI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130203', N'13', N'02', N'03', N'LAMBAYEQUE', N'FERREÑAFE', N'CAÑARIS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130204', N'13', N'02', N'04', N'LAMBAYEQUE', N'FERREÑAFE', N'PITIPO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130205', N'13', N'02', N'05', N'LAMBAYEQUE', N'FERREÑAFE', N'PUEBLO NUEVO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130206', N'13', N'02', N'06', N'LAMBAYEQUE', N'FERREÑAFE', N'MANUEL ANTONIO MESONES MURO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130301', N'13', N'03', N'01', N'LAMBAYEQUE', N'LAMBAYEQUE', N'LAMBAYEQUE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130302', N'13', N'03', N'02', N'LAMBAYEQUE', N'LAMBAYEQUE', N'CHOCHOPE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130303', N'13', N'03', N'03', N'LAMBAYEQUE', N'LAMBAYEQUE', N'ILLIMO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130304', N'13', N'03', N'04', N'LAMBAYEQUE', N'LAMBAYEQUE', N'JAYANCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130305', N'13', N'03', N'05', N'LAMBAYEQUE', N'LAMBAYEQUE', N'MOCHUMI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130306', N'13', N'03', N'06', N'LAMBAYEQUE', N'LAMBAYEQUE', N'MORROPE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130307', N'13', N'03', N'07', N'LAMBAYEQUE', N'LAMBAYEQUE', N'MOTUPE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130308', N'13', N'03', N'08', N'LAMBAYEQUE', N'LAMBAYEQUE', N'OLMOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130309', N'13', N'03', N'09', N'LAMBAYEQUE', N'LAMBAYEQUE', N'PACORA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130310', N'13', N'03', N'10', N'LAMBAYEQUE', N'LAMBAYEQUE', N'SALAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130311', N'13', N'03', N'11', N'LAMBAYEQUE', N'LAMBAYEQUE', N'SAN JOSE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'130312', N'13', N'03', N'12', N'LAMBAYEQUE', N'LAMBAYEQUE', N'TUCUME', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140101', N'14', N'01', N'01', N'LIMA', N'LIMA', N'LIMA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140102', N'14', N'01', N'02', N'LIMA', N'LIMA', N'ANCON', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140103', N'14', N'01', N'03', N'LIMA', N'LIMA', N'ATE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140104', N'14', N'01', N'04', N'LIMA', N'LIMA', N'BREÑA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140105', N'14', N'01', N'05', N'LIMA', N'LIMA', N'CARABAYLLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140106', N'14', N'01', N'06', N'LIMA', N'LIMA', N'COMAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140107', N'14', N'01', N'07', N'LIMA', N'LIMA', N'CHACLACAYO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140108', N'14', N'01', N'08', N'LIMA', N'LIMA', N'CHORRILLOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140109', N'14', N'01', N'09', N'LIMA', N'LIMA', N'LA VICTORIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140110', N'14', N'01', N'10', N'LIMA', N'LIMA', N'LA MOLINA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140111', N'14', N'01', N'11', N'LIMA', N'LIMA', N'LINCE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140112', N'14', N'01', N'12', N'LIMA', N'LIMA', N'LURIGANCHO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140113', N'14', N'01', N'13', N'LIMA', N'LIMA', N'LURIN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140114', N'14', N'01', N'14', N'LIMA', N'LIMA', N'MAGDALENA DEL MAR', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140115', N'14', N'01', N'15', N'LIMA', N'LIMA', N'MIRAFLORES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140116', N'14', N'01', N'16', N'LIMA', N'LIMA', N'PACHACAMAC', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140117', N'14', N'01', N'17', N'LIMA', N'LIMA', N'PUEBLO LIBRE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140118', N'14', N'01', N'18', N'LIMA', N'LIMA', N'PUCUSANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140119', N'14', N'01', N'19', N'LIMA', N'LIMA', N'PUENTE PIEDRA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140120', N'14', N'01', N'20', N'LIMA', N'LIMA', N'PUNTA HERMOSA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140121', N'14', N'01', N'21', N'LIMA', N'LIMA', N'PUNTA NEGRA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140122', N'14', N'01', N'22', N'LIMA', N'LIMA', N'RIMAC', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140123', N'14', N'01', N'23', N'LIMA', N'LIMA', N'SAN BARTOLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140124', N'14', N'01', N'24', N'LIMA', N'LIMA', N'SAN ISIDRO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140125', N'14', N'01', N'25', N'LIMA', N'LIMA', N'BARRANCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140126', N'14', N'01', N'26', N'LIMA', N'LIMA', N'SAN MARTIN DE PORRES',NULL )
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140127', N'14', N'01', N'27', N'LIMA', N'LIMA', N'SAN MIGUEL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140128', N'14', N'01', N'28', N'LIMA', N'LIMA', N'SANTA MARIA DEL MAR', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140129', N'14', N'01', N'29', N'LIMA', N'LIMA', N'SANTA ROSA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140130', N'14', N'01', N'30', N'LIMA', N'LIMA', N'SANTIAGO DE SURCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140131', N'14', N'01', N'31', N'LIMA', N'LIMA', N'SURQUILLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140132', N'14', N'01', N'32', N'LIMA', N'LIMA', N'VILLA MARIA DEL TRIUNFO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140133', N'14', N'01', N'33', N'LIMA', N'LIMA', N'JESUS MARIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140134', N'14', N'01', N'34', N'LIMA', N'LIMA', N'INDEPENDENCIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140135', N'14', N'01', N'35', N'LIMA', N'LIMA', N'EL AGUSTINO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140136', N'14', N'01', N'36', N'LIMA', N'LIMA', N'SAN JUAN DE MIRAFLORES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140137', N'14', N'01', N'37', N'LIMA', N'LIMA', N'SAN JUAN DE LURIGANCHO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140138', N'14', N'01', N'38', N'LIMA', N'LIMA', N'SAN LUIS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140139', N'14', N'01', N'39', N'LIMA', N'LIMA', N'CIENEGUILLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140140', N'14', N'01', N'40', N'LIMA', N'LIMA', N'SAN BORJA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140141', N'14', N'01', N'41', N'LIMA', N'LIMA', N'VILLA EL SALVADOR', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140142', N'14', N'01', N'42', N'LIMA', N'LIMA', N'LOS OLIVOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140143', N'14', N'01', N'43', N'LIMA', N'LIMA', N'SANTA ANITA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140201', N'14', N'02', N'01', N'LIMA', N'CAJATAMBO', N'CAJATAMBO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140205', N'14', N'02', N'05', N'LIMA', N'CAJATAMBO', N'COPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140206', N'14', N'02', N'06', N'LIMA', N'CAJATAMBO', N'GORGOR', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140207', N'14', N'02', N'07', N'LIMA', N'CAJATAMBO', N'HUANCAPON', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140208', N'14', N'02', N'08', N'LIMA', N'CAJATAMBO', N'MANAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140301', N'14', N'03', N'01', N'LIMA', N'CANTA', N'CANTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140302', N'14', N'03', N'02', N'LIMA', N'CANTA', N'ARAHUAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140303', N'14', N'03', N'03', N'LIMA', N'CANTA', N'HUAMANTANGA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140304', N'14', N'03', N'04', N'LIMA', N'CANTA', N'HUAROS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140305', N'14', N'03', N'05', N'LIMA', N'CANTA', N'LACHAQUI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140306', N'14', N'03', N'06', N'LIMA', N'CANTA', N'SAN BUENAVENTURA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140307', N'14', N'03', N'07', N'LIMA', N'CANTA', N'SANTA ROSA DE QUIVES', NULL)
GO
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140401', N'14', N'04', N'01', N'LIMA', N'CAÑETE', N'SAN VICENTE DE CAÑETE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140402', N'14', N'04', N'02', N'LIMA', N'CAÑETE', N'CALANGO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140403', N'14', N'04', N'03', N'LIMA', N'CAÑETE', N'CERRO AZUL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140404', N'14', N'04', N'04', N'LIMA', N'CAÑETE', N'COAYLLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140405', N'14', N'04', N'05', N'LIMA', N'CAÑETE', N'CHILCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140406', N'14', N'04', N'06', N'LIMA', N'CAÑETE', N'IMPERIAL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140407', N'14', N'04', N'07', N'LIMA', N'CAÑETE', N'LUNAHUANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140408', N'14', N'04', N'08', N'LIMA', N'CAÑETE', N'MALA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140409', N'14', N'04', N'09', N'LIMA', N'CAÑETE', N'NUEVO IMPERIAL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140410', N'14', N'04', N'10', N'LIMA', N'CAÑETE', N'PACARAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140411', N'14', N'04', N'11', N'LIMA', N'CAÑETE', N'QUILMANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140412', N'14', N'04', N'12', N'LIMA', N'CAÑETE', N'SAN ANTONIO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140413', N'14', N'04', N'13', N'LIMA', N'CAÑETE', N'SAN LUIS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140414', N'14', N'04', N'14', N'LIMA', N'CAÑETE', N'SANTA CRUZ DE FLORES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140415', N'14', N'04', N'15', N'LIMA', N'CAÑETE', N'ZUÑIGA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140416', N'14', N'04', N'16', N'LIMA', N'CAÑETE', N'ASIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140501', N'14', N'05', N'01', N'LIMA', N'HUAURA', N'HUACHO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140502', N'14', N'05', N'02', N'LIMA', N'HUAURA', N'AMBAR', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140504', N'14', N'05', N'04', N'LIMA', N'HUAURA', N'CALETA DE CARQUIN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140505', N'14', N'05', N'05', N'LIMA', N'HUAURA', N'CHECRAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140506', N'14', N'05', N'06', N'LIMA', N'HUAURA', N'HUALMAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140507', N'14', N'05', N'07', N'LIMA', N'HUAURA', N'HUAURA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140508', N'14', N'05', N'08', N'LIMA', N'HUAURA', N'LEONCIO PRADO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140509', N'14', N'05', N'09', N'LIMA', N'HUAURA', N'PACCHO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140511', N'14', N'05', N'11', N'LIMA', N'HUAURA', N'SANTA LEONOR', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140512', N'14', N'05', N'12', N'LIMA', N'HUAURA', N'SANTA MARIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140513', N'14', N'05', N'13', N'LIMA', N'HUAURA', N'SAYAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140516', N'14', N'05', N'16', N'LIMA', N'HUAURA', N'VEGUETA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140601', N'14', N'06', N'01', N'LIMA', N'HUAROCHIRI', N'MATUCANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140602', N'14', N'06', N'02', N'LIMA', N'HUAROCHIRI', N'ANTIOQUIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140603', N'14', N'06', N'03', N'LIMA', N'HUAROCHIRI', N'CALLAHUANCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140604', N'14', N'06', N'04', N'LIMA', N'HUAROCHIRI', N'CARAMPOMA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140605', N'14', N'06', N'05', N'LIMA', N'HUAROCHIRI', N'CASTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140606', N'14', N'06', N'06', N'LIMA', N'HUAROCHIRI', N'SAN JOSE DE LOS CHORRILLOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140607', N'14', N'06', N'07', N'LIMA', N'HUAROCHIRI', N'CHICLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140608', N'14', N'06', N'08', N'LIMA', N'HUAROCHIRI', N'HUANZA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140609', N'14', N'06', N'09', N'LIMA', N'HUAROCHIRI', N'HUAROCHIRI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140610', N'14', N'06', N'10', N'LIMA', N'HUAROCHIRI', N'LAHUAYTAMBO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140611', N'14', N'06', N'11', N'LIMA', N'HUAROCHIRI', N'LANGA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140612', N'14', N'06', N'12', N'LIMA', N'HUAROCHIRI', N'MARIATANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140613', N'14', N'06', N'13', N'LIMA', N'HUAROCHIRI', N'RICARDO PALMA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140614', N'14', N'06', N'14', N'LIMA', N'HUAROCHIRI', N'SAN ANDRES DE TUPICOCHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140615', N'14', N'06', N'15', N'LIMA', N'HUAROCHIRI', N'SAN ANTONIO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140616', N'14', N'06', N'16', N'LIMA', N'HUAROCHIRI', N'SAN BARTOLOME', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140617', N'14', N'06', N'17', N'LIMA', N'HUAROCHIRI', N'SAN DAMIAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140618', N'14', N'06', N'18', N'LIMA', N'HUAROCHIRI', N'SANGALLAYA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140619', N'14', N'06', N'19', N'LIMA', N'HUAROCHIRI', N'SAN JUAN DE TANTARANCHE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140620', N'14', N'06', N'20', N'LIMA', N'HUAROCHIRI', N'SAN LORENZO DE QUINTI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140621', N'14', N'06', N'21', N'LIMA', N'HUAROCHIRI', N'SAN MATEO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140622', N'14', N'06', N'22', N'LIMA', N'HUAROCHIRI', N'SAN MATEO DE OTAO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140623', N'14', N'06', N'23', N'LIMA', N'HUAROCHIRI', N'SAN PEDRO DE HUANCAYRE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140624', N'14', N'06', N'24', N'LIMA', N'HUAROCHIRI', N'SANTA CRUZ DE COCACHACRA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140625', N'14', N'06', N'25', N'LIMA', N'HUAROCHIRI', N'SANTA EULALIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140626', N'14', N'06', N'26', N'LIMA', N'HUAROCHIRI', N'SANTIAGO DE ANCHUCAYA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140627', N'14', N'06', N'27', N'LIMA', N'HUAROCHIRI', N'SANTIAGO DE TUNA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140628', N'14', N'06', N'28', N'LIMA', N'HUAROCHIRI', N'SANTO DOMINGO DE LOS OLLEROS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140629', N'14', N'06', N'29', N'LIMA', N'HUAROCHIRI', N'SURCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140630', N'14', N'06', N'30', N'LIMA', N'HUAROCHIRI', N'HUACHUPAMPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140631', N'14', N'06', N'31', N'LIMA', N'HUAROCHIRI', N'LARAOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140632', N'14', N'06', N'32', N'LIMA', N'HUAROCHIRI', N'SAN JUAN DE IRIS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140701', N'14', N'07', N'01', N'LIMA', N'YAUYOS', N'YAUYOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140702', N'14', N'07', N'02', N'LIMA', N'YAUYOS', N'ALIS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140703', N'14', N'07', N'03', N'LIMA', N'YAUYOS', N'ALLAUCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140704', N'14', N'07', N'04', N'LIMA', N'YAUYOS', N'AYAVIRI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140705', N'14', N'07', N'05', N'LIMA', N'YAUYOS', N'AZANGARO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140706', N'14', N'07', N'06', N'LIMA', N'YAUYOS', N'CACRA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140707', N'14', N'07', N'07', N'LIMA', N'YAUYOS', N'CARANIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140708', N'14', N'07', N'08', N'LIMA', N'YAUYOS', N'COCHAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140709', N'14', N'07', N'09', N'LIMA', N'YAUYOS', N'COLONIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140710', N'14', N'07', N'10', N'LIMA', N'YAUYOS', N'CHOCOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140711', N'14', N'07', N'11', N'LIMA', N'YAUYOS', N'HUAMPARA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140712', N'14', N'07', N'12', N'LIMA', N'YAUYOS', N'HUANCAYA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140713', N'14', N'07', N'13', N'LIMA', N'YAUYOS', N'HUANGASCAR', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140714', N'14', N'07', N'14', N'LIMA', N'YAUYOS', N'HUANTAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140715', N'14', N'07', N'15', N'LIMA', N'YAUYOS', N'HUAÑEC', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140716', N'14', N'07', N'16', N'LIMA', N'YAUYOS', N'LARAOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140717', N'14', N'07', N'17', N'LIMA', N'YAUYOS', N'LINCHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140718', N'14', N'07', N'18', N'LIMA', N'YAUYOS', N'MIRAFLORES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140719', N'14', N'07', N'19', N'LIMA', N'YAUYOS', N'OMAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140720', N'14', N'07', N'20', N'LIMA', N'YAUYOS', N'QUINCHES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140721', N'14', N'07', N'21', N'LIMA', N'YAUYOS', N'QUINOCAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140722', N'14', N'07', N'22', N'LIMA', N'YAUYOS', N'SAN JOAQUIN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140723', N'14', N'07', N'23', N'LIMA', N'YAUYOS', N'SAN PEDRO DE PILAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140724', N'14', N'07', N'24', N'LIMA', N'YAUYOS', N'TANTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140725', N'14', N'07', N'25', N'LIMA', N'YAUYOS', N'TAURIPAMPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140726', N'14', N'07', N'26', N'LIMA', N'YAUYOS', N'TUPE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140727', N'14', N'07', N'27', N'LIMA', N'YAUYOS', N'TOMAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140728', N'14', N'07', N'28', N'LIMA', N'YAUYOS', N'VIÑAC', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140729', N'14', N'07', N'29', N'LIMA', N'YAUYOS', N'VITIS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140730', N'14', N'07', N'30', N'LIMA', N'YAUYOS', N'HONGOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140731', N'14', N'07', N'31', N'LIMA', N'YAUYOS', N'MADEAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140732', N'14', N'07', N'32', N'LIMA', N'YAUYOS', N'PUTINZA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140733', N'14', N'07', N'33', N'LIMA', N'YAUYOS', N'CATAHUASI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140801', N'14', N'08', N'01', N'LIMA', N'HUARAL', N'HUARAL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140802', N'14', N'08', N'02', N'LIMA', N'HUARAL', N'ATAVILLOS ALTO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140803', N'14', N'08', N'03', N'LIMA', N'HUARAL', N'ATAVILLOS BAJO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140804', N'14', N'08', N'04', N'LIMA', N'HUARAL', N'AUCALLAMA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140805', N'14', N'08', N'05', N'LIMA', N'HUARAL', N'CHANCAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140806', N'14', N'08', N'06', N'LIMA', N'HUARAL', N'IHUARI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140807', N'14', N'08', N'07', N'LIMA', N'HUARAL', N'LAMPIAN', NULL)
GO
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140808', N'14', N'08', N'08', N'LIMA', N'HUARAL', N'PACARAOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140809', N'14', N'08', N'09', N'LIMA', N'HUARAL', N'SAN MIGUEL DE ACOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140810', N'14', N'08', N'10', N'LIMA', N'HUARAL', N'VEINTISIETE DE NOVIEMBRE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140811', N'14', N'08', N'11', N'LIMA', N'HUARAL', N'SANTA CRUZ DE ANDAMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140812', N'14', N'08', N'12', N'LIMA', N'HUARAL', N'SUMBILCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140901', N'14', N'09', N'01', N'LIMA', N'BARRANCA', N'BARRANCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140902', N'14', N'09', N'02', N'LIMA', N'BARRANCA', N'PARAMONGA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140903', N'14', N'09', N'03', N'LIMA', N'BARRANCA', N'PATIVILCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140904', N'14', N'09', N'04', N'LIMA', N'BARRANCA', N'SUPE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'140905', N'14', N'09', N'05', N'LIMA', N'BARRANCA', N'SUPE PUERTO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'141001', N'14', N'10', N'01', N'LIMA', N'OYON', N'OYON', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'141002', N'14', N'10', N'02', N'LIMA', N'OYON', N'NAVAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'141003', N'14', N'10', N'03', N'LIMA', N'OYON', N'CAUJUL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'141004', N'14', N'10', N'04', N'LIMA', N'OYON', N'ANDAJES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'141005', N'14', N'10', N'05', N'LIMA', N'OYON', N'PACHANGARA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'141006', N'14', N'10', N'06', N'LIMA', N'OYON', N'COCHAMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'141101', N'14', N'11', N'01', N'LIMA', N'CALLAO', N'CALLAO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'141102', N'14', N'11', N'02', N'LIMA', N'CALLAO', N'BELLAVISTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'141103', N'14', N'11', N'03', N'LIMA', N'CALLAO', N'LA PUNTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'141104', N'14', N'11', N'04', N'LIMA', N'CALLAO', N'CARMEN DE LA LEGUA-REYNOSO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'141105', N'14', N'11', N'05', N'LIMA', N'CALLAO', N'LA PERLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'141106', N'14', N'11', N'06', N'LIMA', N'CALLAO', N'VENTANILLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150101', N'15', N'01', N'01', N'LORETO', N'MAYNAS', N'IQUITOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150102', N'15', N'01', N'02', N'LORETO', N'MAYNAS', N'ALTO NANAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150103', N'15', N'01', N'03', N'LORETO', N'MAYNAS', N'FERNANDO LORES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150104', N'15', N'01', N'04', N'LORETO', N'MAYNAS', N'LAS AMAZONAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150105', N'15', N'01', N'05', N'LORETO', N'MAYNAS', N'MAZAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150106', N'15', N'01', N'06', N'LORETO', N'MAYNAS', N'NAPO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150107', N'15', N'01', N'07', N'LORETO', N'MAYNAS', N'PUTUMAYO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150108', N'15', N'01', N'08', N'LORETO', N'MAYNAS', N'TORRES CAUSANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150110', N'15', N'01', N'10', N'LORETO', N'MAYNAS', N'INDIANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150111', N'15', N'01', N'11', N'LORETO', N'MAYNAS', N'PUNCHANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150112', N'15', N'01', N'12', N'LORETO', N'MAYNAS', N'BELEN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150113', N'15', N'01', N'13', N'LORETO', N'MAYNAS', N'SAN JUAN BAUTISTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150114', N'15', N'01', N'14', N'LORETO', N'MAYNAS', N'TENIENTE MANUEL CLAVERO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150201', N'15', N'02', N'01', N'LORETO', N'ALTO AMAZONAS', N'YURIMAGUAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150202', N'15', N'02', N'02', N'LORETO', N'ALTO AMAZONAS', N'BALSAPUERTO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150205', N'15', N'02', N'05', N'LORETO', N'ALTO AMAZONAS', N'JEBEROS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150206', N'15', N'02', N'06', N'LORETO', N'ALTO AMAZONAS', N'LAGUNAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150210', N'15', N'02', N'10', N'LORETO', N'ALTO AMAZONAS', N'SANTA CRUZ', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150211', N'15', N'02', N'11', N'LORETO', N'ALTO AMAZONAS', N'TENIENTE CESAR LOPEZ ROJAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150301', N'15', N'03', N'01', N'LORETO', N'LORETO', N'NAUTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150302', N'15', N'03', N'02', N'LORETO', N'LORETO', N'PARINARI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150303', N'15', N'03', N'03', N'LORETO', N'LORETO', N'TIGRE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150304', N'15', N'03', N'04', N'LORETO', N'LORETO', N'URARINAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150305', N'15', N'03', N'05', N'LORETO', N'LORETO', N'TROMPETEROS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150401', N'15', N'04', N'01', N'LORETO', N'REQUENA', N'REQUENA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150402', N'15', N'04', N'02', N'LORETO', N'REQUENA', N'ALTO TAPICHE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150403', N'15', N'04', N'03', N'LORETO', N'REQUENA', N'CAPELO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150404', N'15', N'04', N'04', N'LORETO', N'REQUENA', N'EMILIO SAN MARTIN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150405', N'15', N'04', N'05', N'LORETO', N'REQUENA', N'MAQUIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150406', N'15', N'04', N'06', N'LORETO', N'REQUENA', N'PUINAHUA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150407', N'15', N'04', N'07', N'LORETO', N'REQUENA', N'SAQUENA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150408', N'15', N'04', N'08', N'LORETO', N'REQUENA', N'SOPLIN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150409', N'15', N'04', N'09', N'LORETO', N'REQUENA', N'TAPICHE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150410', N'15', N'04', N'10', N'LORETO', N'REQUENA', N'JENARO HERRERA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150411', N'15', N'04', N'11', N'LORETO', N'REQUENA', N'YAQUERANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150501', N'15', N'05', N'01', N'LORETO', N'UCAYALI', N'CONTAMANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150502', N'15', N'05', N'02', N'LORETO', N'UCAYALI', N'VARGAS GUERRA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150503', N'15', N'05', N'03', N'LORETO', N'UCAYALI', N'PADRE MARQUEZ', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150504', N'15', N'05', N'04', N'LORETO', N'UCAYALI', N'PAMPA HERMOSA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150505', N'15', N'05', N'05', N'LORETO', N'UCAYALI', N'SARAYACU', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150506', N'15', N'05', N'06', N'LORETO', N'UCAYALI', N'INAHUAYA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150601', N'15', N'06', N'01', N'LORETO', N'MARISCAL RAMON CASTILLA', N'RAMON CASTILLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150602', N'15', N'06', N'02', N'LORETO', N'MARISCAL RAMON CASTILLA', N'PEBAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150603', N'15', N'06', N'03', N'LORETO', N'MARISCAL RAMON CASTILLA', N'YAVARI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150604', N'15', N'06', N'04', N'LORETO', N'MARISCAL RAMON CASTILLA', N'SAN PABLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150701', N'15', N'07', N'01', N'LORETO', N'DATEM DEL MARAÑON', N'BARRANCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150702', N'15', N'07', N'02', N'LORETO', N'DATEM DEL MARAÑON', N'ANDOAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150703', N'15', N'07', N'03', N'LORETO', N'DATEM DEL MARAÑON', N'CAHUAPANAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150704', N'15', N'07', N'04', N'LORETO', N'DATEM DEL MARAÑON', N'MANSERICHE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150705', N'15', N'07', N'05', N'LORETO', N'DATEM DEL MARAÑON', N'MORONA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'150706', N'15', N'07', N'06', N'LORETO', N'DATEM DEL MARAÑON', N'PASTAZA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'160101', N'16', N'01', N'01', N'MADRE DE DIOS', N'TAMBOPATA', N'TAMBOPATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'160102', N'16', N'01', N'02', N'MADRE DE DIOS', N'TAMBOPATA', N'INAMBARI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'160103', N'16', N'01', N'03', N'MADRE DE DIOS', N'TAMBOPATA', N'LAS PIEDRAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'160104', N'16', N'01', N'04', N'MADRE DE DIOS', N'TAMBOPATA', N'LABERINTO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'160201', N'16', N'02', N'01', N'MADRE DE DIOS', N'MANU', N'MANU', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'160202', N'16', N'02', N'02', N'MADRE DE DIOS', N'MANU', N'FITZCARRALD', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'160203', N'16', N'02', N'03', N'MADRE DE DIOS', N'MANU', N'MADRE DE DIOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'160204', N'16', N'02', N'04', N'MADRE DE DIOS', N'MANU', N'HUEPETUHE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'160301', N'16', N'03', N'01', N'MADRE DE DIOS', N'TAHUAMANU', N'IÑAPARI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'160302', N'16', N'03', N'02', N'MADRE DE DIOS', N'TAHUAMANU', N'IBERIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'160303', N'16', N'03', N'03', N'MADRE DE DIOS', N'TAHUAMANU', N'TAHUAMANU', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'170101', N'17', N'01', N'01', N'MOQUEGUA', N'MARISCAL NIETO', N'MOQUEGUA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'170102', N'17', N'01', N'02', N'MOQUEGUA', N'MARISCAL NIETO', N'CARUMAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'170103', N'17', N'01', N'03', N'MOQUEGUA', N'MARISCAL NIETO', N'CUCHUMBAYA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'170104', N'17', N'01', N'04', N'MOQUEGUA', N'MARISCAL NIETO', N'SAN CRISTOBAL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'170105', N'17', N'01', N'05', N'MOQUEGUA', N'MARISCAL NIETO', N'TORATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'170106', N'17', N'01', N'06', N'MOQUEGUA', N'MARISCAL NIETO', N'SAMEGUA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'170201', N'17', N'02', N'01', N'MOQUEGUA', N'GENERAL SANCHEZ CERRO', N'OMATE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'170202', N'17', N'02', N'02', N'MOQUEGUA', N'GENERAL SANCHEZ CERRO', N'COALAQUE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'170203', N'17', N'02', N'03', N'MOQUEGUA', N'GENERAL SANCHEZ CERRO', N'CHOJATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'170204', N'17', N'02', N'04', N'MOQUEGUA', N'GENERAL SANCHEZ CERRO', N'ICHUÑA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'170205', N'17', N'02', N'05', N'MOQUEGUA', N'GENERAL SANCHEZ CERRO', N'LA CAPILLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'170206', N'17', N'02', N'06', N'MOQUEGUA', N'GENERAL SANCHEZ CERRO', N'LLOQUE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'170207', N'17', N'02', N'07', N'MOQUEGUA', N'GENERAL SANCHEZ CERRO', N'MATALAQUE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'170208', N'17', N'02', N'08', N'MOQUEGUA', N'GENERAL SANCHEZ CERRO', N'PUQUINA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'170209', N'17', N'02', N'09', N'MOQUEGUA', N'GENERAL SANCHEZ CERRO', N'QUINISTAQUILLAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'170210', N'17', N'02', N'10', N'MOQUEGUA', N'GENERAL SANCHEZ CERRO', N'UBINAS', NULL)
GO
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'170211', N'17', N'02', N'11', N'MOQUEGUA', N'GENERAL SANCHEZ CERRO', N'YUNGA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'170301', N'17', N'03', N'01', N'MOQUEGUA', N'ILO', N'ILO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'170302', N'17', N'03', N'02', N'MOQUEGUA', N'ILO', N'EL ALGARROBAL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'170303', N'17', N'03', N'03', N'MOQUEGUA', N'ILO', N'PACOCHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'180101', N'18', N'01', N'01', N'PASCO', N'PASCO', N'CHAUPIMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'180103', N'18', N'01', N'03', N'PASCO', N'PASCO', N'HUACHON', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'180104', N'18', N'01', N'04', N'PASCO', N'PASCO', N'HUARIACA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'180105', N'18', N'01', N'05', N'PASCO', N'PASCO', N'HUAYLLAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'180106', N'18', N'01', N'06', N'PASCO', N'PASCO', N'NINACACA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'180107', N'18', N'01', N'07', N'PASCO', N'PASCO', N'PALLANCHACRA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'180108', N'18', N'01', N'08', N'PASCO', N'PASCO', N'PAUCARTAMBO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'180109', N'18', N'01', N'09', N'PASCO', N'PASCO', N'SAN FCO DE ASIS DE YARUSYACAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'180110', N'18', N'01', N'10', N'PASCO', N'PASCO', N'SIMON BOLIVAR', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'180111', N'18', N'01', N'11', N'PASCO', N'PASCO', N'TICLACAYAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'180112', N'18', N'01', N'12', N'PASCO', N'PASCO', N'TINYAHUARCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'180113', N'18', N'01', N'13', N'PASCO', N'PASCO', N'VICCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'180114', N'18', N'01', N'14', N'PASCO', N'PASCO', N'YANACANCHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'180201', N'18', N'02', N'01', N'PASCO', N'DANIEL ALCIDES CARRION', N'YANAHUANCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'180202', N'18', N'02', N'02', N'PASCO', N'DANIEL ALCIDES CARRION', N'CHACAYAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'180203', N'18', N'02', N'03', N'PASCO', N'DANIEL ALCIDES CARRION', N'GOYLLARISQUIZGA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'180204', N'18', N'02', N'04', N'PASCO', N'DANIEL ALCIDES CARRION', N'PAUCAR', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'180205', N'18', N'02', N'05', N'PASCO', N'DANIEL ALCIDES CARRION', N'SAN PEDRO DE PILLAO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'180206', N'18', N'02', N'06', N'PASCO', N'DANIEL ALCIDES CARRION', N'SANTA ANA DE TUSI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'180207', N'18', N'02', N'07', N'PASCO', N'DANIEL ALCIDES CARRION', N'TAPUC', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'180208', N'18', N'02', N'08', N'PASCO', N'DANIEL ALCIDES CARRION', N'VILCABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'180301', N'18', N'03', N'01', N'PASCO', N'OXAPAMPA', N'OXAPAMPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'180302', N'18', N'03', N'02', N'PASCO', N'OXAPAMPA', N'CHONTABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'180303', N'18', N'03', N'03', N'PASCO', N'OXAPAMPA', N'HUANCABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'180304', N'18', N'03', N'04', N'PASCO', N'OXAPAMPA', N'PUERTO BERMUDEZ', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'180305', N'18', N'03', N'05', N'PASCO', N'OXAPAMPA', N'VILLA RICA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'180306', N'18', N'03', N'06', N'PASCO', N'OXAPAMPA', N'POZUZO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'180307', N'18', N'03', N'07', N'PASCO', N'OXAPAMPA', N'PALCAZU', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'180308', N'18', N'03', N'08', N'PASCO', N'OXAPAMPA', N'CONSTITUCION', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190101', N'19', N'01', N'01', N'PIURA', N'PIURA', N'PIURA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190103', N'19', N'01', N'03', N'PIURA', N'PIURA', N'CASTILLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190104', N'19', N'01', N'04', N'PIURA', N'PIURA', N'CATACAOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190105', N'19', N'01', N'05', N'PIURA', N'PIURA', N'LA ARENA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190106', N'19', N'01', N'06', N'PIURA', N'PIURA', N'LA UNION', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190107', N'19', N'01', N'07', N'PIURA', N'PIURA', N'LAS LOMAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190109', N'19', N'01', N'09', N'PIURA', N'PIURA', N'TAMBO GRANDE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190113', N'19', N'01', N'13', N'PIURA', N'PIURA', N'CURA MORI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190114', N'19', N'01', N'14', N'PIURA', N'PIURA', N'EL TALLAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190115', N'19', N'01', N'15', N'PIURA', N'PIURA', N'VEINTISEIS DE OCTUBRE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190201', N'19', N'02', N'01', N'PIURA', N'AYABACA', N'AYABACA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190202', N'19', N'02', N'02', N'PIURA', N'AYABACA', N'FRIAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190203', N'19', N'02', N'03', N'PIURA', N'AYABACA', N'LAGUNAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190204', N'19', N'02', N'04', N'PIURA', N'AYABACA', N'MONTERO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190205', N'19', N'02', N'05', N'PIURA', N'AYABACA', N'PACAIPAMPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190206', N'19', N'02', N'06', N'PIURA', N'AYABACA', N'SAPILLICA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190207', N'19', N'02', N'07', N'PIURA', N'AYABACA', N'SICCHEZ', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190208', N'19', N'02', N'08', N'PIURA', N'AYABACA', N'SUYO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190209', N'19', N'02', N'09', N'PIURA', N'AYABACA', N'JILILI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190210', N'19', N'02', N'10', N'PIURA', N'AYABACA', N'PAIMAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190301', N'19', N'03', N'01', N'PIURA', N'HUANCABAMBA', N'HUANCABAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190302', N'19', N'03', N'02', N'PIURA', N'HUANCABAMBA', N'CANCHAQUE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190303', N'19', N'03', N'03', N'PIURA', N'HUANCABAMBA', N'HUARMACA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190304', N'19', N'03', N'04', N'PIURA', N'HUANCABAMBA', N'SONDOR', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190305', N'19', N'03', N'05', N'PIURA', N'HUANCABAMBA', N'SONDORILLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190306', N'19', N'03', N'06', N'PIURA', N'HUANCABAMBA', N'EL CARMEN DE LA FRONTERA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190307', N'19', N'03', N'07', N'PIURA', N'HUANCABAMBA', N'SAN MIGUEL DE EL FAIQUE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190308', N'19', N'03', N'08', N'PIURA', N'HUANCABAMBA', N'LALAQUIZ', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190401', N'19', N'04', N'01', N'PIURA', N'MORROPON', N'CHULUCANAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190402', N'19', N'04', N'02', N'PIURA', N'MORROPON', N'BUENOS AIRES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190403', N'19', N'04', N'03', N'PIURA', N'MORROPON', N'CHALACO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190404', N'19', N'04', N'04', N'PIURA', N'MORROPON', N'MORROPON', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190405', N'19', N'04', N'05', N'PIURA', N'MORROPON', N'SALITRAL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190406', N'19', N'04', N'06', N'PIURA', N'MORROPON', N'SANTA CATALINA DE MOSSA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190407', N'19', N'04', N'07', N'PIURA', N'MORROPON', N'SANTO DOMINGO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190408', N'19', N'04', N'08', N'PIURA', N'MORROPON', N'LA MATANZA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190409', N'19', N'04', N'09', N'PIURA', N'MORROPON', N'YAMANGO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190410', N'19', N'04', N'10', N'PIURA', N'MORROPON', N'SAN JUAN DE BIGOTE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190501', N'19', N'05', N'01', N'PIURA', N'PAITA', N'PAITA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190502', N'19', N'05', N'02', N'PIURA', N'PAITA', N'AMOTAPE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190503', N'19', N'05', N'03', N'PIURA', N'PAITA', N'ARENAL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190504', N'19', N'05', N'04', N'PIURA', N'PAITA', N'LA HUACA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190505', N'19', N'05', N'05', N'PIURA', N'PAITA', N'COLAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190506', N'19', N'05', N'06', N'PIURA', N'PAITA', N'TAMARINDO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190507', N'19', N'05', N'07', N'PIURA', N'PAITA', N'VICHAYAL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190601', N'19', N'06', N'01', N'PIURA', N'SULLANA', N'SULLANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190602', N'19', N'06', N'02', N'PIURA', N'SULLANA', N'BELLAVISTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190603', N'19', N'06', N'03', N'PIURA', N'SULLANA', N'LANCONES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190604', N'19', N'06', N'04', N'PIURA', N'SULLANA', N'MARCAVELICA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190605', N'19', N'06', N'05', N'PIURA', N'SULLANA', N'MIGUEL CHECA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190606', N'19', N'06', N'06', N'PIURA', N'SULLANA', N'QUERECOTILLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190607', N'19', N'06', N'07', N'PIURA', N'SULLANA', N'SALITRAL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190608', N'19', N'06', N'08', N'PIURA', N'SULLANA', N'IGNACIO ESCUDERO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190701', N'19', N'07', N'01', N'PIURA', N'TALARA', N'PARIÑAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190702', N'19', N'07', N'02', N'PIURA', N'TALARA', N'EL ALTO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190703', N'19', N'07', N'03', N'PIURA', N'TALARA', N'LA BREA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190704', N'19', N'07', N'04', N'PIURA', N'TALARA', N'LOBITOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190705', N'19', N'07', N'05', N'PIURA', N'TALARA', N'MANCORA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190706', N'19', N'07', N'06', N'PIURA', N'TALARA', N'LOS ORGANOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190801', N'19', N'08', N'01', N'PIURA', N'SECHURA', N'SECHURA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190802', N'19', N'08', N'02', N'PIURA', N'SECHURA', N'VICE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190803', N'19', N'08', N'03', N'PIURA', N'SECHURA', N'BERNAL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190804', N'19', N'08', N'04', N'PIURA', N'SECHURA', N'BELLAVISTA DE LA UNION', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190805', N'19', N'08', N'05', N'PIURA', N'SECHURA', N'CRISTO NOS VALGA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'190806', N'19', N'08', N'06', N'PIURA', N'SECHURA', N'RINCONADA-LLICUAR', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200101', N'20', N'01', N'01', N'PUNO', N'PUNO', N'PUNO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200102', N'20', N'01', N'02', N'PUNO', N'PUNO', N'ACORA', NULL)
GO
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200103', N'20', N'01', N'03', N'PUNO', N'PUNO', N'ATUNCOLLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200104', N'20', N'01', N'04', N'PUNO', N'PUNO', N'CAPACHICA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200105', N'20', N'01', N'05', N'PUNO', N'PUNO', N'COATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200106', N'20', N'01', N'06', N'PUNO', N'PUNO', N'CHUCUITO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200107', N'20', N'01', N'07', N'PUNO', N'PUNO', N'HUATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200108', N'20', N'01', N'08', N'PUNO', N'PUNO', N'MAÑAZO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200109', N'20', N'01', N'09', N'PUNO', N'PUNO', N'PAUCARCOLLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200110', N'20', N'01', N'10', N'PUNO', N'PUNO', N'PICHACANI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200111', N'20', N'01', N'11', N'PUNO', N'PUNO', N'SAN ANTONIO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200112', N'20', N'01', N'12', N'PUNO', N'PUNO', N'TIQUILLACA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200113', N'20', N'01', N'13', N'PUNO', N'PUNO', N'VILQUE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200114', N'20', N'01', N'14', N'PUNO', N'PUNO', N'PLATERIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200115', N'20', N'01', N'15', N'PUNO', N'PUNO', N'AMANTANI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200201', N'20', N'02', N'01', N'PUNO', N'AZANGARO', N'AZANGARO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200202', N'20', N'02', N'02', N'PUNO', N'AZANGARO', N'ACHAYA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200203', N'20', N'02', N'03', N'PUNO', N'AZANGARO', N'ARAPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200204', N'20', N'02', N'04', N'PUNO', N'AZANGARO', N'ASILLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200205', N'20', N'02', N'05', N'PUNO', N'AZANGARO', N'CAMINACA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200206', N'20', N'02', N'06', N'PUNO', N'AZANGARO', N'CHUPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200207', N'20', N'02', N'07', N'PUNO', N'AZANGARO', N'JOSE DOMINGO CHOQUEHUANCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200208', N'20', N'02', N'08', N'PUNO', N'AZANGARO', N'MUÑANI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200210', N'20', N'02', N'10', N'PUNO', N'AZANGARO', N'POTONI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200212', N'20', N'02', N'12', N'PUNO', N'AZANGARO', N'SAMAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200213', N'20', N'02', N'13', N'PUNO', N'AZANGARO', N'SAN ANTON', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200214', N'20', N'02', N'14', N'PUNO', N'AZANGARO', N'SAN JOSE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200215', N'20', N'02', N'15', N'PUNO', N'AZANGARO', N'SAN JUAN DE SALINAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200216', N'20', N'02', N'16', N'PUNO', N'AZANGARO', N'SANTIAGO DE PUPUJA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200217', N'20', N'02', N'17', N'PUNO', N'AZANGARO', N'TIRAPATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200301', N'20', N'03', N'01', N'PUNO', N'CARABAYA', N'MACUSANI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200302', N'20', N'03', N'02', N'PUNO', N'CARABAYA', N'AJOYANI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200303', N'20', N'03', N'03', N'PUNO', N'CARABAYA', N'AYAPATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200304', N'20', N'03', N'04', N'PUNO', N'CARABAYA', N'COASA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200305', N'20', N'03', N'05', N'PUNO', N'CARABAYA', N'CORANI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200306', N'20', N'03', N'06', N'PUNO', N'CARABAYA', N'CRUCERO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200307', N'20', N'03', N'07', N'PUNO', N'CARABAYA', N'ITUATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200308', N'20', N'03', N'08', N'PUNO', N'CARABAYA', N'OLLACHEA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200309', N'20', N'03', N'09', N'PUNO', N'CARABAYA', N'SAN GABAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200310', N'20', N'03', N'10', N'PUNO', N'CARABAYA', N'USICAYOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200401', N'20', N'04', N'01', N'PUNO', N'CHUCUITO', N'JULI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200402', N'20', N'04', N'02', N'PUNO', N'CHUCUITO', N'DESAGUADERO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200403', N'20', N'04', N'03', N'PUNO', N'CHUCUITO', N'HUACULLANI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200406', N'20', N'04', N'06', N'PUNO', N'CHUCUITO', N'PISACOMA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200407', N'20', N'04', N'07', N'PUNO', N'CHUCUITO', N'POMATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200410', N'20', N'04', N'10', N'PUNO', N'CHUCUITO', N'ZEPITA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200412', N'20', N'04', N'12', N'PUNO', N'CHUCUITO', N'KELLUYO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200501', N'20', N'05', N'01', N'PUNO', N'HUANCANE', N'HUANCANE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200502', N'20', N'05', N'02', N'PUNO', N'HUANCANE', N'COJATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200504', N'20', N'05', N'04', N'PUNO', N'HUANCANE', N'INCHUPALLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200506', N'20', N'05', N'06', N'PUNO', N'HUANCANE', N'PUSI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200507', N'20', N'05', N'07', N'PUNO', N'HUANCANE', N'ROSASPATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200508', N'20', N'05', N'08', N'PUNO', N'HUANCANE', N'TARACO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200509', N'20', N'05', N'09', N'PUNO', N'HUANCANE', N'VILQUE CHICO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200511', N'20', N'05', N'11', N'PUNO', N'HUANCANE', N'HUATASANI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200601', N'20', N'06', N'01', N'PUNO', N'LAMPA', N'LAMPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200602', N'20', N'06', N'02', N'PUNO', N'LAMPA', N'CABANILLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200603', N'20', N'06', N'03', N'PUNO', N'LAMPA', N'CALAPUJA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200604', N'20', N'06', N'04', N'PUNO', N'LAMPA', N'NICASIO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200605', N'20', N'06', N'05', N'PUNO', N'LAMPA', N'OCUVIRI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200606', N'20', N'06', N'06', N'PUNO', N'LAMPA', N'PALCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200607', N'20', N'06', N'07', N'PUNO', N'LAMPA', N'PARATIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200608', N'20', N'06', N'08', N'PUNO', N'LAMPA', N'PUCARA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200609', N'20', N'06', N'09', N'PUNO', N'LAMPA', N'SANTA LUCIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200610', N'20', N'06', N'10', N'PUNO', N'LAMPA', N'VILAVILA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200701', N'20', N'07', N'01', N'PUNO', N'MELGAR', N'AYAVIRI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200702', N'20', N'07', N'02', N'PUNO', N'MELGAR', N'ANTAUTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200703', N'20', N'07', N'03', N'PUNO', N'MELGAR', N'CUPI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200704', N'20', N'07', N'04', N'PUNO', N'MELGAR', N'LLALLI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200705', N'20', N'07', N'05', N'PUNO', N'MELGAR', N'MACARI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200706', N'20', N'07', N'06', N'PUNO', N'MELGAR', N'NUÑOA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200707', N'20', N'07', N'07', N'PUNO', N'MELGAR', N'ORURILLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200708', N'20', N'07', N'08', N'PUNO', N'MELGAR', N'SANTA ROSA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200709', N'20', N'07', N'09', N'PUNO', N'MELGAR', N'UMACHIRI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200801', N'20', N'08', N'01', N'PUNO', N'SANDIA', N'SANDIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200803', N'20', N'08', N'03', N'PUNO', N'SANDIA', N'CUYOCUYO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200804', N'20', N'08', N'04', N'PUNO', N'SANDIA', N'LIMBANI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200805', N'20', N'08', N'05', N'PUNO', N'SANDIA', N'PHARA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200806', N'20', N'08', N'06', N'PUNO', N'SANDIA', N'PATAMBUCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200807', N'20', N'08', N'07', N'PUNO', N'SANDIA', N'QUIACA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200808', N'20', N'08', N'08', N'PUNO', N'SANDIA', N'SAN JUAN DEL ORO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200810', N'20', N'08', N'10', N'PUNO', N'SANDIA', N'YANAHUAYA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200811', N'20', N'08', N'11', N'PUNO', N'SANDIA', N'ALTO INAMBARI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200812', N'20', N'08', N'12', N'PUNO', N'SANDIA', N'SAN PEDRO DE PUTINA PUNCO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200901', N'20', N'09', N'01', N'PUNO', N'SAN ROMAN', N'JULIACA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200902', N'20', N'09', N'02', N'PUNO', N'SAN ROMAN', N'CABANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200903', N'20', N'09', N'03', N'PUNO', N'SAN ROMAN', N'CABANILLAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'200904', N'20', N'09', N'04', N'PUNO', N'SAN ROMAN', N'CARACOTO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'201001', N'20', N'10', N'01', N'PUNO', N'YUNGUYO', N'YUNGUYO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'201002', N'20', N'10', N'02', N'PUNO', N'YUNGUYO', N'UNICACHI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'201003', N'20', N'10', N'03', N'PUNO', N'YUNGUYO', N'ANAPIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'201004', N'20', N'10', N'04', N'PUNO', N'YUNGUYO', N'COPANI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'201005', N'20', N'10', N'05', N'PUNO', N'YUNGUYO', N'CUTURAPI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'201006', N'20', N'10', N'06', N'PUNO', N'YUNGUYO', N'OLLARAYA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'201007', N'20', N'10', N'07', N'PUNO', N'YUNGUYO', N'TINICACHI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'201101', N'20', N'11', N'01', N'PUNO', N'SAN ANTONIO DE PUTINA', N'PUTINA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'201102', N'20', N'11', N'02', N'PUNO', N'SAN ANTONIO DE PUTINA', N'PEDRO VILCA APAZA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'201103', N'20', N'11', N'03', N'PUNO', N'SAN ANTONIO DE PUTINA', N'QUILCAPUNCU', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'201104', N'20', N'11', N'04', N'PUNO', N'SAN ANTONIO DE PUTINA', N'ANANEA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'201105', N'20', N'11', N'05', N'PUNO', N'SAN ANTONIO DE PUTINA', N'SINA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'201201', N'20', N'12', N'01', N'PUNO', N'EL COLLAO', N'ILAVE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'201202', N'20', N'12', N'02', N'PUNO', N'EL COLLAO', N'PILCUYO', NULL)
GO
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'201203', N'20', N'12', N'03', N'PUNO', N'EL COLLAO', N'SANTA ROSA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'201204', N'20', N'12', N'04', N'PUNO', N'EL COLLAO', N'CAPASO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'201205', N'20', N'12', N'05', N'PUNO', N'EL COLLAO', N'CONDURIRI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'201301', N'20', N'13', N'01', N'PUNO', N'MOHO', N'MOHO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'201302', N'20', N'13', N'02', N'PUNO', N'MOHO', N'CONIMA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'201303', N'20', N'13', N'03', N'PUNO', N'MOHO', N'TILALI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'201304', N'20', N'13', N'04', N'PUNO', N'MOHO', N'HUAYRAPATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210101', N'21', N'01', N'01', N'SAN MARTIN', N'MOYOBAMBA', N'MOYOBAMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210102', N'21', N'01', N'02', N'SAN MARTIN', N'MOYOBAMBA', N'CALZADA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210103', N'21', N'01', N'03', N'SAN MARTIN', N'MOYOBAMBA', N'HABANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210104', N'21', N'01', N'04', N'SAN MARTIN', N'MOYOBAMBA', N'JEPELACIO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210105', N'21', N'01', N'05', N'SAN MARTIN', N'MOYOBAMBA', N'SORITOR', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210106', N'21', N'01', N'06', N'SAN MARTIN', N'MOYOBAMBA', N'YANTALO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210201', N'21', N'02', N'01', N'SAN MARTIN', N'HUALLAGA', N'SAPOSOA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210202', N'21', N'02', N'02', N'SAN MARTIN', N'HUALLAGA', N'PISCOYACU', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210203', N'21', N'02', N'03', N'SAN MARTIN', N'HUALLAGA', N'SACANCHE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210204', N'21', N'02', N'04', N'SAN MARTIN', N'HUALLAGA', N'TINGO DE SAPOSOA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210205', N'21', N'02', N'05', N'SAN MARTIN', N'HUALLAGA', N'ALTO SAPOSOA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210206', N'21', N'02', N'06', N'SAN MARTIN', N'HUALLAGA', N'EL ESLABON', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210301', N'21', N'03', N'01', N'SAN MARTIN', N'LAMAS', N'LAMAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210303', N'21', N'03', N'03', N'SAN MARTIN', N'LAMAS', N'BARRANQUITA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210304', N'21', N'03', N'04', N'SAN MARTIN', N'LAMAS', N'CAYNARACHI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210305', N'21', N'03', N'05', N'SAN MARTIN', N'LAMAS', N'CUÑUMBUQUI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210306', N'21', N'03', N'06', N'SAN MARTIN', N'LAMAS', N'PINTO RECODO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210307', N'21', N'03', N'07', N'SAN MARTIN', N'LAMAS', N'RUMISAPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210311', N'21', N'03', N'11', N'SAN MARTIN', N'LAMAS', N'SHANAO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210313', N'21', N'03', N'13', N'SAN MARTIN', N'LAMAS', N'TABALOSOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210314', N'21', N'03', N'14', N'SAN MARTIN', N'LAMAS', N'ZAPATERO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210315', N'21', N'03', N'15', N'SAN MARTIN', N'LAMAS', N'ALONSO DE ALVARADO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210316', N'21', N'03', N'16', N'SAN MARTIN', N'LAMAS', N'SAN ROQUE DE CUMBAZA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210401', N'21', N'04', N'01', N'SAN MARTIN', N'MARISCAL CACERES', N'JUANJUI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210402', N'21', N'04', N'02', N'SAN MARTIN', N'MARISCAL CACERES', N'CAMPANILLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210403', N'21', N'04', N'03', N'SAN MARTIN', N'MARISCAL CACERES', N'HUICUNGO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210404', N'21', N'04', N'04', N'SAN MARTIN', N'MARISCAL CACERES', N'PACHIZA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210405', N'21', N'04', N'05', N'SAN MARTIN', N'MARISCAL CACERES', N'PAJARILLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210501', N'21', N'05', N'01', N'SAN MARTIN', N'RIOJA', N'RIOJA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210502', N'21', N'05', N'02', N'SAN MARTIN', N'RIOJA', N'POSIC', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210503', N'21', N'05', N'03', N'SAN MARTIN', N'RIOJA', N'YORONGOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210504', N'21', N'05', N'04', N'SAN MARTIN', N'RIOJA', N'YURACYACU', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210505', N'21', N'05', N'05', N'SAN MARTIN', N'RIOJA', N'NUEVA CAJAMARCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210506', N'21', N'05', N'06', N'SAN MARTIN', N'RIOJA', N'ELIAS SOPLIN VARGAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210507', N'21', N'05', N'07', N'SAN MARTIN', N'RIOJA', N'SAN FERNANDO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210508', N'21', N'05', N'08', N'SAN MARTIN', N'RIOJA', N'PARDO MIGUEL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210509', N'21', N'05', N'09', N'SAN MARTIN', N'RIOJA', N'AWAJUN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210601', N'21', N'06', N'01', N'SAN MARTIN', N'SAN MARTIN', N'TARAPOTO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210602', N'21', N'06', N'02', N'SAN MARTIN', N'SAN MARTIN', N'ALBERTO LEVEAU', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210604', N'21', N'06', N'04', N'SAN MARTIN', N'SAN MARTIN', N'CACATACHI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210606', N'21', N'06', N'06', N'SAN MARTIN', N'SAN MARTIN', N'CHAZUTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210607', N'21', N'06', N'07', N'SAN MARTIN', N'SAN MARTIN', N'CHIPURANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210608', N'21', N'06', N'08', N'SAN MARTIN', N'SAN MARTIN', N'EL PORVENIR', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210609', N'21', N'06', N'09', N'SAN MARTIN', N'SAN MARTIN', N'HUIMBAYOC', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210610', N'21', N'06', N'10', N'SAN MARTIN', N'SAN MARTIN', N'JUAN GUERRA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210611', N'21', N'06', N'11', N'SAN MARTIN', N'SAN MARTIN', N'MORALES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210612', N'21', N'06', N'12', N'SAN MARTIN', N'SAN MARTIN', N'PAPAPLAYA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210616', N'21', N'06', N'16', N'SAN MARTIN', N'SAN MARTIN', N'SAN ANTONIO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210619', N'21', N'06', N'19', N'SAN MARTIN', N'SAN MARTIN', N'SAUCE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210620', N'21', N'06', N'20', N'SAN MARTIN', N'SAN MARTIN', N'SHAPAJA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210621', N'21', N'06', N'21', N'SAN MARTIN', N'SAN MARTIN', N'LA BANDA DE SHILCAYO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210701', N'21', N'07', N'01', N'SAN MARTIN', N'BELLAVISTA', N'BELLAVISTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210702', N'21', N'07', N'02', N'SAN MARTIN', N'BELLAVISTA', N'SAN RAFAEL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210703', N'21', N'07', N'03', N'SAN MARTIN', N'BELLAVISTA', N'SAN PABLO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210704', N'21', N'07', N'04', N'SAN MARTIN', N'BELLAVISTA', N'ALTO BIAVO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210705', N'21', N'07', N'05', N'SAN MARTIN', N'BELLAVISTA', N'HUALLAGA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210706', N'21', N'07', N'06', N'SAN MARTIN', N'BELLAVISTA', N'BAJO BIAVO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210801', N'21', N'08', N'01', N'SAN MARTIN', N'TOCACHE', N'TOCACHE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210802', N'21', N'08', N'02', N'SAN MARTIN', N'TOCACHE', N'NUEVO PROGRESO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210803', N'21', N'08', N'03', N'SAN MARTIN', N'TOCACHE', N'POLVORA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210804', N'21', N'08', N'04', N'SAN MARTIN', N'TOCACHE', N'SHUNTE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210805', N'21', N'08', N'05', N'SAN MARTIN', N'TOCACHE', N'UCHIZA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210901', N'21', N'09', N'01', N'SAN MARTIN', N'PICOTA', N'PICOTA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210902', N'21', N'09', N'02', N'SAN MARTIN', N'PICOTA', N'BUENOS AIRES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210903', N'21', N'09', N'03', N'SAN MARTIN', N'PICOTA', N'CASPIZAPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210904', N'21', N'09', N'04', N'SAN MARTIN', N'PICOTA', N'PILLUANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210905', N'21', N'09', N'05', N'SAN MARTIN', N'PICOTA', N'PUCACACA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210906', N'21', N'09', N'06', N'SAN MARTIN', N'PICOTA', N'SAN CRISTOBAL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210907', N'21', N'09', N'07', N'SAN MARTIN', N'PICOTA', N'SAN HILARION', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210908', N'21', N'09', N'08', N'SAN MARTIN', N'PICOTA', N'TINGO DE PONASA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210909', N'21', N'09', N'09', N'SAN MARTIN', N'PICOTA', N'TRES UNIDOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'210910', N'21', N'09', N'10', N'SAN MARTIN', N'PICOTA', N'SHAMBOYACU', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'211001', N'21', N'10', N'01', N'SAN MARTIN', N'EL DORADO', N'SAN JOSE DE SISA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'211002', N'21', N'10', N'02', N'SAN MARTIN', N'EL DORADO', N'AGUA BLANCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'211003', N'21', N'10', N'03', N'SAN MARTIN', N'EL DORADO', N'SHATOJA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'211004', N'21', N'10', N'04', N'SAN MARTIN', N'EL DORADO', N'SAN MARTIN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'211005', N'21', N'10', N'05', N'SAN MARTIN', N'EL DORADO', N'SANTA ROSA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'220101', N'22', N'01', N'01', N'TACNA', N'TACNA', N'TACNA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'220102', N'22', N'01', N'02', N'TACNA', N'TACNA', N'CALANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'220104', N'22', N'01', N'04', N'TACNA', N'TACNA', N'INCLAN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'220107', N'22', N'01', N'07', N'TACNA', N'TACNA', N'PACHIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'220108', N'22', N'01', N'08', N'TACNA', N'TACNA', N'PALCA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'220109', N'22', N'01', N'09', N'TACNA', N'TACNA', N'POCOLLAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'220110', N'22', N'01', N'10', N'TACNA', N'TACNA', N'SAMA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'220111', N'22', N'01', N'11', N'TACNA', N'TACNA', N'ALTO DE LA ALIANZA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'220112', N'22', N'01', N'12', N'TACNA', N'TACNA', N'CIUDAD NUEVA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'220113', N'22', N'01', N'13', N'TACNA', N'TACNA', N'CORONEL GREGORIO ALBARRACIN L.', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'220201', N'22', N'02', N'01', N'TACNA', N'TARATA', N'TARATA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'220205', N'22', N'02', N'05', N'TACNA', N'TARATA', N'HEROES ALBARRACIN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'220206', N'22', N'02', N'06', N'TACNA', N'TARATA', N'ESTIQUE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'220207', N'22', N'02', N'07', N'TACNA', N'TARATA', N'ESTIQUE PAMPA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'220210', N'22', N'02', N'10', N'TACNA', N'TARATA', N'SITAJARA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'220211', N'22', N'02', N'11', N'TACNA', N'TARATA', N'SUSAPAYA', NULL)
go
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'220212', N'22', N'02', N'12', N'TACNA', N'TARATA', N'TARUCACHI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'220213', N'22', N'02', N'13', N'TACNA', N'TARATA', N'TICACO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'220301', N'22', N'03', N'01', N'TACNA', N'JORGE BASADRE', N'LOCUMBA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'220302', N'22', N'03', N'02', N'TACNA', N'JORGE BASADRE', N'ITE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'220303', N'22', N'03', N'03', N'TACNA', N'JORGE BASADRE', N'ILABAYA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'220401', N'22', N'04', N'01', N'TACNA', N'CANDARAVE', N'CANDARAVE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'220402', N'22', N'04', N'02', N'TACNA', N'CANDARAVE', N'CAIRANI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'220403', N'22', N'04', N'03', N'TACNA', N'CANDARAVE', N'CURIBAYA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'220404', N'22', N'04', N'04', N'TACNA', N'CANDARAVE', N'HUANUARA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'220405', N'22', N'04', N'05', N'TACNA', N'CANDARAVE', N'QUILAHUANI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'220406', N'22', N'04', N'06', N'TACNA', N'CANDARAVE', N'CAMILACA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'230101', N'23', N'01', N'01', N'TUMBES', N'TUMBES', N'TUMBES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'230102', N'23', N'01', N'02', N'TUMBES', N'TUMBES', N'CORRALES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'230103', N'23', N'01', N'03', N'TUMBES', N'TUMBES', N'LA CRUZ', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'230104', N'23', N'01', N'04', N'TUMBES', N'TUMBES', N'PAMPAS DE HOSPITAL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'230105', N'23', N'01', N'05', N'TUMBES', N'TUMBES', N'SAN JACINTO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'230106', N'23', N'01', N'06', N'TUMBES', N'TUMBES', N'SAN JUAN DE LA VIRGEN', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'230201', N'23', N'02', N'01', N'TUMBES', N'CONTRALMIRANTE VILLAR', N'ZORRITOS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'230202', N'23', N'02', N'02', N'TUMBES', N'CONTRALMIRANTE VILLAR', N'CASITAS', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'230203', N'23', N'02', N'03', N'TUMBES', N'CONTRALMIRANTE VILLAR', N'CANOAS DE PUNTA SAL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'230301', N'23', N'03', N'01', N'TUMBES', N'ZARUMILLA', N'ZARUMILLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'230302', N'23', N'03', N'02', N'TUMBES', N'ZARUMILLA', N'MATAPALO', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'230303', N'23', N'03', N'03', N'TUMBES', N'ZARUMILLA', N'PAPAYAL', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'230304', N'23', N'03', N'04', N'TUMBES', N'ZARUMILLA', N'AGUAS VERDES', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'250101', N'25', N'01', N'01', N'UCAYALI', N'CORONEL PORTILLO', N'CALLERIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'250102', N'25', N'01', N'02', N'UCAYALI', N'CORONEL PORTILLO', N'YARINACOCHA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'250103', N'25', N'01', N'03', N'UCAYALI', N'CORONEL PORTILLO', N'MASISEA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'250104', N'25', N'01', N'04', N'UCAYALI', N'CORONEL PORTILLO', N'CAMPOVERDE', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'250105', N'25', N'01', N'05', N'UCAYALI', N'CORONEL PORTILLO', N'IPARIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'250106', N'25', N'01', N'06', N'UCAYALI', N'CORONEL PORTILLO', N'NUEVA REQUENA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'250107', N'25', N'01', N'07', N'UCAYALI', N'CORONEL PORTILLO', N'MANANTAY', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'250201', N'25', N'02', N'01', N'UCAYALI', N'PADRE ABAD', N'PADRE ABAD', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'250202', N'25', N'02', N'02', N'UCAYALI', N'PADRE ABAD', N'IRAZOLA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'250203', N'25', N'02', N'03', N'UCAYALI', N'PADRE ABAD', N'CURIMANA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'250301', N'25', N'03', N'01', N'UCAYALI', N'ATALAYA', N'RAIMONDI', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'250302', N'25', N'03', N'02', N'UCAYALI', N'ATALAYA', N'TAHUANIA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'250303', N'25', N'03', N'03', N'UCAYALI', N'ATALAYA', N'YURUA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'250304', N'25', N'03', N'04', N'UCAYALI', N'ATALAYA', N'SEPAHUA', NULL)
INSERT [dbo].[Tb_Ubigeo] ([Id_Ubigeo], [IdDepa], [IdProv], [IdDist], [Departamento], [Provincia], [Distrito], [Cod_Pro]) VALUES (N'250401', N'25', N'04', N'01', N'UCAYALI', N'PURUS', N'PURUS', NULL)
GO

/*INSERT ESPECIALIDAD*/

Select * From Tb_Especialidad

Set Identity_Insert [dbo].[Tb_Especialidad] On
Insert [Tb_Especialidad] ([Id_Espec],[Nom_Espec],[Des_Espec]) Values (1,'Psicologo','Especialista patrones anormales de comportamiento')
Insert [Tb_Especialidad] ([Id_Espec],[Nom_Espec],[Des_Espec]) Values (2,'Psiquiatra','Medico especialista patrones anormales mentales.')
Insert [Tb_Especialidad] ([Id_Espec],[Nom_Espec],[Des_Espec]) Values (3,'Terapeuta Infantil','Especialista comportamiento infantil')
Insert [Tb_Especialidad] ([Id_Espec],[Nom_Espec],[Des_Espec]) Values (4,'Psicologo Organizacional','Especialista en le manejo de organizaciones')
Insert [Tb_Especialidad] ([Id_Espec],[Nom_Espec],[Des_Espec]) Values (5,'Psicoanalista','Especialista en el psicoanálsis')
Insert [Tb_Especialidad] ([Id_Espec],[Nom_Espec],[Des_Espec]) Values (6,'Psicólogo Forense','Especialista en casos criminales')
Insert [Tb_Especialidad] ([Id_Espec],[Nom_Espec],[Des_Espec]) Values (7,'Psicologo Educativo','Especialista en organizaciones educativas')
Insert [Tb_Especialidad] ([Id_Espec],[Nom_Espec],[Des_Espec]) Values (8,'Psicologo Lógico-Conductual','Especialista en el manejo de las conductas')
Insert [Tb_Especialidad] ([Id_Espec],[Nom_Espec],[Des_Espec]) Values (9,'Psicoanalista clínico','psicoterapueta con competencias psiquiátricas')
Insert [Tb_Especialidad] ([Id_Espec],[Nom_Espec],[Des_Espec]) Values (10,'Psicologo Deportivo','Especialista en el maenejo de deportistas')
Insert [Tb_Especialidad] ([Id_Espec],[Nom_Espec],[Des_Espec]) Values (11,'Psicólogo experimentales','psicólogs dedicados a la investigación')
Insert [Tb_Especialidad] ([Id_Espec],[Nom_Espec],[Des_Espec]) Values (12,'Terapeuta Infantil','Especialista comportamiento infantil')
Insert [Tb_Especialidad] ([Id_Espec],[Nom_Espec],[Des_Espec]) Values (13,'Psicologos del desarrollo','en los jóvenes')
Insert [Tb_Especialidad] ([Id_Espec],[Nom_Espec],[Des_Espec]) Values (14,'Neuropsicólogos','Especialistas en neurología')
Insert [Tb_Especialidad] ([Id_Espec],[Nom_Espec],[Des_Espec]) Values (15,'Psicólogos sociales','Especialista ')
Insert [Tb_Especialidad] ([Id_Espec],[Nom_Espec],[Des_Espec]) Values (16,'Sexólogos','Especialista en el ámbito sexual de los pacientes')
Insert [Tb_Especialidad] ([Id_Espec],[Nom_Espec],[Des_Espec]) Values (17,'psicogerontólogos','Especialistas en la vejez')
Insert [Tb_Especialidad] ([Id_Espec],[Nom_Espec],[Des_Espec]) Values (18,'Psicólogo de marketing','Especialistas en el marketing')
Insert [Tb_Especialidad] ([Id_Espec],[Nom_Espec],[Des_Espec]) Values (19,'Psicologo General','psicólogo sin ninguna especialidad')
Insert [Tb_Especialidad] ([Id_Espec],[Nom_Espec],[Des_Espec]) Values (20,'Practicante','Estudiante')
Set Identity_Insert [dbo].[Tb_Especialidad] Off
GO

/*INSERT PROFESIONAL*/

Select * From Tb_Profesional

INSERT [Tb_Profesional] VALUES (N'P01', 1 , N'Juan Ramon', N'Sequeiros Ramos', 2200.0000, CAST(N'2010-11-15T00:00:00.000' AS DateTime), N'40736223', N'jramonsq56@gmail.com', CAST(N'2015-11-08T11:15:28.353' AS DateTime), N'Admin', NULL, NULL, 1)
INSERT [Tb_Profesional] VALUES (N'P02', 2 , N'Maria Mercedes', N'Olivares Mejia', 4000.0000, CAST(N'2011-11-15T00:00:00.000' AS DateTime), N'78915468', N'marita69@gmail.com', CAST(N'2015-11-08T11:15:28.353' AS DateTime), N'Admin', NULL, NULL, 1)
INSERT [Tb_Profesional] VALUES (N'P03', 3 , N'Richard', N'Rayme Cardenas ', 1800.0000, CAST(N'2012-11-15T00:00:00.000' AS DateTime), N'77736223', N'handstone@gmail.com', CAST(N'2015-11-08T11:15:28.353' AS DateTime), N'Admin', NULL, NULL, 1)
INSERT [Tb_Profesional] VALUES (N'P04', 4 , N'Samuel', N'Cisneros', 2200.0000, CAST(N'2011-12-15T00:00:00.000' AS DateTime), N'72598432', N'papasyhelado@gmail.com', CAST(N'2015-11-08T11:15:28.353' AS DateTime), N'Admin', NULL, NULL, 1)
INSERT [Tb_Profesional] VALUES (N'P05', 5 , N'Richards', N'Olivares Zafra', 4000.0000, CAST(N'2010-01-05T00:00:00.000' AS DateTime), N'77895433', N'masmas@gmail.com', CAST(N'2015-11-08T11:15:28.353' AS DateTime), N'Admin', NULL, NULL, 1)
INSERT [Tb_Profesional] VALUES (N'P06', 5 , N'Ronaldo', N'Winston ', 1800.0000, CAST(N'2010-05-19T00:00:00.000' AS DateTime), N'99424999', N'psicology55@gmail.com', CAST(N'2015-11-08T11:15:28.353' AS DateTime), N'Admin', NULL, NULL, 1)
INSERT [Tb_Profesional] VALUES (N'P07', 5 , N'Juan Ramon', N'Sequeiros Ramos', 2200.0000, CAST(N'2013-12-15T00:00:00.000' AS DateTime), N'79168466', N'freudfan666@gmail.com', CAST(N'2015-11-08T11:15:28.353' AS DateTime), N'Admin', NULL, NULL, 1)
INSERT [Tb_Profesional] VALUES (N'P08', 6 , N'Scout', N'Lovecraft', 4000.0000, CAST(N'2010-10-26T00:00:00.000' AS DateTime), N'79855556', N'maxtone69@gmail.com', CAST(N'2015-11-08T11:15:28.353' AS DateTime), N'Admin', NULL, NULL, 1)
INSERT [Tb_Profesional] VALUES (N'P09', 6 , N'Celestia', N'Royalness ', 1800.0000, CAST(N'2013-10-18T00:00:00.000' AS DateTime), N'12111568', N'coconut55@gmail.com', CAST(N'2015-11-08T11:15:28.353' AS DateTime), N'Admin', NULL, NULL, 1)
INSERT [Tb_Profesional] VALUES (N'P10', 10 , N'Luna', N'Shining', 2200.0000, CAST(N'2014-11-17T00:00:00.000' AS DateTime), N'50400253', N'sodafocuailt@gmail.com', CAST(N'2015-11-08T11:15:28.353' AS DateTime), N'Admin', NULL, NULL, 1)
INSERT [Tb_Profesional] VALUES (N'P11', 12 , N'Maria', N'Bastidas', 4000.0000, CAST(N'2011-08-08T00:00:00.000' AS DateTime), N'05400269', N'facoultfan99@gmail.com', CAST(N'2015-11-08T11:15:28.353' AS DateTime), N'Admin', NULL, NULL, 1)
INSERT [Tb_Profesional] VALUES (N'P12', 16 , N'Felipe', N'Cuarto ', 1800.0000, CAST(N'2012-09-10T00:00:00.000' AS DateTime), N'78922188', N'squirrel89@gmail.com', CAST(N'2015-11-08T11:15:28.353' AS DateTime), N'Admin', NULL, NULL, 1)
INSERT [Tb_Profesional] VALUES (N'P13', 19 , N'Ramón', N'Cortéz', 2200.0000, CAST(N'2011-01-05T00:00:00.000' AS DateTime), N'78977448', N'ggletsgo64@gmail.com', CAST(N'2015-11-08T11:15:28.353' AS DateTime), N'Admin', NULL, NULL, 1)
INSERT [Tb_Profesional] VALUES (N'P14', 2 , N'Linda', N'Ochoa', 4000.0000, CAST(N'2009-10-05T00:00:00.000' AS DateTime), N'08479699', N'marcelo88@gmail.com', CAST(N'2015-11-08T11:15:28.353' AS DateTime), N'Admin', NULL, NULL, 1)
INSERT [Tb_Profesional] VALUES (N'P15', 6 , N'Nicolle', N'Wattersone ', 1800.0000, CAST(N'2012-01-01T00:00:00.000' AS DateTime), N'77890140', N'doometernal99@gmail.com', CAST(N'2015-11-08T11:15:28.353' AS DateTime), N'Admin', NULL, NULL, 1)
INSERT [Tb_Profesional] VALUES (N'P16', 10 , N'Homero', N'Simpsons', 2200.0000, CAST(N'2011-01-06T00:00:00.000' AS DateTime), N'04998850', N'feli8989@gmail.com', CAST(N'2015-11-08T11:15:28.353' AS DateTime), N'Admin', NULL, NULL, 1)
INSERT [Tb_Profesional] VALUES (N'P17', 2 , N'Luz', N'Quispe', 4000.0000, CAST(N'2011-11-15T00:00:00.000' AS DateTime), N'08744033', N'mkultra231@gmail.com', CAST(N'2015-11-08T11:15:28.353' AS DateTime), N'Admin', NULL, NULL, 1)
INSERT [Tb_Profesional] VALUES (N'P18', 6 , N'Candice', N'Balls ', 1800.0000, CAST(N'2012-11-15T00:00:00.000' AS DateTime), N'55300069', N'totheend66@gmail.com', CAST(N'2015-11-08T11:15:28.353' AS DateTime), N'Admin', NULL, NULL, 1)
INSERT [Tb_Profesional] VALUES (N'P19', 10 , N'Lenin', N'Santos', 2200.0000, CAST(N'2010-11-15T00:00:00.000' AS DateTime), N'74920778', N'lele89@gmail.com', CAST(N'2015-11-08T11:15:28.353' AS DateTime), N'Admin', NULL, NULL, 1)
INSERT [Tb_Profesional] VALUES (N'P20', 20 , N'Federico', N'Oliveros', 500.0000, CAST(N'2011-11-15T00:00:00.000' AS DateTime), N'08963472', N'federico8989@gmail.com', CAST(N'2015-11-08T11:15:28.353' AS DateTime), N'Admin', NULL, NULL, 1)
Go

/*INSERT APODERADO*/

Select * From Tb_Apoderado;
Select * from Tb_Ubigeo where Id_Ubigeo = '010101';

use [Centro-EADES]
go

INSERT [Tb_Apoderado] VALUES (N'A001', N'140101' ,'Manuel','Gutierrez Reyes', N'Calle Independencia 123', N'77737458', N'999124279', CAST(N'2018-09-15T00:00:00.000' AS DateTime), N'Ximena Diaz',NULL, NULL, 1)
INSERT [Tb_Apoderado] VALUES (N'A002', N'140102' ,'Daniela','Guevara Mejia', N'Calle Esperanza 478', N'43737458', N'998824278', CAST(N'2018-08-14T00:00:00.000' AS DateTime), N'Paola',NULL, NULL, 1)
INSERT [Tb_Apoderado] VALUES (N'A003', N'140103' ,'Fannia','Ramos Icht ',  N'Jr. Libertad 156', N'56737458', N'998342576', CAST(N'2018-07-13T00:00:00.000' AS DateTime), N'Ximena Diaz',NULL, NULL, 1)

-- Adición de apoderados
INSERT [Tb_Apoderado] VALUES (N'A004', N'250103' ,'Manuel','Coronado Preciado', N'Calle Independencia 200', N'85713864', N'999123308', CAST(N'2018-10-30T00:00:00.000' AS DateTime), N'Lucas Caviar',NULL, NULL, 1)
INSERT [Tb_Apoderado] VALUES (N'A005', N'250106' ,'Miguel','Carvantes Mendoza', N'Calle Cruceta 126', N'15562111', N'99869423', CAST(N'2017-09-04T00:00:00.000' AS DateTime), N'Nicolas Amadeo',NULL, NULL, 1)
INSERT [Tb_Apoderado] VALUES (N'A006', N'220213' ,'Fanny','Sparkle ',  N'Jr. La Molina 789', N'80557887', N'998593347', CAST(N'2019-09-09T00:00:00.000' AS DateTime), N'Mauricio Carvajal',NULL, NULL, 1)
INSERT [Tb_Apoderado] VALUES (N'A007', N'211004' ,'Rita','Perez Ayala', N'Calle Los Carrizos 363', N'42027695', N'999216204', CAST(N'2018-01-16T00:00:00.000' AS DateTime), N'Celeste Villanueva',NULL, NULL, 1)
INSERT [Tb_Apoderado] VALUES (N'A008', N'210503' ,'Lisa','Mosqote Villa', N'Calle Pista Nueva 59', N'19827611', N'998930471', CAST(N'2018-10-10T00:00:00.000' AS DateTime), N'Paolo Carvajal',NULL, NULL, 1)
INSERT [Tb_Apoderado] VALUES (N'A009', N'210205' ,'Celeste','Rosquete Campos',  N'Calle SrJuan 150', N'16175547', N'998788783', CAST(N'2018-07-13T00:00:00.000' AS DateTime), N'Amber Jara',NULL, NULL, 1)
INSERT [Tb_Apoderado] VALUES (N'A010', N'200806' ,'Elma','Mador', N'Calle Los últimos de Dios 780', N'84546953', N'999686078', CAST(N'2019-10-15T00:00:00.000' AS DateTime), N'Daniel Ramos',NULL, NULL, 1)
INSERT [Tb_Apoderado] VALUES (N'A011', N'200701' ,'Daniel','Ereje Campos', N'Calle Las Gaviotas 666', N'85980058', N'998694791', CAST(N'2018-06-04T00:00:00.000' AS DateTime), N'Carlos',NULL, NULL, 1)
INSERT [Tb_Apoderado] VALUES (N'A012', N'200504' ,'Fiona','Obregón Escala',  N'Calle Los Girasoles 659', N'40703331', N'99860402', CAST(N'2018-02-20T00:00:00.000' AS DateTime), N'Estefany',NULL, NULL, 1)
INSERT [Tb_Apoderado] VALUES (N'A013', N'200303' ,'Manco','Quispe Huaylas', N'Calle Los Primeros 450', N'39554887', N'999488735', CAST(N'2018-10-11T00:00:00.000' AS DateTime), N'Candace',NULL, NULL, 1)
INSERT [Tb_Apoderado] VALUES (N'A014', N'200204' ,'Simon','Primo de Rivera', N'Calle Matelini 125', N'36299007', N'998619623', CAST(N'2018-08-10T00:00:00.000' AS DateTime), N'Sebastian',NULL, NULL, 1)
INSERT [Tb_Apoderado] VALUES (N'A015', N'200103' ,'Francisco','Franco',  N'Calle Los caminos 780', N'25013922', N'998912020', CAST(N'2018-07-12T00:00:00.000' AS DateTime), N'Esmeralda Iguarán',NULL, NULL, 1)
INSERT [Tb_Apoderado] VALUES (N'A016', N'180108' ,'Matías','De la Rosa Gonzales', N'Calle Sin Esperanza 200', N'11449393', N'999753079', CAST(N'2018-09-10T00:00:00.000' AS DateTime), N'Eulalia',NULL, NULL, 1)
INSERT [Tb_Apoderado] VALUES (N'A017', N'160202' ,'Paulo','Torres Villanueva', N'Calle Esperanza 478', N'81732377', N'998300037', CAST(N'2018-08-01T00:00:00.000' AS DateTime), N'José Rivero',NULL, NULL, 1)
INSERT [Tb_Apoderado] VALUES (N'A020', N'150406' ,'Lucas','Mother Tres', N'Calle Esperanza 478', N'79737364', N'998906620', CAST(N'2018-10-24T00:00:00.000' AS DateTime), N'Julio Ramón',NULL, NULL, 1)
INSERT [Tb_Apoderado] VALUES (N'A021', N'150305' ,'Esmeralda','Rojas Comas ',  N'Jr. Libertad 156', N'87087642', N'998433798', CAST(N'2018-03-13T00:00:00.000' AS DateTime), N'Clarín Alas',NULL, NULL, 1)
INSERT [Tb_Apoderado] VALUES (N'A022', N'150301' ,'Cristian','Perez de Ayala', N'Calle Independencia 123', N'34227187', N'999218598', CAST(N'2018-10-25T00:00:00.000' AS DateTime), N'Diana Ana',NULL, NULL, 1)
INSERT [Tb_Apoderado] VALUES (N'A023', N'140902' ,'Carla','De la Nueva', N'Calle Esperanza 477', N'45911925', N'999886527', CAST(N'2018-12-13T00:00:00.000' AS DateTime), N'Paula Ramirez',NULL, NULL, 1)
INSERT [Tb_Apoderado] VALUES (N'A024', N'140901' ,'Ana','Cristiana',  N'Jr. Estrella 188', N'20118712', N'998661745', CAST(N'2018-12-23T00:00:00.000' AS DateTime), N'Pilar Soto',NULL, NULL, 1)

go

/*INSERT HORARIO_SESIONES*/

use [Centro-EADES]
go

Select * From Tb_Horario_Sesiones

Set Identity_Insert [dbo].[Tb_Horario_Sesiones] On
INSERT [Tb_Horario_Sesiones] ([Cod_Horario_Ses],[Cod_Pro],[Descrip_dia],[Est_Hor_Ses]) VALUES ( 1, N'P01' , N'Martes , Jueves', 1)
INSERT [Tb_Horario_Sesiones] ([Cod_Horario_Ses],[Cod_Pro],[Descrip_dia],[Est_Hor_Ses]) VALUES ( 2, N'P02' , N'Lunes , Viernes', 1)
INSERT [Tb_Horario_Sesiones] ([Cod_Horario_Ses],[Cod_Pro],[Descrip_dia],[Est_Hor_Ses]) VALUES ( 3, N'P03' , N'Martes , Jueves', 1)
INSERT [Tb_Horario_Sesiones] ([Cod_Horario_Ses],[Cod_Pro],[Descrip_dia],[Est_Hor_Ses]) VALUES ( 4, N'P04' , N'Lunes , Miercoles , Viernes', 1)
INSERT [Tb_Horario_Sesiones] ([Cod_Horario_Ses],[Cod_Pro],[Descrip_dia],[Est_Hor_Ses]) VALUES ( 5, N'P05' , N'Lunes', 1)
INSERT [Tb_Horario_Sesiones] ([Cod_Horario_Ses],[Cod_Pro],[Descrip_dia],[Est_Hor_Ses]) VALUES ( 6, N'P06' , N'Martes', 1)
INSERT [Tb_Horario_Sesiones] ([Cod_Horario_Ses],[Cod_Pro],[Descrip_dia],[Est_Hor_Ses]) VALUES ( 7, N'P07' , N'Jueves', 1)
INSERT [Tb_Horario_Sesiones] ([Cod_Horario_Ses],[Cod_Pro],[Descrip_dia],[Est_Hor_Ses]) VALUES ( 8, N'P08' , N'Miercoles , Viernes', 1)
INSERT [Tb_Horario_Sesiones] ([Cod_Horario_Ses],[Cod_Pro],[Descrip_dia],[Est_Hor_Ses]) VALUES ( 9, N'P09' , N'Jueves', 1)
INSERT [Tb_Horario_Sesiones] ([Cod_Horario_Ses],[Cod_Pro],[Descrip_dia],[Est_Hor_Ses]) VALUES ( 10, N'P10' , N'Martes', 1)
INSERT [Tb_Horario_Sesiones] ([Cod_Horario_Ses],[Cod_Pro],[Descrip_dia],[Est_Hor_Ses]) VALUES ( 11, N'P11' , N'Jueves', 1)
INSERT [Tb_Horario_Sesiones] ([Cod_Horario_Ses],[Cod_Pro],[Descrip_dia],[Est_Hor_Ses]) VALUES ( 12, N'P12' , N'Viernes', 1)
INSERT [Tb_Horario_Sesiones] ([Cod_Horario_Ses],[Cod_Pro],[Descrip_dia],[Est_Hor_Ses]) VALUES ( 13, N'P13' , N'Martes', 1)
INSERT [Tb_Horario_Sesiones] ([Cod_Horario_Ses],[Cod_Pro],[Descrip_dia],[Est_Hor_Ses]) VALUES ( 14, N'P14' , N'Viernes', 1)
INSERT [Tb_Horario_Sesiones] ([Cod_Horario_Ses],[Cod_Pro],[Descrip_dia],[Est_Hor_Ses]) VALUES ( 15, N'P15' , N'Martes , Jueves', 1)
INSERT [Tb_Horario_Sesiones] ([Cod_Horario_Ses],[Cod_Pro],[Descrip_dia],[Est_Hor_Ses]) VALUES ( 16, N'P16' , N'Lunes , Miercoles , Viernes', 1)
INSERT [Tb_Horario_Sesiones] ([Cod_Horario_Ses],[Cod_Pro],[Descrip_dia],[Est_Hor_Ses]) VALUES ( 17, N'P17' , N'Martes', 1)
INSERT [Tb_Horario_Sesiones] ([Cod_Horario_Ses],[Cod_Pro],[Descrip_dia],[Est_Hor_Ses]) VALUES ( 18, N'P18' , N'Lunes , Viernes', 1)
INSERT [Tb_Horario_Sesiones] ([Cod_Horario_Ses],[Cod_Pro],[Descrip_dia],[Est_Hor_Ses]) VALUES ( 19, N'P19' , N'Martes', 1)
INSERT [Tb_Horario_Sesiones] ([Cod_Horario_Ses],[Cod_Pro],[Descrip_dia],[Est_Hor_Ses]) VALUES ( 20, N'P20' , N'Lunes , Miercoles , Viernes', 1)
Set Identity_Insert [dbo].[Tb_Horario_Sesiones] Off
go


/*INSERT PACIENTE*/

Select * From Tb_Paciente
INSERT [Tb_Paciente] VALUES (N'P002',N'A002', N'140102' ,'Sofia','Abal Guevara', N'Calle Esperanza 478', N'77664458', N'982124887', CAST(N'2018-08-16T00:00:00.000' AS DateTime), N'Ximena Diaz',NULL, NULL, 1)
INSERT [Tb_Paciente] VALUES (N'P003',N'A003', N'140103' ,'Lu','Ramos Icht', N'Jr. Libertad 156', N'78291458', N'983124887', CAST(N'2018-07-19T00:00:00.000' AS DateTime), N'Paola',NULL, NULL, 1)
--Agregado 13/10/22
INSERT [Tb_Paciente] VALUES (N'P004',N'A004', N'250103' ,'Maria','Serpa Heredia', N'Jr. Esperanza 234', N'77291458', N'987724887', CAST(N'2018-08-19T00:00:00.000' AS DateTime), N'Ximena Diaz',NULL, NULL, 1)
INSERT [Tb_Paciente] VALUES (N'P005',N'A005', N'250106' ,'Medalia','Guevara Linch', N'Jr. Inclan 198', N'70291458', N'999124887', CAST(N'2018-09-19T00:00:00.000' AS DateTime), N'Paola',NULL, NULL, 0)
INSERT [Tb_Paciente] VALUES (N'P006',N'A006', N'220213' ,'Roxana','Aquino Flores', N'Jr. Pando 892', N'78221458', N'900124887', CAST(N'2018-10-19T00:00:00.000' AS DateTime), N'Ximena Diaz',NULL, NULL, 0)
INSERT [Tb_Paciente] VALUES (N'P007',N'A007', N'211004' ,'Daniela','Avila Castro', N'Calle. Santa Maria 262', N'68291458', N'980024887', CAST(N'2018-11-19T00:00:00.000' AS DateTime), N'Paola',NULL, NULL, 1)
INSERT [Tb_Paciente] VALUES (N'P008',N'A008', N'210503' ,'Antonia','Vespucio Celis', N'Calle. Aldabas 321', N'58291458', N'983123887', CAST(N'2018-12-19T00:00:00.000' AS DateTime), N'Ximena Diaz',NULL, NULL, 1)
INSERT [Tb_Paciente] VALUES (N'P009',N'A009', N'210205' ,'Luisa','Larrea Riquelme', N'Calle. Carabaya 196', N'76291458', N'983188887', CAST(N'2019-01-19T00:00:00.000' AS DateTime), N'Paola',NULL, NULL, 1)
INSERT [Tb_Paciente] VALUES (N'P010',N'A010', N'200806' ,'Jose','Espert Milei', N'Av. Bodegones 1736', N'78294458', N'989124887', CAST(N'2019-02-19T00:00:00.000' AS DateTime), N'Ximena Diaz',NULL, NULL, 0)
INSERT [Tb_Paciente] VALUES (N'P011',N'A011', N'200701' ,'Jedy','Vilcatoma Mejia', N'Av. Concepcion 872', N'76691458', N'988124887', CAST(N'2019-03-19T00:00:00.000' AS DateTime), N'Paola',NULL, NULL, 1)
INSERT [Tb_Paciente] VALUES (N'P012',N'A012', N'200504' ,'Silvia','Xeno Zoldiek', N'Av. Cueva 726', N'78293358', N'987124887', CAST(N'2019-04-19T00:00:00.000' AS DateTime), N'Ximena Diaz',NULL, NULL, 1)
INSERT [Tb_Paciente] VALUES (N'P013',N'A013', N'200303' ,'Ruben','Castro De la Cruz', N'Av. Sucre 1256', N'78221458', N'986124887', CAST(N'2019-05-19T00:00:00.000' AS DateTime), N'Paola',NULL, NULL, 1)
INSERT [Tb_Paciente] VALUES (N'P014',N'A014', N'200204' ,'Prudencio','Ochoa Paredes', N'Av. La Marina 1156', N'44291458', N'985124887', CAST(N'2019-06-19T00:00:00.000' AS DateTime), N'Ximena Diaz',NULL, NULL, 0)
INSERT [Tb_Paciente] VALUES (N'P015',N'A015', N'200103' ,'Bertha','Valerio Ayala', N'Av. Argentina 2391', N'66291458', N'984124887', CAST(N'2019-07-19T00:00:00.000' AS DateTime), N'Paola',NULL, NULL, 1)
INSERT [Tb_Paciente] VALUES (N'P016',N'A016', N'180108' ,'Irina','Costacurta Maldini', N'Av. Colonial 2821', N'78222458', N'903124887', CAST(N'2019-08-19T00:00:00.000' AS DateTime), N'Ximena Diaz',NULL, NULL, 1)
INSERT [Tb_Paciente] VALUES (N'P017',N'A017', N'160202' ,'Pedro','Aquino Ureta', N'Av. Alfonso Ugarte 1827', N'78291919', N'913124887', CAST(N'2019-09-19T00:00:00.000' AS DateTime), N'Paola',NULL, NULL, 1)
INSERT [Tb_Paciente] VALUES (N'P018',N'A020', N'150406' ,'Moises','Guevara Hinostrosa', N'Av. Garcia Naranjo 1256', N'78123458', N'923124887', CAST(N'2019-10-19T00:00:00.000' AS DateTime), N'Ximena Diaz',NULL, NULL, 0)
INSERT [Tb_Paciente] VALUES (N'P019',N'A021', N'150305' ,'Ana','Rios Dias', N'Av. Mariano Carranza 2156', N'78244458', N'933124887', CAST(N'2019-11-19T00:00:00.000' AS DateTime), N'Paola',NULL, NULL, 1)
INSERT [Tb_Paciente] VALUES (N'P020',N'A022', N'150301' ,'Kirk','Flores Acosta', N'Av. Morales Duarez 3156', N'81791458', N'943124887', CAST(N'2019-12-19T00:00:00.000' AS DateTime), N'Ximena Diaz',NULL, NULL, 1)
go


/*INSERT DETALLE_SESIONES*/

Select * From Tb_Detalle_Sesiones
INSERT [Tb_Detalle_Sesiones] VALUES (N'P001', 1, N'9:00 am' , N'11:00 am', CAST(N'2018-09-19T00:00:00.000' AS DateTime), N'Ximena Diaz',NULL, NULL, 1)
INSERT [Tb_Detalle_Sesiones] VALUES (N'P002', 2, N'8:00 am' , N'10:00 am', CAST(N'2018-08-20T00:00:00.000' AS DateTime), N'Ximena Diaz',NULL, NULL, 1)
INSERT [Tb_Detalle_Sesiones] VALUES (N'P003', 3, N'4:00 pm' , N'6:00 pm', CAST(N'2018-08-21T00:00:00.000' AS DateTime), N'Ximena Diaz',NULL, NULL, 1)
--Agregado 13/10/22
INSERT [Tb_Detalle_Sesiones] VALUES (N'P004', 4, N'7:00 pm' , N'10:00 pm', CAST(N'2018-07-21T00:00:00.000' AS DateTime), N'Ximena Diaz',NULL, NULL, 1)
INSERT [Tb_Detalle_Sesiones] VALUES (N'P005', 5, N'9:00 am' , N'11:00 am', CAST(N'2018-06-21T00:00:00.000' AS DateTime), N'Paola',NULL, NULL, 1)
INSERT [Tb_Detalle_Sesiones] VALUES (N'P006', 6, N'8:00 am' , N'10:00 am', CAST(N'2018-05-21T00:00:00.000' AS DateTime), N'Ximena Diaz',NULL, NULL, 1)
INSERT [Tb_Detalle_Sesiones] VALUES (N'P007', 7, N'4:00 pm' , N'6:00 pm', CAST(N'2018-04-21T00:00:00.000' AS DateTime), N'Ximena Diaz',NULL, NULL, 1)
INSERT [Tb_Detalle_Sesiones] VALUES (N'P008', 8, N'7:00 pm' , N'10:00 pm', CAST(N'2018-03-21T00:00:00.000' AS DateTime), N'Ximena Diaz',NULL, NULL, 1)
INSERT [Tb_Detalle_Sesiones] VALUES (N'P009', 9, N'9:00 am' , N'11:00 am', CAST(N'2018-02-21T00:00:00.000' AS DateTime), N'Ximena Diaz',NULL, NULL, 1)
INSERT [Tb_Detalle_Sesiones] VALUES (N'P010', 10, N'8:00 am' , N'10:00 am', CAST(N'2018-01-21T00:00:00.000' AS DateTime), N'Ximena Diaz',NULL, NULL, 1)
INSERT [Tb_Detalle_Sesiones] VALUES (N'P011', 11, N'4:00 pm' , N'6:00 pm', CAST(N'2019-01-21T00:00:00.000' AS DateTime), N'Paola',NULL, NULL, 1)
INSERT [Tb_Detalle_Sesiones] VALUES (N'P012', 12, N'7:00 pm' , N'10:00 pm', CAST(N'2019-02-21T00:00:00.000' AS DateTime), N'Paola',NULL, NULL, 1)
INSERT [Tb_Detalle_Sesiones] VALUES (N'P013', 13, N'9:00 am' , N'11:00 am', CAST(N'2019-03-21T00:00:00.000' AS DateTime), N'Paola',NULL, NULL, 1)
INSERT [Tb_Detalle_Sesiones] VALUES (N'P014', 14, N'8:00 am' , N'10:00 am', CAST(N'2019-04-21T00:00:00.000' AS DateTime), N'Paola',NULL, NULL, 1)
INSERT [Tb_Detalle_Sesiones] VALUES (N'P015', 15, N'4:00 pm' , N'6:00 pm', CAST(N'2019-05-21T00:00:00.000' AS DateTime), N'Paola',NULL, NULL, 1)
INSERT [Tb_Detalle_Sesiones] VALUES (N'P016', 16, N'7:00 pm' , N'10:00 pm', CAST(N'2019-06-21T00:00:00.000' AS DateTime), N'Paola',NULL, NULL, 1)
INSERT [Tb_Detalle_Sesiones] VALUES (N'P017', 17, N'9:00 am' , N'11:00 am', CAST(N'2019-07-21T00:00:00.000' AS DateTime), N'Paola',NULL, NULL, 1)
INSERT [Tb_Detalle_Sesiones] VALUES (N'P018', 18, N'8:00 am' , N'10:00 am', CAST(N'2019-08-21T00:00:00.000' AS DateTime), N'Paola',NULL, NULL, 1)
INSERT [Tb_Detalle_Sesiones] VALUES (N'P019', 19, N'4:00 pm' , N'6:00 pm', CAST(N'2019-09-21T00:00:00.000' AS DateTime), N'Paola',NULL, NULL, 1)
INSERT [Tb_Detalle_Sesiones] VALUES (N'P020', 20, N'7:00 pm' , N'10:00 pm', CAST(N'2019-10-21T00:00:00.000' AS DateTime), N'Ximena Diaz',NULL, NULL, 1)

go

/*INSERT RESERVACION_SESION*/

use [Centro-EADES]
go

Select * From Tb_Reservacion_Sesion
INSERT [Tb_Reservacion_Sesion] VALUES (N'A001', 1, CAST(N'2018-09-19T00:00:00.000' AS DateTime),1, CAST(N'2018-09-18T00:00:00.000' AS DateTime), NULL, NULL, N'Ximena Diaz')
INSERT [Tb_Reservacion_Sesion] VALUES (N'A002', 2, CAST(N'2018-08-20T00:00:00.000' AS DateTime),1, CAST(N'2018-08-19T00:00:00.000' AS DateTime), NULL, NULL, N'Ximena Diaz')
INSERT [Tb_Reservacion_Sesion] VALUES (N'A003', 3, CAST(N'2018-08-21T00:00:00.000' AS DateTime),1, CAST(N'2018-08-20T00:00:00.000' AS DateTime), NULL, NULL, N'Ximena Diaz')
INSERT [Tb_Reservacion_Sesion] VALUES (N'A004', 4, CAST(N'2018-09-21T00:00:00.000' AS DateTime),1, CAST(N'2018-09-20T00:00:00.000' AS DateTime), NULL, NULL, N'Ximena Diaz')
INSERT [Tb_Reservacion_Sesion] VALUES (N'A005', 5, CAST(N'2018-08-21T00:00:00.000' AS DateTime),1, CAST(N'2018-08-20T00:00:00.000' AS DateTime), NULL, NULL, N'Ximena Diaz')
INSERT [Tb_Reservacion_Sesion] VALUES (N'A006', 6, CAST(N'2018-09-01T00:00:00.000' AS DateTime),1, CAST(N'2018-08-30T00:00:00.000' AS DateTime), NULL, NULL, N'Ximena Diaz')
INSERT [Tb_Reservacion_Sesion] VALUES (N'A007', 7, CAST(N'2018-08-10T00:00:00.000' AS DateTime),1, CAST(N'2018-08-09T00:00:00.000' AS DateTime), NULL, NULL, N'Ximena Diaz')
INSERT [Tb_Reservacion_Sesion] VALUES (N'A008', 8, CAST(N'2018-08-23T00:00:00.000' AS DateTime),1, CAST(N'2018-08-22T00:00:00.000' AS DateTime), NULL, NULL, N'Ximena Diaz')
INSERT [Tb_Reservacion_Sesion] VALUES (N'A009', 9, CAST(N'2018-08-21T00:00:00.000' AS DateTime),1, CAST(N'2018-08-20T00:00:00.000' AS DateTime), NULL, NULL, N'Ximena Diaz')
INSERT [Tb_Reservacion_Sesion] VALUES (N'A010', 10, CAST(N'2018-09-13T00:00:00.000' AS DateTime),1, CAST(N'2018-09-17T00:00:00.000' AS DateTime), NULL, NULL, N'Ximena Diaz')
INSERT [Tb_Reservacion_Sesion] VALUES (N'A011', 11, CAST(N'2018-08-22T00:00:00.000' AS DateTime),1, CAST(N'2018-08-18T00:00:00.000' AS DateTime), NULL, NULL, N'Ximena Diaz')
INSERT [Tb_Reservacion_Sesion] VALUES (N'A012', 12, CAST(N'2018-08-21T00:00:00.000' AS DateTime),1, CAST(N'2018-08-19T00:00:00.000' AS DateTime), NULL, NULL, N'Ximena Diaz')
INSERT [Tb_Reservacion_Sesion] VALUES (N'A013', 13, CAST(N'2018-08-23T00:00:00.000' AS DateTime),1, CAST(N'2018-08-20T00:00:00.000' AS DateTime), NULL, NULL, N'Ximena Diaz')
INSERT [Tb_Reservacion_Sesion] VALUES (N'A014', 14, CAST(N'2018-08-24T00:00:00.000' AS DateTime),1, CAST(N'2018-08-23T00:00:00.000' AS DateTime), NULL, NULL, N'Ximena Diaz')
INSERT [Tb_Reservacion_Sesion] VALUES (N'A015', 15, CAST(N'2018-08-21T00:00:00.000' AS DateTime),1, CAST(N'2018-08-20T00:00:00.000' AS DateTime), NULL, NULL, N'Ximena Diaz')
INSERT [Tb_Reservacion_Sesion] VALUES (N'A016', 16, CAST(N'2018-09-19T00:00:00.000' AS DateTime),1, CAST(N'2018-09-18T00:00:00.000' AS DateTime), NULL, NULL, N'Ximena Diaz')
INSERT [Tb_Reservacion_Sesion] VALUES (N'A017', 17, CAST(N'2018-08-20T00:00:00.000' AS DateTime),1, CAST(N'2018-08-19T00:00:00.000' AS DateTime), NULL, NULL, N'Ximena Diaz')
INSERT [Tb_Reservacion_Sesion] VALUES (N'A020', 18, CAST(N'2018-08-20T00:00:00.000' AS DateTime),1, CAST(N'2018-08-19T00:00:00.000' AS DateTime), NULL, NULL, N'Ximena Diaz')
INSERT [Tb_Reservacion_Sesion] VALUES (N'A021', 19, CAST(N'2018-09-13T00:00:00.000' AS DateTime),1, CAST(N'2018-09-12T00:00:00.000' AS DateTime), NULL, NULL, N'Ximena Diaz')
INSERT [Tb_Reservacion_Sesion] VALUES (N'A022', 20, CAST(N'2018-08-22T00:00:00.000' AS DateTime),1, CAST(N'2018-08-21T00:00:00.000' AS DateTime), NULL, NULL, N'Ximena Diaz')
go


/**PROCEDIMIENTOS ALMACENADOS*/

/****************************************************************************/
/*************   USUARIO         *****************************/
/*******************************************************/

/* usp_InsertarUsuario */

Create Procedure [dbo].[usp_InsertarUsuario]
@Login_Usuario varchar (20),
@Pass_Usuario varchar (20),
@Niv_Usuario int,
@Est_Usuario int,
@Usu_Registro varchar(20)
as
declare @vcod char(3)
declare @vcont int
set @vcont=(Select count(*) from Tb_Usuario)
if @vcont=0
		set @vcod='U01'
else
		set @vcod=(Select 'U'+Right(Max(Right(Cod_Usu,2)+101),2)
	From Tb_Usuario)
--Insertamos un nuevo usuario
Insert into Tb_Usuario values 
(@vcod, @Login_Usuario , @Pass_Usuario , @Niv_Usuario , @Est_Usuario , GETDATE(),@Usu_Registro )
GO

--EXEC [usp_InsertarUsuario] 'Carola Gomes','michifuz',2,1,'Admin'
go

--SELECT * FROM Tb_Usuario
GO

/****************************************************************************/
/*************   PROFESIONAL         *****************************/
/*******************************************************/

/* usp_InsertarProfesional */

Create Procedure [dbo].[usp_InsertarProfesional]
@vId_Espec int,
@vNom varchar(25),
@vApe varchar(25),
@vSuel money,
@vDni char(8),
@vEmail varchar(50),
@vUsu_Registro varchar(20),
@vEst integer
as
declare @vcod char(3)
declare @vcont int
set @vcont=(Select count(*) from Tb_Profesional)
if @vcont=0
		set @vcod='P01'
else
		set @vcod=(Select 'P'+Right(Max(Right(Cod_Pro,2)+101),2)
	From Tb_Profesional)
--Insertamos un nuevo usuario

Insert into Tb_Profesional values (@vcod , @vId_Espec , @vNom , @vApe ,@vSuel, GETDATE(),@vDni,@vEmail,GETDATE(),@vUsu_Registro,null,null,@vEst )
GO

--EXEC [usp_InsertarProfesional]  3,'Rodrigo','Palacio',2800,'40736245','rodrigoelcrack@hotmail.com','Paola Gomes',1 
--go

Select * From Tb_Profesional 
go

/****************************************************************************/
/*************   ESPECIALIADAD         *****************************/
/*******************************************************/

/* usp_InsertarEspecialiadad */

Create Procedure [dbo].[usp_InsertarEspecialidad]
@vNom_Espec varchar(50),
@vDes_Espec varchar(50)
as
--Insertamos una nueva especialidad
Insert into Tb_Especialidad values 
(@vNom_Espec, @vDes_Espec)
GO

--EXEC [usp_InsertarEspecialidad]  4,'Terapeuta Adulto','Especialista en el adulto mayor' 
--go

--Select * From Tb_Especialidad
--go


/****************************************************************************/
/*************   APODERADO         *****************************/
/*******************************************************/

/* usp_InsertarApoderado */
Create Procedure [dbo].[usp_InsertarApoderado]
@vId_Ubigeo char(6),
@vNom varchar(25),
@vApe varchar(25),
@vDir varchar(50),
@vDni char(8),
@vTel varchar(10),
@vUsu_Registro varchar(20),
@vEst integer
As
declare @vcod char(4)
declare @vcont int
set @vcont=(Select count(*) from Tb_Apoderado)
if @vcont=0
		set @vcod = 'A001'
else
--Se puede usar tambien substring para tomar desde la segunda
--posicion tres caracteres
Set @vcod=(Select 'A'+ right(max(substring(Cod_apo,2,3)+1001),3)
from Tb_Apoderado)

insert into Tb_Apoderado values
(@vcod,@vId_Ubigeo,@vNom,@vApe,@vDir,@vDni,@vTel,GETDATE(),@vUsu_Registro,NULL,NULL,@vEst)
go

--EXEC [usp_InsertarApoderado] '140104','Fabiola','De las Casas','Calle Los girasoles 333','50436252','999333777','Paola Gomes',1
--go

--Select * From Tb_Apoderado
--go

/****************************************************************************/
/*************   PACIENTE         *****************************/
/*******************************************************/

/* usp_InsertarPaciente */

CREATE PROCEDURE [dbo].[usp_InsertarPaciente]
@vCod_apo char(4),
@vId_Ubigeo char(6),
@vNom varchar(25),
@vApe varchar(25),
@vDir varchar(50),
@vDni char(8),
@vTel varchar(10),
@vUsu_Registro varchar(20),
@vEst int
As
declare @vcod char(4)
declare @vcont int
set @vcont=(Select count(*) from Tb_Paciente)
if @vcont=0
		set @vcod = 'P001'
else
--Se puede usar tambien substring para tomar desde la segunda
--posicion tres caracteres
Set @vcod=(Select 'P' + right(max(substring(Cod_pac,2,3)+1001),3)
		from Tb_Paciente)
Insert into Tb_Paciente values
(@vcod,@vCod_apo,@vId_Ubigeo,@vNom,@vApe,@vDir,@vDni,@vTel,GETDATE(),@vUsu_Registro,null,null,@vEst)
go


--EXEC [usp_InsertarPaciente] 'A003','140103','Ana Patricia','Riquelme','Calle Inclan 197','70736267','999888723','Ximena Diaz',1
--go

--Select * From Tb_Paciente
--go

/****************************************************************************/
/*************   HORARIO DE SESIONES         *****************************/
/*******************************************************/

/* usp_InsertarHorarioSesiones */
CREATE PROCEDURE [dbo].[usp_InsertarHorarioSesiones]
@vCod_Pro char(3),
@vDes_dia varchar(50),
@vEst int
as
--Insertamos un nuevo horario de sesiones
Insert into Tb_Horario_Sesiones values 
(@vCod_Pro, @vDes_dia,@vEst)
GO


--EXEC [usp_InsertarHorarioSesiones] 5,'P03','Lunes , Miercoles , Viernes',1
--go

--Select * From Tb_Horario_Sesiones
--go

--2022/10/02
/****************************************************************************/
/*************   usp_ActualizarUsuario        *****************************/
/*******************************************************/

Create Procedure [dbo].[usp_ActualizarUsuario]
@vcod char(3),
@vLogin varchar(20),
@vPass varchar(20),
@vNiv int,
@vEst int
As
Update Tb_Usuario set Login_Usuario=@vLogin,Pass_Usuario=@vPass,
Niv_Usuario=@vNiv, Est_Usuario=@vEst
where Cod_Usu=@vcod
go


--EXEC [usp_ActualizarUsuario] 'Carola Gomes','gmopass',2,1
--go


--Select * From Tb_Usuario
--go

/****************************************************************************/
/*************   usp_ActualizarProfesional*****************************/
/*******************************************************/
Create Procedure [dbo].[usp_ActualizarProfesional]
@vcod char(3),
@vId_Espec int,
@vNom varchar(25),
@vApe varchar(25),
@vSuel money,
@vDni char(8),
@vEmail varchar(50),
@vUsu_Ult_Mod varchar(20),
@vEst int
As
Update Tb_Profesional set Id_Espec=@vId_Espec,Nom_pro=@vNom,
Ape_pro=@vApe,Sue_pro=@vSuel,Dni_pro=@vDni,Email_pro=@vDni,
Fech_Ult_Mod=getdate(),Usu_Ult_Mod=@vUsu_Ult_Mod,Est_pro=@vEst
where Cod_Pro=@vcod
go


--EXEC [usp_ActualizarProfesional] 'P04',3,'Rodrigo Marcelo','Palacio Molinas',3000,'40736245','rodrigo777@gmail','Paola Gomes',1
--go


--Select * From Tb_Profesional
--go


/****************************************************************************/
/*************   usp_ActualizarEspecialidad*****************************/
/*******************************************************/

Create Procedure [dbo].[usp_ActualizarEspecialidad]
@vcod int,
@vNom varchar(50),
@vDes varchar(50)
As
Update Tb_Especialidad set Nom_Espec=@vNom,Des_Espec=@vDes
where Id_Espec=@vcod
Go


--EXEC [usp_ActualizarEspecialidad] 4,'Psicologa','Especialista en problemas de pareja.'
--go


--Select * From Tb_Especialidad
--go


/****************************************************************************/
/*************   usp_ActualizarApoderado*****************************/
/*******************************************************/

Create Procedure [dbo].[usp_ActualizarApoderado]
@vcod char(4),
@vId_Ubigeo char(6),
@vNom varchar(25),
@vApe varchar(25),
@vDir varchar(50),
@vDni char(8),
@vTel varchar(10),
@vUsu_Ult_Mod varchar(20),
@vEst int
As
Update Tb_Apoderado set Id_Ubigeo=@vId_Ubigeo,Nom_apo=@vNom,Ape_apo=@vApe,
Dir_apo=@vDir,Dni_apo=@vDni,Tel_pac=@vTel,Fech_Ult_Mod=getdate(),
Usu_Ult_Mod=@vUsu_Ult_Mod,Est_apo=@vEst
where Cod_apo=@vcod
Go


--EXEC [usp_ActualizarApoderado] 'A004','140101','Fabiola','Farias De las Casas','Calle Los girasoles 123','50433278','999333999','Paola Gomes',1
--go


--Select * From Tb_Apoderado
--go


/****************************************************************************/
/*************   usp_ActualizarPaciente*****************************/
/*******************************************************/

Create Procedure [dbo].[usp_ActualizarPaciente]
@vcod varchar(4),
@vCod_apo char(4),
@vId_Ubigeo char(6),
@vNom varchar(25),
@vApe varchar(25),
@vDir varchar(50),
@vDni char(8),
@vTel varchar(10),
@vUsu_Ult_Mod varchar(20),
@vEst int
As
Update Tb_Paciente set Cod_apo=@vCod_apo, Id_Ubigeo=@vId_Ubigeo,Nom_pac=@vNom,Ape_pac=@vApe,
Dir_pac=@vDir,Dni_pac=@vDni,Tel_pac=@vTel,Fech_Ult_Mod=getdate(),Usu_Ult_Mod=@vUsu_Ult_Mod,Est_pac=@vEst
where Cod_pac=@vcod
Go


--EXEC [usp_ActualizarPaciente] 'P004','A002','140103','Ana Patricia','Zanabria Riquelme','Calle Los girasoles 223','60433278','999037299','Paola Gomes',1
--go


--Select * From Tb_Paciente
--go

/****************************************************************************/
/*************   usp_ActualizarHorarioSesiones*****************************/
/*******************************************************/

Create Procedure [dbo].[usp_ActualizarHorarioSesiones]
@vcod int,
@vCod_pro char(3),
@vDes varchar(50),
@vEst int
As
Update Tb_Horario_Sesiones set Cod_Pro=@vCod_pro,Descrip_dia=@vDes,Est_Hor_Ses=@vEst
where Cod_Horario_Ses=@vcod
Go

--use [Centro-EADES]


--EXEC [usp_ActualizarHorarioSesiones] 5 ,'P04','Lunes , Viernes',1
--go


--Select * From Tb_Horario_Sesiones
--go



/****************************************************************************/
/*************   usp_ActualizarDetalleSesiones*****************************/
/*******************************************************/

Create Procedure [dbo].[usp_ActualizarDetalleSesiones]
@vcod_pac varchar(4),
@vcod_hor_ses integer,
@vhor_ini varchar(10),
@vhor_fin varchar(10),
@vUsu_Ult_Mod varchar(20),
@vEst integer
As
Update Tb_Detalle_Sesiones set Hora_Ini=@vhor_ini,Hora_Fin=@vhor_fin ,
Fec_Ult_Mod=getdate(),Usu_Ult_Mod=@vUsu_Ult_Mod,Est_Ses_Asig=@vEst
where Cod_pac=@vcod_pac and Cod_Horario_Ses=@vcod_hor_ses
Go


--use [Centro-EADES]


--EXEC [usp_ActualizarDetalleSesiones] 'P003',3,'5:00pm','7:00pm','Ximena Dias',1 
--go


--Select * From Tb_Detalle_Sesiones
--go

/****************************************************************************/
/*************   usp_ActualizarReservacionSesion*****************************/
/*******************************************************/

Create Procedure [dbo].[usp_ActualizarReservacionSesion]
@vcod_apo varchar(4),
@vcod_hor_ses integer,
@vFecha_Reser datetime,
@vEst integer,
@vUsu_Ult_Mod varchar(20)
As
Update Tb_Reservacion_Sesion set Fecha_Reserv=@vFecha_Reser, Est_Reserv=@vEst,
Fech_Ult_Mod=getdate(),Usu_Ult_Mod=@vUsu_Ult_Mod
where Cod_apo=@vcod_apo and Cod_Horario_Ses=@vcod_hor_ses
Go


--EXEC [usp_ActualizarReservacionSesion] 'A003','3','20190820',1,'Ximena Diaz' 
--go


--Select * From Tb_Reservacion_Sesion
--go

/****************************************************************************/
/*************   usp_InsertarDetalleSesiones*****************************/
/*******************************************************/

CREATE PROCEDURE [dbo].[usp_InsertarDetalleSesiones]
@vcod_pac varchar(4),
@vcod_Hor_Ses int,
@vHor_ini varchar(10),
@vHor_fin varchar(10),
@vUsu_Reg varchar(20),
@vEst int
as
--Insertamos un nuevo detalle de sesion
Insert into Tb_Detalle_Sesiones values 
(@vcod_pac , @vcod_Hor_Ses, @vHor_ini,@vHor_fin,getdate(),@vUsu_Reg,null,null,@vEst)
GO


--EXEC [usp_InsertarDetalleSesiones] 'P004',4,'7:00 am','9:00 am','Paola Gomes',1 
--go

--Select * From Tb_Detalle_Sesiones
--go

/****************************************************************************/
/*************   usp_InsertarReservacionSesion*****************************/
/*******************************************************/

CREATE PROCEDURE [dbo].[usp_InsertarReservacionSesion]
@vcod_apo char(4),
@vcod_Hor_Ses int,
@vFech_Res datetime,
@vEst int,
@vUsu_Reg varchar(20)
as
--Insertamos una nueva Reservacion de sesion
Insert into Tb_Reservacion_Sesion values 
(@vcod_apo,@vcod_Hor_Ses,@vFech_Res,@vEst,getdate(),@vUsu_Reg,null,null)
GO


--EXEC [usp_InsertarReservacionSesion] 'A003',1,'20190711',0,'Paola Gomes' 
--go

--Select * From Tb_Reservacion_Sesion
--go

--04/10/2022
/****************************************************************************/
/*************   usp_EliminarUsuario  *****************************/
/*******************************************************/

Create Procedure [dbo].[usp_EliminarUsuario]
@vcod char(3)
As
delete from Tb_Usuario where
Cod_Usu=@vcod
go


--EXEC [usp_EliminarUsuario] 'U04' 
--go

--Select * From Tb_Usuario
--go


/****************************************************************************/
/*************   usp_EliminarProfesional  *****************************/
/*******************************************************/

Create Procedure [dbo].[usp_EliminarProfesional]
@vcod char(3)
As
delete from Tb_Profesional where
Cod_Pro=@vcod
go


------EXEC [usp_EliminarProfesional] 'P03' 
------go

------Select * From Tb_Profesional
------go

/****************************************************************************/
/*************   usp_EliminarEspecialidad  *****************************/
/*******************************************************/

Create Procedure [dbo].[usp_EliminarEspecialidad]
@vcod int
As
delete from Tb_Especialidad where
Id_Espec=@vcod
go


--EXEC [usp_EliminarEspecialidad] 3
--go

--Select * From Tb_Especialidad
--go


/****************************************************************************/
/*************   usp_EliminarPaciente  *****************************/
/*******************************************************/

Create Procedure [dbo].[usp_EliminarPaciente]
@vcod varchar(4)
As
delete from Tb_Paciente where
Cod_pac=@vcod
go


----EXEC [usp_EliminarPaciente] 'P003' 
----go

----Select * From Tb_Paciente
----go


/****************************************************************************/
/*************   usp_EliminarApoderado  *****************************/
/*******************************************************/

Create Procedure [dbo].[usp_EliminarApoderado]
@vcod char(4)
As
delete from Tb_Apoderado where
Cod_apo=@vcod
go


----EXEC [usp_EliminarApoderado] 'A003' 
----go

----Select * From Tb_Apoderado
----go


/****************************************************************************/
/*************   usp_EliminarHorarioSesiones  *****************************/
/*******************************************************/

Create Procedure [dbo].[usp_EliminarHorarioSesiones]
@vcod int
As
delete from Tb_Horario_Sesiones where
Cod_Horario_Ses=@vcod
go


----EXEC [usp_EliminarHorarioSesiones] 4 
----go

----Select * From Tb_Horario_Sesiones
----go


/****************************************************************************/
/*************   usp_EliminarDetalleSesiones  *****************************/
/*******************************************************/

Create Procedure [dbo].[usp_EliminarDetalleSesiones]
@vcod_pac varchar(4),
@vcod_ses int
As
delete from Tb_Detalle_Sesiones where
Cod_pac=@vcod_pac And Cod_Horario_Ses=@vcod_ses
go


----EXEC [usp_EliminarDetalleSesiones] 'P002',2
----go

----Select * From Tb_Detalle_Sesiones
----go


/****************************************************************************/
/*************   usp_EliminarReservacionSesion  *****************************/
/*******************************************************/

Create Procedure [dbo].[usp_EliminarReservacionSesion]
@vcod_apo char(4),
@vcod_hor_ses int
As
delete from Tb_Reservacion_Sesion where
Cod_apo=@vcod_apo And Cod_Horario_Ses=@vcod_hor_ses
go


----EXEC [usp_EliminarReservacionSesion] 'A002',2
----go

----Select * From Tb_Reservacion_Sesion
----go

--04/10/2022

/****************************************************************************/
/*************   vw_VistaUsuarios  *****************************/
/*******************************************************/

Create View [dbo].[vw_VistaUsuarios]
As
Select U.Cod_Usu,U.Login_Usuario,U.Pass_Usuario,U.Niv_Usuario,
Case U.Niv_Usuario
	when 1 then 'Administrador de Sistema'
	when 2 then 'Recepcionista'
end as Nivel,
U.Est_Usuario,
Case U.Est_Usuario
	when 0 then 'Inactivo'
	when 1 then 'Activo'
end as Estado,
U.Fec_Registro,
U.Usu_Registro
From Tb_Usuario as U
go

/****************************************************************************/
/*************   vw_VistaProfesional  *****************************/
/*******************************************************/

Create View [dbo].[vw_VistaProfesional]
As
Select P.Cod_Pro,E.Id_Espec,P.Nom_pro,P.Ape_pro,
P.Sue_pro,P.Fech_ing,DATEDIFF(D,P.Fech_ing,GETDATE()) /365 AS Antiguedad_Años,P.Dni_pro,
P.Email_pro,P.Fech_Registro,P.Usu_Registro,P.Fech_Ult_Mod,P.Usu_Ult_Mod,P.Est_pro,
Case P.Est_pro
	when 0 then 'Inactivo'
	when 1 then 'Activo'
end as Estado
From Tb_Especialidad E inner join Tb_Profesional P  on P.Id_Espec=E.Id_Espec 
go

/****************************************************************************/
/*************   vw_VistaEspecialidadProfesional  *****************************/
/*******************************************************/

Create View [dbo].[vw_VistaEspecialidadProfesional]
As
Select E.Id_Espec,P.Nom_pro,P.Ape_pro,E.Nom_Espec,E.Des_Espec
From Tb_Especialidad E inner join Tb_Profesional P  on P.Id_Espec=E.Id_Espec 
go


/****************************************************************************/
/*************   vw_VistaUbigeo  *****************************/
/*******************************************************/

Create View [dbo].[vw_VistaUbigeo]
As
Select row_number() 
over(Order by IdDepa,IdProv, IdDist) As Id, Id_Ubigeo, IdDepa , IdProv,IdDist,Departamento,Provincia,Distrito,IsNull (Cod_Pro,'---') As Cod_pro
From Tb_Ubigeo 
go

/****************************************************************************/
/*************   vw_VistaApoderado  *****************************/
/*******************************************************/

Create View [dbo].[vw_VistaApoderado]
As
Select 
A.Cod_apo,U.Id_Ubigeo,U.Departamento,U.Provincia,U.Distrito,A.Nom_apo,A.Ape_apo,A.Dir_apo,
A.Dni_apo,IsNull(A.Tel_pac,'-----') as Tel_apo,A.Fec_reg,A.Usu_Registro,A.Fech_Ult_Mod,A.Usu_Ult_Mod,A.Est_apo,
Case A.Est_apo
	when 0 then 'Inactivo'
	when 1 then 'Activo'
End as Estado
From Tb_Apoderado A inner join Tb_Ubigeo U on A.Id_Ubigeo=U.Id_Ubigeo
go

/****************************************************************************/
/*************   vw_VistaPaciente  *****************************/
/*******************************************************/

Create View [dbo].[vw_VistaPaciente]
As
Select 
P.Cod_pac,P.Cod_apo,U.Id_Ubigeo,U.Departamento,U.Provincia,U.Distrito,P.Nom_pac,P.Ape_pac,P.Dir_pac,
P.Dni_pac,IsNull(P.Tel_pac,'-----') as Tel_pac,P.Fec_reg,P.Usu_Registro,P.Fech_Ult_Mod,P.Usu_Ult_Mod,P.Est_pac,
Case P.Est_pac
	when 0 then 'Inactivo'
	when 1 then 'Activo'
End as Estado
From Tb_Paciente P inner join Tb_Ubigeo U on P.Id_Ubigeo=U.Id_Ubigeo
go

/****************************************************************************/
/*************   vw_VistaHorarioProfesional  *****************************/
/*******************************************************/

Create View [dbo].[vw_VistaHorarioProfesional]
As
Select 
P.Cod_Pro,H.Cod_Horario_Ses,P.Nom_pro,P.Ape_pro,E.Nom_Espec,P.Email_pro,H.Descrip_dia,H.Est_Hor_Ses,
Case H.Est_Hor_Ses
	when 0 then 'Inactivo'
	when 1 then 'Activo'
End as Estado_Horario
From Tb_Profesional P inner join Tb_Horario_Sesiones H on P.Cod_Pro=H.Cod_Pro 
inner join Tb_Especialidad E on P.Id_Espec=E.Id_Espec
go

/****************************************************************************/
/*************   vw_VistaEstadoSesionesPaciente  *****************************/
/*******************************************************/

Create View [dbo].[vw_VistaEstadoSesionPaciente]
As
Select 
P.Cod_pac,D.Cod_Horario_Ses,P.Nom_pac,P.Ape_pac,P.Dni_pac,IsNull(P.Tel_pac,'-----') As Tel_Pac,
D.Fec_reg As Fecha_Asignación,D.Hora_Ini As Hora_Inicio,D.Hora_Fin,D.Est_Ses_Asig,
Case D.Est_Ses_Asig
	when 0 then 'Sesion Cancelada'
	when 1 then 'Sesion Asignada'
End as Estado_Sesion
From Tb_Paciente P inner join Tb_Detalle_Sesiones D on P.Cod_pac=D.Cod_pac 
go

/****************************************************************************/
/*************   vw_VistaEstadoReservacionSesion  *****************************/
/*******************************************************/

Create View [dbo].[vw_VistaEstadoReservacion]
As
Select 
A.Cod_apo,R.Cod_Horario_Ses,A.Nom_apo,A.Ape_apo,A.Dni_apo,IsNull(A.Tel_pac,'-----') As Tel_Apo,
R.Fecha_Reserv As Fecha_Reservación,R.Est_Reserv,
Case R.Est_Reserv
	when 0 then 'Reservación Sin Confirmar'
	when 1 then 'Reservación Confirmada'
End as Estado_Reservacion
From Tb_Apoderado A inner join Tb_Reservacion_Sesion R on A.Cod_apo=R.Cod_apo 
go

--06/10/2022

/****************************************************************************/
/*************   usp_ConsultarUsuario  *****************************/
/*******************************************************/

Create Procedure [dbo].[usp_ConsultarUsuario]
@vCod_usu char(3)
As
Select Login_Usuario,Pass_Usuario,Niv_Usuario,Est_Usuario,Fec_Registro,Usu_Registro
From Tb_Usuario where Cod_Usu = @vCod_usu
Go


/****************************************************************************/
/*************   usp_ConsultarProfesional  *****************************/
/*******************************************************/

Create Procedure [dbo].[usp_ConsultarProfesional]
@vCod_pro char(3)
As
Select Id_Espec,Nom_pro,Ape_pro,Sue_pro,Fech_ing,Dni_pro,Email_pro,Fech_Registro,Usu_Registro,Fech_Ult_Mod,Usu_Ult_Mod,Est_pro
From [dbo].[vw_VistaProfesional] where Cod_Pro = @vCod_pro
Go

/****************************************************************************/
/*************   usp_ConsultarEspecialidad  *****************************/
/*******************************************************/

Create Procedure [dbo].[usp_ConsultarEspecialidad]
@vId_esp int
As
Select Id_Espec,Nom_pro,Ape_pro,Nom_Espec,Des_Espec
From [dbo].[vw_VistaEspecialidadProfesional] where Id_Espec = @vId_esp
Go

/****************************************************************************/
/*************   usp_ConsultarUbigeo  *****************************/
/*******************************************************/

Create Procedure [dbo].[usp_ConsultarUbigeo]
@vId int
As
Select Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito
From [dbo].[vw_VistaUbigeo] where Id = @vId
Go


/****************************************************************************/
/*************   usp_ConsultarApoderado  *****************************/
/*******************************************************/

Create Procedure [dbo].[usp_ConsultarApoderado]
@vCod_apo char(4)
As
Select Nom_apo,Ape_apo,Dir_apo,Departamento,Provincia,Distrito,Tel_apo,Fec_reg,Usu_Registro,Fech_Ult_Mod,Usu_Ult_Mod,Est_apo,Estado
From [dbo].[vw_VistaApoderado] where Cod_apo = @vCod_apo
Go

/****************************************************************************/
/*************   usp_ConsultarPaciente  *****************************/
/*******************************************************/

Create Procedure [dbo].[usp_ConsultarPaciente]
@vCod_pac varchar(4)
As
Select Nom_pac,Ape_pac,Dir_pac,Departamento,Provincia,Distrito,Tel_pac,Fec_reg,Usu_Registro,Fech_Ult_Mod,Usu_Ult_Mod,Est_pac,Estado
From [dbo].[vw_VistaPaciente] where Cod_pac = @vCod_pac
Go

/****************************************************************************/
/*************   [usp_ConsultarHorarioSesiones  *****************************/
/*******************************************************/

Create Procedure [dbo].[usp_ConsultarHorarioSesiones]
@vCod_hor_ses int
As
Select Nom_pro,Ape_pro,Nom_Espec,Email_pro,Descrip_dia,Est_Hor_Ses,Estado_Horario
From [dbo].[vw_VistaHorarioProfesional] where Cod_Horario_Ses = @vCod_hor_ses
Go

/****************************************************************************/
/*************   [usp_ConsultarDetalleSesiones]  *****************************/
/*******************************************************/

Create Procedure [dbo].[usp_ConsultarEstadoDetalleSesiones]
@vCod_pac varchar(4)
As
Select Cod_Horario_Ses,Nom_pac,Ape_pac,Dni_pac,Tel_Pac,Fecha_Asignación,Hora_Inicio,Hora_Fin,Est_Ses_Asig,Estado_Sesion
From [dbo].[vw_VistaEstadoSesionPaciente] where Est_Ses_Asig=1 and Cod_pac = @vCod_pac
Go

/****************************************************************************/
/*************   [usp_ConsultarEstadoReservacion]  *****************************/
/*******************************************************/

Create Procedure [dbo].[usp_ConsultarEstadoReservacion]
@vCod_apo char(4)
As
Select Cod_Horario_Ses,Nom_apo,Ape_apo,Dni_apo,Tel_Apo,Fecha_Reservación,Est_Reserv,Estado_Reservacion
From [dbo].[vw_VistaEstadoReservacion] where Est_Reserv=1 and Cod_apo = @vCod_apo
Go

/****************************************************************************/
/*************   [usp_ListarUsuario]  *****************************/
/*******************************************************/

Create Procedure [dbo].[usp_ListarUsuario]
As
Select [Cod_Usu],
		[Login_Usuario],
		[Pass_Usuario],
		[Niv_Usuario],
		[Nivel],
		[Est_Usuario],
		[Estado],
		[Fec_Registro],
		[Usu_Registro]
From [dbo].[vw_VistaUsuarios]
Order by Fec_Registro
GO

/****************************************************************************/
/*************   [usp_ListarProfesional]  *****************************/
/*******************************************************/

Create Procedure [dbo].[usp_ListarProfesional]
As
Select [Cod_Pro]
      ,[Id_Espec]
      ,[Nom_pro]
      ,[Ape_pro]
      ,[Sue_pro]
      ,[Fech_ing]
      ,[Antiguedad_Años]
      ,[Dni_pro]
      ,[Email_pro]
      ,[Fech_Registro]
      ,[Usu_Registro]
      ,[Fech_Ult_Mod]
      ,[Usu_Ult_Mod]
      ,[Est_pro]
      ,[Estado]
From [dbo].[vw_VistaProfesional]
Order by Antiguedad_Años desc
GO

/****************************************************************************/
/*************   [usp_ListarEspecialidad]  *****************************/
/*******************************************************/

Create Procedure [dbo].[usp_ListarEspecialidad]
As
Select [Id_Espec]
      ,[Nom_pro]
      ,[Ape_pro]
      ,[Nom_Espec]
      ,[Des_Espec]
From [dbo].[vw_VistaEspecialidadProfesional]
Order by Id_Espec desc
GO

/****************************************************************************/
/*************   [usp_ListarUbigeo]  *****************************/
/*******************************************************/

Create Procedure [dbo].[usp_ListarUbigeo]
@vthreeletters char(3)
As
Select [Id]
      ,[Id_Ubigeo]
      ,[IdDepa]
      ,[IdProv]
      ,[IdDist]
      ,[Departamento]
      ,[Provincia]
      ,[Distrito]
      ,[Cod_pro]
From [dbo].[vw_VistaUbigeo]
Where Departamento like '%' + @vthreeletters + '%'
Order by Id desc
GO

/****************************************************************************/
/*************   [usp_ListarApoderado]  *****************************/
/*******************************************************/

Create Procedure [dbo].[usp_ListarApoderado]
As
Select [Cod_apo]
      ,[Id_Ubigeo]
      ,[Departamento]
      ,[Provincia]
      ,[Distrito]
      ,[Nom_apo]
      ,[Ape_apo]
      ,[Dir_apo]
      ,[Dni_apo]
      ,[Tel_apo]
      ,[Fec_reg]
      ,[Usu_Registro]
      ,[Fech_Ult_Mod]
      ,[Usu_Ult_Mod]
      ,[Est_apo]
      ,[Estado]
From [dbo].[vw_VistaApoderado]
Where Est_apo = 1
Order by Fec_reg desc
GO

/****************************************************************************/
/*************   [usp_ListarPaciente]  *****************************/
/*******************************************************/

Create Procedure [dbo].[usp_ListarPaciente]
As
Select [Cod_pac]
      ,[Cod_apo]
      ,[Id_Ubigeo]
      ,[Departamento]
      ,[Provincia]
      ,[Distrito]
      ,[Nom_pac]
      ,[Ape_pac]
      ,[Dir_pac]
      ,[Dni_pac]
      ,[Tel_pac]
      ,[Fec_reg]
      ,[Usu_Registro]
      ,[Fech_Ult_Mod]
      ,[Usu_Ult_Mod]
      ,[Est_pac]
      ,[Estado]
From [dbo].[vw_VistaPaciente]
Where Est_pac = 1
Order by Fec_reg desc
GO

/****************************************************************************/
/*************   [usp_ListarHorarioProfesional]  *****************************/
/*******************************************************/

Create Procedure [dbo].[usp_ListarHorarioProfesional]
@vNom_Espec varchar(6)
As
Select [Cod_Pro]
      ,[Cod_Horario_Ses]
      ,[Nom_pro]
      ,[Ape_pro]
      ,[Nom_Espec]
      ,[Email_pro]
      ,[Descrip_dia]
      ,[Est_Hor_Ses]
      ,[Estado_Horario]
From [dbo].[vw_VistaHorarioProfesional]
Where Est_Hor_Ses = 1 And Nom_Espec Like '%'+ @vNom_Espec +'%'
GO

/****************************************************************************/
/*************   [usp_ListarDetalleSesiones]  *****************************/
/*******************************************************/

Create Procedure [dbo].[usp_ListarDetalleSesiones]
@vHor_Ini varchar(8),
@vHor_Fin varchar(8)
As
Select [Cod_pac]
      ,[Cod_Horario_Ses]
      ,[Nom_pac]
      ,[Ape_pac]
      ,[Dni_pac]
      ,[Tel_Pac]
      ,[Fecha_Asignación]
      ,[Hora_Inicio]
      ,[Hora_Fin]
      ,[Est_Ses_Asig]
      ,[Estado_Sesion]
From [dbo].[vw_VistaEstadoSesionPaciente]
Where Est_Ses_Asig = 1 And Hora_Inicio Like '%'+ @vHor_Ini +'%' And Hora_Fin Like '%' + @vHor_Fin + '%'
GO

/****************************************************************************/
/*************   [usp_ListarReservacionSesion]  *****************************/
/*******************************************************/

Create Procedure [dbo].[usp_ListarReservacionSesion]
As
Select [Cod_apo]
      ,[Cod_Horario_Ses]
      ,[Nom_apo]
      ,[Ape_apo]
      ,[Dni_apo]
      ,[Tel_Apo]
      ,[Fecha_Reservación]
      ,[Est_Reserv]
      ,[Estado_Reservacion]
From [dbo].[vw_VistaEstadoReservacion]
Where Est_Reserv = 1 
Order by Fecha_Reservación desc
GO

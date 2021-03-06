USE [master]
GO
/****** Object:  Database [Am Israel Defense Web]    Script Date: 5/11/2019 10:36:44 ******/
CREATE DATABASE [Am Israel Defense Web]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Am Israel Defense Web', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Am Israel Defense Web.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Am Israel Defense Web_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Am Israel Defense Web_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Am Israel Defense Web] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Am Israel Defense Web].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Am Israel Defense Web] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Am Israel Defense Web] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Am Israel Defense Web] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Am Israel Defense Web] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Am Israel Defense Web] SET ARITHABORT OFF 
GO
ALTER DATABASE [Am Israel Defense Web] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Am Israel Defense Web] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Am Israel Defense Web] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Am Israel Defense Web] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Am Israel Defense Web] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Am Israel Defense Web] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Am Israel Defense Web] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Am Israel Defense Web] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Am Israel Defense Web] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Am Israel Defense Web] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Am Israel Defense Web] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Am Israel Defense Web] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Am Israel Defense Web] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Am Israel Defense Web] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Am Israel Defense Web] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Am Israel Defense Web] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Am Israel Defense Web] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Am Israel Defense Web] SET RECOVERY FULL 
GO
ALTER DATABASE [Am Israel Defense Web] SET  MULTI_USER 
GO
ALTER DATABASE [Am Israel Defense Web] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Am Israel Defense Web] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Am Israel Defense Web] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Am Israel Defense Web] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Am Israel Defense Web] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Am Israel Defense Web', N'ON'
GO
ALTER DATABASE [Am Israel Defense Web] SET QUERY_STORE = OFF
GO
USE [Am Israel Defense Web]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Am Israel Defense Web]
GO
/****** Object:  User [alumno]    Script Date: 5/11/2019 10:36:44 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 5/11/2019 10:36:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[IdCategorias] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[IdCategorias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comentarios]    Script Date: 5/11/2019 10:36:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentarios](
	[IdComentario] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[fkUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Comentarios] PRIMARY KEY CLUSTERED 
(
	[IdComentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Noticias]    Script Date: 5/11/2019 10:36:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Noticias](
	[IdNoticia] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](50) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[Multimedia] [varchar](50) NOT NULL,
	[fkCategoria] [int] NOT NULL,
 CONSTRAINT [PK_Noticias] PRIMARY KEY CLUSTERED 
(
	[IdNoticia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sabias Que]    Script Date: 5/11/2019 10:36:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sabias Que](
	[IdSabiasQue] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[Multimedia] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Sabias Que] PRIMARY KEY CLUSTERED 
(
	[IdSabiasQue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 5/11/2019 10:36:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuarios] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Clave] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IdUsuarios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([IdCategorias], [Nombre]) VALUES (1, N'Antisemitismo')
INSERT [dbo].[Categorias] ([IdCategorias], [Nombre]) VALUES (2, N'Diaspora')
INSERT [dbo].[Categorias] ([IdCategorias], [Nombre]) VALUES (3, N'Shoa')
INSERT [dbo].[Categorias] ([IdCategorias], [Nombre]) VALUES (4, N'Educacion al odio')
INSERT [dbo].[Categorias] ([IdCategorias], [Nombre]) VALUES (5, N'Medio Oriente')
INSERT [dbo].[Categorias] ([IdCategorias], [Nombre]) VALUES (6, N'Comunidad')
INSERT [dbo].[Categorias] ([IdCategorias], [Nombre]) VALUES (7, N'Tikun Olam')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
SET IDENTITY_INSERT [dbo].[Noticias] ON 

INSERT [dbo].[Noticias] ([IdNoticia], [Titulo], [Descripcion], [Multimedia], [fkCategoria]) VALUES (1, N'H', N'P', N'1', 1)
SET IDENTITY_INSERT [dbo].[Noticias] OFF
ALTER TABLE [dbo].[Comentarios]  WITH CHECK ADD  CONSTRAINT [FK_Comentarios_Usuarios] FOREIGN KEY([fkUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuarios])
GO
ALTER TABLE [dbo].[Comentarios] CHECK CONSTRAINT [FK_Comentarios_Usuarios]
GO
ALTER TABLE [dbo].[Noticias]  WITH CHECK ADD  CONSTRAINT [FK_Noticias_Categorias] FOREIGN KEY([fkCategoria])
REFERENCES [dbo].[Categorias] ([IdCategorias])
GO
ALTER TABLE [dbo].[Noticias] CHECK CONSTRAINT [FK_Noticias_Categorias]
GO
/****** Object:  StoredProcedure [dbo].[sp_BorrarCategorias]    Script Date: 5/11/2019 10:36:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_BorrarCategorias]
@id int
as
begin

delete from Categorias  where (IdCategorias=@id);

end
GO
/****** Object:  StoredProcedure [dbo].[sp_BorrarComentarios]    Script Date: 5/11/2019 10:36:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_BorrarComentarios]
@id int
as
begin

delete from Comentarios  where (IdComentario=@id);

end
GO
/****** Object:  StoredProcedure [dbo].[sp_BorrarNoticias]    Script Date: 5/11/2019 10:36:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_BorrarNoticias]
@id int
as
begin

delete from Noticias  where (IdNoticia=@id);

end
GO
/****** Object:  StoredProcedure [dbo].[sp_BorrarSabiasQue]    Script Date: 5/11/2019 10:36:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_BorrarSabiasQue]
@id int
as
begin

delete from [Sabias Que]  where (IdSabiasQue=@id);

end
GO
/****** Object:  StoredProcedure [dbo].[sp_BorrarUsuarios]    Script Date: 5/11/2019 10:36:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_BorrarUsuarios]
@id int
as
begin

delete from Usuarios  where (IdUsuarios=@id);

end
GO
/****** Object:  StoredProcedure [dbo].[sp_CargarNoticias]    Script Date: 5/11/2019 10:36:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CargarNoticias]
@titulo varchar,
@descripcion varchar,
@multimedia varchar,
@fkcategoria int
as
begin

insert into Noticias values
(@titulo, @descripcion, @multimedia, @fkcategoria);

end
GO
/****** Object:  StoredProcedure [dbo].[sp_CargarSabiasQue]    Script Date: 5/11/2019 10:36:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CargarSabiasQue]
@descrip varchar,
@multimedia varchar
as
begin

insert into [Sabias Que](Descripcion, Multimedia) values (@descrip, @multimedia);

end
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearCategorias]    Script Date: 5/11/2019 10:36:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CrearCategorias]
@nombre varchar
as
begin

insert into Categorias(Nombre) values (@nombre);

end
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearComentarios]    Script Date: 5/11/2019 10:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CrearComentarios]
@descrip varchar,
@fkUsu int
as
begin

insert into Comentarios (Descripcion, fkUsuario) values (@descrip, @fkUsu);

end
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearUsuarios]    Script Date: 5/11/2019 10:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CrearUsuarios]
@nombre varchar,
@apellido varchar,
@email varchar,
@clave varchar
as
begin

insert into Usuarios(Nombre, Apellido, Email, Clave) values (@nombre, @apellido, @email, @clave);

end
GO
/****** Object:  StoredProcedure [dbo].[sp_TraerCategoria]    Script Date: 5/11/2019 10:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TraerCategoria]
@id int
as
begin

select Nombre from Categorias

end
GO
/****** Object:  StoredProcedure [dbo].[sp_TraerComentario]    Script Date: 5/11/2019 10:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TraerComentario]
@id int
as
begin

select Descripcion, fkUsuario from Comentarios

end
GO
/****** Object:  StoredProcedure [dbo].[sp_TraerNoticia]    Script Date: 5/11/2019 10:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TraerNoticia]
@id int
as
begin

select Titulo, Descripcion, Multimedia, fkCategoria from Noticias

end
GO
/****** Object:  StoredProcedure [dbo].[sp_TraerSabiasQue]    Script Date: 5/11/2019 10:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TraerSabiasQue]
@id int
as
begin

select Descripcion, Multimedia from [Sabias Que]

end
GO
/****** Object:  StoredProcedure [dbo].[sp_TraerUsuario]    Script Date: 5/11/2019 10:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TraerUsuario]
@id int
as
begin

select Nombre, Apellido, Email, Clave from Usuarios

end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_apellido]    Script Date: 5/11/2019 10:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_update_apellido]
@id int,
@apellido varchar(50)
as 
begin

update Usuarios set Apellido= @apellido where IdUsuarios =@id;

end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_clave]    Script Date: 5/11/2019 10:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_update_clave]
@id int,
@clave varchar(50)
as 
begin

update Usuarios set Clave= @clave where IdUsuarios =@id;

end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_descripcioncomentarios]    Script Date: 5/11/2019 10:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_update_descripcioncomentarios]
@id int,
@desripcion varchar(50)
as 
begin

update Comentarios set Descripcion= @desripcion where IdComentario =@id;

end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_descripcionsq]    Script Date: 5/11/2019 10:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_update_descripcionsq]
@id int,
@descripcion varchar(50)
as 
begin

update [Sabias Que] set Descripcion= @descripcion where IdSabiasQue =@id;

end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_email]    Script Date: 5/11/2019 10:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_update_email]
@id int,
@email varchar(50)
as 
begin

update Usuarios set Email= @email where IdUsuarios =@id;

end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_fkusuario]    Script Date: 5/11/2019 10:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_update_fkusuario]
@id int,
@fkusuario varchar(50)
as 
begin

update Comentarios set fkUsuario= @fkusuario where IdComentario =@id;

end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_multimediasq]    Script Date: 5/11/2019 10:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_update_multimediasq]
@id int,
@multimedia varchar(50)
as 
begin

update [Sabias Que] set Multimedia= @multimedia where IdSabiasQue =@id;

end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_nombre]    Script Date: 5/11/2019 10:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_update_nombre]
@id int,
@nombre varchar(50)
as 
begin

update Usuarios set Nombre= @nombre where IdUsuarios =@id;

end
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCategorias]    Script Date: 5/11/2019 10:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_UpdateCategorias]
@id int,
@nombre varchar(50)
as 
begin

update Categorias set Nombre=@nombre where IdCategorias=@id;

end
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateDescripcion]    Script Date: 5/11/2019 10:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_UpdateDescripcion]
@id int,
@descripcion varchar(50)
as 
begin

update Noticias set Descripcion=@descripcion where IdNoticia =@id;

end
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateFkcategoria]    Script Date: 5/11/2019 10:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_UpdateFkcategoria]
@id int,
@fkcategoria varchar(50)
as 
begin

update Noticias set Descripcion= @fkcategoria where IdNoticia =@id;

end
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateMultimedia]    Script Date: 5/11/2019 10:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_UpdateMultimedia]
@id int,
@multimedia varchar(50)
as 
begin

update Noticias set Multimedia= @multimedia where IdNoticia =@id;

end
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateTitulo]    Script Date: 5/11/2019 10:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_UpdateTitulo]
@id int,
@titulo varchar(50)
as 
begin

update Noticias set Titulo=@titulo where IdNoticia =@id;

end
GO
USE [master]
GO
ALTER DATABASE [Am Israel Defense Web] SET  READ_WRITE 
GO

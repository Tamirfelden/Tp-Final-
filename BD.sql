USE [master]
GO
/****** Object:  Database [Am Israel Defense Web]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  User [alumno]    Script Date: 10/12/2019 12:34:01 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  Table [dbo].[Comentarios]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  Table [dbo].[Noticias]    Script Date: 10/12/2019 12:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Noticias](
	[IdNoticia] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](200) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
	[Multimedia] [varchar](50) NULL,
	[fkCategoria] [int] NOT NULL,
 CONSTRAINT [PK_Noticias] PRIMARY KEY CLUSTERED 
(
	[IdNoticia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sabias Que]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  Table [dbo].[Usuarios]    Script Date: 10/12/2019 12:34:01 ******/
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

INSERT [dbo].[Noticias] ([IdNoticia], [Titulo], [Descripcion], [Multimedia], [fkCategoria]) VALUES (2, N'UK prohibirá el boicot a Israel', N'El partido conservador britanico, dirigido por el PM Boris Johnson, prohibira el boicot a Israel', N'uk.png', 2)
INSERT [dbo].[Noticias] ([IdNoticia], [Titulo], [Descripcion], [Multimedia], [fkCategoria]) VALUES (3, N'Partido Israel vs Uruguay', N'El partido de ayer fue un triunfo rotundo, una goleada historica sin dudas. Ganamos desde antes del comienzo del partido. Ganamos desde que aterrizaron en el aeropuerto. Ganamos desde que se decidio q', N'partido.png', 1)
INSERT [dbo].[Noticias] ([IdNoticia], [Titulo], [Descripcion], [Multimedia], [fkCategoria]) VALUES (4, N'ISRAEL BAJO ATAQUE', N'ISRAEL BAJO ATAQUE Las FDI eliminaron al comandante de la Yihad Islámica en Gaza, Baha Abu Al Ata. Al Ata fue directamente responsable de cientos de ataques terroristas contra civiles israelíes y sold', N'ataque.png', 1)
INSERT [dbo].[Noticias] ([IdNoticia], [Titulo], [Descripcion], [Multimedia], [fkCategoria]) VALUES (7, N'Antisemitismo = Antisionismo', N'El Antisionismo es oponerse al derecho del pueblo judío a la autodeterminación en un estado judío independiente. Sorprendentemente, el 95% se opone solamente a la existencia de un estado: Israel. La e', N'anitisionismo.png', 1)
INSERT [dbo].[Noticias] ([IdNoticia], [Titulo], [Descripcion], [Multimedia], [fkCategoria]) VALUES (8, N'Elecciones Israel', N'El partido conservador britIsrael celebrará unas nuevas elecciones, este martes 17 de septiembre. Cabe recordar que Israel es la única democracia en todo medio oriente. Estos 9 partidos integrarán la ', N'elecciones.png', 1)
INSERT [dbo].[Noticias] ([IdNoticia], [Titulo], [Descripcion], [Multimedia], [fkCategoria]) VALUES (9, N'Bandera Nazi en Gaza', N'La bandera Nazi Símbolo de muerte, odio Otra vez en una Manifestación De Hamás En Gaza Frente A este odio Los soldados de las FDI Se paran con determinación Listos para defender a Israel AM ISRAEL JAI', N'bandera.png', 2)
INSERT [dbo].[Noticias] ([IdNoticia], [Titulo], [Descripcion], [Multimedia], [fkCategoria]) VALUES (16, N'Aguas Israel', N'¿Sabías que el 86% de las aguas residuales en Israel se reutilizan para la agricultura?', N'aguaisrael.jpg', 1)
INSERT [dbo].[Noticias] ([IdNoticia], [Titulo], [Descripcion], [Multimedia], [fkCategoria]) VALUES (17, N'Legislador Nazi Alemania', N'Legisladores de Alemania destituyen a miembro de extrema derecha por comentarios antisemitas', N'diputadoalemania.jpg', 2)
INSERT [dbo].[Noticias] ([IdNoticia], [Titulo], [Descripcion], [Multimedia], [fkCategoria]) VALUES (18, N'Ataque de Gaza a Israel', N'Hamas se va unir con la Yihad Islámica Palestina? Líder del Hamás para el canal  "Al-Aqsa TV":  "Si el enemigo (Israel)  ataca esta noche, con la ayuda de Alá, entramos en la batalla " (Hasta ahora so', N'ataqueisrael.jpg', 3)
INSERT [dbo].[Noticias] ([IdNoticia], [Titulo], [Descripcion], [Multimedia], [fkCategoria]) VALUES (26, N'Científicos israelíes diseñaron una bacteria capaz de comer CO2 y contribuir a la lucha contra el cambio climático', N'El cambio climatico es un gran problema de la sociedad en los ultimos tiempos. Israel aporta este avance para poder combatirlo, un modo mas de ver el Tikun Olam, reparar al mundo', N'bacterias.jpg', 3)
INSERT [dbo].[Noticias] ([IdNoticia], [Titulo], [Descripcion], [Multimedia], [fkCategoria]) VALUES (28, N'Foto de judios liberados de trenes Nazis', N'Una foto tomada en Abril de 1945. Cuando los Aliados interceptaron un tren de prisioneros judíos. Este es el momento en el cuál se enteraron que el tren no se dirigirá a un campo de exterminio, y que ', N'judioslibres.jpg', 3)
SET IDENTITY_INSERT [dbo].[Noticias] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([IdUsuarios], [Nombre], [Apellido], [Email], [Clave]) VALUES (1, N'j', N'm', N'D', N'P')
INSERT [dbo].[Usuarios] ([IdUsuarios], [Nombre], [Apellido], [Email], [Clave]) VALUES (2, N'j', N'g', N'g', N'd')
INSERT [dbo].[Usuarios] ([IdUsuarios], [Nombre], [Apellido], [Email], [Clave]) VALUES (3, N'sdfweewqweq', N'563553', N'ereerewe', N'eerertrtwre')
INSERT [dbo].[Usuarios] ([IdUsuarios], [Nombre], [Apellido], [Email], [Clave]) VALUES (4, N'j', N'o', N'd', N'p')
INSERT [dbo].[Usuarios] ([IdUsuarios], [Nombre], [Apellido], [Email], [Clave]) VALUES (5, N'a', N'o', N'd', N'p')
INSERT [dbo].[Usuarios] ([IdUsuarios], [Nombre], [Apellido], [Email], [Clave]) VALUES (6, N'j', N'o', N'd', N'o')
INSERT [dbo].[Usuarios] ([IdUsuarios], [Nombre], [Apellido], [Email], [Clave]) VALUES (7, N'j', N'h', N'd', N'p')
INSERT [dbo].[Usuarios] ([IdUsuarios], [Nombre], [Apellido], [Email], [Clave]) VALUES (8, N'j', N'o', N'd', N'p')
INSERT [dbo].[Usuarios] ([IdUsuarios], [Nombre], [Apellido], [Email], [Clave]) VALUES (9, N'j', N'h', N'd', N'p')
INSERT [dbo].[Usuarios] ([IdUsuarios], [Nombre], [Apellido], [Email], [Clave]) VALUES (10, N'backoffice', N'backoffice', N'backoffice', N'backoffice')
INSERT [dbo].[Usuarios] ([IdUsuarios], [Nombre], [Apellido], [Email], [Clave]) VALUES (11, N'menguele', N'chona', N'menguele@gmail.com', N'puto')
INSERT [dbo].[Usuarios] ([IdUsuarios], [Nombre], [Apellido], [Email], [Clave]) VALUES (12, N'leok', N'd', N'f', N'12345')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
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
/****** Object:  StoredProcedure [dbo].[sp_BorrarCategorias]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_BorrarComentarios]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_BorrarNoticias]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_BorrarSabiasQue]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_BorrarUsuarios]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CargarNoticias]    Script Date: 10/12/2019 12:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CargarNoticias]
@titulo varchar(200),
@descripcion varchar(200),
@Multimedia varchar(200),
@fkCategoria int
as
begin

insert into Noticias values
(@Titulo, @Descripcion, @Multimedia, @fkCategoria);

end
GO
/****** Object:  StoredProcedure [dbo].[sp_CargarNoticias1]    Script Date: 10/12/2019 12:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CargarNoticias1]
@titulo varchar(200),
@descripcion varchar(200),
@Multimedia varchar(200),
@fkCategoria int,
@idNoticia int
as
begin

update Noticias set Titulo = @titulo ,Descripcion = @Descripcion, Multimedia = @Multimedia, fkCategoria = @fkCategoria
where IdNoticia = @IdNoticia

end

GO
/****** Object:  StoredProcedure [dbo].[sp_CargarSabiasQue]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CrearCategorias]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CrearComentarios]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CrearUsuarios]    Script Date: 10/12/2019 12:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CrearUsuarios]
@nombre varchar(200),
@apellido varchar(200),
@email varchar(200),
@clave varchar(200)
as
begin

insert into Usuarios(Nombre, Apellido, Email, Clave) values (@nombre, @apellido, @email, @clave);

end
GO
/****** Object:  StoredProcedure [dbo].[sp_Menguele]    Script Date: 10/12/2019 12:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Menguele] 
 @Nombre varchar(200)

 as
 
 select Nombre from Categorias Where Nombre like 'Diaspora'

	select * from Noticias where fkCategoria != 5 And fkCategoria < 4
	order by Titulo DESC

GO
/****** Object:  StoredProcedure [dbo].[sp_TraerCategoria]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TraerComentario]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TraerNoticia]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TraerSabiasQue]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TraerUnaNoticia]    Script Date: 10/12/2019 12:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_TraerUnaNoticia]
@id int

as
begin

select Titulo, Descripcion, Multimedia, fkCategoria from Noticias where @id = IdNoticia 

end
GO
/****** Object:  StoredProcedure [dbo].[sp_TraerUsuario]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_update_apellido]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_update_clave]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_update_descripcioncomentarios]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_update_descripcionsq]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_update_email]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_update_fkusuario]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_update_multimediasq]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_update_nombre]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateCategorias]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateDescripcion]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateFkcategoria]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateMultimedia]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateTitulo]    Script Date: 10/12/2019 12:34:01 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_VerificarUsuario]    Script Date: 10/12/2019 12:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_VerificarUsuario]
@Nombre varchar(200),
@Clave varchar(200)
as
begin

select * from Usuarios where Nombre=@Nombre and Clave=@Clave

end
GO
USE [master]
GO
ALTER DATABASE [Am Israel Defense Web] SET  READ_WRITE 
GO

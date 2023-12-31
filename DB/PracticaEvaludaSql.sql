USE [master]
GO
/****** Object:  Database [elContinental]    Script Date: 30/9/2023 18:27:51 ******/
CREATE DATABASE [elContinental]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'elContinental', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\elContinental.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'elContinental_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\elContinental_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [elContinental] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [elContinental].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [elContinental] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [elContinental] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [elContinental] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [elContinental] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [elContinental] SET ARITHABORT OFF 
GO
ALTER DATABASE [elContinental] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [elContinental] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [elContinental] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [elContinental] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [elContinental] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [elContinental] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [elContinental] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [elContinental] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [elContinental] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [elContinental] SET  DISABLE_BROKER 
GO
ALTER DATABASE [elContinental] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [elContinental] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [elContinental] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [elContinental] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [elContinental] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [elContinental] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [elContinental] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [elContinental] SET RECOVERY FULL 
GO
ALTER DATABASE [elContinental] SET  MULTI_USER 
GO
ALTER DATABASE [elContinental] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [elContinental] SET DB_CHAINING OFF 
GO
ALTER DATABASE [elContinental] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [elContinental] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [elContinental] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [elContinental] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'elContinental', N'ON'
GO
ALTER DATABASE [elContinental] SET QUERY_STORE = OFF
GO
USE [elContinental]
GO
/****** Object:  User [DataWereHouse]    Script Date: 30/9/2023 18:27:52 ******/
CREATE USER [DataWereHouse] FOR LOGIN [DataWereHouse] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 30/9/2023 18:27:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[HotelId] [int] NOT NULL,
	[nombre] [nvarchar](255) NULL,
 CONSTRAINT [pk_dim_hotel] PRIMARY KEY CLUSTERED 
(
	[HotelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Torre]    Script Date: 30/9/2023 18:27:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Torre](
	[torreId] [int] NOT NULL,
	[hotelId] [int] NULL,
	[Numero] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[torreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habitacion]    Script Date: 30/9/2023 18:27:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitacion](
	[habitacionId] [int] NOT NULL,
	[torreId] [int] NULL,
	[numero] [int] NULL,
	[estado] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[habitacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VistaHotelTorreHabitacion]    Script Date: 30/9/2023 18:27:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaHotelTorreHabitacion] AS
SELECT
    h.hotelId AS HotelId,
    h.nombre AS HotelNombre,
    t.torreId AS TorreId,
    t.Numero AS TorreNumero,
    ha.numero AS HabitacionNumero,
    ha.estado AS HabitacionEstado
FROM
    Hotel h
JOIN
    Torre t ON h.hotelId = t.hotelId
JOIN
    Habitacion ha ON t.torreId = ha.torreId;
GO
/****** Object:  Table [dbo].[PersonaH]    Script Date: 30/9/2023 18:27:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonaH](
	[personaId] [int] NOT NULL,
	[nombre] [nvarchar](255) NULL,
	[primerApellido] [nvarchar](255) NULL,
	[segundoApellido] [nvarchar](255) NULL,
	[cedula] [nvarchar](20) NULL,
	[nacionalidad] [nvarchar](50) NULL,
	[telefono] [nvarchar](15) NULL,
	[correo] [nvarchar](255) NULL,
	[habitacionAsignada] [nvarchar](10) NULL,
	[Disponibilidad] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[personaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE VIEW VistaHotelHabitacionEstado1 AS
SELECT
    h.hotelId AS HotelId,
    h.nombre AS HotelNombre,
    t.torreId AS TorreId,
    ha.numero AS HabitacionNumero,
    ha.estado AS HabitacionEstado
FROM
    Hotel h
JOIN
    Torre t ON h.hotelId = t.hotelId
JOIN
    Habitacion ha ON t.torreId = ha.torreId
WHERE
    ha.estado = 1;


INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (1, 1, 1, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (2, 1, 2, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (3, 1, 3, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (4, 1, 4, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (5, 1, 5, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (6, 1, 6, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (7, 1, 7, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (8, 1, 8, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (9, 1, 9, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (10, 1, 10, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (11, 1, 11, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (12, 1, 12, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (13, 1, 13, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (14, 1, 14, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (15, 1, 15, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (16, 1, 16, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (17, 1, 17, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (18, 1, 18, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (19, 1, 19, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (20, 1, 20, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (21, 1, 21, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (22, 1, 22, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (23, 1, 23, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (24, 1, 24, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (25, 1, 25, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (26, 2, 1, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (27, 2, 2, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (28, 2, 3, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (29, 2, 4, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (30, 2, 5, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (31, 2, 6, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (32, 2, 7, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (33, 2, 8, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (34, 2, 9, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (35, 2, 10, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (36, 2, 11, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (37, 2, 12, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (38, 2, 13, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (39, 2, 14, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (40, 2, 15, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (41, 2, 16, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (42, 2, 17, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (43, 2, 18, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (44, 2, 19, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (45, 2, 20, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (46, 2, 21, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (47, 2, 22, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (48, 2, 23, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (49, 2, 24, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (50, 2, 25, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (51, 3, 1, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (52, 3, 2, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (53, 3, 3, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (54, 3, 4, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (55, 3, 5, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (56, 3, 6, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (57, 3, 7, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (58, 3, 8, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (59, 3, 9, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (60, 3, 10, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (61, 3, 11, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (62, 3, 12, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (63, 3, 13, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (64, 3, 14, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (65, 3, 15, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (66, 3, 16, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (67, 3, 17, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (68, 3, 18, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (69, 3, 19, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (70, 3, 20, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (71, 3, 21, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (72, 3, 22, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (73, 3, 23, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (74, 3, 24, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (75, 3, 25, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (76, 4, 1, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (77, 4, 2, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (78, 4, 3, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (79, 4, 4, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (80, 4, 5, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (81, 4, 6, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (82, 4, 7, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (83, 4, 8, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (84, 4, 9, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (85, 4, 10, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (86, 4, 11, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (87, 4, 12, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (88, 4, 13, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (89, 4, 14, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (90, 4, 15, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (91, 4, 16, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (92, 4, 17, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (93, 4, 18, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (94, 4, 19, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (95, 4, 20, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (96, 4, 21, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (97, 4, 22, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (98, 4, 23, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (99, 4, 24, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (100, 4, 25, N'1')
GO
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (101, 5, 1, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (102, 5, 2, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (103, 5, 3, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (104, 5, 4, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (105, 5, 5, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (106, 5, 6, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (107, 5, 7, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (108, 5, 8, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (109, 5, 9, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (110, 5, 10, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (111, 5, 11, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (112, 5, 12, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (113, 5, 13, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (114, 5, 14, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (115, 5, 15, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (116, 5, 16, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (117, 5, 17, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (118, 5, 18, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (119, 5, 19, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (120, 5, 20, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (121, 5, 21, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (122, 5, 22, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (123, 5, 23, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (124, 5, 24, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (125, 5, 25, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (126, 6, 1, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (127, 6, 2, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (128, 6, 3, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (129, 6, 4, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (130, 6, 5, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (131, 6, 6, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (132, 6, 7, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (133, 6, 8, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (134, 6, 9, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (135, 6, 10, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (136, 6, 11, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (137, 6, 12, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (138, 6, 13, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (139, 6, 14, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (140, 6, 15, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (141, 6, 16, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (142, 6, 17, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (143, 6, 18, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (144, 6, 19, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (145, 6, 20, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (146, 6, 21, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (147, 6, 22, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (148, 6, 23, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (149, 6, 24, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (150, 6, 25, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (151, 7, 1, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (152, 7, 2, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (153, 7, 3, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (154, 7, 4, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (155, 7, 5, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (156, 7, 6, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (157, 7, 7, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (158, 7, 8, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (159, 7, 9, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (160, 7, 10, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (161, 7, 11, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (162, 7, 12, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (163, 7, 13, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (164, 7, 14, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (165, 7, 15, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (166, 7, 16, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (167, 7, 17, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (168, 7, 18, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (169, 7, 19, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (170, 7, 20, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (171, 7, 21, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (172, 7, 22, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (173, 7, 23, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (174, 7, 24, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (175, 7, 25, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (176, 8, 1, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (177, 8, 2, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (178, 8, 3, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (179, 8, 4, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (180, 8, 5, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (181, 8, 6, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (182, 8, 7, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (183, 8, 8, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (184, 8, 9, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (185, 8, 10, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (186, 8, 11, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (187, 8, 12, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (188, 8, 13, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (189, 8, 14, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (190, 8, 15, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (191, 8, 16, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (192, 8, 17, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (193, 8, 18, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (194, 8, 19, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (195, 8, 20, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (196, 8, 21, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (197, 8, 22, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (198, 8, 23, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (199, 8, 24, N'1')
INSERT [dbo].[Habitacion] ([habitacionId], [torreId], [numero], [estado]) VALUES (200, 8, 25, N'1')
GO
INSERT [dbo].[Hotel] ([HotelId], [nombre]) VALUES (1, N'Continental New york')
INSERT [dbo].[Hotel] ([HotelId], [nombre]) VALUES (2, N'Continental Roma')
INSERT [dbo].[Hotel] ([HotelId], [nombre]) VALUES (3, N'Continental Marruecos')
INSERT [dbo].[Hotel] ([HotelId], [nombre]) VALUES (4, N'Continental Osaka  Tokyo')
GO
INSERT [dbo].[PersonaH] ([personaId], [nombre], [primerApellido], [segundoApellido], [cedula], [nacionalidad], [telefono], [correo], [habitacionAsignada], [Disponibilidad]) VALUES (5, N'cooc', N'lossa', N'coco', N'15', N'tico', N'1231213', N'lossa', N'2', N'1')
INSERT [dbo].[PersonaH] ([personaId], [nombre], [primerApellido], [segundoApellido], [cedula], [nacionalidad], [telefono], [correo], [habitacionAsignada], [Disponibilidad]) VALUES (10, N'christopher', N'alvarez', N'coco', N'1596', N'tico', N'7897', N'lossa', N'2', N'0')
GO
INSERT [dbo].[Torre] ([torreId], [hotelId], [Numero]) VALUES (1, 1, N'1')
INSERT [dbo].[Torre] ([torreId], [hotelId], [Numero]) VALUES (2, 1, N'2')
INSERT [dbo].[Torre] ([torreId], [hotelId], [Numero]) VALUES (3, 2, N'1')
INSERT [dbo].[Torre] ([torreId], [hotelId], [Numero]) VALUES (4, 2, N'2')
INSERT [dbo].[Torre] ([torreId], [hotelId], [Numero]) VALUES (5, 3, N'1')
INSERT [dbo].[Torre] ([torreId], [hotelId], [Numero]) VALUES (6, 3, N'2')
INSERT [dbo].[Torre] ([torreId], [hotelId], [Numero]) VALUES (7, 4, N'1')
INSERT [dbo].[Torre] ([torreId], [hotelId], [Numero]) VALUES (8, 4, N'2')
GO
ALTER TABLE [dbo].[Habitacion]  WITH CHECK ADD FOREIGN KEY([torreId])
REFERENCES [dbo].[Torre] ([torreId])
GO
ALTER TABLE [dbo].[Torre]  WITH CHECK ADD FOREIGN KEY([hotelId])
REFERENCES [dbo].[Hotel] ([HotelId])
GO
USE [master]
GO
ALTER DATABASE [elContinental] SET  READ_WRITE 
GO

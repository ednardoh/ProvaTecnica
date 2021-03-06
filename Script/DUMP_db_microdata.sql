USE [master]
GO
/****** Object:  Database [db_microdata]    Script Date: 03/06/2021 15:56:33 ******/
CREATE DATABASE [db_microdata]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_microdata', FILENAME = N'D:\Sistemas\MicroData\Dados\db_microdata.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'db_microdata_log', FILENAME = N'D:\Sistemas\MicroData\Dados\db_microdata_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [db_microdata] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_microdata].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_microdata] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_microdata] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_microdata] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_microdata] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_microdata] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_microdata] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_microdata] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_microdata] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_microdata] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_microdata] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_microdata] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_microdata] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_microdata] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_microdata] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_microdata] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_microdata] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_microdata] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_microdata] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_microdata] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_microdata] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_microdata] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_microdata] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_microdata] SET RECOVERY FULL 
GO
ALTER DATABASE [db_microdata] SET  MULTI_USER 
GO
ALTER DATABASE [db_microdata] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_microdata] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_microdata] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_microdata] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_microdata', N'ON'
GO
USE [db_microdata]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 03/06/2021 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Cep] [varchar](8) NOT NULL,
	[Logradouro] [varchar](60) NOT NULL,
	[Numero] [varchar](10) NOT NULL,
	[Complemento] [varchar](40) NULL,
	[Bairro] [varchar](40) NULL,
	[Cidade] [varchar](40) NOT NULL,
	[Ibge_cidade] [varchar](7) NOT NULL,
	[Sigla_uf] [varchar](2) NOT NULL,
	[Ibge_uf] [varchar](2) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONTATO]    Script Date: 03/06/2021 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTATO](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Data_nasc] [date] NOT NULL,
	[Idade] [int] NOT NULL,
	[Telefone] [varchar](15) NULL,
	[Id_Cliente] [int] NOT NULL,
 CONSTRAINT [PK_CONTATO] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CONTATO]  WITH CHECK ADD  CONSTRAINT [FK_CONTATO_CLIENTE] FOREIGN KEY([Id_Cliente])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[CONTATO] CHECK CONSTRAINT [FK_CONTATO_CLIENTE]
GO
USE [master]
GO
ALTER DATABASE [db_microdata] SET  READ_WRITE 
GO

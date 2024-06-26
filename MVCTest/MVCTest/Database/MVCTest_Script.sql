USE [master]
GO
/****** Object:  Database [MVCTest]    Script Date: 3/28/2024 5:50:49 PM ******/
CREATE DATABASE [MVCTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MVCTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MVCTest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MVCTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MVCTest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MVCTest] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MVCTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MVCTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MVCTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MVCTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MVCTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MVCTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [MVCTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MVCTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MVCTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MVCTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MVCTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MVCTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MVCTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MVCTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MVCTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MVCTest] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MVCTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MVCTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MVCTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MVCTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MVCTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MVCTest] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [MVCTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MVCTest] SET RECOVERY FULL 
GO
ALTER DATABASE [MVCTest] SET  MULTI_USER 
GO
ALTER DATABASE [MVCTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MVCTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MVCTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MVCTest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MVCTest] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MVCTest] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MVCTest', N'ON'
GO
ALTER DATABASE [MVCTest] SET QUERY_STORE = OFF
GO
USE [MVCTest]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/28/2024 5:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DesignationGrades]    Script Date: 3/28/2024 5:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DesignationGrades](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Gradename] [nvarchar](100) NOT NULL,
	[DesignationIdRef] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_DesignationGrades] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeDesignations]    Script Date: 3/28/2024 5:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeDesignations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DesignationName] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_EmployeeDesignations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 3/28/2024 5:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [nvarchar](100) NOT NULL,
	[Lastname] [nvarchar](100) NOT NULL,
	[EmailAddress] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[DesignationIdRef] [int] NOT NULL,
	[GradeIdRef] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240328102439_MvcTest', N'8.0.3')
GO
SET IDENTITY_INSERT [dbo].[DesignationGrades] ON 

INSERT [dbo].[DesignationGrades] ([Id], [Gradename], [DesignationIdRef], [IsActive]) VALUES (1, N'A1', 1, 1)
INSERT [dbo].[DesignationGrades] ([Id], [Gradename], [DesignationIdRef], [IsActive]) VALUES (2, N'A2', 1, 1)
INSERT [dbo].[DesignationGrades] ([Id], [Gradename], [DesignationIdRef], [IsActive]) VALUES (3, N'A3', 1, 1)
INSERT [dbo].[DesignationGrades] ([Id], [Gradename], [DesignationIdRef], [IsActive]) VALUES (4, N'B1', 2, 1)
INSERT [dbo].[DesignationGrades] ([Id], [Gradename], [DesignationIdRef], [IsActive]) VALUES (5, N'B2', 2, 1)
INSERT [dbo].[DesignationGrades] ([Id], [Gradename], [DesignationIdRef], [IsActive]) VALUES (6, N'B3', 3, 0)
INSERT [dbo].[DesignationGrades] ([Id], [Gradename], [DesignationIdRef], [IsActive]) VALUES (7, N'B4', 3, 1)
INSERT [dbo].[DesignationGrades] ([Id], [Gradename], [DesignationIdRef], [IsActive]) VALUES (8, N'B5', 4, 1)
INSERT [dbo].[DesignationGrades] ([Id], [Gradename], [DesignationIdRef], [IsActive]) VALUES (9, N'C1', 5, 0)
INSERT [dbo].[DesignationGrades] ([Id], [Gradename], [DesignationIdRef], [IsActive]) VALUES (10, N'C2', 5, 1)
INSERT [dbo].[DesignationGrades] ([Id], [Gradename], [DesignationIdRef], [IsActive]) VALUES (11, N'C3', 6, 1)
INSERT [dbo].[DesignationGrades] ([Id], [Gradename], [DesignationIdRef], [IsActive]) VALUES (12, N'D1', 7, 1)
INSERT [dbo].[DesignationGrades] ([Id], [Gradename], [DesignationIdRef], [IsActive]) VALUES (13, N'D2', 7, 0)
INSERT [dbo].[DesignationGrades] ([Id], [Gradename], [DesignationIdRef], [IsActive]) VALUES (14, N'E1', 8, 1)
INSERT [dbo].[DesignationGrades] ([Id], [Gradename], [DesignationIdRef], [IsActive]) VALUES (15, N'E2', 8, 0)
SET IDENTITY_INSERT [dbo].[DesignationGrades] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeDesignations] ON 

INSERT [dbo].[EmployeeDesignations] ([Id], [DesignationName], [IsActive]) VALUES (1, N'Jr. Software Engineer', 1)
INSERT [dbo].[EmployeeDesignations] ([Id], [DesignationName], [IsActive]) VALUES (2, N'Software Engineer', 1)
INSERT [dbo].[EmployeeDesignations] ([Id], [DesignationName], [IsActive]) VALUES (3, N'Senior Software Engineer', 1)
INSERT [dbo].[EmployeeDesignations] ([Id], [DesignationName], [IsActive]) VALUES (4, N'Team Leader', 1)
INSERT [dbo].[EmployeeDesignations] ([Id], [DesignationName], [IsActive]) VALUES (5, N'Project Manager', 1)
INSERT [dbo].[EmployeeDesignations] ([Id], [DesignationName], [IsActive]) VALUES (6, N'Senior Project Manager', 0)
INSERT [dbo].[EmployeeDesignations] ([Id], [DesignationName], [IsActive]) VALUES (7, N'Tester', 1)
INSERT [dbo].[EmployeeDesignations] ([Id], [DesignationName], [IsActive]) VALUES (8, N'SEO', 0)
SET IDENTITY_INSERT [dbo].[EmployeeDesignations] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [Firstname], [Lastname], [EmailAddress], [PhoneNumber], [DesignationIdRef], [GradeIdRef]) VALUES (7, N'Nitesh', N'Pandya', N'mitpandya22@gmail.com', N'(123) 456-7890', 2, 13)
INSERT [dbo].[Employees] ([Id], [Firstname], [Lastname], [EmailAddress], [PhoneNumber], [DesignationIdRef], [GradeIdRef]) VALUES (10, N'nitesh', N'Pandya', N'mitpandya222@gmail.com', N'(123) 456-7890', 1, 11)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
/****** Object:  Index [IX_Employees_DesignationIdRef]    Script Date: 3/28/2024 5:50:49 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employees_DesignationIdRef] ON [dbo].[Employees]
(
	[DesignationIdRef] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Employees_EmailAddress]    Script Date: 3/28/2024 5:50:49 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Employees_EmailAddress] ON [dbo].[Employees]
(
	[EmailAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employees_GradeIdRef]    Script Date: 3/28/2024 5:50:49 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employees_GradeIdRef] ON [dbo].[Employees]
(
	[GradeIdRef] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_DesignationGrades_GradeIdRef] FOREIGN KEY([GradeIdRef])
REFERENCES [dbo].[DesignationGrades] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_DesignationGrades_GradeIdRef]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_EmployeeDesignations_DesignationIdRef] FOREIGN KEY([DesignationIdRef])
REFERENCES [dbo].[EmployeeDesignations] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_EmployeeDesignations_DesignationIdRef]
GO
USE [master]
GO
ALTER DATABASE [MVCTest] SET  READ_WRITE 
GO

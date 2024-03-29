USE [master]
GO
/****** Object:  Database [EFRepository]    Script Date: 12/28/2021 4:42:08 PM ******/
CREATE DATABASE [EFRepository]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EFRepository', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EFRepository.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EFRepository_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EFRepository_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EFRepository] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EFRepository].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EFRepository] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EFRepository] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EFRepository] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EFRepository] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EFRepository] SET ARITHABORT OFF 
GO
ALTER DATABASE [EFRepository] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EFRepository] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EFRepository] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EFRepository] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EFRepository] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EFRepository] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EFRepository] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EFRepository] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EFRepository] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EFRepository] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EFRepository] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EFRepository] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EFRepository] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EFRepository] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EFRepository] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EFRepository] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [EFRepository] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EFRepository] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EFRepository] SET  MULTI_USER 
GO
ALTER DATABASE [EFRepository] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EFRepository] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EFRepository] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EFRepository] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EFRepository] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EFRepository] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EFRepository] SET QUERY_STORE = OFF
GO
USE [EFRepository]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/28/2021 4:42:09 PM ******/
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
/****** Object:  Table [dbo].[Students]    Script Date: 12/28/2021 4:42:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentTeacher]    Script Date: 12/28/2021 4:42:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentTeacher](
	[StudentsStudentId] [int] NOT NULL,
	[TeachersTeacherId] [int] NOT NULL,
 CONSTRAINT [PK_StudentTeacher] PRIMARY KEY CLUSTERED 
(
	[StudentsStudentId] ASC,
	[TeachersTeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentTeachers]    Script Date: 12/28/2021 4:42:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentTeachers](
	[StudentTeacherId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
 CONSTRAINT [PK_StudentTeachers] PRIMARY KEY CLUSTERED 
(
	[StudentTeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 12/28/2021 4:42:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[TeacherId] [int] IDENTITY(1,1) NOT NULL,
	[TeacherName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211227092548_StudentEntity', N'6.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211227100511_EfCore', N'6.0.1')
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentId], [StudentName]) VALUES (3, N'Faysal')
INSERT [dbo].[Students] ([StudentId], [StudentName]) VALUES (4, N'string')
INSERT [dbo].[Students] ([StudentId], [StudentName]) VALUES (5, N'Kobir')
INSERT [dbo].[Students] ([StudentId], [StudentName]) VALUES (6, N'Rahat')
INSERT [dbo].[Students] ([StudentId], [StudentName]) VALUES (7, N'Saleh')
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
INSERT [dbo].[StudentTeacher] ([StudentsStudentId], [TeachersTeacherId]) VALUES (3, 3)
INSERT [dbo].[StudentTeacher] ([StudentsStudentId], [TeachersTeacherId]) VALUES (4, 4)
INSERT [dbo].[StudentTeacher] ([StudentsStudentId], [TeachersTeacherId]) VALUES (5, 5)
INSERT [dbo].[StudentTeacher] ([StudentsStudentId], [TeachersTeacherId]) VALUES (6, 6)
GO
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([TeacherId], [TeacherName]) VALUES (2, N'Dr. Rahat')
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName]) VALUES (3, N'Mr. Atik')
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName]) VALUES (4, N'Sneha')
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName]) VALUES (5, N'Dr.')
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName]) VALUES (6, N'Farid')
SET IDENTITY_INSERT [dbo].[Teachers] OFF
GO
/****** Object:  Index [IX_StudentTeacher_TeachersTeacherId]    Script Date: 12/28/2021 4:42:09 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentTeacher_TeachersTeacherId] ON [dbo].[StudentTeacher]
(
	[TeachersTeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentTeachers_StudentId]    Script Date: 12/28/2021 4:42:09 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentTeachers_StudentId] ON [dbo].[StudentTeachers]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentTeachers_TeacherId]    Script Date: 12/28/2021 4:42:09 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentTeachers_TeacherId] ON [dbo].[StudentTeachers]
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentTeacher]  WITH CHECK ADD  CONSTRAINT [FK_StudentTeacher_Students_StudentsStudentId] FOREIGN KEY([StudentsStudentId])
REFERENCES [dbo].[Students] ([StudentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentTeacher] CHECK CONSTRAINT [FK_StudentTeacher_Students_StudentsStudentId]
GO
ALTER TABLE [dbo].[StudentTeacher]  WITH CHECK ADD  CONSTRAINT [FK_StudentTeacher_Teachers_TeachersTeacherId] FOREIGN KEY([TeachersTeacherId])
REFERENCES [dbo].[Teachers] ([TeacherId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentTeacher] CHECK CONSTRAINT [FK_StudentTeacher_Teachers_TeachersTeacherId]
GO
ALTER TABLE [dbo].[StudentTeachers]  WITH CHECK ADD  CONSTRAINT [FK_StudentTeachers_Students_StudentId] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentTeachers] CHECK CONSTRAINT [FK_StudentTeachers_Students_StudentId]
GO
ALTER TABLE [dbo].[StudentTeachers]  WITH CHECK ADD  CONSTRAINT [FK_StudentTeachers_Teachers_TeacherId] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teachers] ([TeacherId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentTeachers] CHECK CONSTRAINT [FK_StudentTeachers_Teachers_TeacherId]
GO
USE [master]
GO
ALTER DATABASE [EFRepository] SET  READ_WRITE 
GO

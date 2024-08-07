USE [master]
GO
/****** Object:  Database [job]    Script Date: 29/06/2024 3:26:59 CH ******/
CREATE DATABASE [job]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'job', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\job.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'job_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\job_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [job] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [job].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [job] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [job] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [job] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [job] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [job] SET ARITHABORT OFF 
GO
ALTER DATABASE [job] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [job] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [job] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [job] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [job] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [job] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [job] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [job] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [job] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [job] SET  ENABLE_BROKER 
GO
ALTER DATABASE [job] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [job] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [job] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [job] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [job] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [job] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [job] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [job] SET RECOVERY FULL 
GO
ALTER DATABASE [job] SET  MULTI_USER 
GO
ALTER DATABASE [job] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [job] SET DB_CHAINING OFF 
GO
ALTER DATABASE [job] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [job] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [job] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [job] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'job', N'ON'
GO
ALTER DATABASE [job] SET QUERY_STORE = OFF
GO
USE [job]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 29/06/2024 3:27:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [text] NULL,
	[Password] [text] NULL,
	[Role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cv]    Script Date: 29/06/2024 3:27:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cv](
	[CvID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NULL,
	[FullName] [text] NULL,
	[DoB] [date] NULL,
	[ShortDescription] [text] NULL,
	[Experience] [text] NULL,
	[Skill] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[CvID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cv_Post]    Script Date: 29/06/2024 3:27:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cv_Post](
	[CvID] [int] NULL,
	[PostID] [int] NULL,
	[Status] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Level]    Script Date: 29/06/2024 3:27:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Level](
	[LevelID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[LevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 29/06/2024 3:27:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 29/06/2024 3:27:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [text] NULL,
	[CompanyName] [text] NULL,
	[Address] [text] NULL,
	[PostDate] [date] NULL,
	[Description] [text] NULL,
	[Benefit] [text] NULL,
	[Status] [int] NULL,
	[LocationID] [int] NULL,
	[LevelID] [int] NULL,
	[TypeJobID] [int] NULL,
	[AccountID] [int] NULL,
	[price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeJob]    Script Date: 29/06/2024 3:27:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeJob](
	[TypeJobID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeJobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Role]) VALUES (1, N'candidate', N'123', 0)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Role]) VALUES (2, N'recruiter', N'123', 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Role]) VALUES (3, N'admin', N'123', 2)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Role]) VALUES (4, N'candidate2', N'123', 0)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Role]) VALUES (5, N'recruiter2', N'123', 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Cv] ON 

INSERT [dbo].[Cv] ([CvID], [AccountID], [FullName], [DoB], [ShortDescription], [Experience], [Skill]) VALUES (1, 1, N'Chris Brown', CAST(N'2022-04-09' AS Date), N'Java dev graduate from FPT university', N'Java developer proficient in backend development, database integration, and API design, with strong problem-solving skills.', N'Java,Sql Server,Jsp')
INSERT [dbo].[Cv] ([CvID], [AccountID], [FullName], [DoB], [ShortDescription], [Experience], [Skill]) VALUES (2, 4, N'Harris June', CAST(N'2021-05-08' AS Date), N'C# dev from MF', N'Experienced C# developer skilled in building robust applications, utilizing .NET framework, MVC architecture, and database integration, with a focus on efficiency and scalability.', N'C#,Sql Server')
SET IDENTITY_INSERT [dbo].[Cv] OFF
GO
INSERT [dbo].[Cv_Post] ([CvID], [PostID], [Status]) VALUES (2, 1, NULL)
INSERT [dbo].[Cv_Post] ([CvID], [PostID], [Status]) VALUES (2, 4, NULL)
INSERT [dbo].[Cv_Post] ([CvID], [PostID], [Status]) VALUES (1, 1, NULL)
INSERT [dbo].[Cv_Post] ([CvID], [PostID], [Status]) VALUES (1, 2, NULL)
INSERT [dbo].[Cv_Post] ([CvID], [PostID], [Status]) VALUES (1, 3, NULL)
INSERT [dbo].[Cv_Post] ([CvID], [PostID], [Status]) VALUES (1, 4, NULL)
GO
SET IDENTITY_INSERT [dbo].[Level] ON 

INSERT [dbo].[Level] ([LevelID], [Name]) VALUES (1, N'Intern')
INSERT [dbo].[Level] ([LevelID], [Name]) VALUES (2, N'Junior')
INSERT [dbo].[Level] ([LevelID], [Name]) VALUES (3, N'Senior')
INSERT [dbo].[Level] ([LevelID], [Name]) VALUES (4, N'PM')
SET IDENTITY_INSERT [dbo].[Level] OFF
GO
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([LocationID], [Name]) VALUES (1, N'New York')
INSERT [dbo].[Location] ([LocationID], [Name]) VALUES (2, N'Chicago')
INSERT [dbo].[Location] ([LocationID], [Name]) VALUES (3, N'Tokyo')
SET IDENTITY_INSERT [dbo].[Location] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([PostID], [Title], [CompanyName], [Address], [PostDate], [Description], [Benefit], [Status], [LocationID], [LevelID], [TypeJobID], [AccountID], [price]) VALUES (1, N'Hiring Java Dev', N'Oracle Group', N'2 St John', CAST(N'2024-04-09' AS Date), N'We are seeking a skilled Java developer to join our dynamic team. You will be responsible for designing and implementing backend services, integrating with databases, and developing scalable applications. Strong knowledge of Java, Spring framework, and SQL is required. Join us in creating cutting-edge solutions', N'As a Java developer with us, you''ll enjoy competitive compensation and benefits, including revenue sharing opportunities that can add $200 to $300 per month based on project performance and your contributions. Join a team where your skills directly impact both our success and your earnings', 1, 1, 1, 1, 2, 3000)
INSERT [dbo].[Post] ([PostID], [Title], [CompanyName], [Address], [PostDate], [Description], [Benefit], [Status], [LocationID], [LevelID], [TypeJobID], [AccountID], [price]) VALUES (2, N'Hiring C# Dev', N'Microsoft', N'3 John Park', CAST(N'2024-03-05' AS Date), N'We are seeking a skilled Java developer to join our dynamic team. You will be responsible for designing and implementing backend services, integrating with databases, and developing scalable applications. Strong knowledge of Java, Spring framework, and SQL is required. Join us in creating cutting-edge solutions', N'As a C# developer with us, you''ll enjoy competitive compensation and benefits, including revenue sharing opportunities that can add $200 to $300 per month based on project performance and your contributions. Join a team where your skills directly impact both our success and your earnings', 1, 3, 2, 1, 4, 2500)
INSERT [dbo].[Post] ([PostID], [Title], [CompanyName], [Address], [PostDate], [Description], [Benefit], [Status], [LocationID], [LevelID], [TypeJobID], [AccountID], [price]) VALUES (3, N'High Level Java Dev', N'Oracle Group', N'15 Suzy Road', CAST(N'2023-04-08' AS Date), N'We are seeking a skilled Java developer to join our dynamic team. You will be responsible for designing and implementing backend services, integrating with databases, and developing scalable applications. Strong knowledge of Java, Spring framework, and SQL is required. Join us in creating cutting-edge solutions', N'As a C# developer with us, you''ll enjoy competitive compensation and benefits, including revenue sharing opportunities that can add $200 to $300 per month based on project performance and your contributions. Join a team where your skills directly impact both our success and your earnings', 1, 2, 3, 1, 2, 1800)
INSERT [dbo].[Post] ([PostID], [Title], [CompanyName], [Address], [PostDate], [Description], [Benefit], [Status], [LocationID], [LevelID], [TypeJobID], [AccountID], [price]) VALUES (4, N'Creativity Content Workers', N'Entertainment CO', N'35 Haryy Wall', CAST(N'2022-05-04' AS Date), N'We''re looking for a creative content creator to produce engaging materials. Responsibilities include ideation, creation, and optimization of content across platforms like social media and blogs. Join us in crafting compelling narratives and growing our audience', N'As a creator content with us, you''ll enjoy competitive compensation and benefits, including revenue sharing opportunities that can add $200 to $300 per month based on project performance and your contributions. Join a team where your skills directly impact both our success and your earnings', 1, 2, 3, 3, 4, 3500)
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeJob] ON 

INSERT [dbo].[TypeJob] ([TypeJobID], [Name]) VALUES (1, N'Developer')
INSERT [dbo].[TypeJob] ([TypeJobID], [Name]) VALUES (2, N'Designer')
INSERT [dbo].[TypeJob] ([TypeJobID], [Name]) VALUES (3, N'Content Creator')
SET IDENTITY_INSERT [dbo].[TypeJob] OFF
GO
/****** Object:  Index [UQ__Cv__349DA587E9774936]    Script Date: 29/06/2024 3:27:00 CH ******/
ALTER TABLE [dbo].[Cv] ADD UNIQUE NONCLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cv]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Cv_Post]  WITH CHECK ADD FOREIGN KEY([CvID])
REFERENCES [dbo].[Cv] ([CvID])
GO
ALTER TABLE [dbo].[Cv_Post]  WITH CHECK ADD FOREIGN KEY([PostID])
REFERENCES [dbo].[Post] ([PostID])
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([LevelID])
REFERENCES [dbo].[Level] ([LevelID])
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([LocationID])
REFERENCES [dbo].[Location] ([LocationID])
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([TypeJobID])
REFERENCES [dbo].[TypeJob] ([TypeJobID])
GO
USE [master]
GO
ALTER DATABASE [job] SET  READ_WRITE 
GO

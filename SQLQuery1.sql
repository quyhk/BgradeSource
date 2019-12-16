USE [master]
GO
/****** Object:  Database [BGrade]    Script Date: 2019-12-14 9:43:18 AM ******/
CREATE DATABASE [BGrade]

ALTER DATABASE [BGrade] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BGrade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BGrade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BGrade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BGrade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BGrade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BGrade] SET ARITHABORT OFF 
GO
ALTER DATABASE [BGrade] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BGrade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BGrade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BGrade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BGrade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BGrade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BGrade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BGrade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BGrade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BGrade] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BGrade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BGrade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BGrade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BGrade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BGrade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BGrade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BGrade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BGrade] SET RECOVERY FULL 
GO
ALTER DATABASE [BGrade] SET  MULTI_USER 
GO
ALTER DATABASE [BGrade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BGrade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BGrade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BGrade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BGrade] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BGrade', N'ON'
GO
ALTER DATABASE [BGrade] SET QUERY_STORE = OFF
GO
USE [BGrade]
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
USE [BGrade]
GO
/****** Object:  Table [dbo].[AcademicAffairsDepartment]    Script Date: 2019-12-14 9:43:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcademicAffairsDepartment](
	[AAD_Username] [varchar](30) NOT NULL,
	[AAD_Password] [varchar](30) NULL,
	[AAD_Name] [nvarchar](30) NULL,
	[PrivateKey] [nchar](100) NULL,
	[WalletAddress] [nchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[AAD_Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2019-12-14 9:43:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Admin_Username] [nchar](20) NULL,
	[Admin_Password] [nchar](30) NULL,
	[Admin_WalletAddress] [nchar](100) NULL,
	[Admin_PrivateKey] [nchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Announce]    Script Date: 2019-12-14 9:43:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Announce](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Session_ID] [int] NULL,
	[OutLine_ID] [int] NULL,
	[DateTime] [varchar](40) NULL,
	[Type] [varchar](10) NULL,
	[Reason] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 2019-12-14 9:43:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[Class_ID] [int] IDENTITY(1,1) NOT NULL,
	[Class_Name] [nvarchar](20) NULL,
	[Class_Course] [int] NULL,
	[Class_Department] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Class_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 2019-12-14 9:43:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Course_ID] [varchar](20) NOT NULL,
	[Course_Name] [nvarchar](50) NULL,
	[Course_Number_Of_Learning_Unit] [int] NULL,
	[Course_Dep_ID] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Course_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dean]    Script Date: 2019-12-14 9:43:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dean](
	[Dean_Username] [varchar](30) NOT NULL,
	[Dean_Password] [varchar](30) NULL,
	[Dean_Name] [nvarchar](30) NULL,
	[PrivateKey] [nchar](100) NULL,
	[WalletAddress] [nchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Dean_Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 2019-12-14 9:43:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Dep_ID] [varchar](10) NOT NULL,
	[Dep_Name] [nvarchar](30) NULL,
	[Dep_Dean_Username] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Dep_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JoinSession]    Script Date: 2019-12-14 9:43:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JoinSession](
	[JS_Session_ID] [int] NOT NULL,
	[JS_Student_ID] [varchar](15) NOT NULL,
 CONSTRAINT [pk_JoinSession] PRIMARY KEY CLUSTERED 
(
	[JS_Session_ID] ASC,
	[JS_Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer]    Script Date: 2019-12-14 9:43:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer](
	[Lecturer_ID] [varchar](15) NOT NULL,
	[Lecturer_Username] [varchar](30) NULL,
	[Lecturer_Password] [varchar](30) NULL,
	[Lecturer_Name] [nvarchar](30) NULL,
	[Lecturer_Dep_ID] [varchar](10) NULL,
	[PrivateKey] [nchar](100) NULL,
	[WalletAddress] [nchar](100) NULL,
	[Lecturer_Email] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Lecturer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OutLine]    Script Date: 2019-12-14 9:43:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutLine](
	[OutLine_ID] [int] IDENTITY(1,1) NOT NULL,
	[OutLine_Session_ID] [int] NULL,
	[OutLine_Name] [nvarchar](30) NULL,
	[OutLine_Percent] [int] NULL,
	[OutLine_DeadLine] [date] NULL,
	[IsFinalTest] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[OutLine_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 2019-12-14 9:43:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Lecturer_ID] [varchar](15) NULL,
	[Session_ID] [int] NULL,
	[OutLine_ID] [int] NULL,
	[Grade] [text] NULL,
	[DateTime] [varchar](50) NULL,
	[AcceptByDean] [int] NULL,
	[AcceptByPDT] [int] NULL,
	[STT] [int] NULL,
	[OldGrade] [text] NULL,
	[Reason] [text] NULL,
	[HasUpload] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 2019-12-14 9:43:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[Session_ID] [int] IDENTITY(1,1) NOT NULL,
	[Session_Course_ID] [varchar](20) NULL,
	[Session_Lecturer_ID] [varchar](15) NULL,
	[Session_Year] [char](10) NULL,
	[Session_Semester] [int] NULL,
	[Session_Start_Date] [date] NULL,
	[Session_End_Date] [date] NULL,
	[Session_Type] [nchar](10) NULL,
	[Session_IsUpload] [bit] NULL,
	[Session_IsSubmitFinalTest] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Session_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2019-12-14 9:43:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Student_ID] [varchar](15) NOT NULL,
	[Student_Username] [varchar](30) NULL,
	[Student_Password] [varchar](30) NULL,
	[Student_Name] [nvarchar](30) NULL,
	[Student_Email] [varchar](40) NULL,
	[Student_Dep_ID] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentClass]    Script Date: 2019-12-14 9:43:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentClass](
	[Class_ID] [int] NOT NULL,
	[Student_ID] [varchar](15) NOT NULL,
 CONSTRAINT [pk_studentclass] PRIMARY KEY CLUSTERED 
(
	[Class_ID] ASC,
	[Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrHash]    Script Date: 2019-12-14 9:43:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrHash](
	[TrHash_ID] [int] IDENTITY(1,1) NOT NULL,
	[TrHash_OutLine_ID] [int] NOT NULL,
	[TrHash] [text] NULL,
	[DateTime] [text] NULL,
 CONSTRAINT [pk_hash] PRIMARY KEY CLUSTERED 
(
	[TrHash_ID] ASC,
	[TrHash_OutLine_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[AcademicAffairsDepartment] ([AAD_Username], [AAD_Password], [AAD_Name], [PrivateKey], [WalletAddress]) VALUES (N'hoanglinhgiang', N'123', N'Hoàng Linh Giang', N'8973fe9a52b3e1e04a878e61b2b92c25397cea9ced53713e1ee4e58ed8e1673e                                    ', N'0x5D587BD73DCb77302695d11DDa4B277917C3BD6f                                                          ')
INSERT [dbo].[Admin] ([Admin_Username], [Admin_Password], [Admin_WalletAddress], [Admin_PrivateKey]) VALUES (N'admin               ', N'admin                         ', N'0xbFdB1e5E74cdeE86983F99276C84B515035B4a6c                                                          ', N'16465e1006860071aa4e391a696b7d9e47b1e854095bcba8263aa6249350fdb1                                    ')
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([Class_ID], [Class_Name], [Class_Course], [Class_Department]) VALUES (1, N'CMUTPM1', 22, N'DTQT')
INSERT [dbo].[Class] ([Class_ID], [Class_Name], [Class_Course], [Class_Department]) VALUES (2, N'CMUTPM2', 22, N'DTQT')
INSERT [dbo].[Class] ([Class_ID], [Class_Name], [Class_Course], [Class_Department]) VALUES (3, N'CMUTPM1', 23, N'DTQT')
INSERT [dbo].[Class] ([Class_ID], [Class_Name], [Class_Course], [Class_Department]) VALUES (4, N'CMUTPM2', 23, N'DTQT')
INSERT [dbo].[Class] ([Class_ID], [Class_Name], [Class_Course], [Class_Department]) VALUES (5, N'CNTT1', 24, N'CNTT')
SET IDENTITY_INSERT [dbo].[Class] OFF
INSERT [dbo].[Course] ([Course_ID], [Course_Name], [Course_Number_Of_Learning_Unit], [Course_Dep_ID]) VALUES (N'CMU-CS 445 BIS', N'System Integration Practices', 3, N'DTQT')
INSERT [dbo].[Course] ([Course_ID], [Course_Name], [Course_Number_Of_Learning_Unit], [Course_Dep_ID]) VALUES (N'CMU-CS 447 AIS', N'CDIO', 1, N'DTQT')
INSERT [dbo].[Course] ([Course_ID], [Course_Name], [Course_Number_Of_Learning_Unit], [Course_Dep_ID]) VALUES (N'CMU-SE 303 GIS', N'Software Testing', 3, N'DTQT')
INSERT [dbo].[Course] ([Course_ID], [Course_Name], [Course_Number_Of_Learning_Unit], [Course_Dep_ID]) VALUES (N'CMU-SE 403 AIS', N'Software Architecture & Design', 4, N'DTQT')
INSERT [dbo].[Course] ([Course_ID], [Course_Name], [Course_Number_Of_Learning_Unit], [Course_Dep_ID]) VALUES (N'CS 414 C', N'Winforms: VB.NET / C#.NET', 2, N'CNTT')
INSERT [dbo].[Course] ([Course_ID], [Course_Name], [Course_Number_Of_Learning_Unit], [Course_Dep_ID]) VALUES (N'CS 466 SA', N'Perl & Python', 2, N'CNTT')
INSERT [dbo].[Course] ([Course_ID], [Course_Name], [Course_Number_Of_Learning_Unit], [Course_Dep_ID]) VALUES (N'IS 301 P', N'Database', 2, N'CNTT')
INSERT [dbo].[Course] ([Course_ID], [Course_Name], [Course_Number_Of_Learning_Unit], [Course_Dep_ID]) VALUES (N'IS 384 AIS', N'ASP.NET', 3, N'CNTT')
INSERT [dbo].[Dean] ([Dean_Username], [Dean_Password], [Dean_Name], [PrivateKey], [WalletAddress]) VALUES (N'nguyenducman', N'123', N'Nguy?n ??c M?n', N'E2B5B2798E30B3302D3F4668492112DF83A7997CC29BAC06F338ECBBB5AFDF34                                    ', N'0x06fB399b9245cb14693Ea430323f2e6b15336E1b                                                          ')
INSERT [dbo].[Dean] ([Dean_Username], [Dean_Password], [Dean_Name], [PrivateKey], [WalletAddress]) VALUES (N'nguyentanthuan', N'123', N'Nguy?n T?n Thu?n', N'E2B5B2798E30B3302D3F4668492112DF83A7997CC29BAC06F338ECBBB5AFDF34                                    ', N'0x06fB399b9245cb14693Ea430323f2e6b15336E1b                                                          ')
INSERT [dbo].[Department] ([Dep_ID], [Dep_Name], [Dep_Dean_Username]) VALUES (N'CNTT', N'Công Ngh? Thông Tin', N'nguyentanthuan')
INSERT [dbo].[Department] ([Dep_ID], [Dep_Name], [Dep_Dean_Username]) VALUES (N'DTQT', N'?ào T?o Qu?c T?', N'nguyenducman')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (14, N'2221128422')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (14, N'2221128423')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (14, N'2221128424')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (14, N'2221128425')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (14, N'2221128426')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (15, N'2221128422')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (15, N'2221128423')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (15, N'2221128424')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (15, N'2221128425')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (15, N'2221128426')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (16, N'2221128422')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (16, N'2221128423')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (16, N'2221128424')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (16, N'2221128425')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (16, N'2221128426')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (17, N'2221128422')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (17, N'2221128423')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (17, N'2221128424')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (17, N'2221128425')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (17, N'2221128426')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (18, N'2221128422')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (18, N'2221128423')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (18, N'2221128424')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (18, N'2221128425')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (18, N'2221128426')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (19, N'2221128422')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (19, N'2221128423')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (19, N'2221128424')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (19, N'2221128425')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (19, N'2221128426')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (20, N'2221128422')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (20, N'2221128423')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (20, N'2221128424')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (20, N'2221128425')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (20, N'2221128426')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (21, N'2221128422')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (21, N'2221128423')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (21, N'2221128424')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (21, N'2221128425')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (21, N'2221128426')
INSERT [dbo].[Lecturer] ([Lecturer_ID], [Lecturer_Username], [Lecturer_Password], [Lecturer_Name], [Lecturer_Dep_ID], [PrivateKey], [WalletAddress], [Lecturer_Email]) VALUES (N'001', N'huynhbadieu', N'123', N'Hu?nh Bá Di?u', N'DTQT', N'6C3D2E442AC4D0BA3FBA3662A5BEA7FE47E941329ED89EF1940B2F4DAB3B28B9                                    ', N'0x8c457656323C73c91655369F920366AFf8DA0861                                                          ', N'          ')
INSERT [dbo].[Lecturer] ([Lecturer_ID], [Lecturer_Username], [Lecturer_Password], [Lecturer_Name], [Lecturer_Dep_ID], [PrivateKey], [WalletAddress], [Lecturer_Email]) VALUES (N'002', N'phanlong', N'123', N'Phan Long', N'CNTT', N'6C3D2E442AC4D0BA3FBA3662A5BEA7FE47E941329ED89EF1940B2F4DAB3B28B9                                    ', N'0x8c457656323C73c91655369F920366AFf8DA0861                                                          ', NULL)
SET IDENTITY_INSERT [dbo].[OutLine] ON 

INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (25, 14, N'Conceive', 25, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (26, 14, N'Skill/Method', 10, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (27, 14, N'Design', 25, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (28, 14, N'Implement', 35, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (29, 14, N'Operate', 5, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (30, 15, N'Quizzes', 10, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (31, 15, N'Group Project', 20, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (32, 15, N'Homework', 5, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (33, 15, N'Labs', 15, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (34, 15, N'Midterm Exam', 15, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (35, 15, N'Final Exam', 35, NULL, 1)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (36, 16, N'Quiz 1', 5, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (37, 16, N'Group Project', 20, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (38, 16, N'Homework 1 ', 5, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (39, 16, N'Midterm Exam', 20, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (40, 16, N'Quiz 2', 5, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (41, 16, N'Homework 2', 5, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (42, 16, N'Quiz 3', 5, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (43, 16, N'Final Exam', 25, NULL, 1)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (44, 17, N'Quiz', 10, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (45, 17, N'Homework', 15, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (46, 17, N'Group Project', 20, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (47, 17, N'Mid Term', 20, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (48, 17, N'Final Exam ', 35, NULL, 1)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (49, 18, N'Attendance', 10, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (50, 18, N'Group Project', 10, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (51, 18, N'Speech & Discussion', 5, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (52, 18, N'Mid Term', 30, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (53, 18, N'Final Exam', 45, NULL, 1)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (54, 19, N'Attendance', 10, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (55, 19, N'Dicussion', 10, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (56, 19, N'Homework', 10, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (57, 19, N'Personal Project', 15, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (58, 19, N'Mid Term', 20, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (59, 19, N'Final Exam', 35, NULL, 1)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (60, 20, N'Attendance', 5, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (61, 20, N'Homework', 10, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (62, 20, N'Group Project', 20, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (63, 20, N'Mid Term', 20, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (64, 20, N'Final Exam', 45, NULL, 1)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (65, 21, N'Attendance', 5, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (66, 21, N'Dicussion', 10, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (67, 21, N'Group Project', 15, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (68, 21, N'Practices', 15, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (69, 21, N'Mid Term', 20, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (70, 21, N'Final Exam', 35, NULL, 1)
SET IDENTITY_INSERT [dbo].[OutLine] OFF
SET IDENTITY_INSERT [dbo].[Session] ON 

INSERT [dbo].[Session] ([Session_ID], [Session_Course_ID], [Session_Lecturer_ID], [Session_Year], [Session_Semester], [Session_Start_Date], [Session_End_Date], [Session_Type], [Session_IsUpload], [Session_IsSubmitFinalTest]) VALUES (14, N'CMU-CS 447 AIS', N'001', N'2018-2019 ', 1, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), N'LEC       ', 0, 0)
INSERT [dbo].[Session] ([Session_ID], [Session_Course_ID], [Session_Lecturer_ID], [Session_Year], [Session_Semester], [Session_Start_Date], [Session_End_Date], [Session_Type], [Session_IsUpload], [Session_IsSubmitFinalTest]) VALUES (15, N'CMU-SE 403 AIS', N'001', N'2018-2019 ', 1, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), N'LEC       ', 0, 0)
INSERT [dbo].[Session] ([Session_ID], [Session_Course_ID], [Session_Lecturer_ID], [Session_Year], [Session_Semester], [Session_Start_Date], [Session_End_Date], [Session_Type], [Session_IsUpload], [Session_IsSubmitFinalTest]) VALUES (16, N'CMU-SE 303 GIS', N'001', N'2019-2020 ', 2, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), N'LEC       ', 0, 0)
INSERT [dbo].[Session] ([Session_ID], [Session_Course_ID], [Session_Lecturer_ID], [Session_Year], [Session_Semester], [Session_Start_Date], [Session_End_Date], [Session_Type], [Session_IsUpload], [Session_IsSubmitFinalTest]) VALUES (17, N'CMU-CS 445 BIS', N'001', N'2019-2020 ', 2, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), N'LEC       ', 0, 0)
INSERT [dbo].[Session] ([Session_ID], [Session_Course_ID], [Session_Lecturer_ID], [Session_Year], [Session_Semester], [Session_Start_Date], [Session_End_Date], [Session_Type], [Session_IsUpload], [Session_IsSubmitFinalTest]) VALUES (18, N'CS 466 SA', N'002', N'2018-2019 ', 2, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), N'LEC       ', 0, 0)
INSERT [dbo].[Session] ([Session_ID], [Session_Course_ID], [Session_Lecturer_ID], [Session_Year], [Session_Semester], [Session_Start_Date], [Session_End_Date], [Session_Type], [Session_IsUpload], [Session_IsSubmitFinalTest]) VALUES (19, N'IS 301 P', N'002', N'2018-2019 ', 2, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), N'LEC       ', 0, 0)
INSERT [dbo].[Session] ([Session_ID], [Session_Course_ID], [Session_Lecturer_ID], [Session_Year], [Session_Semester], [Session_Start_Date], [Session_End_Date], [Session_Type], [Session_IsUpload], [Session_IsSubmitFinalTest]) VALUES (20, N'CS 414 C', N'002', N'2019-2020 ', 1, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), N'LEC       ', 0, 0)
INSERT [dbo].[Session] ([Session_ID], [Session_Course_ID], [Session_Lecturer_ID], [Session_Year], [Session_Semester], [Session_Start_Date], [Session_End_Date], [Session_Type], [Session_IsUpload], [Session_IsSubmitFinalTest]) VALUES (21, N'IS 384 AIS', N'002', N'2019-2020 ', 1, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), N'LEC       ', 0, 0)
SET IDENTITY_INSERT [dbo].[Session] OFF
INSERT [dbo].[Student] ([Student_ID], [Student_Username], [Student_Password], [Student_Name], [Student_Email], [Student_Dep_ID]) VALUES (N'2221128422', N'huynhtandung', N'123', N'Hu?nh T?n D?ng', N'dunghuynh.010598@gmail.com', N'DTQT')
INSERT [dbo].[Student] ([Student_ID], [Student_Username], [Student_Password], [Student_Name], [Student_Email], [Student_Dep_ID]) VALUES (N'2221128423', N'leminhhoang', N'123', N'Lê Minh Hoàng', N'lehoang97minh@gmail.com', N'DTQT')
INSERT [dbo].[Student] ([Student_ID], [Student_Username], [Student_Password], [Student_Name], [Student_Email], [Student_Dep_ID]) VALUES (N'2221128424', N'hoangkimquy', N'123', N'Hoàng Kim Quý', N'quykimhoang@gmail.com', N'DTQT')
INSERT [dbo].[Student] ([Student_ID], [Student_Username], [Student_Password], [Student_Name], [Student_Email], [Student_Dep_ID]) VALUES (N'2221128425', N'maivanthanh', N'123', N'Mai V?n Th?nh', N'thanhmai@gmail.com', N'DTQT')
INSERT [dbo].[Student] ([Student_ID], [Student_Username], [Student_Password], [Student_Name], [Student_Email], [Student_Dep_ID]) VALUES (N'2221128426', N'nguyenthanhsang', N'123', N'Nguy?n Thành Sang', N'sangnguyen@gmail.com', N'CNTT')
INSERT [dbo].[StudentClass] ([Class_ID], [Student_ID]) VALUES (1, N'2221128422')
INSERT [dbo].[StudentClass] ([Class_ID], [Student_ID]) VALUES (2, N'2221128423')
INSERT [dbo].[StudentClass] ([Class_ID], [Student_ID]) VALUES (3, N'2221128424')
INSERT [dbo].[StudentClass] ([Class_ID], [Student_ID]) VALUES (4, N'2221128425')
INSERT [dbo].[StudentClass] ([Class_ID], [Student_ID]) VALUES (5, N'2221128426')
ALTER TABLE [dbo].[Announce]  WITH CHECK ADD FOREIGN KEY([OutLine_ID])
REFERENCES [dbo].[OutLine] ([OutLine_ID])
GO
ALTER TABLE [dbo].[Announce]  WITH CHECK ADD FOREIGN KEY([Session_ID])
REFERENCES [dbo].[Session] ([Session_ID])
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD FOREIGN KEY([Course_Dep_ID])
REFERENCES [dbo].[Department] ([Dep_ID])
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD FOREIGN KEY([Dep_Dean_Username])
REFERENCES [dbo].[Dean] ([Dean_Username])
GO
ALTER TABLE [dbo].[JoinSession]  WITH CHECK ADD FOREIGN KEY([JS_Session_ID])
REFERENCES [dbo].[Session] ([Session_ID])
GO
ALTER TABLE [dbo].[JoinSession]  WITH CHECK ADD FOREIGN KEY([JS_Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[Lecturer]  WITH CHECK ADD FOREIGN KEY([Lecturer_Dep_ID])
REFERENCES [dbo].[Department] ([Dep_ID])
GO
ALTER TABLE [dbo].[OutLine]  WITH CHECK ADD FOREIGN KEY([OutLine_Session_ID])
REFERENCES [dbo].[Session] ([Session_ID])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([Lecturer_ID])
REFERENCES [dbo].[Lecturer] ([Lecturer_ID])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([OutLine_ID])
REFERENCES [dbo].[OutLine] ([OutLine_ID])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([Session_ID])
REFERENCES [dbo].[Session] ([Session_ID])
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD FOREIGN KEY([Session_Course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD FOREIGN KEY([Session_Lecturer_ID])
REFERENCES [dbo].[Lecturer] ([Lecturer_ID])
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD FOREIGN KEY([Student_Dep_ID])
REFERENCES [dbo].[Department] ([Dep_ID])
GO
ALTER TABLE [dbo].[StudentClass]  WITH CHECK ADD FOREIGN KEY([Class_ID])
REFERENCES [dbo].[Class] ([Class_ID])
GO
ALTER TABLE [dbo].[StudentClass]  WITH CHECK ADD FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[TrHash]  WITH CHECK ADD FOREIGN KEY([TrHash_OutLine_ID])
REFERENCES [dbo].[OutLine] ([OutLine_ID])
GO
USE [master]
GO
ALTER DATABASE [BGrade] SET  READ_WRITE 
GO

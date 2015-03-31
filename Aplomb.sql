USE [master]
GO
/****** Object:  Database [Aplomb]    Script Date: 08/05/2015 13:52:30 ******/
CREATE DATABASE [Aplomb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Aplomb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BECS.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Aplomb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BECS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Aplomb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Aplomb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Aplomb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Aplomb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Aplomb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Aplomb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Aplomb] SET ARITHABORT OFF 
GO
ALTER DATABASE [Aplomb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Aplomb] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Aplomb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Aplomb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Aplomb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Aplomb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Aplomb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Aplomb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Aplomb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Aplomb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Aplomb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Aplomb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Aplomb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Aplomb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Aplomb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Aplomb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Aplomb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Aplomb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Aplomb] SET RECOVERY FULL 
GO
ALTER DATABASE [Aplomb] SET  MULTI_USER 
GO
ALTER DATABASE [Aplomb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Aplomb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Aplomb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Aplomb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Aplomb', N'ON'
GO
USE [Aplomb]
GO
/****** Object:  Table [dbo].[DataDiagramEntityTypes]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DataDiagramEntityTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DataDiagramID] [int] NOT NULL,
	[EntityTypeID] [int] NOT NULL,
	[Color] [char](6) NOT NULL,
	[PositionX] [float] NOT NULL,
	[PositionY] [float] NOT NULL,
 CONSTRAINT [PK_DataDiagramEntityTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DataDiagrams]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataDiagrams](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_DataDiagrams] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_DataDiagrams_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Entities]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entities](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [int] NOT NULL,
 CONSTRAINT [PK_Entities] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EntityTypes]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntityTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EntityTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Fields]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fields](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EntityTypeID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[MinNumber] [int] NOT NULL,
	[MaxNumber] [int] NULL,
	[SortOrder] [int] NOT NULL,
	[ExtraInfo] [xml] NULL,
 CONSTRAINT [PK_Fields] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FieldTypes]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FieldTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ValueTableName] [varchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[ExtraInfoFields] [varchar](max) NULL,
 CONSTRAINT [PK_FieldTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FieldValues]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FieldValues](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EntityID] [int] NOT NULL,
	[FieldID] [int] NOT NULL,
	[FieldNumber] [int] NOT NULL,
	[ValueNumber] [int] NOT NULL,
 CONSTRAINT [PK_FieldValues] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FieldValues_Bit]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FieldValues_Bit](
	[FieldValueID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [bit] NOT NULL,
 CONSTRAINT [PK_FieldValues_Bit] PRIMARY KEY CLUSTERED 
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FieldValues_Date]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FieldValues_Date](
	[FieldValueID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [datetime] NOT NULL,
 CONSTRAINT [PK_FieldValues_Date] PRIMARY KEY CLUSTERED 
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FieldValues_Decimal]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FieldValues_Decimal](
	[FieldValueID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_FieldValues_Decimal] PRIMARY KEY CLUSTERED 
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FieldValues_FK]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FieldValues_FK](
	[FieldValueID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [int] NOT NULL,
	[IsChild] [bit] NOT NULL,
 CONSTRAINT [PK_FieldValues_FK] PRIMARY KEY CLUSTERED 
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FieldValues_Int]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FieldValues_Int](
	[FieldValueID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [int] NOT NULL,
 CONSTRAINT [PK_FieldValues_Int] PRIMARY KEY CLUSTERED 
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FieldValues_LongText]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FieldValues_LongText](
	[FieldValueID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_FieldValues_LongText] PRIMARY KEY CLUSTERED 
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FieldValues_ShortText]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FieldValues_ShortText](
	[FieldValueID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](80) NOT NULL,
 CONSTRAINT [PK_FieldValues_ShortText] PRIMARY KEY CLUSTERED 
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LayoutFields]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LayoutFields](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LayoutID] [int] NOT NULL,
	[FieldID] [int] NOT NULL,
	[NameOverride] [nvarchar](50) NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_LayoutFields] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Layouts]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Layouts](
	[ID] [int] NOT NULL,
	[EntityTypeID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Layouts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Layouts] UNIQUE NONCLUSTERED 
(
	[EntityTypeID] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuItems]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MenuID] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PageID] [int] NULL,
 CONSTRAINT [PK_MenuItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menus]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[ParentMenuItemID] [int] NULL,
 CONSTRAINT [PK_Menus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Menus] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pages]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PageTypeID] [int] NOT NULL,
	[LayoutID] [int] NOT NULL,
	[SectionID] [int] NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Slug] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Pages] UNIQUE NONCLUSTERED 
(
	[SectionID] ASC,
	[Slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PageTypes]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_PageTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_PageTypes_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CanView] [bit] NOT NULL,
	[CanEdit] [bit] NOT NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Permissions_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RightEntityTypes]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RightEntityTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RightID] [int] NOT NULL,
	[EntityTypeID] [int] NOT NULL,
	[PermissionID] [int] NOT NULL,
 CONSTRAINT [PK_RightEntityTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RightFields]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RightFields](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RightID] [int] NOT NULL,
	[FieldID] [int] NOT NULL,
	[PermissionID] [int] NOT NULL,
 CONSTRAINT [PK_RightFields] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RightPages]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RightPages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RightID] [int] NOT NULL,
	[PageID] [int] NOT NULL,
	[PermissionID] [int] NOT NULL,
 CONSTRAINT [PK_RightPages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_RightPages] UNIQUE NONCLUSTERED 
(
	[RightID] ASC,
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rights]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rights](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Rights] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoleRights]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleRights](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[RightID] [int] NOT NULL,
 CONSTRAINT [PK_RoleRights] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sections]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sections](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Slug] [varchar](50) NOT NULL,
	[MenuID] [int] NULL,
 CONSTRAINT [PK_Sections] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Sections_Slug] UNIQUE NONCLUSTERED 
(
	[Slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserEntities]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserEntities](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[EntityID] [int] NOT NULL,
	[PermissionID] [int] NOT NULL,
 CONSTRAINT [PK_UserEntities] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Users] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[EntityTypeFieldsView]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[EntityTypeFieldsView]
AS
SELECT        dbo.EntityTypes.ID AS EntityTypeID, dbo.EntityTypes.Name AS EntityType, dbo.Components.Name AS ComponentName, dbo.Fields.ID AS FieldID, 
                         dbo.Fields.Name AS FieldName, dbo.FieldTypes.Name AS FieldType, dbo.EntityTypeComponents.MinNumber AS ComponentMinNumber, 
                         dbo.EntityTypeComponents.MaxNumber AS ComponentMaxNumber, dbo.Fields.MinNumber AS FieldMinNumber, dbo.Fields.MaxNumber AS FieldMaxNumber, 
                         dbo.EntityTypeComponents.SortOrder AS ComponentSortOrder, dbo.Fields.SortOrder AS FieldSortOrder
FROM            dbo.EntityTypes INNER JOIN
                         dbo.EntityTypeComponents ON dbo.EntityTypes.ID = dbo.EntityTypeComponents.EntityTypeID INNER JOIN
                         dbo.Components ON dbo.EntityTypeComponents.ComponentID = dbo.Components.ID INNER JOIN
                         dbo.Fields ON dbo.Components.ID = dbo.Fields.ComponentID INNER JOIN
                         dbo.FieldTypes ON dbo.Fields.TypeID = dbo.FieldTypes.ID

GO
/****** Object:  View [dbo].[FieldValuesView]    Script Date: 08/05/2015 13:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[FieldValuesView]
AS
SELECT        dbo.FieldValues.ID, dbo.FieldValues.EntityID, dbo.FieldValues.FieldID, dbo.FieldValues.ComponentNumber, dbo.FieldValues.FieldNumber, 
                         dbo.FieldValues.ValueNumber, dbo.Fields.Name AS FieldName, dbo.FieldTypes.Name AS FieldType, dbo.FieldValues_Bit.Value AS BitValue, 
                         dbo.FieldValues_Int.Value AS IntValue, dbo.FieldValues_Decimal.Value AS DecimalValue, dbo.FieldValues_Date.Value AS DateValue, 
                         dbo.FieldValues_ShortText.Value AS ShortTextValue, dbo.FieldValues_LongText.Value AS LongTextValue, dbo.FieldValues_FK.Value AS FKValue
FROM            dbo.Fields INNER JOIN
                         dbo.FieldValues ON dbo.Fields.ID = dbo.FieldValues.FieldID INNER JOIN
                         dbo.FieldTypes ON dbo.Fields.TypeID = dbo.FieldTypes.ID LEFT OUTER JOIN
                         dbo.FieldValues_FK ON dbo.FieldValues.ID = dbo.FieldValues_FK.FieldValueID LEFT OUTER JOIN
                         dbo.FieldValues_Int ON dbo.FieldValues.ID = dbo.FieldValues_Int.FieldValueID LEFT OUTER JOIN
                         dbo.FieldValues_Bit ON dbo.FieldValues.ID = dbo.FieldValues_Bit.FieldValueID LEFT OUTER JOIN
                         dbo.FieldValues_ShortText ON dbo.FieldValues.ID = dbo.FieldValues_ShortText.FieldValueID LEFT OUTER JOIN
                         dbo.FieldValues_LongText ON dbo.FieldValues.ID = dbo.FieldValues_LongText.FieldValueID LEFT OUTER JOIN
                         dbo.FieldValues_Date ON dbo.FieldValues.ID = dbo.FieldValues_Date.FieldValueID LEFT OUTER JOIN
                         dbo.FieldValues_Decimal ON dbo.FieldValues.ID = dbo.FieldValues_Decimal.FieldValueID

GO
/****** Object:  Index [IX_DataDiagramEntityTypes_DataDiagramID]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_DataDiagramEntityTypes_DataDiagramID] ON [dbo].[DataDiagramEntityTypes]
(
	[DataDiagramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DataDiagramEntityTypes_EntityTypeID]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_DataDiagramEntityTypes_EntityTypeID] ON [dbo].[DataDiagramEntityTypes]
(
	[EntityTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DataDiagrams_SortOrder]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_DataDiagrams_SortOrder] ON [dbo].[DataDiagrams]
(
	[SortOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Entities_Type]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_Entities_Type] ON [dbo].[Entities]
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_EntityTypes]    Script Date: 08/05/2015 13:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_EntityTypes] ON [dbo].[EntityTypes]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Fields_Name]    Script Date: 08/05/2015 13:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Fields_Name] ON [dbo].[Fields]
(
	[EntityTypeID] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Fields_Order]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_Fields_Order] ON [dbo].[Fields]
(
	[EntityTypeID] ASC,
	[SortOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Fields_Type]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_Fields_Type] ON [dbo].[Fields]
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_FieldTypes_Name]    Script Date: 08/05/2015 13:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FieldTypes_Name] ON [dbo].[FieldTypes]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldTypes_SortOrder]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_FieldTypes_SortOrder] ON [dbo].[FieldTypes]
(
	[SortOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_EntityID]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_FieldValues_EntityID] ON [dbo].[FieldValues]
(
	[EntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_FieldID]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_FieldValues_FieldID] ON [dbo].[FieldValues]
(
	[FieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_FieldNumber]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_FieldValues_FieldNumber] ON [dbo].[FieldValues]
(
	[FieldNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_ValueNumber]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_FieldValues_ValueNumber] ON [dbo].[FieldValues]
(
	[ValueNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_Bit_FieldValue]    Script Date: 08/05/2015 13:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FieldValues_Bit_FieldValue] ON [dbo].[FieldValues_Bit]
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_Bit_Value]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_FieldValues_Bit_Value] ON [dbo].[FieldValues_Bit]
(
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_Date_FieldValue]    Script Date: 08/05/2015 13:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FieldValues_Date_FieldValue] ON [dbo].[FieldValues_Date]
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_Date_Value]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_FieldValues_Date_Value] ON [dbo].[FieldValues_Date]
(
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_Decimal_FieldValue]    Script Date: 08/05/2015 13:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FieldValues_Decimal_FieldValue] ON [dbo].[FieldValues_Decimal]
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_Decimal_Value]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_FieldValues_Decimal_Value] ON [dbo].[FieldValues_Decimal]
(
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_FK_FieldValue]    Script Date: 08/05/2015 13:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FieldValues_FK_FieldValue] ON [dbo].[FieldValues_FK]
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_FK_Value]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_FieldValues_FK_Value] ON [dbo].[FieldValues_FK]
(
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFieldValues_FK_EnforceChild]    Script Date: 08/05/2015 13:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IXFieldValues_FK_EnforceChild] ON [dbo].[FieldValues_FK]
(
	[Value] ASC
)
WHERE ([IsChild]=(1))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_Int_FieldValue]    Script Date: 08/05/2015 13:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FieldValues_Int_FieldValue] ON [dbo].[FieldValues_Int]
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_Int_Value]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_FieldValues_Int_Value] ON [dbo].[FieldValues_Int]
(
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_LongText_FieldValue]    Script Date: 08/05/2015 13:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FieldValues_LongText_FieldValue] ON [dbo].[FieldValues_LongText]
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_ShortText_FieldValue]    Script Date: 08/05/2015 13:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FieldValues_ShortText_FieldValue] ON [dbo].[FieldValues_ShortText]
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_FieldValues_ShortText_Value]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_FieldValues_ShortText_Value] ON [dbo].[FieldValues_ShortText]
(
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LayoutFields_FieldID]    Script Date: 08/05/2015 13:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LayoutFields_FieldID] ON [dbo].[LayoutFields]
(
	[LayoutID] ASC,
	[FieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LayoutFields_SortOrder]    Script Date: 08/05/2015 13:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LayoutFields_SortOrder] ON [dbo].[LayoutFields]
(
	[LayoutID] ASC,
	[SortOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MenuItems]    Script Date: 08/05/2015 13:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_MenuItems] ON [dbo].[MenuItems]
(
	[MenuID] ASC,
	[SortOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MenuItems_Page]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_MenuItems_Page] ON [dbo].[MenuItems]
(
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Menus_Parent]    Script Date: 08/05/2015 13:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Menus_Parent] ON [dbo].[Menus]
(
	[ParentMenuItemID] ASC
)
WHERE ([ParentMenuItemID] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Menus_SortOrder]    Script Date: 08/05/2015 13:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Menus_SortOrder] ON [dbo].[Menus]
(
	[SortOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pages_LayoutID]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_Pages_LayoutID] ON [dbo].[Pages]
(
	[LayoutID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pages_PageTypeID]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_Pages_PageTypeID] ON [dbo].[Pages]
(
	[PageTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PageTypes_SortOrder]    Script Date: 08/05/2015 13:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PageTypes_SortOrder] ON [dbo].[PageTypes]
(
	[SortOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Permissions_CanEdit]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_Permissions_CanEdit] ON [dbo].[Permissions]
(
	[CanEdit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Permissions_CanView]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_Permissions_CanView] ON [dbo].[Permissions]
(
	[CanView] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RightEntityTypes_EntityTypes]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_RightEntityTypes_EntityTypes] ON [dbo].[RightEntityTypes]
(
	[EntityTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RightEntityTypes_Permissions]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_RightEntityTypes_Permissions] ON [dbo].[RightEntityTypes]
(
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RightEntityTypes_Rights]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_RightEntityTypes_Rights] ON [dbo].[RightEntityTypes]
(
	[RightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RightFields_Fields]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_RightFields_Fields] ON [dbo].[RightFields]
(
	[FieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RightFields_Permissions]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_RightFields_Permissions] ON [dbo].[RightFields]
(
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RightFields_Rights]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_RightFields_Rights] ON [dbo].[RightFields]
(
	[RightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RightPages_Pages]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_RightPages_Pages] ON [dbo].[RightPages]
(
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RightPages_Rights]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_RightPages_Rights] ON [dbo].[RightPages]
(
	[RightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Rights]    Script Date: 08/05/2015 13:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Rights] ON [dbo].[Rights]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleRights_RightID]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_RoleRights_RightID] ON [dbo].[RoleRights]
(
	[RightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleRights_RoleID]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_RoleRights_RoleID] ON [dbo].[RoleRights]
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Roles]    Script Date: 08/05/2015 13:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Roles] ON [dbo].[Roles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sections_Menu]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_Sections_Menu] ON [dbo].[Sections]
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Sections_Name]    Script Date: 08/05/2015 13:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Sections_Name] ON [dbo].[Sections]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserEntities]    Script Date: 08/05/2015 13:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserEntities] ON [dbo].[UserEntities]
(
	[UserID] ASC,
	[EntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserRoles_RoleID]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_UserRoles_RoleID] ON [dbo].[UserRoles]
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserRoles_UserID]    Script Date: 08/05/2015 13:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_UserRoles_UserID] ON [dbo].[UserRoles]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DataDiagramEntityTypes] ADD  CONSTRAINT [DF_DataDiagramEntityTypes_Color]  DEFAULT ((999999)) FOR [Color]
GO
ALTER TABLE [dbo].[DataDiagramEntityTypes] ADD  CONSTRAINT [DF_DataDiagramEntityTypes_PositionX]  DEFAULT ((0)) FOR [PositionX]
GO
ALTER TABLE [dbo].[DataDiagramEntityTypes] ADD  CONSTRAINT [DF_DataDiagramEntityTypes_PositionY]  DEFAULT ((0)) FOR [PositionY]
GO
ALTER TABLE [dbo].[Fields] ADD  CONSTRAINT [DF_Fields_MinNumber]  DEFAULT ((1)) FOR [MinNumber]
GO
ALTER TABLE [dbo].[Fields] ADD  CONSTRAINT [DF_Fields_MaxNumber]  DEFAULT ((1)) FOR [MaxNumber]
GO
ALTER TABLE [dbo].[FieldValues] ADD  CONSTRAINT [DF_FieldValues_ComponentNumber]  DEFAULT ((1)) FOR [FieldNumber]
GO
ALTER TABLE [dbo].[FieldValues] ADD  CONSTRAINT [DF_FieldValues_ValueNumber]  DEFAULT ((1)) FOR [ValueNumber]
GO
ALTER TABLE [dbo].[FieldValues_FK] ADD  CONSTRAINT [DF_FieldValues_FK_IsChild]  DEFAULT ((0)) FOR [IsChild]
GO
ALTER TABLE [dbo].[DataDiagramEntityTypes]  WITH CHECK ADD  CONSTRAINT [FK_DataDiagramEntityTypes_DataDiagrams] FOREIGN KEY([DataDiagramID])
REFERENCES [dbo].[DataDiagrams] ([ID])
GO
ALTER TABLE [dbo].[DataDiagramEntityTypes] CHECK CONSTRAINT [FK_DataDiagramEntityTypes_DataDiagrams]
GO
ALTER TABLE [dbo].[DataDiagramEntityTypes]  WITH CHECK ADD  CONSTRAINT [FK_DataDiagramEntityTypes_EntityTypes] FOREIGN KEY([EntityTypeID])
REFERENCES [dbo].[EntityTypes] ([ID])
GO
ALTER TABLE [dbo].[DataDiagramEntityTypes] CHECK CONSTRAINT [FK_DataDiagramEntityTypes_EntityTypes]
GO
ALTER TABLE [dbo].[Entities]  WITH CHECK ADD  CONSTRAINT [FK_Entities_EntityTypes] FOREIGN KEY([TypeID])
REFERENCES [dbo].[EntityTypes] ([ID])
GO
ALTER TABLE [dbo].[Entities] CHECK CONSTRAINT [FK_Entities_EntityTypes]
GO
ALTER TABLE [dbo].[Fields]  WITH CHECK ADD  CONSTRAINT [FK_Fields_EntityTypes] FOREIGN KEY([EntityTypeID])
REFERENCES [dbo].[EntityTypes] ([ID])
GO
ALTER TABLE [dbo].[Fields] CHECK CONSTRAINT [FK_Fields_EntityTypes]
GO
ALTER TABLE [dbo].[Fields]  WITH CHECK ADD  CONSTRAINT [FK_Fields_FieldTypes] FOREIGN KEY([TypeID])
REFERENCES [dbo].[FieldTypes] ([ID])
GO
ALTER TABLE [dbo].[Fields] CHECK CONSTRAINT [FK_Fields_FieldTypes]
GO
ALTER TABLE [dbo].[FieldValues]  WITH CHECK ADD  CONSTRAINT [FK_FieldValues_Entities] FOREIGN KEY([EntityID])
REFERENCES [dbo].[Entities] ([ID])
GO
ALTER TABLE [dbo].[FieldValues] CHECK CONSTRAINT [FK_FieldValues_Entities]
GO
ALTER TABLE [dbo].[FieldValues]  WITH CHECK ADD  CONSTRAINT [FK_FieldValues_Fields] FOREIGN KEY([FieldID])
REFERENCES [dbo].[Fields] ([ID])
GO
ALTER TABLE [dbo].[FieldValues] CHECK CONSTRAINT [FK_FieldValues_Fields]
GO
ALTER TABLE [dbo].[FieldValues_Bit]  WITH CHECK ADD  CONSTRAINT [FK_FieldValues_Bit_FieldValues] FOREIGN KEY([FieldValueID])
REFERENCES [dbo].[FieldValues] ([ID])
GO
ALTER TABLE [dbo].[FieldValues_Bit] CHECK CONSTRAINT [FK_FieldValues_Bit_FieldValues]
GO
ALTER TABLE [dbo].[FieldValues_Date]  WITH CHECK ADD  CONSTRAINT [FK_FieldValues_Date_FieldValues] FOREIGN KEY([FieldValueID])
REFERENCES [dbo].[FieldValues] ([ID])
GO
ALTER TABLE [dbo].[FieldValues_Date] CHECK CONSTRAINT [FK_FieldValues_Date_FieldValues]
GO
ALTER TABLE [dbo].[FieldValues_Decimal]  WITH CHECK ADD  CONSTRAINT [FK_FieldValues_Decimal_FieldValues] FOREIGN KEY([FieldValueID])
REFERENCES [dbo].[FieldValues] ([ID])
GO
ALTER TABLE [dbo].[FieldValues_Decimal] CHECK CONSTRAINT [FK_FieldValues_Decimal_FieldValues]
GO
ALTER TABLE [dbo].[FieldValues_FK]  WITH CHECK ADD  CONSTRAINT [FK_FieldValues_FK_Entities] FOREIGN KEY([Value])
REFERENCES [dbo].[Entities] ([ID])
GO
ALTER TABLE [dbo].[FieldValues_FK] CHECK CONSTRAINT [FK_FieldValues_FK_Entities]
GO
ALTER TABLE [dbo].[FieldValues_FK]  WITH CHECK ADD  CONSTRAINT [FK_FieldValues_FK_FieldValues] FOREIGN KEY([FieldValueID])
REFERENCES [dbo].[FieldValues] ([ID])
GO
ALTER TABLE [dbo].[FieldValues_FK] CHECK CONSTRAINT [FK_FieldValues_FK_FieldValues]
GO
ALTER TABLE [dbo].[FieldValues_Int]  WITH CHECK ADD  CONSTRAINT [FK_FieldValues_Int_FieldValues] FOREIGN KEY([FieldValueID])
REFERENCES [dbo].[FieldValues] ([ID])
GO
ALTER TABLE [dbo].[FieldValues_Int] CHECK CONSTRAINT [FK_FieldValues_Int_FieldValues]
GO
ALTER TABLE [dbo].[FieldValues_LongText]  WITH CHECK ADD  CONSTRAINT [FK_FieldValues_LongText_FieldValues] FOREIGN KEY([FieldValueID])
REFERENCES [dbo].[FieldValues] ([ID])
GO
ALTER TABLE [dbo].[FieldValues_LongText] CHECK CONSTRAINT [FK_FieldValues_LongText_FieldValues]
GO
ALTER TABLE [dbo].[FieldValues_ShortText]  WITH CHECK ADD  CONSTRAINT [FK_FieldValues_ShortText_FieldValues] FOREIGN KEY([FieldValueID])
REFERENCES [dbo].[FieldValues] ([ID])
GO
ALTER TABLE [dbo].[FieldValues_ShortText] CHECK CONSTRAINT [FK_FieldValues_ShortText_FieldValues]
GO
ALTER TABLE [dbo].[LayoutFields]  WITH CHECK ADD  CONSTRAINT [FK_LayoutFields_Fields] FOREIGN KEY([FieldID])
REFERENCES [dbo].[Fields] ([ID])
GO
ALTER TABLE [dbo].[LayoutFields] CHECK CONSTRAINT [FK_LayoutFields_Fields]
GO
ALTER TABLE [dbo].[LayoutFields]  WITH CHECK ADD  CONSTRAINT [FK_LayoutFields_Layouts] FOREIGN KEY([LayoutID])
REFERENCES [dbo].[Layouts] ([ID])
GO
ALTER TABLE [dbo].[LayoutFields] CHECK CONSTRAINT [FK_LayoutFields_Layouts]
GO
ALTER TABLE [dbo].[Layouts]  WITH CHECK ADD  CONSTRAINT [FK_Layouts_EntityTypes] FOREIGN KEY([EntityTypeID])
REFERENCES [dbo].[EntityTypes] ([ID])
GO
ALTER TABLE [dbo].[Layouts] CHECK CONSTRAINT [FK_Layouts_EntityTypes]
GO
ALTER TABLE [dbo].[MenuItems]  WITH CHECK ADD  CONSTRAINT [FK_MenuItems_Menus] FOREIGN KEY([MenuID])
REFERENCES [dbo].[Menus] ([ID])
GO
ALTER TABLE [dbo].[MenuItems] CHECK CONSTRAINT [FK_MenuItems_Menus]
GO
ALTER TABLE [dbo].[MenuItems]  WITH CHECK ADD  CONSTRAINT [FK_MenuItems_Pages] FOREIGN KEY([PageID])
REFERENCES [dbo].[Pages] ([ID])
GO
ALTER TABLE [dbo].[MenuItems] CHECK CONSTRAINT [FK_MenuItems_Pages]
GO
ALTER TABLE [dbo].[Menus]  WITH CHECK ADD  CONSTRAINT [FK_Menus_MenuItems] FOREIGN KEY([ParentMenuItemID])
REFERENCES [dbo].[MenuItems] ([ID])
GO
ALTER TABLE [dbo].[Menus] CHECK CONSTRAINT [FK_Menus_MenuItems]
GO
ALTER TABLE [dbo].[Pages]  WITH CHECK ADD  CONSTRAINT [FK_Pages_Layouts] FOREIGN KEY([LayoutID])
REFERENCES [dbo].[Layouts] ([ID])
GO
ALTER TABLE [dbo].[Pages] CHECK CONSTRAINT [FK_Pages_Layouts]
GO
ALTER TABLE [dbo].[Pages]  WITH CHECK ADD  CONSTRAINT [FK_Pages_PageTypes] FOREIGN KEY([PageTypeID])
REFERENCES [dbo].[PageTypes] ([ID])
GO
ALTER TABLE [dbo].[Pages] CHECK CONSTRAINT [FK_Pages_PageTypes]
GO
ALTER TABLE [dbo].[Pages]  WITH CHECK ADD  CONSTRAINT [FK_Pages_Sections] FOREIGN KEY([SectionID])
REFERENCES [dbo].[Sections] ([ID])
GO
ALTER TABLE [dbo].[Pages] CHECK CONSTRAINT [FK_Pages_Sections]
GO
ALTER TABLE [dbo].[RightEntityTypes]  WITH CHECK ADD  CONSTRAINT [FK_RightEntityTypes_EntityTypes] FOREIGN KEY([EntityTypeID])
REFERENCES [dbo].[EntityTypes] ([ID])
GO
ALTER TABLE [dbo].[RightEntityTypes] CHECK CONSTRAINT [FK_RightEntityTypes_EntityTypes]
GO
ALTER TABLE [dbo].[RightEntityTypes]  WITH CHECK ADD  CONSTRAINT [FK_RightEntityTypes_Permissions] FOREIGN KEY([PermissionID])
REFERENCES [dbo].[Permissions] ([ID])
GO
ALTER TABLE [dbo].[RightEntityTypes] CHECK CONSTRAINT [FK_RightEntityTypes_Permissions]
GO
ALTER TABLE [dbo].[RightEntityTypes]  WITH CHECK ADD  CONSTRAINT [FK_RightEntityTypes_Rights] FOREIGN KEY([RightID])
REFERENCES [dbo].[Rights] ([ID])
GO
ALTER TABLE [dbo].[RightEntityTypes] CHECK CONSTRAINT [FK_RightEntityTypes_Rights]
GO
ALTER TABLE [dbo].[RightFields]  WITH CHECK ADD  CONSTRAINT [FK_RightFields_Permissions] FOREIGN KEY([PermissionID])
REFERENCES [dbo].[Permissions] ([ID])
GO
ALTER TABLE [dbo].[RightFields] CHECK CONSTRAINT [FK_RightFields_Permissions]
GO
ALTER TABLE [dbo].[RightFields]  WITH CHECK ADD  CONSTRAINT [FK_RightFields_RightFields] FOREIGN KEY([FieldID])
REFERENCES [dbo].[Fields] ([ID])
GO
ALTER TABLE [dbo].[RightFields] CHECK CONSTRAINT [FK_RightFields_RightFields]
GO
ALTER TABLE [dbo].[RightFields]  WITH CHECK ADD  CONSTRAINT [FK_RightFields_Rights] FOREIGN KEY([RightID])
REFERENCES [dbo].[Rights] ([ID])
GO
ALTER TABLE [dbo].[RightFields] CHECK CONSTRAINT [FK_RightFields_Rights]
GO
ALTER TABLE [dbo].[RightPages]  WITH CHECK ADD  CONSTRAINT [FK_RightPages_Pages] FOREIGN KEY([PageID])
REFERENCES [dbo].[Pages] ([ID])
GO
ALTER TABLE [dbo].[RightPages] CHECK CONSTRAINT [FK_RightPages_Pages]
GO
ALTER TABLE [dbo].[RightPages]  WITH CHECK ADD  CONSTRAINT [FK_RightPages_Permissions] FOREIGN KEY([PermissionID])
REFERENCES [dbo].[Permissions] ([ID])
GO
ALTER TABLE [dbo].[RightPages] CHECK CONSTRAINT [FK_RightPages_Permissions]
GO
ALTER TABLE [dbo].[RightPages]  WITH CHECK ADD  CONSTRAINT [FK_RightPages_Rights] FOREIGN KEY([PageID])
REFERENCES [dbo].[Rights] ([ID])
GO
ALTER TABLE [dbo].[RightPages] CHECK CONSTRAINT [FK_RightPages_Rights]
GO
ALTER TABLE [dbo].[RoleRights]  WITH CHECK ADD  CONSTRAINT [FK_RoleRights_Rights] FOREIGN KEY([RightID])
REFERENCES [dbo].[Rights] ([ID])
GO
ALTER TABLE [dbo].[RoleRights] CHECK CONSTRAINT [FK_RoleRights_Rights]
GO
ALTER TABLE [dbo].[RoleRights]  WITH CHECK ADD  CONSTRAINT [FK_RoleRights_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[RoleRights] CHECK CONSTRAINT [FK_RoleRights_Roles]
GO
ALTER TABLE [dbo].[Sections]  WITH CHECK ADD  CONSTRAINT [FK_Sections_Menus] FOREIGN KEY([MenuID])
REFERENCES [dbo].[Menus] ([ID])
GO
ALTER TABLE [dbo].[Sections] CHECK CONSTRAINT [FK_Sections_Menus]
GO
ALTER TABLE [dbo].[UserEntities]  WITH CHECK ADD  CONSTRAINT [FK_UserEntities_Entities] FOREIGN KEY([EntityID])
REFERENCES [dbo].[Entities] ([ID])
GO
ALTER TABLE [dbo].[UserEntities] CHECK CONSTRAINT [FK_UserEntities_Entities]
GO
ALTER TABLE [dbo].[UserEntities]  WITH CHECK ADD  CONSTRAINT [FK_UserEntities_Permissions] FOREIGN KEY([PermissionID])
REFERENCES [dbo].[Permissions] ([ID])
GO
ALTER TABLE [dbo].[UserEntities] CHECK CONSTRAINT [FK_UserEntities_Permissions]
GO
ALTER TABLE [dbo].[UserEntities]  WITH CHECK ADD  CONSTRAINT [FK_UserEntities_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UserEntities] CHECK CONSTRAINT [FK_UserEntities_Users]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "EntityTypes"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 101
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EntityTypeComponents"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 175
               Right = 418
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Components"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 102
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Fields"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 204
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FieldTypes"
            Begin Extent = 
               Top = 6
               Left = 870
               Bottom = 181
               Right = 1049
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'EntityTypeFieldsView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'EntityTypeFieldsView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'EntityTypeFieldsView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Fields"
            Begin Extent = 
               Top = 5
               Left = 226
               Bottom = 208
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FieldValues"
            Begin Extent = 
               Top = 7
               Left = 473
               Bottom = 184
               Right = 670
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FieldTypes"
            Begin Extent = 
               Top = 9
               Left = 1
               Bottom = 158
               Right = 180
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FieldValues_Int"
            Begin Extent = 
               Top = 591
               Left = 980
               Bottom = 686
               Right = 1150
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FieldValues_Bit"
            Begin Extent = 
               Top = 495
               Left = 979
               Bottom = 590
               Right = 1149
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FieldValues_ShortText"
            Begin Extent = 
               Top = 209
               Left = 979
               Bottom = 304
               Right = 1149
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FieldValues_LongText"
            Begin Extent = 
               Top = 304
               Left = 979
               Bottom = 399
               Right = 11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FieldValuesView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'49
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FieldValues_Date"
            Begin Extent = 
               Top = 112
               Left = 979
               Bottom = 207
               Right = 1149
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FieldValues_Decimal"
            Begin Extent = 
               Top = 16
               Left = 979
               Bottom = 111
               Right = 1149
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FieldValues_FK"
            Begin Extent = 
               Top = 400
               Left = 979
               Bottom = 495
               Right = 1149
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 15
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1815
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FieldValuesView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FieldValuesView'
GO
USE [master]
GO
ALTER DATABASE [Aplomb] SET  READ_WRITE 
GO

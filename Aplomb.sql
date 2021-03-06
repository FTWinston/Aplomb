USE [master]
GO
/****** Object:  Database [Aplomb]    Script Date: 22/12/2015 15:49:55 ******/
CREATE DATABASE [Aplomb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Aplomb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Aplomb.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Aplomb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Aplomb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
ALTER DATABASE [Aplomb] SET ANSI_NULLS ON 
GO
ALTER DATABASE [Aplomb] SET ANSI_PADDING ON
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
ALTER DATABASE [Aplomb] SET QUOTED_IDENTIFIER ON 
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
/****** Object:  Schema [accounts]    Script Date: 22/12/2015 15:49:55 ******/
CREATE SCHEMA [accounts]
GO
/****** Object:  Schema [data]    Script Date: 22/12/2015 15:49:55 ******/
CREATE SCHEMA [data]
GO
/****** Object:  Schema [model]    Script Date: 22/12/2015 15:49:55 ******/
CREATE SCHEMA [model]
GO
/****** Object:  Schema [security]    Script Date: 22/12/2015 15:49:55 ******/
CREATE SCHEMA [security]
GO
/****** Object:  Schema [site]    Script Date: 22/12/2015 15:49:55 ******/
CREATE SCHEMA [site]
GO
/****** Object:  Table [accounts].[UserEntities]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [accounts].[UserEntities](
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
/****** Object:  Table [accounts].[UserRoles]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [accounts].[UserRoles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [accounts].[Users]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [accounts].[Users](
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
/****** Object:  Table [data].[Entities]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [data].[Entities](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_Entities] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [data].[FieldValues]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [data].[FieldValues](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EntityID] [int] NOT NULL,
	[FieldID] [int] NOT NULL,
	[ValueNumber] [int] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_FieldValues] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [data].[FieldValues_Bit]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [data].[FieldValues_Bit](
	[FieldValueID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [bit] NOT NULL,
 CONSTRAINT [PK_FieldValues_Bit] PRIMARY KEY CLUSTERED 
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [data].[FieldValues_Date]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [data].[FieldValues_Date](
	[FieldValueID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [datetime] NOT NULL,
 CONSTRAINT [PK_FieldValues_Date] PRIMARY KEY CLUSTERED 
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [data].[FieldValues_Decimal]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [data].[FieldValues_Decimal](
	[FieldValueID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_FieldValues_Decimal] PRIMARY KEY CLUSTERED 
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [data].[FieldValues_FK]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [data].[FieldValues_FK](
	[FieldValueID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [int] NOT NULL,
	[IsChild] [bit] NOT NULL,
 CONSTRAINT [PK_FieldValues_FK] PRIMARY KEY CLUSTERED 
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [data].[FieldValues_Int]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [data].[FieldValues_Int](
	[FieldValueID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [int] NOT NULL,
 CONSTRAINT [PK_FieldValues_Int] PRIMARY KEY CLUSTERED 
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [data].[FieldValues_FreeText]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [data].[FieldValues_FreeText](
	[FieldValueID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_FieldValues_FreeText] PRIMARY KEY CLUSTERED 
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [data].[FieldValues_Text]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [data].[FieldValues_Text](
	[FieldValueID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_FieldValues_Text] PRIMARY KEY CLUSTERED 
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [model].[DataDiagramEntityTypes]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [model].[DataDiagramEntityTypes](
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
/****** Object:  Table [model].[DataDiagrams]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [model].[DataDiagrams](
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
/****** Object:  Table [model].[EntityTypes]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [model].[EntityTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EntityTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [model].[Fields]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [model].[Fields](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EntityTypeID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[Mandatory] [bit] NOT NULL,
	[MinNumber] [int] NOT NULL,
	[MaxNumber] [int] NULL,
	[ForeignKeyEntityTypeID] [int] NULL,
	[NumericDefault] [int] NULL,
	[MinValue] [int] NULL,
	[MaxValue] [int] NULL,
	[TextDefault] [nvarchar](255) NULL,
	[TextRegex] [nvarchar](255) NULL
	
 CONSTRAINT [PK_Fields] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [model].[FieldTypes]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [model].[FieldTypes](
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
/****** Object:  Table [security].[Permissions]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [security].[Permissions](
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
/****** Object:  Table [security].[RightEntityTypes]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [security].[RightEntityTypes](
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
/****** Object:  Table [security].[RightFields]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [security].[RightFields](
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
/****** Object:  Table [security].[RightPages]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [security].[RightPages](
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
/****** Object:  Table [security].[Rights]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [security].[Rights](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Rights] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [security].[RoleRights]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [security].[RoleRights](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[RightID] [int] NOT NULL,
 CONSTRAINT [PK_RoleRights] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [security].[Roles]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [security].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [site].[LayoutFields]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [site].[LayoutFields](
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
/****** Object:  Table [site].[Layouts]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [site].[Layouts](
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
/****** Object:  Table [site].[MenuItems]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [site].[MenuItems](
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
/****** Object:  Table [site].[Menus]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [site].[Menus](
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
/****** Object:  Table [site].[Pages]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [site].[Pages](
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
/****** Object:  Table [site].[PageTypes]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [site].[PageTypes](
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
/****** Object:  Table [site].[Sections]    Script Date: 22/12/2015 15:49:55 ******/
CREATE TABLE [site].[Sections](
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
USE [Aplomb]
GO

/****** Object:  View [data].[CurrentFieldValues]    Script Date: 4/9/2016 12:03:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  View [data].[CurrentFieldValues]    Script Date: 09/04/2016 12:04:55 ******/

CREATE VIEW [data].[CurrentFieldValues]
AS
SELECT ID, EntityID, FieldID, ValueNumber
FROM (SELECT ID, EntityID, FieldID, ValueNumber, Deleted,
    RANK() OVER (PARTITION BY EntityID, FieldID, ValueNumber ORDER BY Timestamp DESC) num
    FROM data.FieldValues
) fv WHERE num = 1 and Deleted = 0

/* an alternative approach for this same view
SELECT fv.ID, fv.EntityID, fv.FieldID, fv.ValueNumber
FROM data.FieldValues fv
INNER JOIN
    (SELECT EntityID, FieldID, ValueNumber, MAX(Timestamp) AS Timestamp
    FROM data.FieldValues 
    GROUP BY EntityID, FieldID, ValueNumber) fvMax
ON fv.EntityID = fvMax.EntityID and fv.FieldID= fvMax.FieldID and fv.ValueNumber = fvMax.ValueNumber
AND fv.Timestamp = fvMax.Timestamp
where Deleted = 0
*/

GO

/****** Object:  View [data].[FieldValuesView]    Script Date: 22/12/2015 15:49:55 ******/

CREATE VIEW [data].[FieldValuesView]
AS
SELECT        data.FieldValues.ID, data.FieldValues.EntityID, data.FieldValues.FieldID, 
                         data.FieldValues.ValueNumber, model.Fields.Name AS FieldName, model.FieldTypes.Name AS FieldType, data.FieldValues_Bit.Value AS BitValue, 
                         data.FieldValues_Int.Value AS IntValue, data.FieldValues_Decimal.Value AS DecimalValue, data.FieldValues_Date.Value AS DateValue, 
                         data.FieldValues_Text.Value AS TextValue, data.FieldValues_FreeText.Value AS FreeTextValue, data.FieldValues_FK.Value AS FKValue
FROM            model.Fields INNER JOIN
                         data.FieldValues ON model.Fields.ID = data.FieldValues.FieldID INNER JOIN
                         model.FieldTypes ON model.Fields.TypeID = model.FieldTypes.ID LEFT OUTER JOIN
                         data.FieldValues_FK ON data.FieldValues.ID = data.FieldValues_FK.FieldValueID LEFT OUTER JOIN
                         data.FieldValues_Int ON data.FieldValues.ID = data.FieldValues_Int.FieldValueID LEFT OUTER JOIN
                         data.FieldValues_Bit ON data.FieldValues.ID = data.FieldValues_Bit.FieldValueID LEFT OUTER JOIN
                         data.FieldValues_Text ON data.FieldValues.ID = data.FieldValues_Text.FieldValueID LEFT OUTER JOIN
                         data.FieldValues_FreeText ON data.FieldValues.ID = data.FieldValues_FreeText.FieldValueID LEFT OUTER JOIN
                         data.FieldValues_Date ON data.FieldValues.ID = data.FieldValues_Date.FieldValueID LEFT OUTER JOIN
                         data.FieldValues_Decimal ON data.FieldValues.ID = data.FieldValues_Decimal.FieldValueID


GO
/****** Object:  Index [IX_UserEntities]    Script Date: 22/12/2015 15:49:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserEntities] ON [accounts].[UserEntities]
(
	[UserID] ASC,
	[EntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserRoles_RoleID]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_UserRoles_RoleID] ON [accounts].[UserRoles]
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserRoles_UserID]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_UserRoles_UserID] ON [accounts].[UserRoles]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Entities_Type]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_Entities_Type] ON [data].[Entities]
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Entities_CreatedOn]    Script Date: 09/04/2016 16:26:55 ******/
CREATE NONCLUSTERED INDEX IX_Entities_CreatedOn ON data.Entities
	(
	CreatedOn
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Entities_Deleted]    Script Date: 09/04/2016 16:03:55 ******/
CREATE NONCLUSTERED INDEX [IX_Entities_DeletedOn] ON data.Entities
	(
	DeletedOn
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_EntityID_ValueNumber_TimeStamp]    Script Date: 09/04/2016 11:44:55 ******/
CREATE NONCLUSTERED INDEX [IX_FieldValues_EntityID_ValueNumber_TimeStamp] ON data.FieldValues
	(
	EntityID,
	ValueNumber,
	TimeStamp
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [IX_FieldValues_FieldID]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_FieldValues_FieldID] ON [data].[FieldValues]
(
	[FieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_Deleted]    Script Date: 09/04/2016 11:45:55 ******/
CREATE NONCLUSTERED INDEX [IX_FieldValues_Deleted] ON data.FieldValues
	(
	Deleted
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_Bit_FieldValue]    Script Date: 22/12/2015 15:49:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FieldValues_Bit_FieldValue] ON [data].[FieldValues_Bit]
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_Bit_Value]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_FieldValues_Bit_Value] ON [data].[FieldValues_Bit]
(
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_Date_FieldValue]    Script Date: 22/12/2015 15:49:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FieldValues_Date_FieldValue] ON [data].[FieldValues_Date]
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_Date_Value]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_FieldValues_Date_Value] ON [data].[FieldValues_Date]
(
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_Decimal_FieldValue]    Script Date: 22/12/2015 15:49:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FieldValues_Decimal_FieldValue] ON [data].[FieldValues_Decimal]
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_Decimal_Value]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_FieldValues_Decimal_Value] ON [data].[FieldValues_Decimal]
(
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_FK_FieldValue]    Script Date: 22/12/2015 15:49:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FieldValues_FK_FieldValue] ON [data].[FieldValues_FK]
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_FK_Value]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_FieldValues_FK_Value] ON [data].[FieldValues_FK]
(
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFieldValues_FK_EnforceChild]    Script Date: 22/12/2015 15:49:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IXFieldValues_FK_EnforceChild] ON [data].[FieldValues_FK]
(
	[Value] ASC
)
WHERE ([IsChild]=(1))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_Int_FieldValue]    Script Date: 22/12/2015 15:49:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FieldValues_Int_FieldValue] ON [data].[FieldValues_Int]
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_Int_Value]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_FieldValues_Int_Value] ON [data].[FieldValues_Int]
(
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_FreeText_FieldValue]    Script Date: 22/12/2015 15:49:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FieldValues_FreeText_FieldValue] ON [data].[FieldValues_FreeText]
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldValues_Text_FieldValue]    Script Date: 22/12/2015 15:49:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FieldValues_Text_FieldValue] ON [data].[FieldValues_Text]
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [IX_FieldValues_Text_Value]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_FieldValues_Text_Value] ON [data].[FieldValues_Text]
(
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DataDiagramEntityTypes_DataDiagramID]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_DataDiagramEntityTypes_DataDiagramID] ON [model].[DataDiagramEntityTypes]
(
	[DataDiagramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DataDiagramEntityTypes_EntityTypeID]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_DataDiagramEntityTypes_EntityTypeID] ON [model].[DataDiagramEntityTypes]
(
	[EntityTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DataDiagrams_SortOrder]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_DataDiagrams_SortOrder] ON [model].[DataDiagrams]
(
	[SortOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [IX_EntityTypes]    Script Date: 22/12/2015 15:49:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_EntityTypes] ON [model].[EntityTypes]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [IX_Fields_Name]    Script Date: 22/12/2015 15:49:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Fields_Name] ON [model].[Fields]
(
	[EntityTypeID] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Fields_Order]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_Fields_Order] ON [model].[Fields]
(
	[EntityTypeID] ASC,
	[SortOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Fields_Type]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_Fields_Type] ON [model].[Fields]
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Fields_EntityType]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_Fields_EntityType] ON [model].[Fields]
(
	[EntityTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Fields_EntityType]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_Fields_ForeignEntityType] ON [model].[Fields]
(
	[ForeignKeyEntityTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldTypes_Name]    Script Date: 22/12/2015 15:49:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FieldTypes_Name] ON [model].[FieldTypes]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FieldTypes_SortOrder]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_FieldTypes_SortOrder] ON [model].[FieldTypes]
(
	[SortOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Permissions_CanEdit]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_Permissions_CanEdit] ON [security].[Permissions]
(
	[CanEdit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Permissions_CanView]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_Permissions_CanView] ON [security].[Permissions]
(
	[CanView] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RightEntityTypes_EntityTypes]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_RightEntityTypes_EntityTypes] ON [security].[RightEntityTypes]
(
	[EntityTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RightEntityTypes_Permissions]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_RightEntityTypes_Permissions] ON [security].[RightEntityTypes]
(
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RightEntityTypes_Rights]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_RightEntityTypes_Rights] ON [security].[RightEntityTypes]
(
	[RightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RightFields_Fields]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_RightFields_Fields] ON [security].[RightFields]
(
	[FieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RightFields_Permissions]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_RightFields_Permissions] ON [security].[RightFields]
(
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RightFields_Rights]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_RightFields_Rights] ON [security].[RightFields]
(
	[RightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RightPages_Pages]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_RightPages_Pages] ON [security].[RightPages]
(
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RightPages_Rights]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_RightPages_Rights] ON [security].[RightPages]
(
	[RightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [IX_Rights]    Script Date: 22/12/2015 15:49:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Rights] ON [security].[Rights]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleRights_RightID]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_RoleRights_RightID] ON [security].[RoleRights]
(
	[RightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleRights_RoleID]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_RoleRights_RoleID] ON [security].[RoleRights]
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [IX_Roles]    Script Date: 22/12/2015 15:49:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Roles] ON [security].[Roles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LayoutFields_FieldID]    Script Date: 22/12/2015 15:49:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LayoutFields_FieldID] ON [site].[LayoutFields]
(
	[LayoutID] ASC,
	[FieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LayoutFields_SortOrder]    Script Date: 22/12/2015 15:49:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LayoutFields_SortOrder] ON [site].[LayoutFields]
(
	[LayoutID] ASC,
	[SortOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MenuItems]    Script Date: 22/12/2015 15:49:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_MenuItems] ON [site].[MenuItems]
(
	[MenuID] ASC,
	[SortOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MenuItems_Page]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_MenuItems_Page] ON [site].[MenuItems]
(
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Menus_Parent]    Script Date: 22/12/2015 15:49:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Menus_Parent] ON [site].[Menus]
(
	[ParentMenuItemID] ASC
)
WHERE ([ParentMenuItemID] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Menus_SortOrder]    Script Date: 22/12/2015 15:49:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Menus_SortOrder] ON [site].[Menus]
(
	[SortOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pages_LayoutID]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_Pages_LayoutID] ON [site].[Pages]
(
	[LayoutID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pages_PageTypeID]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_Pages_PageTypeID] ON [site].[Pages]
(
	[PageTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PageTypes_SortOrder]    Script Date: 22/12/2015 15:49:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PageTypes_SortOrder] ON [site].[PageTypes]
(
	[SortOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sections_Menu]    Script Date: 22/12/2015 15:49:55 ******/
CREATE NONCLUSTERED INDEX [IX_Sections_Menu] ON [site].[Sections]
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [IX_Sections_Name]    Script Date: 22/12/2015 15:49:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Sections_Name] ON [site].[Sections]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [data].[Entities] ADD  CONSTRAINT [DF_Entities_CreatedOn]  DEFAULT ((current_timestamp)) FOR [CreatedOn]
GO
ALTER TABLE [data].[Entities] ADD  CONSTRAINT [DF_Entities_DeletedOn]  DEFAULT ((null)) FOR [DeletedOn]
GO
ALTER TABLE [data].[FieldValues] ADD  CONSTRAINT [DF_FieldValues_ValueNumber]  DEFAULT ((1)) FOR [ValueNumber]
GO
ALTER TABLE [data].[FieldValues] ADD  CONSTRAINT [DF_FieldValues_TimeStamp]  DEFAULT ((current_timestamp)) FOR [TimeStamp]
GO
ALTER TABLE [data].[FieldValues] ADD  CONSTRAINT [DF_FieldValues_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [data].[FieldValues_FK] ADD  CONSTRAINT [DF_FieldValues_FK_IsChild]  DEFAULT ((0)) FOR [IsChild]
GO
ALTER TABLE [model].[DataDiagramEntityTypes] ADD  CONSTRAINT [DF_DataDiagramEntityTypes_Color]  DEFAULT ((999999)) FOR [Color]
GO
ALTER TABLE [model].[DataDiagramEntityTypes] ADD  CONSTRAINT [DF_DataDiagramEntityTypes_PositionX]  DEFAULT ((0)) FOR [PositionX]
GO
ALTER TABLE [model].[DataDiagramEntityTypes] ADD  CONSTRAINT [DF_DataDiagramEntityTypes_PositionY]  DEFAULT ((0)) FOR [PositionY]
GO
ALTER TABLE [model].[Fields] ADD  CONSTRAINT [DF_Fields_Mandatory]  DEFAULT ((1)) FOR [Mandatory]
GO
ALTER TABLE [model].[Fields] ADD  CONSTRAINT [DF_Fields_MinNumber]  DEFAULT ((1)) FOR [MinNumber]
GO
ALTER TABLE [model].[Fields] ADD  CONSTRAINT [DF_Fields_MaxNumber]  DEFAULT ((1)) FOR [MaxNumber]
GO
ALTER TABLE [model].[Fields] ADD  CONSTRAINT [DF_Fields_ForeignKeyEntityTypeID]  DEFAULT ((NULL)) FOR [ForeignKeyEntityTypeID]
GO
ALTER TABLE [model].[Fields] ADD  CONSTRAINT [DF_Fields_NumericDefault]  DEFAULT ((NULL)) FOR [NumericDefault]
GO
ALTER TABLE [model].[Fields] ADD  CONSTRAINT [DF_Fields_MinValue]  DEFAULT ((NULL)) FOR [MinValue]
GO
ALTER TABLE [model].[Fields] ADD  CONSTRAINT [DF_Fields_MaxValue]  DEFAULT ((NULL)) FOR [MaxValue]
GO
ALTER TABLE [model].[Fields] ADD  CONSTRAINT [DF_Fields_TextDefault]  DEFAULT ((NULL)) FOR [TextDefault]
GO
ALTER TABLE [model].[Fields] ADD  CONSTRAINT [DF_Fields_TextRegex]  DEFAULT ((NULL)) FOR [TextRegex]
GO
ALTER TABLE [accounts].[UserEntities]  WITH CHECK ADD  CONSTRAINT [FK_UserEntities_Entities] FOREIGN KEY([EntityID])
REFERENCES [data].[Entities] ([ID])
GO
ALTER TABLE [accounts].[UserEntities] CHECK CONSTRAINT [FK_UserEntities_Entities]
GO
ALTER TABLE [accounts].[UserEntities]  WITH CHECK ADD  CONSTRAINT [FK_UserEntities_Permissions] FOREIGN KEY([PermissionID])
REFERENCES [security].[Permissions] ([ID])
GO
ALTER TABLE [accounts].[UserEntities] CHECK CONSTRAINT [FK_UserEntities_Permissions]
GO
ALTER TABLE [accounts].[UserEntities]  WITH CHECK ADD  CONSTRAINT [FK_UserEntities_Users] FOREIGN KEY([UserID])
REFERENCES [accounts].[Users] ([ID])
GO
ALTER TABLE [accounts].[UserEntities] CHECK CONSTRAINT [FK_UserEntities_Users]
GO
ALTER TABLE [accounts].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleID])
REFERENCES [security].[Roles] ([ID])
GO
ALTER TABLE [accounts].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [accounts].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([UserID])
REFERENCES [accounts].[Users] ([ID])
GO
ALTER TABLE [accounts].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
ALTER TABLE [data].[Entities]  WITH CHECK ADD  CONSTRAINT [FK_Entities_EntityTypes] FOREIGN KEY([TypeID])
REFERENCES [model].[EntityTypes] ([ID])
GO
ALTER TABLE [data].[Entities] CHECK CONSTRAINT [FK_Entities_EntityTypes]
GO
ALTER TABLE [data].[FieldValues]  WITH CHECK ADD  CONSTRAINT [FK_FieldValues_Entities] FOREIGN KEY([EntityID])
REFERENCES [data].[Entities] ([ID])
GO
ALTER TABLE [data].[FieldValues] CHECK CONSTRAINT [FK_FieldValues_Entities]
GO
ALTER TABLE [data].[FieldValues]  WITH CHECK ADD  CONSTRAINT [FK_FieldValues_Fields] FOREIGN KEY([FieldID])
REFERENCES [model].[Fields] ([ID])
GO
ALTER TABLE [data].[FieldValues] CHECK CONSTRAINT [FK_FieldValues_Fields]
GO
ALTER TABLE [data].[FieldValues_Bit]  WITH CHECK ADD  CONSTRAINT [FK_FieldValues_Bit_FieldValues] FOREIGN KEY([FieldValueID])
REFERENCES [data].[FieldValues] ([ID])
GO
ALTER TABLE [data].[FieldValues_Bit] CHECK CONSTRAINT [FK_FieldValues_Bit_FieldValues]
GO
ALTER TABLE [data].[FieldValues_Date]  WITH CHECK ADD  CONSTRAINT [FK_FieldValues_Date_FieldValues] FOREIGN KEY([FieldValueID])
REFERENCES [data].[FieldValues] ([ID])
GO
ALTER TABLE [data].[FieldValues_Date] CHECK CONSTRAINT [FK_FieldValues_Date_FieldValues]
GO
ALTER TABLE [data].[FieldValues_Decimal]  WITH CHECK ADD  CONSTRAINT [FK_FieldValues_Decimal_FieldValues] FOREIGN KEY([FieldValueID])
REFERENCES [data].[FieldValues] ([ID])
GO
ALTER TABLE [data].[FieldValues_Decimal] CHECK CONSTRAINT [FK_FieldValues_Decimal_FieldValues]
GO
ALTER TABLE [data].[FieldValues_FK]  WITH CHECK ADD  CONSTRAINT [FK_FieldValues_FK_Entities] FOREIGN KEY([Value])
REFERENCES [data].[Entities] ([ID])
GO
ALTER TABLE [data].[FieldValues_FK] CHECK CONSTRAINT [FK_FieldValues_FK_Entities]
GO
ALTER TABLE [data].[FieldValues_FK]  WITH CHECK ADD  CONSTRAINT [FK_FieldValues_FK_FieldValues] FOREIGN KEY([FieldValueID])
REFERENCES [data].[FieldValues] ([ID])
GO
ALTER TABLE [data].[FieldValues_FK] CHECK CONSTRAINT [FK_FieldValues_FK_FieldValues]
GO
ALTER TABLE [data].[FieldValues_Int]  WITH CHECK ADD  CONSTRAINT [FK_FieldValues_Int_FieldValues] FOREIGN KEY([FieldValueID])
REFERENCES [data].[FieldValues] ([ID])
GO
ALTER TABLE [data].[FieldValues_Int] CHECK CONSTRAINT [FK_FieldValues_Int_FieldValues]
GO
ALTER TABLE [data].[FieldValues_FreeText]  WITH CHECK ADD  CONSTRAINT [FK_FieldValues_FreeText_FieldValues] FOREIGN KEY([FieldValueID])
REFERENCES [data].[FieldValues] ([ID])
GO
ALTER TABLE [data].[FieldValues_FreeText] CHECK CONSTRAINT [FK_FieldValues_FreeText_FieldValues]
GO
ALTER TABLE [data].[FieldValues_Text]  WITH CHECK ADD  CONSTRAINT [FK_FieldValues_Text_FieldValues] FOREIGN KEY([FieldValueID])
REFERENCES [data].[FieldValues] ([ID])
GO
ALTER TABLE [data].[FieldValues_Text] CHECK CONSTRAINT [FK_FieldValues_Text_FieldValues]
GO
ALTER TABLE [model].[DataDiagramEntityTypes]  WITH CHECK ADD  CONSTRAINT [FK_DataDiagramEntityTypes_DataDiagrams] FOREIGN KEY([DataDiagramID])
REFERENCES [model].[DataDiagrams] ([ID])
GO
ALTER TABLE [model].[DataDiagramEntityTypes] CHECK CONSTRAINT [FK_DataDiagramEntityTypes_DataDiagrams]
GO
ALTER TABLE [model].[DataDiagramEntityTypes]  WITH CHECK ADD  CONSTRAINT [FK_DataDiagramEntityTypes_EntityTypes] FOREIGN KEY([EntityTypeID])
REFERENCES [model].[EntityTypes] ([ID])
GO
ALTER TABLE [model].[DataDiagramEntityTypes] CHECK CONSTRAINT [FK_DataDiagramEntityTypes_EntityTypes]
GO
ALTER TABLE [model].[Fields]  WITH CHECK ADD  CONSTRAINT [FK_Fields_EntityTypes] FOREIGN KEY([EntityTypeID])
REFERENCES [model].[EntityTypes] ([ID])
GO
ALTER TABLE [model].[Fields] CHECK CONSTRAINT [FK_Fields_EntityTypes]
GO
ALTER TABLE [model].[Fields]  WITH CHECK ADD  CONSTRAINT [FK_Fields_ForeignEntityTypes] FOREIGN KEY([ForeignKeyEntityTypeID])
REFERENCES [model].[EntityTypes] ([ID])
GO
ALTER TABLE [model].[Fields] CHECK CONSTRAINT [FK_Fields_ForeignEntityTypes]
GO
ALTER TABLE [model].[Fields]  WITH CHECK ADD  CONSTRAINT [FK_Fields_FieldTypes] FOREIGN KEY([TypeID])
REFERENCES [model].[FieldTypes] ([ID])
GO
ALTER TABLE [model].[Fields] CHECK CONSTRAINT [FK_Fields_FieldTypes]
GO
ALTER TABLE [security].[RightEntityTypes]  WITH CHECK ADD  CONSTRAINT [FK_RightEntityTypes_EntityTypes] FOREIGN KEY([EntityTypeID])
REFERENCES [model].[EntityTypes] ([ID])
GO
ALTER TABLE [security].[RightEntityTypes] CHECK CONSTRAINT [FK_RightEntityTypes_EntityTypes]
GO
ALTER TABLE [security].[RightEntityTypes]  WITH CHECK ADD  CONSTRAINT [FK_RightEntityTypes_Permissions] FOREIGN KEY([PermissionID])
REFERENCES [security].[Permissions] ([ID])
GO
ALTER TABLE [security].[RightEntityTypes] CHECK CONSTRAINT [FK_RightEntityTypes_Permissions]
GO
ALTER TABLE [security].[RightEntityTypes]  WITH CHECK ADD  CONSTRAINT [FK_RightEntityTypes_Rights] FOREIGN KEY([RightID])
REFERENCES [security].[Rights] ([ID])
GO
ALTER TABLE [security].[RightEntityTypes] CHECK CONSTRAINT [FK_RightEntityTypes_Rights]
GO
ALTER TABLE [security].[RightFields]  WITH CHECK ADD  CONSTRAINT [FK_RightFields_Permissions] FOREIGN KEY([PermissionID])
REFERENCES [security].[Permissions] ([ID])
GO
ALTER TABLE [security].[RightFields] CHECK CONSTRAINT [FK_RightFields_Permissions]
GO
ALTER TABLE [security].[RightFields]  WITH CHECK ADD  CONSTRAINT [FK_RightFields_RightFields] FOREIGN KEY([FieldID])
REFERENCES [model].[Fields] ([ID])
GO
ALTER TABLE [security].[RightFields] CHECK CONSTRAINT [FK_RightFields_RightFields]
GO
ALTER TABLE [security].[RightFields]  WITH CHECK ADD  CONSTRAINT [FK_RightFields_Rights] FOREIGN KEY([RightID])
REFERENCES [security].[Rights] ([ID])
GO
ALTER TABLE [security].[RightFields] CHECK CONSTRAINT [FK_RightFields_Rights]
GO
ALTER TABLE [security].[RightPages]  WITH CHECK ADD  CONSTRAINT [FK_RightPages_Pages] FOREIGN KEY([PageID])
REFERENCES [site].[Pages] ([ID])
GO
ALTER TABLE [security].[RightPages] CHECK CONSTRAINT [FK_RightPages_Pages]
GO
ALTER TABLE [security].[RightPages]  WITH CHECK ADD  CONSTRAINT [FK_RightPages_Permissions] FOREIGN KEY([PermissionID])
REFERENCES [security].[Permissions] ([ID])
GO
ALTER TABLE [security].[RightPages] CHECK CONSTRAINT [FK_RightPages_Permissions]
GO
ALTER TABLE [security].[RightPages]  WITH CHECK ADD  CONSTRAINT [FK_RightPages_Rights] FOREIGN KEY([PageID])
REFERENCES [security].[Rights] ([ID])
GO
ALTER TABLE [security].[RightPages] CHECK CONSTRAINT [FK_RightPages_Rights]
GO
ALTER TABLE [security].[RoleRights]  WITH CHECK ADD  CONSTRAINT [FK_RoleRights_Rights] FOREIGN KEY([RightID])
REFERENCES [security].[Rights] ([ID])
GO
ALTER TABLE [security].[RoleRights] CHECK CONSTRAINT [FK_RoleRights_Rights]
GO
ALTER TABLE [security].[RoleRights]  WITH CHECK ADD  CONSTRAINT [FK_RoleRights_Roles] FOREIGN KEY([RoleID])
REFERENCES [security].[Roles] ([ID])
GO
ALTER TABLE [security].[RoleRights] CHECK CONSTRAINT [FK_RoleRights_Roles]
GO
ALTER TABLE [site].[LayoutFields]  WITH CHECK ADD  CONSTRAINT [FK_LayoutFields_Fields] FOREIGN KEY([FieldID])
REFERENCES [model].[Fields] ([ID])
GO
ALTER TABLE [site].[LayoutFields] CHECK CONSTRAINT [FK_LayoutFields_Fields]
GO
ALTER TABLE [site].[LayoutFields]  WITH CHECK ADD  CONSTRAINT [FK_LayoutFields_Layouts] FOREIGN KEY([LayoutID])
REFERENCES [site].[Layouts] ([ID])
GO
ALTER TABLE [site].[LayoutFields] CHECK CONSTRAINT [FK_LayoutFields_Layouts]
GO
ALTER TABLE [site].[Layouts]  WITH CHECK ADD  CONSTRAINT [FK_Layouts_EntityTypes] FOREIGN KEY([EntityTypeID])
REFERENCES [model].[EntityTypes] ([ID])
GO
ALTER TABLE [site].[Layouts] CHECK CONSTRAINT [FK_Layouts_EntityTypes]
GO
ALTER TABLE [site].[MenuItems]  WITH CHECK ADD  CONSTRAINT [FK_MenuItems_Menus] FOREIGN KEY([MenuID])
REFERENCES [site].[Menus] ([ID])
GO
ALTER TABLE [site].[MenuItems] CHECK CONSTRAINT [FK_MenuItems_Menus]
GO
ALTER TABLE [site].[MenuItems]  WITH CHECK ADD  CONSTRAINT [FK_MenuItems_Pages] FOREIGN KEY([PageID])
REFERENCES [site].[Pages] ([ID])
GO
ALTER TABLE [site].[MenuItems] CHECK CONSTRAINT [FK_MenuItems_Pages]
GO
ALTER TABLE [site].[Menus]  WITH CHECK ADD  CONSTRAINT [FK_Menus_MenuItems] FOREIGN KEY([ParentMenuItemID])
REFERENCES [site].[MenuItems] ([ID])
GO
ALTER TABLE [site].[Menus] CHECK CONSTRAINT [FK_Menus_MenuItems]
GO
ALTER TABLE [site].[Pages]  WITH CHECK ADD  CONSTRAINT [FK_Pages_Layouts] FOREIGN KEY([LayoutID])
REFERENCES [site].[Layouts] ([ID])
GO
ALTER TABLE [site].[Pages] CHECK CONSTRAINT [FK_Pages_Layouts]
GO
ALTER TABLE [site].[Pages]  WITH CHECK ADD  CONSTRAINT [FK_Pages_PageTypes] FOREIGN KEY([PageTypeID])
REFERENCES [site].[PageTypes] ([ID])
GO
ALTER TABLE [site].[Pages] CHECK CONSTRAINT [FK_Pages_PageTypes]
GO
ALTER TABLE [site].[Pages]  WITH CHECK ADD  CONSTRAINT [FK_Pages_Sections] FOREIGN KEY([SectionID])
REFERENCES [site].[Sections] ([ID])
GO
ALTER TABLE [site].[Pages] CHECK CONSTRAINT [FK_Pages_Sections]
GO
ALTER TABLE [site].[Sections]  WITH CHECK ADD  CONSTRAINT [FK_Sections_Menus] FOREIGN KEY([MenuID])
REFERENCES [site].[Menus] ([ID])
GO
ALTER TABLE [site].[Sections] CHECK CONSTRAINT [FK_Sections_Menus]
GO
USE [master]
GO
ALTER DATABASE [Aplomb] SET  READ_WRITE 
GO
use [Aplomb]
GO

insert into site.PageTypes select 'Edit', 1
insert into site.PageTypes select 'Search', 2
insert into site.PageTypes select 'Static', 3

insert into model.FieldTypes select 'Boolean', 'FieldValues_Bit', 1, null
insert into model.FieldTypes select 'Date', 'FieldValues_Date', 2, null
insert into model.FieldTypes select 'Decimal', 'FieldValues_Decimal', 3, null
insert into model.FieldTypes select 'Foreign Key', 'FieldValues_FK', 7, null
insert into model.FieldTypes select 'Integer', 'FieldValues_Int', 4, null
insert into model.FieldTypes select 'Free Text', 'FieldValues_FreeText', 6, null
insert into model.FieldTypes select 'Text', 'FieldValues_Text', 5, null
GO


EXEC sp_addrole 'aplomb_site'
go

GRANT SELECT ON SCHEMA::accounts TO aplomb_site;
GRANT EXECUTE ON SCHEMA::accounts TO aplomb_site;
GRANT INSERT ON SCHEMA::accounts TO aplomb_site;
GRANT UPDATE ON SCHEMA::accounts TO aplomb_site;
GRANT DELETE ON SCHEMA::accounts TO aplomb_site;

GRANT SELECT ON SCHEMA::data TO aplomb_site;
GRANT EXECUTE ON SCHEMA::data TO aplomb_site;
GRANT INSERT ON SCHEMA::data TO aplomb_site;
GRANT UPDATE ON SCHEMA::data TO aplomb_site;
GRANT DELETE ON SCHEMA::data TO aplomb_site;

GRANT SELECT ON SCHEMA::model TO aplomb_site;
GRANT SELECT ON SCHEMA::security TO aplomb_site;
GRANT SELECT ON SCHEMA::site TO aplomb_site;
go

EXEC sp_addrole 'aplomb_admin'
go

GRANT SELECT ON SCHEMA::accounts TO aplomb_admin;
GRANT EXECUTE ON SCHEMA::accounts TO aplomb_admin;
GRANT INSERT ON SCHEMA::accounts TO aplomb_admin;
GRANT UPDATE ON SCHEMA::accounts TO aplomb_admin;
GRANT DELETE ON SCHEMA::accounts TO aplomb_admin;

GRANT SELECT ON SCHEMA::data TO aplomb_admin;
GRANT EXECUTE ON SCHEMA::data TO aplomb_admin;
GRANT INSERT ON SCHEMA::data TO aplomb_admin;
GRANT UPDATE ON SCHEMA::data TO aplomb_admin;
GRANT DELETE ON SCHEMA::data TO aplomb_admin;

GRANT SELECT ON SCHEMA::model TO aplomb_admin;
GRANT EXECUTE ON SCHEMA::model TO aplomb_admin;
GRANT INSERT ON SCHEMA::model TO aplomb_admin;
GRANT UPDATE ON SCHEMA::model TO aplomb_admin;
GRANT DELETE ON SCHEMA::model TO aplomb_admin;

GRANT SELECT ON SCHEMA::security TO aplomb_admin;
GRANT EXECUTE ON SCHEMA::security TO aplomb_admin;
GRANT INSERT ON SCHEMA::security TO aplomb_admin;
GRANT UPDATE ON SCHEMA::security TO aplomb_admin;
GRANT DELETE ON SCHEMA::security TO aplomb_admin;

GRANT SELECT ON SCHEMA::site TO aplomb_admin;
GRANT EXECUTE ON SCHEMA::site TO aplomb_admin;
GRANT INSERT ON SCHEMA::site TO aplomb_admin;
GRANT UPDATE ON SCHEMA::site TO aplomb_admin;
GRANT DELETE ON SCHEMA::site TO aplomb_admin;
go

EXEC sp_addrole 'aplomb_reports'
go
GRANT SELECT ON SCHEMA::data TO aplomb_reports;
GRANT VIEW DEFINITION ON SCHEMA::data TO aplomb_reports;

GRANT SELECT ON SCHEMA::model TO aplomb_reports;
GRANT VIEW DEFINITION ON SCHEMA::model TO aplomb_reports;
go


use master
go
if not exists (select loginname from master.dbo.syslogins where name = 'aplomb_test' and dbname = 'master')
begin
	CREATE LOGIN aplomb_test WITH Password='abcd1234!';
end
go
if not exists (select loginname from master.dbo.syslogins where name = 'aplomb_test_admin' and dbname = 'master')
begin
	CREATE LOGIN aplomb_test_admin WITH Password='abcd1234!';
end
go
use Aplomb
go
--Create Database Users
CREATE USER aplomb_test;
CREATE USER aplomb_test_admin;

EXEC sp_addrolemember 'aplomb_site','aplomb_test';
EXEC sp_addrolemember 'aplomb_admin','aplomb_test_admin';
GO
USE [master]
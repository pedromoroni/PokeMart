USE [master]
GO
/****** Object:  Database [pokemart]    Script Date: 1/14/2025 11:08:15 PM ******/
CREATE DATABASE [pokemart]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pokemart', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\pokemart.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pokemart_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\pokemart_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [pokemart] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pokemart].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pokemart] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pokemart] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pokemart] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pokemart] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pokemart] SET ARITHABORT OFF 
GO
ALTER DATABASE [pokemart] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pokemart] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pokemart] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pokemart] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pokemart] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pokemart] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pokemart] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pokemart] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pokemart] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pokemart] SET  ENABLE_BROKER 
GO
ALTER DATABASE [pokemart] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pokemart] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pokemart] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pokemart] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pokemart] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pokemart] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pokemart] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pokemart] SET RECOVERY FULL 
GO
ALTER DATABASE [pokemart] SET  MULTI_USER 
GO
ALTER DATABASE [pokemart] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pokemart] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pokemart] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pokemart] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [pokemart] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [pokemart] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'pokemart', N'ON'
GO
ALTER DATABASE [pokemart] SET QUERY_STORE = ON
GO
ALTER DATABASE [pokemart] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [pokemart]
GO
/****** Object:  Table [dbo].[Administrator]    Script Date: 1/14/2025 11:08:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrator](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[password_hash] [varchar](800) NOT NULL,
	[security_level] [int] NOT NULL,
	[is_deleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdministratorEditionHistory]    Script Date: 1/14/2025 11:08:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdministratorEditionHistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[administrator_id] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[description] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdministratorPermission]    Script Date: 1/14/2025 11:08:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdministratorPermission](
	[id_administrator] [int] NOT NULL,
	[id_permission] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_administrator] ASC,
	[id_permission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Avaliation]    Script Date: 1/14/2025 11:08:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Avaliation](
	[id_client] [int] NOT NULL,
	[id_product] [int] NOT NULL,
	[rate] [int] NOT NULL,
	[review] [varchar](400) NULL,
	[date] [datetime] NOT NULL,
	[is_deleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_client] ASC,
	[id_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartSlot]    Script Date: 1/14/2025 11:08:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartSlot](
	[id_client] [int] NOT NULL,
	[id_product] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[is_paid] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_client] ASC,
	[id_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/14/2025 11:08:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[is_deleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 1/14/2025 11:08:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[nif] [varchar](9) NULL,
	[password_hash] [varchar](800) NOT NULL,
	[profile_picture_path] [varchar](max) NULL,
	[is_deleted] [bit] NOT NULL,
	[gender] [char](1) NULL,
	[balance] [money] NOT NULL,
	[creation_date] [datetime] NOT NULL,
	[deletion_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorite]    Script Date: 1/14/2025 11:08:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorite](
	[client_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[added_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Filter]    Script Date: 1/14/2025 11:08:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Filter](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[creation_date] [datetime] NOT NULL,
	[deletion_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FilterProduct]    Script Date: 1/14/2025 11:08:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilterProduct](
	[product_id] [int] NOT NULL,
	[filter_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[filter_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 1/14/2025 11:08:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/14/2025 11:08:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[price] [money] NOT NULL,
	[category_id] [int] NOT NULL,
	[stock] [int] NOT NULL,
	[description] [varchar](max) NULL,
	[image_path] [varchar](max) NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[creation_date] [datetime] NOT NULL,
	[deletion_date] [datetime] NULL,
	[special_offer_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 1/14/2025 11:08:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[product_id] [int] NOT NULL,
	[sale_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[product_price] [money] NOT NULL,
	[special_offer_id] [int] NULL,
	[is_refunded] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[sale_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 1/14/2025 11:08:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[client_id] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[nif] [varchar](9) NULL,
	[is_refunded] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpecialOffer]    Script Date: 1/14/2025 11:08:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialOffer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[percentage] [int] NOT NULL,
	[description] [varchar](max) NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NOT NULL,
	[is_deleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Administrator] ON

-- senha: Admin@12345
INSERT [dbo].[Administrator] ([id], [email], [password_hash], [security_level], [is_deleted]) VALUES (1, N'admin1@gmail.com', N'12B721CBF1436E1314866367EDF51B370A15FC8EDCDC11DBA7A786CEFF35D13D7B73D17A6A5F9D46D42B62EBEC7AD75', 5, 0)
SET IDENTITY_INSERT [dbo].[Administrator] OFF
GO
INSERT [dbo].[AdministratorPermission] ([id_administrator], [id_permission]) VALUES (1, 1)
INSERT [dbo].[AdministratorPermission] ([id_administrator], [id_permission]) VALUES (1, 2)
INSERT [dbo].[AdministratorPermission] ([id_administrator], [id_permission]) VALUES (1, 3)
INSERT [dbo].[AdministratorPermission] ([id_administrator], [id_permission]) VALUES (1, 4)
INSERT [dbo].[AdministratorPermission] ([id_administrator], [id_permission]) VALUES (1, 5)
INSERT [dbo].[AdministratorPermission] ([id_administrator], [id_permission]) VALUES (1, 6)
INSERT [dbo].[AdministratorPermission] ([id_administrator], [id_permission]) VALUES (1, 7)
INSERT [dbo].[AdministratorPermission] ([id_administrator], [id_permission]) VALUES (1, 8)
INSERT [dbo].[AdministratorPermission] ([id_administrator], [id_permission]) VALUES (1, 9)
INSERT [dbo].[AdministratorPermission] ([id_administrator], [id_permission]) VALUES (1, 10)
INSERT [dbo].[AdministratorPermission] ([id_administrator], [id_permission]) VALUES (1, 11)
INSERT [dbo].[AdministratorPermission] ([id_administrator], [id_permission]) VALUES (1, 12)
INSERT [dbo].[AdministratorPermission] ([id_administrator], [id_permission]) VALUES (1, 13)
INSERT [dbo].[AdministratorPermission] ([id_administrator], [id_permission]) VALUES (1, 14)
INSERT [dbo].[AdministratorPermission] ([id_administrator], [id_permission]) VALUES (1, 15)
INSERT [dbo].[AdministratorPermission] ([id_administrator], [id_permission]) VALUES (1, 16)
INSERT [dbo].[AdministratorPermission] ([id_administrator], [id_permission]) VALUES (1, 17)
INSERT [dbo].[AdministratorPermission] ([id_administrator], [id_permission]) VALUES (1, 18)
INSERT [dbo].[AdministratorPermission] ([id_administrator], [id_permission]) VALUES (1, 19)
INSERT [dbo].[AdministratorPermission] ([id_administrator], [id_permission]) VALUES (1, 20)
GO
INSERT [dbo].[Avaliation] ([id_client], [id_product], [rate], [review], [date], [is_deleted]) VALUES (1, 28, 2, N'Não é muito bom', CAST(N'2025-01-14T23:04:01.570' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name], [is_deleted]) VALUES (1, N'Pokéballs', 0)
INSERT [dbo].[Category] ([id], [name], [is_deleted]) VALUES (2, N'Berries', 0)
INSERT [dbo].[Category] ([id], [name], [is_deleted]) VALUES (3, N'Medicine', 0)
INSERT [dbo].[Category] ([id], [name], [is_deleted]) VALUES (4, N'Machines', 0)
INSERT [dbo].[Category] ([id], [name], [is_deleted]) VALUES (5, N'General Items', 0)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

-- senha: Senha_123
INSERT [dbo].[Client] ([id], [first_name], [last_name], [email], [nif], [password_hash], [profile_picture_path], [is_deleted], [gender], [balance], [creation_date], [deletion_date]) VALUES (1, N'Andriy', N'Klachynskyy', N'andriy@email.com', NULL, N'12D71195BBE1A11F5803676C906E1A3455BC8969BF371B4784FE2641CC7F31E317D327E264BCA993384A8', NULL, 0, N'M', 52700.0000, CAST(N'2025-01-14T22:42:15.600' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
INSERT [dbo].[Favorite] ([client_id], [product_id], [added_date]) VALUES (1, 15, CAST(N'2025-01-14T23:03:09.103' AS DateTime))
INSERT [dbo].[Favorite] ([client_id], [product_id], [added_date]) VALUES (1, 29, CAST(N'2025-01-14T23:03:14.343' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Filter] ON 

INSERT [dbo].[Filter] ([id], [name], [is_deleted], [creation_date], [deletion_date]) VALUES (1, N'Hp', 0, CAST(N'2025-01-14T22:42:15.893' AS DateTime), NULL)
INSERT [dbo].[Filter] ([id], [name], [is_deleted], [creation_date], [deletion_date]) VALUES (2, N'Awakens', 0, CAST(N'2025-01-14T22:42:15.897' AS DateTime), NULL)
INSERT [dbo].[Filter] ([id], [name], [is_deleted], [creation_date], [deletion_date]) VALUES (3, N'Poison', 0, CAST(N'2025-01-14T22:42:15.900' AS DateTime), NULL)
INSERT [dbo].[Filter] ([id], [name], [is_deleted], [creation_date], [deletion_date]) VALUES (4, N'Burn', 0, CAST(N'2025-01-14T22:42:15.903' AS DateTime), NULL)
INSERT [dbo].[Filter] ([id], [name], [is_deleted], [creation_date], [deletion_date]) VALUES (5, N'Freezing', 0, CAST(N'2025-01-14T22:42:15.903' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Filter] OFF
GO
INSERT [dbo].[FilterProduct] ([product_id], [filter_id]) VALUES (11, 1)
INSERT [dbo].[FilterProduct] ([product_id], [filter_id]) VALUES (12, 1)
INSERT [dbo].[FilterProduct] ([product_id], [filter_id]) VALUES (14, 2)
INSERT [dbo].[FilterProduct] ([product_id], [filter_id]) VALUES (15, 3)
INSERT [dbo].[FilterProduct] ([product_id], [filter_id]) VALUES (16, 4)
INSERT [dbo].[FilterProduct] ([product_id], [filter_id]) VALUES (17, 5)
INSERT [dbo].[FilterProduct] ([product_id], [filter_id]) VALUES (19, 2)
INSERT [dbo].[FilterProduct] ([product_id], [filter_id]) VALUES (19, 3)
INSERT [dbo].[FilterProduct] ([product_id], [filter_id]) VALUES (19, 4)
INSERT [dbo].[FilterProduct] ([product_id], [filter_id]) VALUES (19, 5)
INSERT [dbo].[FilterProduct] ([product_id], [filter_id]) VALUES (21, 1)
INSERT [dbo].[FilterProduct] ([product_id], [filter_id]) VALUES (22, 1)
INSERT [dbo].[FilterProduct] ([product_id], [filter_id]) VALUES (23, 1)
INSERT [dbo].[FilterProduct] ([product_id], [filter_id]) VALUES (24, 1)
INSERT [dbo].[FilterProduct] ([product_id], [filter_id]) VALUES (25, 1)
INSERT [dbo].[FilterProduct] ([product_id], [filter_id]) VALUES (26, 3)
INSERT [dbo].[FilterProduct] ([product_id], [filter_id]) VALUES (27, 4)
INSERT [dbo].[FilterProduct] ([product_id], [filter_id]) VALUES (31, 1)
INSERT [dbo].[FilterProduct] ([product_id], [filter_id]) VALUES (32, 1)
INSERT [dbo].[FilterProduct] ([product_id], [filter_id]) VALUES (43, 3)
GO
SET IDENTITY_INSERT [dbo].[Permission] ON 

INSERT [dbo].[Permission] ([id], [name]) VALUES (1, N'CREATE PRODUCT')
INSERT [dbo].[Permission] ([id], [name]) VALUES (2, N'UPDATE PRODUCT')
INSERT [dbo].[Permission] ([id], [name]) VALUES (3, N'DELETE PRODUCT')
INSERT [dbo].[Permission] ([id], [name]) VALUES (4, N'RECOVER PRODUCT')
INSERT [dbo].[Permission] ([id], [name]) VALUES (5, N'CREATE CATEGORY')
INSERT [dbo].[Permission] ([id], [name]) VALUES (6, N'UPDATE CATEGORY')
INSERT [dbo].[Permission] ([id], [name]) VALUES (7, N'DELETE CATEGORY')
INSERT [dbo].[Permission] ([id], [name]) VALUES (8, N'RECOVER CATEGORY')
INSERT [dbo].[Permission] ([id], [name]) VALUES (9, N'CREATE SPECIAL OFFER')
INSERT [dbo].[Permission] ([id], [name]) VALUES (10, N'DELETE SPECIAL OFFER')
INSERT [dbo].[Permission] ([id], [name]) VALUES (11, N'RECOVER SPECIAL OFFER')
INSERT [dbo].[Permission] ([id], [name]) VALUES (12, N'CREATE FILTER')
INSERT [dbo].[Permission] ([id], [name]) VALUES (13, N'UPDATE FILTER')
INSERT [dbo].[Permission] ([id], [name]) VALUES (14, N'DELETE FILTER')
INSERT [dbo].[Permission] ([id], [name]) VALUES (15, N'RECOVER FILTER')
INSERT [dbo].[Permission] ([id], [name]) VALUES (16, N'CREATE ADMINISTRATOR')
INSERT [dbo].[Permission] ([id], [name]) VALUES (17, N'DELETE ADMINISTRATOR')
INSERT [dbo].[Permission] ([id], [name]) VALUES (18, N'ASSOCIATE SPECIAL OFFERS')
INSERT [dbo].[Permission] ([id], [name]) VALUES (19, N'ASSOCIATE FILTERS')
INSERT [dbo].[Permission] ([id], [name]) VALUES (20, N'UPDATE ADMINISTRATOR')
SET IDENTITY_INSERT [dbo].[Permission] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (1, N'Poké Ball', 200.0000, 1, 50, N'A standard Poké Ball used to catch Pokémon.', N'imgs\products\1.png', 0, CAST(N'2025-01-14T22:42:15.460' AS DateTime), NULL, 2)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (2, N'Great Ball', 600.0000, 1, 30, N'A higher-quality Poké Ball with a higher success rate.', N'imgs\products\2.png', 0, CAST(N'2025-01-14T22:42:15.460' AS DateTime), NULL, 2)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (3, N'Ultra Ball', 1200.0000, 1, 20, N'An advanced Poké Ball for catching strong Pokémon.', N'imgs\products\3.png', 0, CAST(N'2025-01-14T22:42:15.460' AS DateTime), NULL, 2)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (4, N'Master Ball', 80000.0000, 1, 1, N'The ultimate Poké Ball with a 100% catch rate.', N'imgs\products\4.png', 0, CAST(N'2025-01-14T22:42:15.460' AS DateTime), NULL, 2)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (5, N'Premier Ball', 200.0000, 1, 40, N'A special Poké Ball made for commemorative purposes.', N'imgs\products\5.png', 0, CAST(N'2025-01-14T22:42:15.460' AS DateTime), NULL, 2)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (6, N'Dive Ball', 1000.0000, 1, 15, N'A Poké Ball designed for catching Pokémon underwater.', N'imgs\products\6.png', 0, CAST(N'2025-01-14T22:42:15.460' AS DateTime), NULL, 2)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (7, N'Net Ball', 1000.0000, 1, 25, N'A Poké Ball effective for catching water or bug Pokémon.', N'imgs\products\7.png', 0, CAST(N'2025-01-14T22:42:15.460' AS DateTime), NULL, 2)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (8, N'Timer Ball', 1000.0000, 1, 10, N'A Poké Ball that becomes more effective as the battle continues.', N'imgs\products\8.png', 0, CAST(N'2025-01-14T22:42:15.460' AS DateTime), NULL, 2)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (9, N'Luxury Ball', 3000.0000, 1, 10, N'A luxurious Poké Ball that makes Pokémon more friendly.', N'imgs\products\9.png', 0, CAST(N'2025-01-14T22:42:15.460' AS DateTime), NULL, 2)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (10, N'Quick Ball', 1000.0000, 1, 20, N'A Poké Ball that works best at the start of a battle.', N'imgs\products\10.png', 0, CAST(N'2025-01-14T22:42:15.460' AS DateTime), NULL, 2)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (11, N'Love Ball', 300.0000, 1, 30, N'A Poké Ball that works best when catching a Pokémon that is of the opposite gender of your Pokémon.', N'imgs\products\11.png', 0, CAST(N'2025-01-14T22:42:15.460' AS DateTime), NULL, 2)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (12, N'Oran Berry', 50.0000, 2, 100, N'A Berry that restores 10 HP when eaten.', N'imgs\products\12.png', 0, CAST(N'2025-01-14T22:42:15.467' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (13, N'Sitrus Berry', 100.0000, 2, 80, N'A Berry that restores a Pokémons HP during battle.', N'imgs\products\13.png', 0, CAST(N'2025-01-14T22:42:15.467' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (14, N'Cheri Berry', 75.0000, 2, 90, N'A Berry that heals paralysis.', N'imgs\products\14.png', 0, CAST(N'2025-01-14T22:42:15.467' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (15, N'Chesto Berry', 75.0000, 2, 81, N'A Berry that awakens a sleeping Pokémon.', N'imgs\products\15.png', 0, CAST(N'2025-01-14T22:42:15.467' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (16, N'Pecha Berry', 75.0000, 2, 95, N'A Berry that cures poisoning.', N'imgs\products\16.png', 0, CAST(N'2025-01-14T22:42:15.467' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (17, N'Rawst Berry', 75.0000, 2, 80, N'A Berry that cures burns.', N'imgs\products\17.png', 0, CAST(N'2025-01-14T22:42:15.467' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (18, N'Aspear Berry', 75.0000, 2, 70, N'A Berry that heals freezing.', N'imgs\products\18.png', 0, CAST(N'2025-01-14T22:42:15.467' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (19, N'Leppa Berry', 120.0000, 2, 60, N'A Berry that restores 10 PP to a Pokémons move.', N'imgs\products\19.png', 0, CAST(N'2025-01-14T22:42:15.467' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (20, N'Lum Berry', 150.0000, 2, 50, N'A Berry that heals any status condition.', N'imgs\products\20.png', 0, CAST(N'2025-01-14T22:42:15.467' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (21, N'Razz Berry', 60.0000, 2, 100, N'A Berry used for making Pokéblocks or Poké Puffs.', N'imgs\products\21.png', 0, CAST(N'2025-01-14T22:42:15.467' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (22, N'Potion', 300.0000, 3, 100, N'A spray-type medicine for treating wounds. It restores 20 HP to a single Pokémon.', N'imgs\products\22.png', 0, CAST(N'2025-01-14T22:42:15.527' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (23, N'Super Potion', 700.0000, 3, 80, N'A spray-type medicine that restores 60 HP to a single Pokémon.', N'imgs\products\23.png', 0, CAST(N'2025-01-14T22:42:15.527' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (24, N'Hyper Potion', 1200.0000, 3, 60, N'A spray-type medicine that restores 120 HP to a single Pokémon.', N'imgs\products\24.png', 0, CAST(N'2025-01-14T22:42:15.527' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (25, N'Max Potion', 2500.0000, 3, 40, N'A spray-type medicine that completely restores the HP of a single Pokémon.', N'imgs\products\25.png', 0, CAST(N'2025-01-14T22:42:15.527' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (26, N'Full Restore', 3000.0000, 3, 30, N'A medicine that fully restores a Pokémon HP and heals any status condition.', N'imgs\products\26.png', 0, CAST(N'2025-01-14T22:42:15.527' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (27, N'Antidote', 100.0000, 3, 200, N'A spray-type medicine that cures a single Pokémon of poisoning.', N'imgs\products\27.png', 0, CAST(N'2025-01-14T22:42:15.527' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (28, N'Burn Heal', 250.0000, 3, 150, N'A spray-type medicine that heals a Pokémon suffering from a burn.', N'imgs\products\28.png', 0, CAST(N'2025-01-14T22:42:15.527' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (29, N'Ice Heal', 250.0000, 3, 150, N'A spray-type medicine that defrosts a Pokémon that is frozen.', N'imgs\products\29.png', 0, CAST(N'2025-01-14T22:42:15.527' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (30, N'Awakening', 250.0000, 3, 140, N'A spray-type medicine that awakens a Pokémon from sleep.', N'imgs\products\30.png', 0, CAST(N'2025-01-14T22:42:15.527' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (31, N'Paralyze Heal', 200.0000, 3, 160, N'A spray-type medicine that cures a Pokémon of paralysis.', N'imgs\products\31.png', 0, CAST(N'2025-01-14T22:42:15.527' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (32, N'Revive', 1500.0000, 3, 50, N'A medicine that revives a fainted Pokémon. It restores half the Pokémons maximum HP.', N'imgs\products\32.png', 0, CAST(N'2025-01-14T22:42:15.530' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (33, N'Max Revive', 4000.0000, 3, 20, N'A medicine that revives a fainted Pokémon. It fully restores the Pokémons HP.', N'imgs\products\33.png', 0, CAST(N'2025-01-14T22:42:15.530' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (34, N'Energy Powder', 500.0000, 3, 100, N'A bitter medicine that restores 60 HP. Can only be used on fainted Pokémon.', N'imgs\products\34.png', 0, CAST(N'2025-01-14T22:42:15.530' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (35, N'Energy Root', 800.0000, 3, 80, N'A bitter medicine that restores 120 HP. Can only be used on fainted Pokémon.', N'imgs\products\35.png', 0, CAST(N'2025-01-14T22:42:15.530' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (36, N'Sacred Ash', 100.0000, 3, 43, N'A very rare ash that revives all fainted Pokémon and restores their full HP.', N'imgs\products\36.png', 0, CAST(N'2025-01-14T22:42:15.530' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (37, N'Revival Herb', 2800.0000, 3, 30, N'A terribly bitter herb that revives a fainted Pokémon and restores full HP.', N'imgs\products\37.png', 0, CAST(N'2025-01-14T22:42:15.530' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (38, N'Soul Dew', 7000.0000, 3, 50, N'A legendary item that revives a fainted Pokémon and grants additional power.', N'imgs\products\38.png', 0, CAST(N'2025-01-14T22:42:15.530' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (39, N'TM01 - Focus Punch', 3000.0000, 4, 40, N'A TM that teaches Focus Punch. A strong punch that lands if the user isnt hit.', N'imgs\products\39.png', 0, CAST(N'2025-01-14T22:42:15.590' AS DateTime), NULL, 2)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (40, N'TM02 - Dragon Claw', 5000.0000, 4, 30, N'A TM that teaches Dragon Claw. Sharp claws slash the target.', N'imgs\products\40.png', 0, CAST(N'2025-01-14T22:42:15.590' AS DateTime), NULL, 2)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (41, N'TM03 - Water Pulse', 3500.0000, 4, 50, N'A TM that teaches Water Pulse. May confuse the target.', N'imgs\products\41.png', 0, CAST(N'2025-01-14T22:42:15.590' AS DateTime), NULL, 2)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (42, N'TM04 - Calm Mind', 4000.0000, 4, 45, N'A TM that teaches Calm Mind. Raises Sp. Atk and Sp. Def.', N'imgs\products\42.png', 0, CAST(N'2025-01-14T22:42:15.590' AS DateTime), NULL, 2)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (43, N'TM05 - Roar', 2000.0000, 4, 60, N'A TM that teaches Roar. The target is scared away.', N'imgs\products\43.png', 0, CAST(N'2025-01-14T22:42:15.590' AS DateTime), NULL, 2)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (44, N'TM06 - Toxic', 4500.0000, 4, 35, N'A TM that teaches Toxic. Badly poisons the target.', N'imgs\products\44.png', 0, CAST(N'2025-01-14T22:42:15.590' AS DateTime), NULL, 2)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (45, N'TM07 - Hail', 3500.0000, 4, 25, N'A TM that teaches Hail. Summons a hailstorm for five turns.', N'imgs\products\45.png', 0, CAST(N'2025-01-14T22:42:15.590' AS DateTime), NULL, 2)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (46, N'TM08 - Bulk Up', 4000.0000, 4, 40, N'A TM that teaches Bulk Up. Boosts Attack and Defense.', N'imgs\products\46.png', 0, CAST(N'2025-01-14T22:42:15.590' AS DateTime), NULL, 2)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (47, N'TM09 - Bullet Seed', 3000.0000, 4, 55, N'A TM that teaches Bullet Seed. Hits 2-5 times in one turn.', N'imgs\products\47.png', 0, CAST(N'2025-01-14T22:42:15.590' AS DateTime), NULL, 2)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (48, N'TM10 - Hidden Power', 3500.0000, 4, 50, N'A TM that teaches Hidden Power. Type depends on the user.', N'imgs\products\48.png', 0, CAST(N'2025-01-14T22:42:15.590' AS DateTime), NULL, 2)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (49, N'Repel', 350.0000, 5, 100, N'An item that keeps weak wild Pokémon away for 100 steps.', N'imgs\products\49.png', 0, CAST(N'2025-01-14T22:42:15.590' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (50, N'Super Repel', 500.0000, 5, 80, N'An item that keeps weak wild Pokémon away for 200 steps.', N'imgs\products\50.png', 0, CAST(N'2025-01-14T22:42:15.590' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (51, N'Max Repel', 700.0000, 5, 60, N'An item that keeps weak wild Pokémon away for 250 steps.', N'imgs\products\51.png', 0, CAST(N'2025-01-14T22:42:15.590' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [price], [category_id], [stock], [description], [image_path], [is_deleted], [creation_date], [deletion_date], [special_offer_id]) VALUES (52, N'Cleanse Tag', 1000.0000, 5, 50, N'A held item that helps the holder repel wild Pokémon.', N'imgs\products\52.png', 0, CAST(N'2025-01-14T22:42:15.590' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[ProductSale] ([product_id], [sale_id], [quantity], [product_price], [special_offer_id], [is_refunded]) VALUES (15, 1, 4, 75.0000, NULL, 0)
INSERT [dbo].[ProductSale] ([product_id], [sale_id], [quantity], [product_price], [special_offer_id], [is_refunded]) VALUES (28, 1, 6, 250.0000, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Sale] ON 

INSERT [dbo].[Sale] ([id], [client_id], [date], [nif], [is_refunded]) VALUES (1, 1, CAST(N'2025-01-14T23:03:31.907' AS DateTime), N'543210006', 0)
SET IDENTITY_INSERT [dbo].[Sale] OFF
GO
SET IDENTITY_INSERT [dbo].[SpecialOffer] ON 

INSERT [dbo].[SpecialOffer] ([id], [name], [percentage], [description], [start_date], [end_date], [is_deleted]) VALUES (1, N'XMAS', 97, N'Happy XMAS', CAST(N'2024-12-20T00:00:00.000' AS DateTime), CAST(N'2024-12-27T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[SpecialOffer] ([id], [name], [percentage], [description], [start_date], [end_date], [is_deleted]) VALUES (2, N'CARNIVAL', 30, N'Discounts of up to 30% on Pokéballs and Machines.', CAST(N'2025-02-10T00:00:00.000' AS DateTime), CAST(N'2025-02-17T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[SpecialOffer] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Administ__AB6E6164EC581FFF]    Script Date: 1/14/2025 11:08:16 PM ******/
ALTER TABLE [dbo].[Administrator] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Client__AB6E61647FA0E583]    Script Date: 1/14/2025 11:08:16 PM ******/
ALTER TABLE [dbo].[Client] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Administrator] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[AdministratorEditionHistory] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Avaliation] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Avaliation] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[CartSlot] ADD  DEFAULT ((0)) FOR [is_paid]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[Client] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[Client] ADD  DEFAULT ((0)) FOR [balance]
GO
ALTER TABLE [dbo].[Client] ADD  DEFAULT (getdate()) FOR [creation_date]
GO
ALTER TABLE [dbo].[Favorite] ADD  DEFAULT (getdate()) FOR [added_date]
GO
ALTER TABLE [dbo].[Filter] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[Filter] ADD  DEFAULT (getdate()) FOR [creation_date]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [creation_date]
GO
ALTER TABLE [dbo].[ProductSale] ADD  DEFAULT ((0)) FOR [is_refunded]
GO
ALTER TABLE [dbo].[Sale] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Sale] ADD  DEFAULT ((0)) FOR [is_refunded]
GO
ALTER TABLE [dbo].[SpecialOffer] ADD  DEFAULT (getdate()) FOR [start_date]
GO
ALTER TABLE [dbo].[SpecialOffer] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[AdministratorEditionHistory]  WITH CHECK ADD FOREIGN KEY([administrator_id])
REFERENCES [dbo].[Administrator] ([id])
GO
ALTER TABLE [dbo].[AdministratorPermission]  WITH CHECK ADD FOREIGN KEY([id_administrator])
REFERENCES [dbo].[Administrator] ([id])
GO
ALTER TABLE [dbo].[AdministratorPermission]  WITH CHECK ADD FOREIGN KEY([id_permission])
REFERENCES [dbo].[Permission] ([id])
GO
ALTER TABLE [dbo].[Avaliation]  WITH CHECK ADD FOREIGN KEY([id_client])
REFERENCES [dbo].[Client] ([id])
GO
ALTER TABLE [dbo].[Avaliation]  WITH CHECK ADD FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[CartSlot]  WITH CHECK ADD FOREIGN KEY([id_client])
REFERENCES [dbo].[Client] ([id])
GO
ALTER TABLE [dbo].[CartSlot]  WITH CHECK ADD FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD FOREIGN KEY([client_id])
REFERENCES [dbo].[Client] ([id])
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[FilterProduct]  WITH CHECK ADD FOREIGN KEY([filter_id])
REFERENCES [dbo].[Filter] ([id])
GO
ALTER TABLE [dbo].[FilterProduct]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([special_offer_id])
REFERENCES [dbo].[SpecialOffer] ([id])
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD FOREIGN KEY([sale_id])
REFERENCES [dbo].[Sale] ([id])
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD FOREIGN KEY([special_offer_id])
REFERENCES [dbo].[SpecialOffer] ([id])
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD FOREIGN KEY([client_id])
REFERENCES [dbo].[Client] ([id])
GO
ALTER TABLE [dbo].[Avaliation]  WITH CHECK ADD CHECK  (([rate]>=(1) AND [rate]<=(5)))
GO
ALTER TABLE [dbo].[CartSlot]  WITH CHECK ADD CHECK  (([quantity]>(0)))
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD CHECK  (([gender]='O' OR [gender]='F' OR [gender]='M'))
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD CHECK  (([quantity]>(0)))
GO
ALTER TABLE [dbo].[SpecialOffer]  WITH CHECK ADD CHECK  (((1)<=[percentage] AND [percentage]<=(100)))
GO
USE [master]
GO
ALTER DATABASE [pokemart] SET  READ_WRITE 
GO

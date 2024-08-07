USE [master]
GO
/****** Object:  Database [QuanLy_Kho]    Script Date: 20/05/2024 10:40:29 SA ******/
CREATE DATABASE [QuanLy_Kho]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLy_Kho', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\QuanLy_Kho.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLy_Kho_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\QuanLy_Kho_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QuanLy_Kho] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLy_Kho].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLy_Kho] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLy_Kho] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLy_Kho] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLy_Kho] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLy_Kho] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLy_Kho] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLy_Kho] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLy_Kho] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLy_Kho] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLy_Kho] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLy_Kho] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLy_Kho] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLy_Kho] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLy_Kho] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLy_Kho] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLy_Kho] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLy_Kho] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLy_Kho] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLy_Kho] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLy_Kho] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLy_Kho] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLy_Kho] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLy_Kho] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLy_Kho] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLy_Kho] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLy_Kho] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLy_Kho] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLy_Kho] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLy_Kho] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLy_Kho] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QuanLy_Kho] SET QUERY_STORE = ON
GO
ALTER DATABASE [QuanLy_Kho] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QuanLy_Kho]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 20/05/2024 10:40:29 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryId] [varchar](15) NOT NULL,
	[categoryName] [nvarchar](200) NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 20/05/2024 10:40:29 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](200) NOT NULL,
	[producer] [nvarchar](100) NOT NULL,
	[status] [bit] NULL,
	[manufactureDate] [date] NULL,
	[expirationDate] [date] NULL,
	[price] [float] NULL,
	[categoryId] [varchar](15) NULL,
	[proImg] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 20/05/2024 10:40:29 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 20/05/2024 10:40:29 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](45) NULL,
	[password] [varchar](200) NULL,
	[enabled] [bit] NULL,
	[fullname] [nvarchar](70) NULL,
	[gender] [bit] NULL,
	[birthday] [datetime] NULL,
	[address] [nvarchar](200) NULL,
	[email] [varchar](100) NULL,
	[telephone] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_roles]    Script Date: 20/05/2024 10:40:29 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[roleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([categoryId], [categoryName], [status]) VALUES (N'C0001', N'NƯỚC lọc1', 1)
INSERT [dbo].[Category] ([categoryId], [categoryName], [status]) VALUES (N'CAT001', N'Electronics', 1)
INSERT [dbo].[Category] ([categoryId], [categoryName], [status]) VALUES (N'CAT002', N'Appliances', 1)
INSERT [dbo].[Category] ([categoryId], [categoryName], [status]) VALUES (N'CAT003', N'Clothing', 1)
INSERT [dbo].[Category] ([categoryId], [categoryName], [status]) VALUES (N'CAT004', N'Home and Garden', 1)
INSERT [dbo].[Category] ([categoryId], [categoryName], [status]) VALUES (N'CAT005', N'Toys', 1)
INSERT [dbo].[Category] ([categoryId], [categoryName], [status]) VALUES (N'CAT006', N'Books', 1)
INSERT [dbo].[Category] ([categoryId], [categoryName], [status]) VALUES (N'CAT007', N'Health and Beauty', 1)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productId], [productName], [producer], [status], [manufactureDate], [expirationDate], [price], [categoryId], [proImg]) VALUES (34, N'fdsfsdfsd', N'loan nè', 1, CAST(N'2024-03-07' AS Date), CAST(N'2024-03-31' AS Date), 10000, N'C0001', N'nui.jpg')
INSERT [dbo].[Product] ([productId], [productName], [producer], [status], [manufactureDate], [expirationDate], [price], [categoryId], [proImg]) VALUES (43, N'Galaxy Tab S7', N'Samsung', 1, CAST(N'2023-08-01' AS Date), CAST(N'2024-08-01' AS Date), 700, N'CAT002', N'galaxytabs7.jpg')
INSERT [dbo].[Product] ([productId], [productName], [producer], [status], [manufactureDate], [expirationDate], [price], [categoryId], [proImg]) VALUES (44, N'iPad Air', N'Apple', 1, CAST(N'2023-09-01' AS Date), CAST(N'2024-09-01' AS Date), 600, N'CAT001', N'ipadair.jpg')
INSERT [dbo].[Product] ([productId], [productName], [producer], [status], [manufactureDate], [expirationDate], [price], [categoryId], [proImg]) VALUES (45, N'Surface Pro 8', N'Microsoft', 1, CAST(N'2023-10-01' AS Date), CAST(N'2024-10-01' AS Date), 1300, N'CAT004', N'surfacepro8.jpg')
INSERT [dbo].[Product] ([productId], [productName], [producer], [status], [manufactureDate], [expirationDate], [price], [categoryId], [proImg]) VALUES (46, N'Pixel 6', N'Google', 1, CAST(N'2023-11-01' AS Date), CAST(N'2024-11-01' AS Date), 800, N'CAT006', N'pixel6.jpg')
INSERT [dbo].[Product] ([productId], [productName], [producer], [status], [manufactureDate], [expirationDate], [price], [categoryId], [proImg]) VALUES (47, N'Fire HD 10', N'Amazon', 1, CAST(N'2023-12-01' AS Date), CAST(N'2024-12-01' AS Date), 300, N'CAT007', N'firehd10.jpg')
INSERT [dbo].[Product] ([productId], [productName], [producer], [status], [manufactureDate], [expirationDate], [price], [categoryId], [proImg]) VALUES (48, N'Mac Mini', N'Apple', 1, CAST(N'2024-01-01' AS Date), CAST(N'2025-01-01' AS Date), 700, N'CAT001', N'macmini.jpg')
INSERT [dbo].[Product] ([productId], [productName], [producer], [status], [manufactureDate], [expirationDate], [price], [categoryId], [proImg]) VALUES (49, N'Echo Dot', N'Amazon', 1, CAST(N'2024-02-01' AS Date), CAST(N'2025-02-01' AS Date), 50, N'CAT007', N'echodot.jpg')
INSERT [dbo].[Product] ([productId], [productName], [producer], [status], [manufactureDate], [expirationDate], [price], [categoryId], [proImg]) VALUES (50, N'Galaxy Watch 4', N'Samsung', 1, CAST(N'2024-03-01' AS Date), CAST(N'2025-03-01' AS Date), 300, N'CAT002', N'galaxywatch4.jpg')
INSERT [dbo].[Product] ([productId], [productName], [producer], [status], [manufactureDate], [expirationDate], [price], [categoryId], [proImg]) VALUES (52, N'Chromecast', N'Google', 1, CAST(N'2024-05-01' AS Date), CAST(N'2025-05-01' AS Date), 50, N'CAT006', N'chromecast.jpg')
INSERT [dbo].[Product] ([productId], [productName], [producer], [status], [manufactureDate], [expirationDate], [price], [categoryId], [proImg]) VALUES (53, N'Kindle Paperwhite', N'Amazon', 1, CAST(N'2024-06-01' AS Date), CAST(N'2025-06-01' AS Date), 150, N'CAT007', N'kindlepaperwhite.jpg')
INSERT [dbo].[Product] ([productId], [productName], [producer], [status], [manufactureDate], [expirationDate], [price], [categoryId], [proImg]) VALUES (54, N'PlayStation VR', N'Sony', 1, CAST(N'2024-07-01' AS Date), CAST(N'2025-07-01' AS Date), 300, N'CAT005', N'playstationvr.jpg')
INSERT [dbo].[Product] ([productId], [productName], [producer], [status], [manufactureDate], [expirationDate], [price], [categoryId], [proImg]) VALUES (57, N'iPhone 9 Plus', N'Apple', 1, CAST(N'2024-04-01' AS Date), CAST(N'2024-05-12' AS Date), 10000000, N'CAT001', N'')
INSERT [dbo].[Product] ([productId], [productName], [producer], [status], [manufactureDate], [expirationDate], [price], [categoryId], [proImg]) VALUES (58, N'iPhone 19 Pro Max', N'Apple', 1, CAST(N'2024-04-03' AS Date), CAST(N'2024-05-12' AS Date), 10000, N'CAT001', N'nui.jpg')
INSERT [dbo].[Product] ([productId], [productName], [producer], [status], [manufactureDate], [expirationDate], [price], [categoryId], [proImg]) VALUES (59, N'máy bơm 1', N'máy bơm toshiba', 1, CAST(N'2024-04-04' AS Date), CAST(N'2024-05-12' AS Date), 12000000, N'CAT002', N'nui.jpg')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([id], [name]) VALUES (1, N'ROLE_ADMIN')
INSERT [dbo].[role] ([id], [name]) VALUES (2, N'ROLE_USER')
SET IDENTITY_INSERT [dbo].[role] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [password], [enabled], [fullname], [gender], [birthday], [address], [email], [telephone]) VALUES (1, N'admin', N'$2a$12$s8FyYcAauHqILMBcI6x0BepO5JI.9/C16QRYMswF7Avt0rRkOiR0u', 1, N'Nguyễn Thành
Trung', 1, CAST(N'2000-02-12T00:00:00.000' AS DateTime), N'Ba Vì - Hà Nội', N'trung.nt@gmail.com', N'0123456789')
INSERT [dbo].[users] ([id], [username], [password], [enabled], [fullname], [gender], [birthday], [address], [email], [telephone]) VALUES (2, N'user', N'$2a$12$s8FyYcAauHqILMBcI6x0BepO5JI.9/C16QRYMswF7Avt0rRkOiR0u', 1, N'Nguyễn Khánh
Nam', 1, CAST(N'2001-05-11T00:00:00.000' AS DateTime), N'Ý Yên - Nam Định', N'nam.nk@gmail.com', N'0911233455')
INSERT [dbo].[users] ([id], [username], [password], [enabled], [fullname], [gender], [birthday], [address], [email], [telephone]) VALUES (3, N'test123', N'$2a$12$nLmK5Oiajh3RVnqFELZ5YuC8zGKQYI5rxuUUeqYqVYudE1AvOj8Ky', 1, N'Đỗ Thị Loan', 1, CAST(N'2024-04-02T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [username], [password], [enabled], [fullname], [gender], [birthday], [address], [email], [telephone]) VALUES (4, N'loanadmin', N'$2a$12$nUAowvDslt5P3I5oZ9ESBu1jrpFMyGgBw4tPMUIS1o7rAjkx4CJK.', 1, NULL, 0, CAST(N'2004-10-03T00:00:00.000' AS DateTime), N'Thạch Thất - Hà Nội', N'loan03041@gmail.com', N'0899269965')
INSERT [dbo].[users] ([id], [username], [password], [enabled], [fullname], [gender], [birthday], [address], [email], [telephone]) VALUES (5, N'adminSon', N'$2a$12$rWNHgEOPU2zao.4mfYeGKue6HuysBusp0wIkzo.gy/mpHc0tFddw6', 1, N'Phạm Như Sơn', 1, CAST(N'2004-05-29T00:00:00.000' AS DateTime), N'Hải Dương Quê Tôi', N'sondz2k4g@gmail.com', N'0899269965')
INSERT [dbo].[users] ([id], [username], [password], [enabled], [fullname], [gender], [birthday], [address], [email], [telephone]) VALUES (6, N'sonkkk', N'$2a$12$Oj87FMJ3PXkaMCNV94j.a.mLsDKm.jZP..oDA.AJI1YvpUJ6J4G5.', 1, N'văn sơn', 0, CAST(N'2024-04-19T00:00:00.000' AS DateTime), N'hà nội', N'admin23@gmail.com', N'0544845315')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[users_roles] ON 

INSERT [dbo].[users_roles] ([id], [userId], [roleId]) VALUES (1, 1, 1)
INSERT [dbo].[users_roles] ([id], [userId], [roleId]) VALUES (2, 1, 2)
INSERT [dbo].[users_roles] ([id], [userId], [roleId]) VALUES (3, 2, 2)
INSERT [dbo].[users_roles] ([id], [userId], [roleId]) VALUES (4, 3, 1)
INSERT [dbo].[users_roles] ([id], [userId], [roleId]) VALUES (5, NULL, NULL)
INSERT [dbo].[users_roles] ([id], [userId], [roleId]) VALUES (6, 4, 1)
INSERT [dbo].[users_roles] ([id], [userId], [roleId]) VALUES (7, NULL, NULL)
INSERT [dbo].[users_roles] ([id], [userId], [roleId]) VALUES (8, 5, 1)
INSERT [dbo].[users_roles] ([id], [userId], [roleId]) VALUES (9, NULL, NULL)
INSERT [dbo].[users_roles] ([id], [userId], [roleId]) VALUES (10, 6, 1)
INSERT [dbo].[users_roles] ([id], [userId], [roleId]) VALUES (11, NULL, NULL)
SET IDENTITY_INSERT [dbo].[users_roles] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Category__37077ABD9FA21754]    Script Date: 20/05/2024 10:40:29 SA ******/
ALTER TABLE [dbo].[Category] ADD UNIQUE NONCLUSTERED 
(
	[categoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Product__0A9CBBE06068BDB1]    Script Date: 20/05/2024 10:40:29 SA ******/
ALTER TABLE [dbo].[Product] ADD UNIQUE NONCLUSTERED 
(
	[productName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([categoryId])
GO
ALTER TABLE [dbo].[users_roles]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[role] ([id])
GO
ALTER TABLE [dbo].[users_roles]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[users] ([id])
GO
USE [master]
GO
ALTER DATABASE [QuanLy_Kho] SET  READ_WRITE 
GO

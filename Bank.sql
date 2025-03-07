USE [master]
GO
/****** Object:  Database [DotNet]    Script Date: 10/31/2024 9:00:13 AM ******/
CREATE DATABASE [DotNet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DotNet', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.DULICH\MSSQL\DATA\DotNet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DotNet_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.DULICH\MSSQL\DATA\DotNet_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DotNet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DotNet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DotNet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DotNet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DotNet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DotNet] SET ARITHABORT OFF 
GO
ALTER DATABASE [DotNet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DotNet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DotNet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DotNet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DotNet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DotNet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DotNet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DotNet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DotNet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DotNet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DotNet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DotNet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DotNet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DotNet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DotNet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DotNet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DotNet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DotNet] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DotNet] SET  MULTI_USER 
GO
ALTER DATABASE [DotNet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DotNet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DotNet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DotNet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DotNet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DotNet] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DotNet] SET QUERY_STORE = ON
GO
ALTER DATABASE [DotNet] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DotNet]
GO
/****** Object:  Table [dbo].[ACCOUNT]    Script Date: 10/31/2024 9:00:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACCOUNT](
	[id] [int] NOT NULL,
	[customerid] [varchar](255) NULL,
	[date_opened] [date] NULL,
	[balance] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BRANCH]    Script Date: 10/31/2024 9:00:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BRANCH](
	[id] [varchar](255) NOT NULL,
	[name] [varchar](255) NULL,
	[house_no] [varchar](255) NULL,
	[city] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 10/31/2024 9:00:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[id] [varchar](255) NOT NULL,
	[name] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[house_no] [varchar](255) NULL,
	[city] [varchar](255) NULL,
	[pin] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMPLOYEE]    Script Date: 10/31/2024 9:00:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLOYEE](
	[id] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[role] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOGIN]    Script Date: 10/31/2024 9:00:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOGIN](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](10) NULL,
	[password] [nvarchar](10) NULL,
 CONSTRAINT [PK_LOGIN] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRANSACTION]    Script Date: 10/31/2024 9:00:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRANSACTION](
	[id] [int] NOT NULL,
	[from_account_id] [int] NULL,
	[branch_id] [varchar](255) NULL,
	[date_of_trans] [date] NULL,
	[amount] [float] NULL,
	[to_account_id] [int] NULL,
	[employee_id] [varchar](255) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[ACCOUNT] ([id], [customerid], [date_opened], [balance]) VALUES (1, N'C001', CAST(N'2023-03-16' AS Date), 25000)
INSERT [dbo].[ACCOUNT] ([id], [customerid], [date_opened], [balance]) VALUES (2, N'C002', CAST(N'2023-02-15' AS Date), 282000)
INSERT [dbo].[ACCOUNT] ([id], [customerid], [date_opened], [balance]) VALUES (3, N'C001', CAST(N'2022-12-29' AS Date), 10020)
INSERT [dbo].[ACCOUNT] ([id], [customerid], [date_opened], [balance]) VALUES (4, N'C003', CAST(N'2024-12-30' AS Date), 116000)
INSERT [dbo].[ACCOUNT] ([id], [customerid], [date_opened], [balance]) VALUES (5, N'C003', CAST(N'2023-01-01' AS Date), 140000)
INSERT [dbo].[ACCOUNT] ([id], [customerid], [date_opened], [balance]) VALUES (6, N'C004', CAST(N'2024-07-01' AS Date), 25000)
GO
INSERT [dbo].[BRANCH] ([id], [name], [house_no], [city]) VALUES (N'B001', N'Da Nang', N'789', N'Da Nang')
INSERT [dbo].[BRANCH] ([id], [name], [house_no], [city]) VALUES (N'B002', N'Hai Phong', N'321', N'Hai Phong')
INSERT [dbo].[BRANCH] ([id], [name], [house_no], [city]) VALUES (N'B003', N'Binh Duong', N'66', N'Binh Duong')
INSERT [dbo].[BRANCH] ([id], [name], [house_no], [city]) VALUES (N'B004', N'Ha Noi', N'212', N'Ha Noi')
INSERT [dbo].[BRANCH] ([id], [name], [house_no], [city]) VALUES (N'B006', N'TP. HCM', N'272', N'TP. HCM')
INSERT [dbo].[BRANCH] ([id], [name], [house_no], [city]) VALUES (N'B007', N'Nha Trang', N'567', N'Nha Trang')
INSERT [dbo].[BRANCH] ([id], [name], [house_no], [city]) VALUES (N'HCM', N'Khanh Hoa', N'67', N'Khanh Hoa')
GO
INSERT [dbo].[CUSTOMER] ([id], [name], [phone], [email], [house_no], [city], [pin]) VALUES (N'C001', N'Pham Ngoc Hai', N'0787582309', N'nhoai@gmail.com', N'123', N'Ha Noi', N'23333')
INSERT [dbo].[CUSTOMER] ([id], [name], [phone], [email], [house_no], [city], [pin]) VALUES (N'C002', N'Tran Van Minh', N'0912233445', N'minh@gmail.com', N'877', N'HCM', N'700000')
INSERT [dbo].[CUSTOMER] ([id], [name], [phone], [email], [house_no], [city], [pin]) VALUES (N'C003', N'Ho Thi Tu Uyen', N'0902678844', N'uyn@gmail.com', N'263', N'Hai Phong', N'232424')
INSERT [dbo].[CUSTOMER] ([id], [name], [phone], [email], [house_no], [city], [pin]) VALUES (N'C004', N'Pham Nguyen Bao Ngoc', N'0931878992', N'bngoc@gmail.com', N'325', N'HCM', N'1008')
GO
INSERT [dbo].[EMPLOYEE] ([id], [password], [role]) VALUES (N'1', N'123456', N'User')
INSERT [dbo].[EMPLOYEE] ([id], [password], [role]) VALUES (N'2', N'123456', N'User')
INSERT [dbo].[EMPLOYEE] ([id], [password], [role]) VALUES (N'E001', N'123', N'User')
INSERT [dbo].[EMPLOYEE] ([id], [password], [role]) VALUES (N'Ngoc', N'123456', N'Admin')
GO
SET IDENTITY_INSERT [dbo].[LOGIN] ON 

INSERT [dbo].[LOGIN] ([id], [username], [password]) VALUES (1, N'admin', N'123456')
INSERT [dbo].[LOGIN] ([id], [username], [password]) VALUES (2, N'bngoc', N'123456')
SET IDENTITY_INSERT [dbo].[LOGIN] OFF
GO
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (1, 1, NULL, CAST(N'2024-10-28' AS Date), 1, 4, NULL)
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (2, 1, N'B001', CAST(N'2024-10-20' AS Date), 15, 1, N'1')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (3, 1, N'B004', CAST(N'2024-10-28' AS Date), 2, 2, NULL)
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (4, 1, N'B006', CAST(N'2024-10-28' AS Date), 1, 2, NULL)
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (5, 5, NULL, CAST(N'2024-10-28' AS Date), 200, 5, NULL)
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (6, 4, N'HCM', CAST(N'2024-10-29' AS Date), 2, 4, N'1')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (7, 2, N'B007', CAST(N'2024-10-29' AS Date), 1044, 2, N'1')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (8, 3, NULL, CAST(N'2024-10-29' AS Date), -200, 2, NULL)
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (9, 2, NULL, CAST(N'2024-10-29' AS Date), -200, 3, NULL)
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (10, 2, NULL, CAST(N'2024-10-29' AS Date), -100, 1, NULL)
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (11, 4, N'HCM', CAST(N'2024-10-29' AS Date), 88, 4, N'1')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (12, 4, N'HCM', CAST(N'2024-10-29' AS Date), 888, 4, N'1')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (13, 4, N'HCM', CAST(N'2024-10-28' AS Date), 5, 4, N'E001')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (14, 1, NULL, CAST(N'2024-10-29' AS Date), -500, 5, NULL)
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (15, 4, N'HCM', CAST(N'2024-10-29' AS Date), 100, 4, N'1')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (16, 4, N'HCM', CAST(N'2024-10-29' AS Date), 100, 4, N'1')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (17, 3, NULL, CAST(N'2024-10-29' AS Date), -5000, 4, NULL)
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (18, 1, N'HCM', CAST(N'2024-10-29' AS Date), 10, 1, N'E001')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (19, 2, NULL, CAST(N'2024-10-29' AS Date), 222, 3, NULL)
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (22, 2, N'HCM', CAST(N'2024-10-29' AS Date), 778, 2, N'1')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (23, 1, N'HCM', CAST(N'2024-10-29' AS Date), 490, 1, N'1')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (24, 5, N'HCM', CAST(N'2024-10-30' AS Date), 50, 5, N'1')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (25, 5, N'HCM', CAST(N'2024-10-30' AS Date), 50, 5, N'1')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (26, 3, NULL, CAST(N'2024-10-30' AS Date), 5000, 2, NULL)
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (30, 3, N'HCM', CAST(N'2024-10-30' AS Date), 5044, 3, N'1')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (31, 3, N'HCM', CAST(N'2024-10-30' AS Date), 56, 3, N'1')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (32, 4, N'HCM', CAST(N'2024-10-30' AS Date), 10000, 4, N'1')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (35, 3, N'HCM', CAST(N'2024-10-30' AS Date), 1000, 3, N'1')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (36, 3, N'HCM', CAST(N'2024-10-30' AS Date), 1000, 3, N'1')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (37, 2, NULL, CAST(N'2024-10-30' AS Date), 20, 3, NULL)
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (38, 3, N'HCM', CAST(N'2024-10-30' AS Date), 10000, 3, N'Ngoc')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (39, 5, N'HCM', CAST(N'2024-10-30' AS Date), 20000, 5, N'Ngoc')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (40, 3, NULL, CAST(N'2024-10-30' AS Date), 50000, 4, NULL)
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (41, 3, NULL, CAST(N'2024-10-30' AS Date), 50000, 4, NULL)
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (42, 2, N'HCM', CAST(N'2024-10-31' AS Date), 980, 2, N'Ngoc')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (43, 2, N'HCM', CAST(N'2024-10-31' AS Date), 1000, 2, N'Ngoc')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (44, 4, N'HCM', CAST(N'2024-10-31' AS Date), 1000, 4, N'Ngoc')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (45, 2, NULL, CAST(N'2024-10-31' AS Date), 10000, 3, NULL)
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (46, 2, N'HCM', CAST(N'2024-10-31' AS Date), 7000, 2, N'Ngoc')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (47, 2, N'HCM', CAST(N'2024-10-31' AS Date), 7000, 2, N'Ngoc')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (48, 4, NULL, CAST(N'2024-10-31' AS Date), 2000, 2, NULL)
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (20, 3, N'HCM', CAST(N'2024-10-29' AS Date), 800, 3, N'1')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (27, 3, N'HCM', CAST(N'2024-10-30' AS Date), 1000, 3, N'1')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (28, 3, N'HCM', CAST(N'2024-10-30' AS Date), 1000, 3, N'1')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (33, 3, N'HCM', CAST(N'2024-10-30' AS Date), 4700, 3, N'1')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (34, 2, N'HCM', CAST(N'2024-10-30' AS Date), 6000, 2, N'1')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (21, 3, N'HCM', CAST(N'2024-10-29' AS Date), 22, 3, N'1')
INSERT [dbo].[TRANSACTION] ([id], [from_account_id], [branch_id], [date_of_trans], [amount], [to_account_id], [employee_id]) VALUES (29, 3, N'HCM', CAST(N'2024-10-30' AS Date), 100000, 3, N'1')
GO
ALTER TABLE [dbo].[ACCOUNT]  WITH CHECK ADD FOREIGN KEY([customerid])
REFERENCES [dbo].[CUSTOMER] ([id])
GO
ALTER TABLE [dbo].[TRANSACTION]  WITH CHECK ADD FOREIGN KEY([branch_id])
REFERENCES [dbo].[BRANCH] ([id])
GO
ALTER TABLE [dbo].[TRANSACTION]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[EMPLOYEE] ([id])
GO
ALTER TABLE [dbo].[TRANSACTION]  WITH CHECK ADD FOREIGN KEY([from_account_id])
REFERENCES [dbo].[ACCOUNT] ([id])
GO
ALTER TABLE [dbo].[TRANSACTION]  WITH CHECK ADD FOREIGN KEY([to_account_id])
REFERENCES [dbo].[ACCOUNT] ([id])
GO
USE [master]
GO
ALTER DATABASE [DotNet] SET  READ_WRITE 
GO

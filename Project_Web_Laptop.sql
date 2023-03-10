USE [master]
GO
/****** Object:  Database [Project]    Script Date: 12/11/2022 2:10:49 PM ******/
CREATE DATABASE [Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Project] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Project] SET  MULTI_USER 
GO
ALTER DATABASE [Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Project] SET QUERY_STORE = OFF
GO
USE [Project]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 12/11/2022 2:10:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[PhoneNumber] [varchar](15) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NULL,
	[IsDeleted] [bit] NOT NULL,
	[Address] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 12/11/2022 2:10:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[RoleId] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 12/11/2022 2:10:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[image] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/11/2022 2:10:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[image] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 12/11/2022 2:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Percentage] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[ProductId] [int] NOT NULL,
	[CreateBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 12/11/2022 2:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/11/2022 2:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[OrderStatus] [nvarchar](25) NOT NULL,
	[Note] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductEvalutions]    Script Date: 12/11/2022 2:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductEvalutions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Evalution] [int] NULL,
	[Comment] [nvarchar](250) NULL,
	[ProductId] [int] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Status] [bit] NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductLikes]    Script Date: 12/11/2022 2:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductLikes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsLiked] [bit] NULL,
	[ProductId] [int] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhotos]    Script Date: 12/11/2022 2:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhotos](
	[Id] [varchar](100) NOT NULL,
	[ProductId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/11/2022 2:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
	[Discription] [nvarchar](max) NULL,
	[Quantity] [int] NULL,
	[isDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/11/2022 2:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [PhoneNumber], [Email], [Photo], [IsDeleted], [Address]) VALUES (N'0328162039', N'123', N'', N'', N'', N'', 1, N'')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [PhoneNumber], [Email], [Photo], [IsDeleted], [Address]) VALUES (N'dang', N'123', N'', N'', N'', N'', 1, N'')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [PhoneNumber], [Email], [Photo], [IsDeleted], [Address]) VALUES (N'datnq', N'123', N'Nguyễn Quốc Đạt', N'0988828888', N'datGoVap@gmail.com', N'dat.jpg', 0, N'Bến Tre')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [PhoneNumber], [Email], [Photo], [IsDeleted], [Address]) VALUES (N'duylnk', N'123456', N'Lê Nguyễn Khánh Duy', N'0969111506', N'duy@gmail.com', N'b6097b5e.jpg', 0, N'zxc. Xã Mỹ Thắng, Huyện Phù Mỹ, Bình Định')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [PhoneNumber], [Email], [Photo], [IsDeleted], [Address]) VALUES (N'haonqn', N'123', N'Nguyễn Quang Nhật Hào', N'0988828888', N'hao@gmail.com', N'hao.jpg', 0, N'An Giang')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [PhoneNumber], [Email], [Photo], [IsDeleted], [Address]) VALUES (N'hieulq', N'123', N'Lữ Quang Hiếu', N'0988828888', N'hieu@gmail.com', N'hieu.jpg', 0, N'Bến Tre')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [PhoneNumber], [Email], [Photo], [IsDeleted], [Address]) VALUES (N'lenhatduy', N'123', N'Lê Nhật Duy', N'', N'duylenhat@gmail.com', N'', 0, N'')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [PhoneNumber], [Email], [Photo], [IsDeleted], [Address]) VALUES (N'phuocnhh', N'123', N'NNguyễn Hữu Hải Phước', N'0988828888', N'phuoc@gmail.com', N'phuoc.jpg', 0, N'Bình Phước')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [PhoneNumber], [Email], [Photo], [IsDeleted], [Address]) VALUES (N'thangtq', N'123', N'Trần Quốc Thắng', N'0375273901', N'tranquocthang972002@gmail.com', N'anhdd.jpg', 1, N'Tổ 10 Ấp Núi Két. Xã Thới Sơn, Huyện Tịnh Biên, An Giang, ')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [PhoneNumber], [Email], [Photo], [IsDeleted], [Address]) VALUES (N'thangtqps15783@fpt.edu.vn', N'1847a2439eb', N'Tran Quoc Thang (FPL HCM_K16)', N'', N'', N'anhdaidien.png', 1, N'')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [PhoneNumber], [Email], [Photo], [IsDeleted], [Address]) VALUES (N'thihienl870@gmail.com', N'111', N'thi hien le', N'0375273933', N'thihienl870@gmail.com', N'1.jpg', 1, N'ABC. Xã Phước Lộc, Huyện Tuy Phước, Bình Định')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [PhoneNumber], [Email], [Photo], [IsDeleted], [Address]) VALUES (N'tranquocthang972002@gmail.com', N'12345', N'Trần Quốc Thắng', N'', N'', N'', 1, N'VVV. Xã Khánh Thuận, Huyện U Minh, Huyện U Minh, ')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [PhoneNumber], [Email], [Photo], [IsDeleted], [Address]) VALUES (N'user1', N'123', N'Na', N'0988828888', N'na@gmail.com', N'na.jpg', 0, NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [PhoneNumber], [Email], [Photo], [IsDeleted], [Address]) VALUES (N'vanduale4@gmail.com', N'321', N'van dua le', N'6009691115', N'vanduale4@gmail.com', N'nen.jpg', 1, N'')
SET IDENTITY_INSERT [dbo].[Authorities] ON 

INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (1, N'duylnk', N'ADMIN')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (2, N'user1', N'USER')
SET IDENTITY_INSERT [dbo].[Authorities] OFF
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([Id], [IsDeleted], [Name], [image]) VALUES (1, 0, N'Laptop Dell', N'6effc912.jpg')
INSERT [dbo].[Brands] ([Id], [IsDeleted], [Name], [image]) VALUES (2, 0, N'Laptop Asus', N'brands_asus.jpg')
INSERT [dbo].[Brands] ([Id], [IsDeleted], [Name], [image]) VALUES (3, 0, N'Laptop HP', N'brands_hp.jpg')
INSERT [dbo].[Brands] ([Id], [IsDeleted], [Name], [image]) VALUES (4, 0, N'Laptop MSI', N'brands_msi.jpg')
INSERT [dbo].[Brands] ([Id], [IsDeleted], [Name], [image]) VALUES (5, 0, N'Laptop LG', N'brands_lg.jfif')
INSERT [dbo].[Brands] ([Id], [IsDeleted], [Name], [image]) VALUES (6, 0, N'Laptop Lenovo', N'brands_lenovo.jpg')
INSERT [dbo].[Brands] ([Id], [IsDeleted], [Name], [image]) VALUES (7, 0, N'Laptop Acer', N'brands_acer.png')
INSERT [dbo].[Brands] ([Id], [IsDeleted], [Name], [image]) VALUES (8, 0, N'Laptop Intel', N'brands_intel.png')
INSERT [dbo].[Brands] ([Id], [IsDeleted], [Name], [image]) VALUES (9, 0, N'Laptop Avita', N'brands_avita.png')
INSERT [dbo].[Brands] ([Id], [IsDeleted], [Name], [image]) VALUES (10, 0, N'Phụ Kiện LapTop', N'f007f387.jpg')
INSERT [dbo].[Brands] ([Id], [IsDeleted], [Name], [image]) VALUES (12, 1, N'Laptop cu', N'ee7b029c.jpg')
INSERT [dbo].[Brands] ([Id], [IsDeleted], [Name], [image]) VALUES (14, 1, N'mpoi', N'8c3664c9.jpg')
INSERT [dbo].[Brands] ([Id], [IsDeleted], [Name], [image]) VALUES (16, 0, N'Quoc Thang', N'c4f6f941.jpg')
SET IDENTITY_INSERT [dbo].[Brands] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [IsDeleted], [image]) VALUES (1, N'Laptop', 0, N'lap_lg_1.jpg')
INSERT [dbo].[Categories] ([Id], [Name], [IsDeleted], [image]) VALUES (2, N'Phụ kiện Laptop', 0, N'danhmuc_phukien.jpg')
INSERT [dbo].[Categories] ([Id], [Name], [IsDeleted], [image]) VALUES (3, N'Thiết bị lưu trữ, dự phòng', 0, N'danhmuc_thietbiluutru.jpg')
INSERT [dbo].[Categories] ([Id], [Name], [IsDeleted], [image]) VALUES (4, N'Thiết bị nghe nhìn', 0, N'danhmuc_thietbinghenhin.png')
INSERT [dbo].[Categories] ([Id], [Name], [IsDeleted], [image]) VALUES (5, N'Linh kiện máy tính', 0, N'danhmuc_linhkienmaytinh.jpg')
INSERT [dbo].[Categories] ([Id], [Name], [IsDeleted], [image]) VALUES (6, N'Apple chính hãng', 0, N'danhmuc_applechinhhang.jpg')
INSERT [dbo].[Categories] ([Id], [Name], [IsDeleted], [image]) VALUES (7, N'Thiết bị ngoại vi', 0, N'danhmuc_thietbingoaivi.png')
INSERT [dbo].[Categories] ([Id], [Name], [IsDeleted], [image]) VALUES (8, N'Thiết bị mạng, Phần mềm', 0, N'danhmuc_thietbimang.jpg')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Discounts] ON 

INSERT [dbo].[Discounts] ([Id], [Percentage], [CreateDate], [EndDate], [ProductId], [CreateBy]) VALUES (2, 8, CAST(N'2022-10-04T00:00:00.000' AS DateTime), CAST(N'2022-12-30T00:00:00.000' AS DateTime), 2, N'duylnk')
INSERT [dbo].[Discounts] ([Id], [Percentage], [CreateDate], [EndDate], [ProductId], [CreateBy]) VALUES (4, 3, CAST(N'2022-10-04T00:00:00.000' AS DateTime), CAST(N'2022-12-30T00:00:00.000' AS DateTime), 3, N'duylnk')
INSERT [dbo].[Discounts] ([Id], [Percentage], [CreateDate], [EndDate], [ProductId], [CreateBy]) VALUES (5, 6, CAST(N'2022-10-04T00:00:00.000' AS DateTime), CAST(N'2022-12-30T00:00:00.000' AS DateTime), 7, N'duylnk')
INSERT [dbo].[Discounts] ([Id], [Percentage], [CreateDate], [EndDate], [ProductId], [CreateBy]) VALUES (6, 10, CAST(N'2022-10-04T00:00:00.000' AS DateTime), CAST(N'2022-12-30T00:00:00.000' AS DateTime), 11, N'duylnk')
INSERT [dbo].[Discounts] ([Id], [Percentage], [CreateDate], [EndDate], [ProductId], [CreateBy]) VALUES (7, 15, CAST(N'2022-10-04T00:00:00.000' AS DateTime), CAST(N'2022-12-30T00:00:00.000' AS DateTime), 16, N'duylnk')
INSERT [dbo].[Discounts] ([Id], [Percentage], [CreateDate], [EndDate], [ProductId], [CreateBy]) VALUES (8, 7, CAST(N'2022-10-04T00:00:00.000' AS DateTime), CAST(N'2022-12-30T00:00:00.000' AS DateTime), 9, N'duylnk')
INSERT [dbo].[Discounts] ([Id], [Percentage], [CreateDate], [EndDate], [ProductId], [CreateBy]) VALUES (10, 12, CAST(N'2022-10-04T00:00:00.000' AS DateTime), CAST(N'2022-12-30T00:00:00.000' AS DateTime), 20, N'duylnk')
INSERT [dbo].[Discounts] ([Id], [Percentage], [CreateDate], [EndDate], [ProductId], [CreateBy]) VALUES (11, 5, CAST(N'2022-10-04T00:00:00.000' AS DateTime), CAST(N'2022-12-30T00:00:00.000' AS DateTime), 1, N'duylnk')
INSERT [dbo].[Discounts] ([Id], [Percentage], [CreateDate], [EndDate], [ProductId], [CreateBy]) VALUES (12, 2, CAST(N'2022-12-10T16:57:35.210' AS DateTime), CAST(N'2022-12-10T16:57:35.210' AS DateTime), 12, N'duylnk')
SET IDENTITY_INSERT [dbo].[Discounts] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (240, 122, 2, 17102800, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (241, 123, 2, 17102800, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (242, 124, 2, 17102800, 3)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [OrderStatus], [Note]) VALUES (122, N'thangtq', CAST(N'2022-12-07T00:00:00.000' AS DateTime), N'aaa. Xã Nhơn Hưng, Huyện Tịnh Biên, An Giang, ', N'Đã giao', N'')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [OrderStatus], [Note]) VALUES (123, N'thangtq', CAST(N'2022-12-07T00:00:00.000' AS DateTime), N'asd. Xã Vĩnh Châu, Thành phố Châu Đốc, An Giang, ', N'Đã giao', N'')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [OrderStatus], [Note]) VALUES (124, N'thangtq', CAST(N'2022-12-07T00:00:00.000' AS DateTime), N'AVC. Xã Phúc Tuy, Huyện Lạc Sơn, Hòa Bình, ', N'Chưa xác nhận', N'')
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[ProductEvalutions] ON 

INSERT [dbo].[ProductEvalutions] ([Id], [Evalution], [Comment], [ProductId], [Username], [Status], [CreateDate]) VALUES (2, 5, N'AAA', 2, N'thangtq', 0, CAST(N'2022-11-15T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductEvalutions] ([Id], [Evalution], [Comment], [ProductId], [Username], [Status], [CreateDate]) VALUES (4, 5, N'Hàng xịn quá', 70, N'thangtq', 1, CAST(N'2022-11-15T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductEvalutions] ([Id], [Evalution], [Comment], [ProductId], [Username], [Status], [CreateDate]) VALUES (5, 4, N'Hàng tốt ạ ', 1, N'thangtq', 1, CAST(N'2022-11-15T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductEvalutions] ([Id], [Evalution], [Comment], [ProductId], [Username], [Status], [CreateDate]) VALUES (6, 5, N'Xinh', 1, N'thihienl870@gmail.com', 1, CAST(N'2022-11-15T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductEvalutions] ([Id], [Evalution], [Comment], [ProductId], [Username], [Status], [CreateDate]) VALUES (7, 3, N'Tạm ok', 1, N'vanduale4@gmail.com', 1, CAST(N'2022-11-15T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductEvalutions] ([Id], [Evalution], [Comment], [ProductId], [Username], [Status], [CreateDate]) VALUES (8, 5, N'Tym', 1, N'thangtq', 1, CAST(N'2022-11-15T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductEvalutions] ([Id], [Evalution], [Comment], [ProductId], [Username], [Status], [CreateDate]) VALUES (9, 5, N'OK ok', 1, N'thangtqps15783@fpt.edu.vn', 1, CAST(N'2022-11-15T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductEvalutions] ([Id], [Evalution], [Comment], [ProductId], [Username], [Status], [CreateDate]) VALUES (10, 5, N'Hàng ngon', 1, N'thangtqps15783@fpt.edu.vn', 1, CAST(N'2022-11-15T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductEvalutions] ([Id], [Evalution], [Comment], [ProductId], [Username], [Status], [CreateDate]) VALUES (11, 5, N'gggg', 6, N'thangtqps15783@fpt.edu.vn', 1, CAST(N'2022-11-15T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductEvalutions] ([Id], [Evalution], [Comment], [ProductId], [Username], [Status], [CreateDate]) VALUES (21, 5, N'test', 1, N'thangtq', 1, CAST(N'2022-11-17T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductEvalutions] ([Id], [Evalution], [Comment], [ProductId], [Username], [Status], [CreateDate]) VALUES (22, 5, N'TYM', 1, N'thangtq', 1, CAST(N'2022-11-23T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductEvalutions] ([Id], [Evalution], [Comment], [ProductId], [Username], [Status], [CreateDate]) VALUES (23, 5, N'TYM', 7, N'thangtq', 1, CAST(N'2022-12-07T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductEvalutions] ([Id], [Evalution], [Comment], [ProductId], [Username], [Status], [CreateDate]) VALUES (24, 5, N'duy', 1, N'thangtq', 1, CAST(N'2022-12-07T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductEvalutions] OFF
SET IDENTITY_INSERT [dbo].[ProductLikes] ON 

INSERT [dbo].[ProductLikes] ([Id], [IsLiked], [ProductId], [Username]) VALUES (1, 1, 1, N'user1')
SET IDENTITY_INSERT [dbo].[ProductLikes] OFF
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_acer_1_1.jpg', 31)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_acer_1_2.jpg', 31)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_acer_1_3.jpg', 31)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_acer_2_1.jpg', 32)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_acer_2_2.jpg', 32)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_acer_2_3.jpg', 32)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_acer_3_1.jpg', 33)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_acer_3_2.jpg', 33)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_acer_3_3.jpg', 33)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_acer_4_1.jpg', 34)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_acer_4_2.jpg', 34)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_acer_4_3.jpg', 34)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_acer_5_1.jpg', 35)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_acer_5_2.jpg', 35)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_acer_5_3.jpg', 35)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_asus_1_1.jpg', 1)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_asus_1_2.jpg', 1)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_asus_1_3.jpg', 1)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_asus_2_1.jpg', 2)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_asus_2_2.jpg', 2)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_asus_2_3.jpg', 2)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_asus_3_1.jpg', 3)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_asus_3_2.jpg', 3)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_asus_3_3.jpg', 3)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_asus_4_1.jpg', 4)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_asus_4_2.jpg', 4)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_asus_4_3.jpg', 4)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_asus_5_1.jpg', 5)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_asus_5_2.jpg', 5)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_asus_5_3.jpg', 5)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_avita_1_1.jpg', 38)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_avita_1_2.jpg', 38)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_avita_1_3.jpg', 38)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_avita_2_1.jpg', 39)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_avita_2_2.jpg', 39)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_avita_2_3.jpg', 39)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_avita_3_1.jpg', 40)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_avita_3_2.jpg', 40)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_avita_3_3.jpg', 40)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_dell_1_1.jpg', 6)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_dell_1_2.jpg', 6)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_dell_1_3.jpg', 6)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_dell_2_1.jpg', 7)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_dell_2_2.jpg', 7)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_dell_2_3.jpg', 7)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_dell_3_1.jpg', 8)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_dell_3_2.jpg', 8)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_dell_3_3.jpg', 8)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_dell_4_1.jpg', 9)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_dell_4_2.jpg', 9)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_dell_4_3.jpg', 9)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_dell_5_1.jpg', 10)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_dell_5_2.jpg', 10)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_dell_5_3.jpg', 10)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_hp_1_1.jpg', 11)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_hp_1_2.jpg', 11)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_hp_1_3.jpg', 11)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_hp_2_1.jpg', 12)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_hp_2_2.jpg', 12)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_hp_2_3.jpg', 12)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_hp_3_1.jpg', 13)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_hp_3_2.jpg', 13)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_hp_3_3.jpg', 13)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_hp_4_1.jpg', 14)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_hp_4_2.jpg', 14)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_hp_4_3.jpg', 14)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_hp_5_1.jpg', 15)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_hp_5_2.jpg', 15)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_hp_5_3.jpg', 15)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_intel_1_1.jpg', 36)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_intel_1_2.jpg', 36)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_intel_1_3.jpg', 36)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_intel_2_1.jpg', 37)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_intel_2_2.jpg', 37)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_intel_2_3.jpg', 37)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_le_1_1.jpg', 26)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_le_1_2.jpg', 26)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_le_1_3.jpg', 26)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_le_2_1.jpg', 27)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_le_2_2.jpg', 27)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_le_2_3.jpg', 27)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_le_3_1.jpg', 28)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_le_3_2.jpg', 28)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_le_3_3.jpg', 28)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_le_4_1.jpg', 29)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_le_4_2.jpg', 29)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_le_4_3.jpg', 29)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_le_5_1.jpg', 30)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_le_5_2.jpg', 30)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_le_5_3.jpg', 30)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_lg_1_1.jpg', 21)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_lg_1_2.jpg', 21)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_lg_1_3.jpg', 21)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_lg_2_1.jpg', 22)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_lg_2_2.jpg', 22)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_lg_2_3.jpg', 22)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_lg_3_1.jpg', 23)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_lg_3_2.jpg', 23)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_lg_3_3.jpg', 23)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_lg_4_1.jpg', 24)
GO
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_lg_4_2.jpg', 24)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_lg_4_3.jpg', 24)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_lg_5_1.jpg', 25)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_lg_5_2.jpg', 25)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_lg_5_3.jpg', 25)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_msi_1_1.jpg', 16)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_msi_1_2.jpg', 16)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_msi_1_3.jpg', 16)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_msi_2_1.jpg', 17)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_msi_2_2.jpg', 17)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_msi_2_3.jpg', 17)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_msi_3_1.jpg', 18)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_msi_3_2.jpg', 18)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_msi_3_3.jpg', 18)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_msi_4_1.jpg', 19)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_msi_4_2.jpg', 19)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_msi_4_3.jpg', 19)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_msi_5_1.jpg', 20)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_msi_5_2.jpg', 20)
INSERT [dbo].[ProductPhotos] ([Id], [ProductId]) VALUES (N'lap_msi_5_3.jpg', 20)
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (1, N'Laptop Asus Vivobook A415EA-EB1750W', N'lap_asus_1.jpg', 11490000, CAST(N'2022-10-04' AS Date), 0, 1, 2, N'CPU Intel Core i3-1125G4 (8MB, up to 3.70GHz,)
Ram 8GB DDR4 onboard,
SSD 256GB M.2 NVMe PCIe 3.0,
VGA Intel UHD Graphics,
Display 14.0Inch FHD IPS Anti-Glare,
Pin 3Cell 42WHrs,
Finger Print,
Color Transparent Silver (B?c),
Weight 1.40 kg,
OS Windows 11 Home 64 bits', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (2, N'Laptop Asus Vivobook 15X OLED A1503ZA-L1421W', N'lap_asus_2.jpg', 18590000, CAST(N'2022-10-04' AS Date), 0, 1, 2, N'CPU Intel® Core™ i5-12500H Processor (18MB cache, up to 4.5GHz), 
Ram 8GB DDR4 Onboard, 
SSD 512GB M.2 NVMe™ PCIe® 3.0, 
VGA Intel® Iris® Xe Graphics, 
Display 15.6Inch OLED FHD (1920 x 1080) 16:9, 0.2ms, 600nits, 100% DCI-P3 color gamut, PANTONE Validated, 
Pin 3Cell Li-ion, 70WHrs, 
Tính nang Finger Print, 
Backlit Chiclet Keyboard, 
Color Silver (B?c), 
Weight 1.70 kg, 
OS Windows 11 Home SL', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (3, N'Laptop Asus ZenBook 13 OLED UX325EA-KG656W', N'lap_asus_3.jpg', 18490000, CAST(N'2022-10-04' AS Date), 0, 1, 2, N'CPU Intel Core i5-1135G7 (8MB, upto 4.20GHz), 
RAM 8GB LPDDR4X 4266MHz onboard, 
SSD 512GB M.2 NVMe PCIe 3.0, 
Display 13.3Inch FHD WV OLED 400nits Glare, 
VGA Intel Iris Xe Graphics, 
Pin 4Cell 67WHrs, 
Color Pine Grey (Xám thông), 
Weight 1.11 kg, 
OS Windows 11 Home SL', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (4, N'Laptop Gaming ASUS TUF Dash F15 FX517ZM-HN480W', N'lap_asus_4.jpg', 29890000, CAST(N'2022-10-04' AS Date), 0, 1, 2, N'CPU Intel® Core™ i7-12650H Processor (24MB Cache, up to 4.70GHz), 
RAM 8GB DDR5-4800Mhz SO-DIMM (2 slots So-Dimm), 
SSD 512GB M.2 NVMe PCIe 3.0, 
VGA NVIDIA® GeForce RTX™ 3060 6GB GDDR6 + Intel® Iris X? Graphics, 
Display 15.6inch FHD IPS, Anti-Glare, 144Hz, AdaptiveSync, 
Pin 4-cell Li-ion, 76WHrs, 4S1P, 
Weight 2.00 kg, 
Color Black (Ðen), 
OS Windows 11 Home SL', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (5, N'Laptop Asus X515EA-BQ3015W 46890', N'lap_asus_5.jpg', 15990000, CAST(N'2022-10-04' AS Date), 0, 1, 2, N'CPU Intel® Core™ i7-1165G7 (12MB, upto 4.70GHz), 
RAM 8GB DDR4 3200Mhz, 
SSD 512GB M.2 NVMe PCIe, 
Display 15.6Inch FHD Anti-Glare 45%NTSC, 
VGA Intel Iris Xe Graphics, 
Pin 2Cell 37WHrs, 
Color B?c, 
Finger Print, 
Weight 1.80 kg, 
OS Windows 11 Home SL', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (6, N'Laptop Dell Latitude 3520 70267108', N'lap_dell_1.jpg', 11350000, CAST(N'2022-10-04' AS Date), 0, 1, 1, N'CPU Intel Core i3-1115G4 (6MB, up to 4.10GHz), 
RAM 4GB DDR4 3200MHz, 
SSD 256GB M.2 PCIe NVMe Gen3 x4, 
VGA Intel UHD Graphics, 
Display 15.6Inch FHD WVA Anti-glare 60Hz, 
Pin 3Cell 41WHrs, 
Color Black (Ðen), 
Weight 1.79 kg, 
OS Windows 11 Home', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (7, N'Laptop Dell Latitude 3420 70264504', N'lap_dell_2.jpg', 11250000, CAST(N'2022-10-04' AS Date), 0, 1, 1, N'CPU Intel Core i3-1115G4 (6MB, 3.0GHz up to 4.10GHz), 
RAM 4GB DDR4 3200MHz, 
SSD 256GB M.2 PCIe NVMe, 
VGA Intel UHD Graphics, 
Display 14inch FHD Anti-Glare, 
Camera & Microphone, 
Pin 3Cell 41WHrs, 
Color Black (Ðen), 
Weight 1.52 kg, 
OS Windows 10 Home', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (8, N'Laptop Dell Inspiron 3511 70270652', N'lap_dell_3.jpg', 22090000, CAST(N'2022-10-04' AS Date), 0, 1, 1, N'CPU Intel Core i7-1165G7 (12MB, up to 4.70GHz), 
RAM 16GB DDR4 3200MHz (8GB + 8GB AKC t?ng), 
SSD 512GB M.2 PCIe NVMe, 
VGA NVIDIA GeForce MX350 2GB GDDR5, 
Display 15.6Inch FHD WVA Anti-Glare 60Hz, 
Pin 3Cell 41WHrs, 
Color Platinum Silver (B?c), 
Finger Print, 
Weight 1.85 kg, 
OS Windows 11 Home + Office 2021', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (9, N'Laptop Gaming Dell G15 5515 70266675', N'lap_dell_4.jpg', 25990000, CAST(N'2022-10-04' AS Date), 0, 1, 1, N'CPU AMD Ryzen R7-5800H (16MB, up to 4.40GHz), 
RAM 16GB DDR4 3200MHz (2x8GB), 
SSD 512GB M.2 PCIe NVMe, 
VGA NVIDIA GeForce RTX 3050Ti 4GB GDDR6, 
Display 15.6Inch FHD WVA Anti-Glare 120Hz, 
Pin 3Cell 56WHrs, 
Color Phantom Grey (Xám), 
English Single Backlit Keyboard, 
Weight 2.57 kg, 
OS Windows 11 Home + Office HS 2021', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (10, N'Laptop Gaming Dell Alienware M15 R6 P109F001ABL', N'lap_dell_5.jpg', 53990000, CAST(N'2022-10-04' AS Date), 0, 1, 1, N'CPU Intel Core i7-11800H (24MB, up to 4.60GHz), 
RAM 32GB DDR4 3200MHz, 
SSD 1TB M.2 PCIe NVMe, 
VGA NVIDIA GeForce RTX 3060 6GB GDDR6, 
Display 15.6Inch QHD WVA 240Hz 2ms, 
Pin 6Cell 86WHrs, 
Color Ðen Xám, 
Alienware CherryMX ultra low-profile mechanical keyboard with per-key AlienFX RGB - US/International, 
Weight 2.69 kg, 
OS Windows 10 Home + Office HS 2019', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (11, N'Laptop HP ProBook 440 G9 6M0X8PA', N'lap_hp_1.jpg', 24990000, CAST(N'2022-10-04' AS Date), 0, 1, 3, N'CPU Intel Core i7-1255U (12MB, up to 4.70GHz), 
RAM 16GB DDR4 3200MHz, 
SSD 512GB PCIe NVMe M.2, 
Display 14.0Inch FHD (1920 x 1080) LED UWVA Anti-Glare, 250nits, 
VGA Intel Iris Xe Graphics, 
Pin 3Cell 45WHrs, 
Color Silver (B?c), 
Finger Print, 
Weight 1.38 kg, 
OS Windows 11 Home 64', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (12, N'Laptop HP Pavilion X360 14-ek0055TU 6L293PA', N'lap_hp_2.jpg', 24390000, CAST(N'2022-10-04' AS Date), 0, 1, 3, N'CPU Intel Core i7-1255U (12MB, upto 4.70GHz), 
RAM 16GB DDR4 3200MHz Onboard, 
SSD 512GB PCIe® NVMe™ M.2, 
Display 14Inch FHD (1920 x 1080) Touch, IPS, edge-to-edge glass, micro-edge, 250 nits, 45% NTSC, 
VGA Intel® Iris® Xe Graphics, 
Pin 3Cell 43WHrs, 
Color Vàng H?ng, 
Weight 1.5 kg, 
Tính nang: B?o m?t vân tay, 
OS Windows 11 Home SL', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (13, N'Laptop HP VICTUS 16-e0177AX 4R0U9PA', N'lap_hp_3.jpg', 15690000, CAST(N'2022-10-04' AS Date), 0, 1, 3, N'CPU AMD Ryzen R5-5600H (16MB, up to 4.20GHz), 
RAM 8GB DDR4 3200MHz (2x4GB), 
SSD 512GB PCIe NVMe M.2, 
Display 16.1Inch FHD IPS 144Hz Anti-glare, 
VGA NVIDIA GeForce GTX 1650 4GB GDDR6, 
Pin 4Cell 70WHrs, 
Color Ðen, 
Weight 2.46 kg, 
OS Windows 11 Home 64', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (14, N'Laptop HP Probook 450 G9 6M0Z9PA Sliver', N'lap_hp_4.jpg', 25190000, CAST(N'2022-10-04' AS Date), 0, 1, 3, N'CPU Intel Core i7-1255U (12MB, up to 4.740GHz), 
RAM 16GB DDR4 3200MHz, 
SSD 512GB PCIe NVMe, 
Display 15.6Inch FHD Anti-Glare, 
VGA Intel® Iris® X? Graphics, 
Pin 3Cell 45WHrs, 
Color Silver (B?c), 
V? Alu, Led Keyboard, 
Finger Print, 
Weight 1.74 kg, 
OS Windows 11 SL', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (15, N'Laptop HP Probook 450 G8 2H0W5PA', N'lap_hp_5.jpg', 23890000, CAST(N'2022-10-04' AS Date), 0, 1, 3, N'CPU Intel Core i7-1165G7 (12MB, up to 4.70GHz), 
RAM 8GB DDR4 3200MHz (1x8GB), 
SSD 512GB PCIe NVMe, 
Display 15.6Inch FHD IPS Anti-Glare, 
VGA Intel Iris X? Graphics, 
Pin 3Cell 45WHrs, 
Color Silver (B?c), 
V? Alu, Led Keyboard, 
Fingerprint, 
Weight 1.74 kg, 
OS Windows 10 SL', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (16, N'Laptop MSI Modern 15 A11MU 680VN', N'lap_msi_1.jpg', 14290000, CAST(N'2022-10-04' AS Date), 0, 1, 4, N'CPU Intel Core i5-1155G7 (8MB, up to 4.50GHz), 
RAM 16GB DDR4 3200MHz (8G + 8GB AKC t?ng), 
SSD 512GB NVMe PCIe Gen3x4, 
VGA Intel Iris Xe Graphics, 
Display 15.6inch FHD IPS 60Hz 45%NTSC, 
Color Carbon Gray (Xám), 
Pin 3Cell 39WHrs, 
Weight 1.60 kg, 
OS Windows 10 Home', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (17, N'Laptop MSI GF63 Thin 11SC 665VN', N'lap_msi_2.jpg', 16390000, CAST(N'2022-10-04' AS Date), 0, 1, 4, N'CPU Intel Core i5-11400H (12MB, up to 4.50GHz), 
RAM 8GB DDR4 3200MHz, 
SSD 512GB NVMe PCIe, 
VGA NVIDIA GeForce GTX 1650 Max-Q 4GB GDDR6, 
Display 15.6Inch FHD IPS 144Hz 45%NTSC, 
Pin 3Cell 51WHrs, 
Color Black (Ðen), 
Backlight Keyboard (Single-Color, Red), 
Weight 1.86 kg, 
OS Windows 11 Home', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (18, N'Laptop MSI GS66 Stealth 11UG 210VN', N'lap_msi_3.jpg', 64990000, CAST(N'2022-10-04' AS Date), 0, 1, 4, N'CPU Intel Core i7-11800H (24MB, up to 4.60GHz), 
RAM 32GB DDR4 3200MHz (2x16GB), 
SSD 2TB NVMe PCIe Gen4x4, 
VGA NVIDIA GeForce RTX 3070 Max-Q 8GB GDDR6, 
Display 15.6Inch FHD 360Hz 100%sRGB, 
Pin 4Cell 99.9WHrs, 
Per key RGB steelseries Keyboard, 
Color Core Black (Ðen), 
Weight 2.10 kg, 
OS Windows 10 Home SEA', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (19, N'Laptop MSI Katana GF66 12UCK 804VN', N'lap_msi_4.jpg', 26990000, CAST(N'2022-10-04' AS Date), 0, 1, 4, N'CPU Intel Core i7-12650H (24MB, up to 4.70GHz), 
RAM 16GB DDR4 3200MHz (2x8GB), 
SSD 512GB NVMe PCIe Gen3x4, 
VGA NVIDIA GeForce RTX 3050 4GB GDDR6, 
Display 15.6Inch FHD IPS 144Hz 45%NTSC, 
Pin 3Cell 53.5WHrs, 
Color Black (Ðen), 
RGB Keyboard, 
Weight 2.25 kg, 
OS Windows 11 Home', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (20, N'Laptop MSI Titan GT77 12UHS 204VN', N'lap_msi_5.jpg', 127390000, CAST(N'2022-10-04' AS Date), 0, 1, 4, N'CPU Intel Core i9-12900HX (30MB, up to 5.00GHz), 
RAM 64GB DDR5 4800MHz (2x32GB), 
SDD 2TB NVMe PCIe Gen4x4, 
VGA NVIDIA GeForce RTX 3080Ti 16GB GDDR6, 
Display 17.3Inch UHD 120Hz 100%DCI-P3, 
Pin 4Cell 99.9WHrs, 
Color Core Black, 
Weight 3.30 kg, 
OS Windows 11 Home', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (21, N'Laptop LG Gram 2021 17Z90P-G.AH78A5', N'lap_lg_1.jpg', 39290000, CAST(N'2022-10-04' AS Date), 0, 1, 5, N'CPU Intel Core i7-1165G7 (12MB, upto 4.70GHz), 
RAM 16GB LPDDR4X 4266MHz Onboard, 
SSD 1TB PCIe NVMe M.2, 
Display 17.0Inch WQXGA 16:10 IPS, 
VGA Intel Iris Xe Graphics, 
Pin 80WHr, 
Color Obsidian Black (Ðen), 
Finger Print, 
Weight 1.35 kg, 
OS Windows 10 Home', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (22, N'Laptop LG Gram 2022 16ZD90Q-G.AX72A5', N'lap_lg_2.jpg', 38390000, CAST(N'2022-10-04' AS Date), 0, 1, 5, N'CPU Intel Core i7-1260P (18MB, up to 4.70GHz), 
RAM 16GB LPDDR5 5200MHz, 
SSD 256GB PCIe NVMe M.2, 
Display 16.0Inch WQXGA 16:10 IPS PoL 99%DCI-P3 350nits, 
VGA Intel Iris Xe Graphics, 
Pin 80WHrs, 
Color Obsidian Black (Ðen), 
Finger Print, 
Weight 1199 g, 
No OS', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (23, N'Laptop LG Gram 2022 14Z90Q-G.AJ32A5', N'lap_lg_3.jpg', 24890000, CAST(N'2022-10-04' AS Date), 0, 1, 5, N'CPU Intel Core i3-12th, 
RAM 8GB LPDDR5 5200MHz, 
SSD 256GB PCIe NVMe M.2, 
Display 14.0Inch WUXGA 16:10 IPS PoL 99%DCI-P3 350nits, 
VGA Intel UHD Graphics, 
Pin 72WHrs, 
Color Obsidian Black (Ðen), 
Finger Print, 
Weight 999 g, 
OS Windows 11 Home', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (24, N'Laptop LG Gram 2022 17Z90Q-G.AH78A5', N'lap_lg_4.jpg', 45590000, CAST(N'2022-10-04' AS Date), 0, 1, 5, N'CPU Intel Core i7-1260P (18MB, up to 4.70GHz), 
RAM 16GB LPDDR5 5200MHz, 
SSD 1TB PCIe NVMe M.2, 
Display 17.0Inch WQXGA 16:10 IPS PoL 99%DCI-P3 350nits, 
VGA Intel Iris Xe Graphics, 
Pin 80WHrs, 
Color Obsidian Black (Ðen), 
Finger Print, 
Weight 1350 g, 
OS Windows 11 Home', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (25, N'Laptop LG Gram 2022 14ZD90Q-G.AX31A5', N'lap_lg_5.jpg', 22190000, CAST(N'2022-10-04' AS Date), 0, 1, 5, N'CPU Intel Core i3-12th, 
RAM 8GB LPDDR5 5200MHz, 
SSD 256GB PCIe NVMe M.2, 
Display 14.0Inch WUXGA 16:10 IPS PoL 99%DCI-P3 350nits, 
VGA Intel UHD Graphics, 
Pin 72WHrs, 
Color White (Tr?ng Tuy?t), 
Finger Print, 
Weight 999 g, 
No OS', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (26, N'Laptop Lenovo ThinkPad E14 Gen 4 21E300DQVA', N'lap_le_1.jpg', 18790000, CAST(N'2022-10-04' AS Date), 0, 1, 6, N'CPU Intel Core i5-1235U (12MB Cache, upto 4.40GHz), 
RAM 8GB DDR4 3200MHz Onboard, 
SSD 256GB M.2 2242 PCIe 4.0x4 NVMe Opal2, 
VGA Intel Iris Xe Graphics, 
Display 14.0Inch FHD IPS 300nits Anti-glare, 45% NTSC, 
Pin 3Cell 45WHrs, 
Color Black (Ðen), 
Finger Print, 
Weight 1.64kg, 
OS No OS', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (27, N'Laptop Lenovo ThinkBook 13s G2 ITL 20V900E2VN', N'lap_le_2.jpg', 16990000, CAST(N'2022-10-04' AS Date), 0, 1, 6, N'CPU Intel Core i7-1165G7 (12MB, up to 4.70GHz), 
RAM 8GB LPDDR4x 4266MHz Onboard, 
SSD 512GB M.2 2242 PCIe 3.0x4 NVMe, 
VGA Intel Iris Xe Graphics, 
Display 13.3Inch WQXGA IPS 300nits Anti-glare, 100% sRGB, Dolby Vision, 
Pin 4Cell 56WHrs, 
Color Mineral Grey (Xám), 
Finger Print, 
Weight 1.26 kg, 
OS Windows 11 Home 64 bits', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (28, N'Laptop Lenovo ThinkPad X1 Nano Gen 1 20UN00B6VN', N'lap_le_3.jpg', 35990000, CAST(N'2022-10-04' AS Date), 0, 1, 6, N'CPU Intel® Core i5-1130G7 (8MB Cache, up to 4.0GHz), 
RAM 8GB LPDDR4 Onboard, 
SSD 512GB PCIe, 
VGA Intel®Iris®Xe Graphics, 
Display 13.0Inch 2K(2160 x 1350) Dolby Vision, 450 nit, sRGB 100%, 
Pin 3Cell 48WHrs, 
Color Black (Ðen), 
Finger Print, 
Weight 962g, 
OS Windows 11 Pro 64 bits', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (29, N'Laptop Lenovo ThinkBook 13s G2 ITL 20V900E0VN', N'lap_le_4.jpg', 13990000, CAST(N'2022-10-04' AS Date), 0, 1, 6, N'CPU Intel Core i5-1135G7 (8MB, up to 4.20GHz), 
RAM 8GB LPDDR4x 4266MHz Onboard, 
SSD 256GB M.2 2242 PCIe 3.0x4 NVMe, 
VGA Intel Iris Xe Graphics, 
Display 13.3Inch WQXGA IPS 300nits Anti-glare, 100% sRGB, Dolby Vision, 
Pin 4Cell 56WHrs, 
Color Mineral Grey (Xám), 
Finger Print, 
Weight 1.26 kg, 
OS Windows 11 Home 64 bits', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (30, N'Laptop Lenovo ThinkPad X1 Nano Gen 2 21E8003FVN', N'lap_le_5.jpg', 51050000, CAST(N'2022-10-04' AS Date), 0, 1, 6, N'CPU Intel® Core ™ i7-1260P (18MB Cache, up to 4.7GHz), 
RAM 16GB LPDDR5-5200Mhz Onboard, 
SSD 1TB SSD M.2 2242 PCIe 4.0x4 NVMe Opal2, 
VGA Intel® Iris® Xe Graphics, 
Display 13inch 2K (2160x1350) IPS 450nits Anti-glare, 
Color Black (Ðen), 
Finger Print, 
Intel AX211 Wi-Fi 6E, 2x2 + BT5.1, 
Weight 966g, 
Pin 3Cell 49.5Whr, 
OS Windows 11 Pro 64 bits', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (31, N'Laptop Gaming Acer Nitro 5 Eagle AN515-57-5669', N'lap_acer_1.jpg', 18890000, CAST(N'2022-10-04' AS Date), 0, 1, 7, N'CPU Intel Core i5-11400H (12MB, up to 4.50GHz), 
RAM 8GB DDR4 3200MHz (1x8GB), 
SSD 512GB PCIe NVMe, 
VGA NVIDIA GeForce GTX 1650 4GB GDDR6, 
Display 15.6Inch FHD IPS 144Hz, 
Pin 4Cell 57.5WHrs, 
Color Shale Black (Ðen), 
Red Backlit Keyboard, 
Weight 2.20 kg, 
OS Windows 11 Home', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (32, N'Laptop Acer Aspire 3 A315-58-35AG NX.ADDSV.00B', N'lap_acer_2.jpg', 9690000, CAST(N'2022-10-04' AS Date), 0, 1, 7, N'CPU Intel Core i3-1115G4 (6MB, up to 4.10GHz), 
RAM 4GB DDR4 2400MHz Onboard, 
SSD 256GB PCIe NVMe, 
VGA Intel UHD Graphics, 
Display 15.6inch FHD Acer ComfyView 60Hz, 
Color Pure Silver (B?c), 
Pin 3Cell 36WHrs, 
Weight 1.70 kg, 
OS Windows 11 Home', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (33, N'Laptop Acer Aspire 3 A315-57G-32QP NX.HZRSV.00A', N'lap_acer_3.jpg', 10490000, CAST(N'2022-10-04' AS Date), 0, 1, 7, N'CPU Intel Core i3-1005G1 (4MB, up to 3.40GHz), 
RAM 4GB DDR4 2400MHz Onboard, 
SSD 256GB PCIe NVMe, 
VGA NVIDIA Geforce MX330 2GB GDDR5, 
Display 15.6Inch FHD Acer ComfyView LED backlit TFT LCD, 
Pin 3Cell 36WHrs, 
Color Charcoal Black (Ðen), 
Weight 1.90 kg, 
OS Windows 11 Home', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (34, N'Laptop Gaming Acer Predator Triton 500 SE', N'lap_acer_4.jpg', 100990000, CAST(N'2022-10-04' AS Date), 0, 1, 7, N'CCPU Intel Core i9-12900H (24MB, up to 5.00GHz), 
RAM 32GB LPDDR5 4800MHz Onboard, 
SSD 2TB PCIe NVMe, 
Display 16.0Inch WQXGA IPS 240Hz 500nits 100%sRGB, 
VGA NVIDIA GeForce 3080Ti 16GB GDDR6, 
Pin 4Cell 99.98WHrs, 
Color Steel Gray (Xám), 
Finger Print, 
Weight 2.40 kg, 
OS Windows 11 Home', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (35, N'Laptop Gaming Acer Nitro 5 Eagle AN515-57-54MV', N'lap_acer_5.jpg', 20590000, CAST(N'2022-10-04' AS Date), 0, 1, 7, N'CPU Intel Core i5-11400H (12MB, up to 4.50GHz), 
RAM 8GB DDR4 3200MHz (1x8GB), 
SSD 512GB PCIe NVMe, 
VGA NVIDIA GeForce RTX 3050 4GB GDDR6, 
Display 15.6Inch FHD IPS 144Hz, 
Pin 4Cell 57.5WHrs, 
Color Shale Black (Ðen), 
Weight 2.20 kg, 
OS Windows 11 Home', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (36, N'Laptop Intel NUC M15 BBC710ECUXBC1 màu xám', N'lap_intel_1.jpg', 22490000, CAST(N'2022-10-04' AS Date), 0, 1, 8, N'CPU Intel Core i7-1165G7 (12MB, up to 4.70GHz), 
RAM 16GB LPDDR4X 4266MHz (2 x 8GB Onboard), 
SSD 512GB NVMe PCIe, 
VGA Intel Iris Xe Graphics, 
Display 15.6Inch FHD IPS Touch 60Hz 100%sRGB, 
Pin 73WHrs, 
Color Gray (Xám), 
Weight 1.65 kg, 
OS Windows 10 Home', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (37, N'Laptop Intel NUC M15 BBC510EAUXBC1 b?n i5', N'lap_intel_2.jpg', 14990000, CAST(N'2022-10-04' AS Date), 0, 1, 8, N'CPU Intel Core i5-1135G7 (8MB, up to 4.20GHz), 
RAM 16GB LPDDR4X 4266MHz (2 x 8GB Onboard), 
SSD 512GB NVMe PCIe, 
VGA Intel Iris Xe Graphics, 
Display 15.6Inch FHD IPS 60Hz 100%sRGB, 
Pin 73WHrs, 
Color Gray (Xám), 
Weight 1.65 kg, 
OS Windows 10 Home', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (38, N'Laptop Avita Pura 14 NS14A6VNF541-SGC', N'lap_avita_1.jpg', 9990000, CAST(N'2022-10-04' AS Date), 0, 1, 9, N'CPU Intel Core i5-8279U (6MB, up to 4.10GHz), 
RAM 8GB DDR4 2400MHz, 
SSD 256GB Sata M.2, 
VGA Intel Iris Plus Graphics 655, 
Display 14.0Inch HD TFT Wide Bezel, 
Pin 2Cell 24WHrs 3200mAh, 
Color Shadow Grey (Xám), 
Weight 1.34 kg, 
OS Windows 10 Home', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (39, N'Laptop Avita Liber V14Q-SP  14Q-SP ', N'lap_avita_2.jpg', 15990000, CAST(N'2022-10-04' AS Date), 0, 1, 9, N'CPU AMD Ryzen R7-3700U (4MB, upto 4.00GHz), 
RAM 8GB DDR4 2400MHz, 
SSD 512GB Sata M.2, 
VGA AMD Radeon RX Vega 10 Graphics, 
Display 14.0Inch FHD IPS Anti-Glare, 
Pin 4830mAh, 
Color Summer Pink (H?ng), 
Finger Print, 
Weight 1.30 kg, 
OS Windows 10 Home', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (40, N'Laptop Avita Liber V14 NS14A9VNV561-CRAB', N'lap_avita_3.jpg', 16690000, CAST(N'2022-10-04' AS Date), 0, 1, 9, N'CPU AMD Ryzen R5-4500U (8MB, up to 4.00GHz), 
RAM 8GB LPDDR4 3200MHz, 
SSD 512GB Sata M.2, 
VGA AMD Radeon RX Vega 10 Graphics, 
Display 14.0Inch FHD IPS Anti-Glare, 
Pin 4830mAh, 
Color Charming Red (Ð?), 
Weight 1.28kg, 
OS Windows 10 Home', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (64, N'Ram Laptop Kingston 4GB DDR4-2666S19', N'5b11f120.jpg', 480000, CAST(N'2022-10-04' AS Date), 0, 1, 1, N'Model: KVR26S19S6/4
Màu: Xanh lá
Ki?u Ram: DDR4
Dung lu?ng: 4GB
T?c d? Buss: 2666Mhz', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (65, N'Ram laptop PNY 8GB DDR4 3200MHz CL22', N'phukien_laptop_1_1.jpg', 650000, CAST(N'2022-10-04' AS Date), 0, 2, 10, N'Model: MN8GSD43200XR-RB
Dung lượng: 8GB
Loại bộ nhớ: DDR4
Tốc độ: 3200MHz
Độ trễ CAS: CL22
Điện áp: 1.2V
Tương thích: 3200MHz, 3000MHz, 2933MHz, 2666MHz, 2400MHz, 2133MHz
Kích thước: 67.6 x 30 x 3.3mm', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (66, N'Ổ cứng SSD Team Group M2.2280 PCIE', N'phukien_laptop_1_2.jpg', 730000, CAST(N'2022-10-04' AS Date), 0, 2, 10, N'Brand: Team Group
Series: MP33
Model: TM8FP6256G0C101
Form Factor: M.2 2280
Capacity: 256GB
Memory Components: 3D NAND
Interface: PCIe 3.0 x4 with NVMe 1.3
Max Sequential Read: Up to 1600 MBps
Max Sequential Write: Up to 1000 MBps
MTBF: 1,500,000 hours
Weight 6.00g', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (67, N'USB Kingston 64GB DataTraveler Exodia DTX/64GB', N'thietbiluutruduphong_1.jpg', 137000, CAST(N'2022-10-04' AS Date), 0, 3, 3, N'Chủng loại: DTX
Dung lượng: 64GB
Tốc độ: USB 3.2 Gen 1
Tốc độ đọc: 100MB/s
Tốc độ ghi: 10MB/s
Chất liệu: Nhựa
Trọng lượng: 11g', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (68, N'Tai nghe Logitech Headset H150 - Blue', N'thietbinghenhin_1.png', 260000, CAST(N'2022-10-04' AS Date), 0, 4, 4, N'Tai nghe H150 có 3 màu : Trắng - Xanh - Hồng
Microphone chống ồn,loại bỏ tối đa có thể các tạp âm xung quanh
Microphone có thể điều chỉnh lên , xuống được
Gọng choàng tai nghe có thể điều chỉnh rộng, nhỏ cho vừa
Có miếng mút kèm theo tạo cảm giác thoải mái khi đeo
Có nút điều chỉnh âm lượng tăng, giảm và nút bật tắt microphone', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (69, N'Chuột không dây Emoji Logitech POP Mouse Bluetooth', N'linhkienmaytinh_1.jpg', 570000, CAST(N'2022-10-04' AS Date), 0, 5, 5, N'Chuột không dây Emoji Logitech POP Mouse Bluetooth màu Vàng Đen (Lốm đốm)
Công nghệ cảm biến: Theo dõi quang học có độ chính xác cao của Logitech
Phạm vi Dpi: 1000-4000, giá trị danh nghĩa 1000 dpi
Công nghệ Bluetooth tiết kiệm năng lượng (5.1)
Tương thích với đầu thu USB Logi Bolt;
Phạm vi không dây 10 m;
Công nghệ Logitech Flow;
Phần mềm Emoji', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (70, N'Apple Magic Mouse 2021 - MK2E3ZA/A', N'applechinhhang_1.jpg', 1890000, CAST(N'2022-10-04' AS Date), 0, 6, 6, N'Chuột bluetooth Apple Magic Mouse 2021- MK2E3ZA/A
Kết nối: Bluetooth, Lightning Port, Wireless
Đối với máy Mac: Hỗ trợ Bluetooth với hệ điều hành OS X 10.11 trở lên. Với IPadOS 13.4 trở lên.
Pin bền, cung cấp năng lượng trong thời gian khoảng 1 tháng.', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (71, N'Webcam Logitech C922 Pro Stream', N'thietbingoaivi_1.png', 2130000, CAST(N'2022-10-04' AS Date), 0, 7, 7, N'Tối ưu hóa để phát và ghi lại
Phát FULL HD 1080P ở tốc độ 30 FPS / 720P ở tốc độ 60FPS
Khả năng thay hậu cảnh có thể tùy chỉnh
Tự động điều chỉnh dưới ánh sáng thấp
Ghi lại âm thanh nổi từ dưới mọi góc độ
Chân máy để trên bàn hoàn toàn có thể điều chỉnh được với giá gắn xoay. Kéo dài tới 18,5 cm', NULL, 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [BrandId], [Discription], [Quantity], [isDeleted]) VALUES (74, N'Bộ phát Wifi Tp-Link TL-WR841NR841N', N'thietbimangphanmem_1.jpg', 310000, CAST(N'2022-10-04' AS Date), 0, 8, 8, N'Hiệu suất: Tốc độ Wi-Fi chuẩn N lên đến 300Mbps, rất thuận lợi để sử dụng cho các ứng dụng tiêu thụ băng thông lớn như xem video HD trực tuyến
Mạng khách: cung cấp quyền truy cập riêng biệt cho khách trong khi vẫn đảm bảo mạng gia đình
IPv6: tương thích với IPv6 (Internet Protocol version 6)
Nút WPS: mã hóa bảo mật không dây dễ dàng bằng cách nhấn nút WPS
IPTV: hỗ trợ IGMP Proxy/Snooping, Cầu nối và Tag VLAN để tối ưu hóa luồng IPTV
', NULL, 0)
SET IDENTITY_INSERT [dbo].[Products] OFF
INSERT [dbo].[Roles] ([Id], [Name], [isDeleted]) VALUES (N'ADMIN', N'Admin', 0)
INSERT [dbo].[Roles] ([Id], [Name], [isDeleted]) VALUES (N'THANG', N'Thang', 0)
INSERT [dbo].[Roles] ([Id], [Name], [isDeleted]) VALUES (N'USER', N'Users', 0)
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Brands] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ProductEvalutions] ADD  DEFAULT ((0)) FOR [Evalution]
GO
ALTER TABLE [dbo].[ProductLikes] ADD  DEFAULT ((0)) FOR [IsLiked]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Available]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[ProductEvalutions]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductEvalutions]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[ProductLikes]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductLikes]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[ProductPhotos]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([Id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
USE [master]
GO
ALTER DATABASE [Project] SET  READ_WRITE 
GO

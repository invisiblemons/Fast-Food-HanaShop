USE [master]
GO
/****** Object:  Database [HanaShop]    Script Date: 3/20/2021 7:35:50 AM ******/
CREATE DATABASE [HanaShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HanaShop', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HanaShop.mdf' , SIZE = 20480KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HanaShop_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HanaShop_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HanaShop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HanaShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HanaShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HanaShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HanaShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HanaShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HanaShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [HanaShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HanaShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HanaShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HanaShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HanaShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HanaShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HanaShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HanaShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HanaShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HanaShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HanaShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HanaShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HanaShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HanaShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HanaShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HanaShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HanaShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HanaShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HanaShop] SET  MULTI_USER 
GO
ALTER DATABASE [HanaShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HanaShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HanaShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HanaShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HanaShop] SET DELAYED_DURABILITY = DISABLED 
GO
USE [HanaShop]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 3/20/2021 7:35:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [varchar](20) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 3/20/2021 7:35:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [int] IDENTITY(0,1) NOT NULL,
	[userID] [varchar](100) NOT NULL,
	[paymentMethod] [varchar](50) NOT NULL,
	[dateOrder] [smalldatetime] NOT NULL,
	[totalPrice] [float] NOT NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 3/20/2021 7:35:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[orderID] [int] NOT NULL,
	[productID] [varchar](20) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_tblOrderDetail_1] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 3/20/2021 7:35:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [varchar](20) NOT NULL,
	[productName] [nvarchar](100) NOT NULL,
	[productImage] [nvarchar](500) NOT NULL,
	[productDescription] [varchar](150) NOT NULL,
	[productPrice] [float] NOT NULL,
	[createDate] [date] NOT NULL,
	[lastUpdate] [date] NOT NULL,
	[userUpdate] [varchar](100) NOT NULL,
	[quantity] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[categoryID] [varchar](20) NOT NULL,
	[count] [int] NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 3/20/2021 7:35:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUser](
	[userID] [varchar](100) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[fullName] [nvarchar](100) NOT NULL,
	[isAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (N'D', N'Drink')
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (N'F', N'Food')
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (N'T', N'Test')
SET IDENTITY_INSERT [dbo].[tblOrder] ON 

INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentMethod], [dateOrder], [totalPrice]) VALUES (14, N'user1', N'Cash payment upon delivery', CAST(N'2021-03-17 00:00:00' AS SmallDateTime), 184445)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentMethod], [dateOrder], [totalPrice]) VALUES (15, N'user1', N'Cash payment upon delivery', CAST(N'2021-03-17 00:00:00' AS SmallDateTime), 164445)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentMethod], [dateOrder], [totalPrice]) VALUES (16, N'user1', N'Cash payment upon delivery', CAST(N'2021-03-17 00:00:00' AS SmallDateTime), 144445)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentMethod], [dateOrder], [totalPrice]) VALUES (17, N'user1', N'Cash payment upon delivery', CAST(N'2021-03-17 00:00:00' AS SmallDateTime), 144445)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentMethod], [dateOrder], [totalPrice]) VALUES (18, N'user1', N'Cash payment upon delivery', CAST(N'2021-03-17 00:00:00' AS SmallDateTime), 66433)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentMethod], [dateOrder], [totalPrice]) VALUES (19, N'user1', N'Cash payment upon delivery', CAST(N'2021-03-17 00:00:00' AS SmallDateTime), 144445)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentMethod], [dateOrder], [totalPrice]) VALUES (20, N'user1', N'Cash payment upon delivery', CAST(N'2021-03-19 00:00:00' AS SmallDateTime), 2200)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentMethod], [dateOrder], [totalPrice]) VALUES (36, N'user1', N'Cash payment upon delivery', CAST(N'2021-03-19 00:00:00' AS SmallDateTime), 106664)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentMethod], [dateOrder], [totalPrice]) VALUES (37, N'user1', N'Cash payment upon delivery', CAST(N'2021-03-19 00:00:00' AS SmallDateTime), 144445)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentMethod], [dateOrder], [totalPrice]) VALUES (38, N'user1', N'Cash payment upon delivery', CAST(N'2021-03-19 00:00:00' AS SmallDateTime), 1877785)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentMethod], [dateOrder], [totalPrice]) VALUES (39, N'user1', N'Cash payment upon delivery', CAST(N'2021-03-19 00:00:00' AS SmallDateTime), 40000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentMethod], [dateOrder], [totalPrice]) VALUES (40, N'user1', N'Cash payment upon delivery', CAST(N'2021-03-19 00:00:00' AS SmallDateTime), 30000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentMethod], [dateOrder], [totalPrice]) VALUES (41, N'user1', N'Cash payment upon delivery', CAST(N'2021-03-19 00:00:00' AS SmallDateTime), 70000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentMethod], [dateOrder], [totalPrice]) VALUES (42, N'user1', N'Cash payment upon delivery', CAST(N'2021-03-19 00:00:00' AS SmallDateTime), 719920)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentMethod], [dateOrder], [totalPrice]) VALUES (43, N'user1', N'Cash payment upon delivery', CAST(N'2021-03-19 00:00:00' AS SmallDateTime), 1079880)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentMethod], [dateOrder], [totalPrice]) VALUES (44, N'user1', N'Cash payment upon delivery', CAST(N'2021-03-20 00:00:00' AS SmallDateTime), 2600010)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentMethod], [dateOrder], [totalPrice]) VALUES (45, N'user1', N'Cash payment upon delivery', CAST(N'2021-03-20 00:00:00' AS SmallDateTime), 180000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentMethod], [dateOrder], [totalPrice]) VALUES (46, N'user1', N'Cash payment upon delivery', CAST(N'2021-03-20 00:00:00' AS SmallDateTime), 30000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentMethod], [dateOrder], [totalPrice]) VALUES (47, N'user1', N'Cash payment upon delivery', CAST(N'2021-03-20 00:00:00' AS SmallDateTime), 30000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentMethod], [dateOrder], [totalPrice]) VALUES (48, N'user1', N'Cash payment upon delivery', CAST(N'2021-03-20 00:00:00' AS SmallDateTime), 270000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentMethod], [dateOrder], [totalPrice]) VALUES (49, N'116919688883613954246', N'Cash payment upon delivery', CAST(N'2021-03-20 00:00:00' AS SmallDateTime), 493283)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentMethod], [dateOrder], [totalPrice]) VALUES (50, N'116919688883613954246', N'Cash payment upon delivery', CAST(N'2021-03-20 00:00:00' AS SmallDateTime), 187772)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentMethod], [dateOrder], [totalPrice]) VALUES (51, N'116919688883613954246', N'Cash payment upon delivery', CAST(N'2021-03-20 00:00:00' AS SmallDateTime), 28888)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentMethod], [dateOrder], [totalPrice]) VALUES (52, N'user1', N'Cash payment upon delivery', CAST(N'2021-03-20 00:00:00' AS SmallDateTime), 14444)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentMethod], [dateOrder], [totalPrice]) VALUES (53, N'user1', N'Cash payment upon delivery', CAST(N'2021-03-20 00:00:00' AS SmallDateTime), 115552)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentMethod], [dateOrder], [totalPrice]) VALUES (54, N'user1', N'Cash payment upon delivery', CAST(N'2021-03-20 00:00:00' AS SmallDateTime), 60000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentMethod], [dateOrder], [totalPrice]) VALUES (55, N'114661843889980946948', N'Cash payment upon delivery', CAST(N'2021-03-20 00:00:00' AS SmallDateTime), 270000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentMethod], [dateOrder], [totalPrice]) VALUES (56, N'114661843889980946948', N'Cash payment upon delivery', CAST(N'2021-03-20 00:00:00' AS SmallDateTime), 270000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentMethod], [dateOrder], [totalPrice]) VALUES (57, N'user1', N'Cash payment upon delivery', CAST(N'2021-03-20 00:00:00' AS SmallDateTime), 144445)
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (14, N'p10', 1, 144445)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (14, N'p11', 2, 40000)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (15, N'p10', 1, 144445)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (15, N'p11', 1, 20000)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (16, N'p10', 1, 144445)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (17, N'p10', 1, 144445)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (18, N'p13', 1, 66433)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (19, N'p10', 1, 144445)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (20, N'p1', 1, 2200)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (36, N'p7', 8, 106664)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (37, N'p10', 1, 144445)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (38, N'p10', 13, 1877785)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (39, N'p11', 2, 40000)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (40, N'p20', 6, 30000)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (41, N'p20', 14, 70000)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (42, N'p39', 8, 719920)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (43, N'p39', 12, 1079880)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (44, N'p10', 18, 2600010)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (45, N'p18', 6, 180000)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (46, N'p18', 1, 30000)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (47, N'p18', 1, 30000)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (48, N'p18', 9, 270000)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (49, N'p18', 1, 30000)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (49, N'p39', 5, 449950)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (49, N'p7', 1, 13333)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (50, N'p6', 13, 187772)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (51, N'p6', 2, 28888)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (52, N'p6', 1, 14444)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (53, N'p6', 8, 115552)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (54, N'p18', 2, 60000)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (55, N'p18', 9, 270000)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (56, N'p18', 9, 270000)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [quantity], [price]) VALUES (57, N'p10', 1, 144445)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p1', N'Cake', N'https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=401&q=80', N'Cream Cake', 2200, CAST(N'2021-01-15' AS Date), CAST(N'2021-03-19' AS Date), N'admin1', 2, 1, N'F', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p10', N'Paella', N'https://pixy.org/src/13/thumbs350/139710.jpg', N'Well-mannered and polite', 144445, CAST(N'2021-01-15' AS Date), CAST(N'2021-03-20' AS Date), N'admin1', 9, 1, N'F', 38)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p11', N'Rice', N'https://pixy.org/src/14/thumbs350/144705.jpg', N'Showing care in one’s duties.', 20000, CAST(N'2021-01-15' AS Date), CAST(N'2021-03-19' AS Date), N'admin1', 12, 1, N'F', 5)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p12', N' Lunch ', N'https://pixy.org/src/14/thumbs350/145754.jpg', N'Showing intense interest in something.', 22445, CAST(N'2021-01-15' AS Date), CAST(N'2021-03-19' AS Date), N'admin1', 22, 1, N'F', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p13', N' Schnitzel ', N'https://pixy.org/src/14/thumbs350/145374.jpg', N'Showing a willingness to give others more than is necessary.', 66433, CAST(N'2021-01-15' AS Date), CAST(N'2021-03-16' AS Date), N'admin1', 2, 1, N'D', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p14', N' Sushi ', N'https://pixy.org/src/12/thumbs350/126443.jpg', N'Feeling contentment.', 11111, CAST(N'2021-01-15' AS Date), CAST(N'2021-03-19' AS Date), N'admin1', 20, 1, N'F', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p15', N'Appetizer', N'https://pixy.org/src/12/thumbs350/127323.jpg', N'Willing to help others.', 33466, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'F', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p16', N'Salad', N'https://pixy.org/src/12/thumbs350/125922.jpg', N'Possessing the ability to imagine or create new things', 10000, CAST(N'2021-01-15' AS Date), CAST(N'2021-03-19' AS Date), N'admin1', 20, 1, N'F', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p17', N'Cookies', N'https://pixy.org/src/12/thumbs350/125026.jpg', N'Easy to like', 29999, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'F', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p18', N' Meatball', N'https://pixy.org/src/12/thumbs350/123853.jpg', N'Showing unwavering support.', 30000, CAST(N'2021-01-15' AS Date), CAST(N'2021-03-20' AS Date), N'admin1', 11, 1, N'F', 38)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p19', N' Jar', N'https://pixy.org/src/12/thumbs350/124013.jpg', N'Having strong feelings.', 49999, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'F', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p2', N'Bread', N'https://images.unsplash.com/photo-1588955839498-03ed07afe570?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80', N'Big Bread', 5000, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-16' AS Date), N'admin1', 20, 1, N'F', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p20', N'Korean Food', N'https://pixy.org/src/12/thumbs350/123745.jpg', N'Able to be relied upon', 5000, CAST(N'2021-01-15' AS Date), CAST(N'2021-03-19' AS Date), N'admin1', 19, 1, N'F', 20)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p21', N' Thai Food
', N'https://pixy.org/src/12/thumbs350/124418.jpg', N'Able to quickly solve problems', 50660, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'F', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p22', N' Hamburger', N'https://pixy.org/src/13/thumbs350/130757.jpg', N'Practical; level-headed.', 70600, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'F', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p23', N' Walnut', N'https://pixy.org/src/478/thumbs350/4780838.jpg', N'Expressing genuine sentiments and feelings', 49400, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'F', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p24', N'Tofu', N'https://pixy.org/src/477/thumbs350/4778562.jpg', N'Showing sympathy for others', 55950, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'F', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p25', N'Crystal Tofu Food
', N'https://pixy.org/src/13/thumbs350/139723.jpg', N'Able to be trusted; honest', 60549, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'F', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p26', N' Loco Hawaii Food', N'https://pixy.org/src/14/thumbs350/143113.jpg', N'Charming and funny.', 4890, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'F', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p27', N'Italian Food Prosciutto', N'https://pixy.org/src/14/thumbs350/143856.jpg', N'Inspiring delight in others', 50000, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'F', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p28', N'Cheese Italian Pizza', N'https://pixy.org/src/14/thumbs350/142746.jpg', N'Drawing the interest of others.', 30000, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'F', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p29', N'Tasty Canoles Italian', N'https://pixy.org/src/13/thumbs350/139370.jpg', N'INCREDIBLY TASTY CANOLES ITALIAN', 20000, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'F', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p3', N'Orange', N'https://images.unsplash.com/photo-1600271886742-f049cd451bba?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80', N'Orange Juice', 4200, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-16' AS Date), N'admin1', 30, 1, N'D', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p30', N'Kabob
', N'https://pixy.org/src/14/thumbs350/140709.jpg', N' Incredibly Tasty Bbq Kabob', 20000, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'F', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p31', N'Chicken', N'https://pixy.org/src2/582/thumbs350/5825963.jpg', N'Tasty Bbq Chicken', 40000, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'F', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p32', N'Chicken Bbq', N'https://pixy.org/src/478/thumbs350/4786055.jpg', N'Chicken Bbq On Grille Tasty Closeup', 50000, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'F', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p33', N'Chicken', N'https://pixy.org/src/13/thumbs350/130138.jpg', N'Caesar Salad With Chicken', 60000, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'F', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p34', N'Pomegranate Salad', N'https://pixy.org/src/12/thumbs350/123445.jpg', N'Healthy Spinach Chicken Pomegranate Salad', 80008, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'F', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p35', N'Milk Drink', N'https://pixy.org/src/12/thumbs350/122271.jpg', N'Aesthetically-pleasing.', 40004, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'D', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p36', N'Aperitif Drink', N'https://pixy.org/src/13/thumbs350/138967.jpg', N'Free from dirt', 50000, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'D', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p37', N'Strawberry Drink', N'https://pixy.org/src/14/thumbs350/145841.jpg', N'Bright and full of color', 60000, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'D', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p38', N'Caipirinha Drink', N'https://pixy.org/src/14/thumbs350/145958.jpg', N'Pretty; endearing.', 65555, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 19, 1, N'D', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p39', N'Cocoa Drink', N'https://pixy.org/src/12/thumbs350/126986.jpg', N'Showing grace and style in appearance or behavior', 89990, CAST(N'2021-01-15' AS Date), CAST(N'2021-03-19' AS Date), N'admin1', 7, 1, N'D', 25)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p4', N'Coffee', N'https://pixy.org/src/9/thumbs350/95553.jpg', N'Root Coffee', 10000, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-16' AS Date), N'admin1', 40, 1, N'D', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p40', N'Heneken', N'https://pixy.org/src/12/thumbs350/124789.jpg', N'Being in good physical shape', 98980, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'D', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p41', N'Mojito Drink', N'https://pixy.org/src/13/thumbs350/138873.jpg', N'Beautiful; visually-appealing.', 86666, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'D', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p42', N'Detoxing Drink', N'https://pixy.org/src/478/thumbs350/4782948.jpg', N'Possessing a smooth, shiny appearance.', 34533, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'D', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p43', N' Liqueur Drink', N'https://pixy.org/src2/582/thumbs350/5826129.jpg', N'Perfect illustration.', 30000, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'D', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p44', N'Mango Drink', N'https://pixy.org/src2/582/thumbs350/5825762.jpg', N'Creamy Drink In Glass
', 33399, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'D', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p45', N'Tee Drink', N'https://pixy.org/src2/582/thumbs350/5822405.jpg', N' Glass Carafe With Drink', 5000, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'D', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p46', N'Fruit Tea', N'https://pixy.org/src/478/thumbs350/4782210.jpg', N' Hot Drink Drink Fruit Tea', 6600, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'D', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p47', N'Power Energy Drink', N'https://pixy.org/src/15/thumbs350/150805.jpg', N' Designed for adult', 6900, CAST(N'2021-01-15' AS Date), CAST(N'2021-03-19' AS Date), N'admin1', 20, 1, N'D', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p48', N' Monsters Energy Drink ', N'https://pixy.org/src/47/thumbs350/479519.jpg', N'Most Popular', 77000, CAST(N'2021-01-15' AS Date), CAST(N'2021-03-16' AS Date), N'admin1', 0, 1, N'D', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p49', N'Carafe', N'https://pixy.org/src/13/thumbs350/134797.jpg', N' Martini Appetizer Drink', 78700, CAST(N'2021-01-15' AS Date), CAST(N'2021-03-19' AS Date), N'admin1', 16, 1, N'D', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p5', N'Jujube', N'https://pixy.org/src/12/thumbs350/122149.jpg', N'Possessing intelligence and mental dexterity', 12222, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'D', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p50', N'Clear Drink', N'https://pixy.org/src/12/thumbs350/128581.jpg', N'Glass With A Drink', 76660, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'D', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p53', N'Hamberger', N'https://scx2.b-cdn.net/gfx/news/hires/2016/howcuttingdo.jpg', N'Hamberger', 20000, CAST(N'2021-01-19' AS Date), CAST(N'2021-03-19' AS Date), N'admin1', 5, 1, N'D', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p6', N'Gummi', N'https://pixy.org/src/6/thumbs350/66233.jpg', N'Pleasant and attractive', 14444, CAST(N'2021-01-15' AS Date), CAST(N'2021-03-20' AS Date), N'admin1', 22, 1, N'F', 24)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p7', N'Salmon', N'https://pixy.org/src/12/thumbs350/122285.jpg', N'Showing sympathy for others.', 13333, CAST(N'2021-01-15' AS Date), CAST(N'2021-03-19' AS Date), N'admin1', 11, 1, N'D', 9)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p8', N'Crisp', N'https://pixy.org/src/14/thumbs350/149617.jpg', N'Careful to not inconvenience others.', 5555, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'F', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [productImage], [productDescription], [productPrice], [createDate], [lastUpdate], [userUpdate], [quantity], [status], [categoryID], [count]) VALUES (N'p9', N' Pilaf', N'https://pixy.org/src/14/thumbs350/142579.jpg', N'Not showing fear in the face of danger', 16666, CAST(N'2021-01-15' AS Date), CAST(N'2021-01-18' AS Date), N'admin1', 20, 1, N'F', 0)
INSERT [dbo].[tblUser] ([userID], [password], [fullName], [isAdmin]) VALUES (N'114661843889980946948', N'c4483e83aee02cb63e9490ce80ebf1a9ccbf0e51454ea027abbf8a8b6d251bbe', N'minhdcse140811@fpt.edu.vn', 0)
INSERT [dbo].[tblUser] ([userID], [password], [fullName], [isAdmin]) VALUES (N'116919688883613954246', N'c7d6c6f8ae10c60f5f8e7f145b992dc60e55be413520899359e71ef3b5456a02', N'dangminh200320@gmail.com', 0)
INSERT [dbo].[tblUser] ([userID], [password], [fullName], [isAdmin]) VALUES (N'admin1', N'111', N'admin1', 1)
INSERT [dbo].[tblUser] ([userID], [password], [fullName], [isAdmin]) VALUES (N'user1', N'aBC', N'user1', 0)
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblUser] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblUser]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblProduct] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblProduct]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblCategory] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblCategory]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblUser] FOREIGN KEY([userUpdate])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblUser]
GO
USE [master]
GO
ALTER DATABASE [HanaShop] SET  READ_WRITE 
GO

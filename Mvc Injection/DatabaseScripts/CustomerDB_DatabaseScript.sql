USE [master]
GO
/****** Object:  Database [CustomerDB]    Script Date: 07/31/2017 09:22:05 ******/
--CREATE DATABASE [CustomerDB] ON  PRIMARY 
--( NAME = N'CustomerDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\CustomerDB.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
-- LOG ON 
--( NAME = N'CustomerDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\CustomerDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
--GO
ALTER DATABASE [CustomerDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CustomerDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CustomerDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [CustomerDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [CustomerDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [CustomerDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [CustomerDB] SET ARITHABORT OFF
GO
ALTER DATABASE [CustomerDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [CustomerDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [CustomerDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [CustomerDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [CustomerDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [CustomerDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [CustomerDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [CustomerDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [CustomerDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [CustomerDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [CustomerDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [CustomerDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [CustomerDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [CustomerDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [CustomerDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [CustomerDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [CustomerDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [CustomerDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [CustomerDB] SET  READ_WRITE
GO
ALTER DATABASE [CustomerDB] SET RECOVERY SIMPLE
GO
ALTER DATABASE [CustomerDB] SET  MULTI_USER
GO
ALTER DATABASE [CustomerDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [CustomerDB] SET DB_CHAINING OFF
GO
USE [CustomerDB]
GO
/****** Object:  Table [dbo].[CustomerTB]    Script Date: 07/31/2017 09:22:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerTB](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Phoneno] [varchar](10) NULL,
 CONSTRAINT [PK_CustomerTB] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sprocCustomerTBsSelectSingleItem]    Script Date: 07/31/2017 09:22:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sprocCustomerTBsSelectSingleItem]
@CustomerID int
as
begin
select 
CustomerID,
Name,
Address,
Country,
City,
Phoneno
from CustomerTB where CustomerID =@CustomerID
end
GO
/****** Object:  StoredProcedure [dbo].[sprocCustomerTBSelectList]    Script Date: 07/31/2017 09:22:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sprocCustomerTBSelectList]
as
begin
select 
CustomerID,
Name,
Address,
Country,
City,
Phoneno
from CustomerTB 
end
GO
/****** Object:  StoredProcedure [dbo].[sprocCustomerTBInsertUpdateSingleItem]    Script Date: 07/31/2017 09:22:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[sprocCustomerTBInsertUpdateSingleItem]  
@CustomerID int,  
@Name varchar(50),  
@Address varchar(50),  
@Country varchar(50),  
@City varchar(50),  
@Phoneno varchar(10)  
as  
  
begin  
  
if(@CustomerID = 0)  
begin  
Insert into CustomerTB  
(  
Name,  
Address,  
Country,  
City,  
Phoneno  
)  
values  
(  
@Name,  
@Address,  
@Country,  
@City,  
@Phoneno  
)  
end  
else   
begin  
Update CustomerTB  
set   
Name =@Name,  
Address = @Address,  
Country= @Country,  
City =@City,  
Phoneno =@Phoneno  
where CustomerID=@CustomerID  
end  
end
GO
/****** Object:  StoredProcedure [dbo].[sprocCustomerTBDeleteSingleItem]    Script Date: 07/31/2017 09:22:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sprocCustomerTBDeleteSingleItem]
@CustomerID int
as
begin
Delete from CustomerTB where CustomerID =@CustomerID
end
GO

/*
* Database: DBExcellOnConsultingServices
* Author: Hoangdp_c00473
* Start Date: 30.06.2011
* */

/*
* 1. CREATE DATABASE
* */
USE [master]
GO
IF EXISTS ( SELECT  *
            FROM    sys.databases
            WHERE   NAME = 'DBExcellOnConsultingServices' ) 
    BEGIN
        DROP DATABASE DBExcellOnConsultingServices
    END
GO
CREATE DATABASE DBExcellOnConsultingServices
GO
USE DBExcellOnConsultingServices
GO

/*
* 2. CREATE TABLE
* */
CREATE TABLE Account
    (
      Account_Id UNIQUEIDENTIFIER NOT NULL
                                  DEFAULT ( NEWID() ) ,
      Employee_Id UNIQUEIDENTIFIER UNIQUE
                                   NOT NULL ,
      Role_Name NVARCHAR(256) NOT NULL ,
      Account_UserName NVARCHAR(256) UNIQUE
                                     NOT NULL ,
      Account_Password NVARCHAR(128) NOT NULL ,
      Account_IsLocked BIT NOT NULL
                           DEFAULT 0 ,
      Account_IsDelete BIT NOT NULL
                           DEFAULT 0 ,
      CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED ( [Account_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE Category
    (
      Category_Id UNIQUEIDENTIFIER NOT NULL
                                   DEFAULT ( NEWID() ) ,
      Category_Name NVARCHAR(256) UNIQUE
                                  NOT NULL ,
      Category_IsDelete BIT NOT NULL
                            DEFAULT 0 ,
      CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED ( [Category_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE Company
    (
      Company_Id UNIQUEIDENTIFIER NOT NULL
                                  DEFAULT ( NEWID() ) ,
      Company_Name NVARCHAR(256) UNIQUE
                                 NOT NULL ,
      Company_Logo NVARCHAR(MAX) ,
      Company_Description NVARCHAR(MAX) ,
      Company_Phone NVARCHAR(16) ,
      Company_Email NVARCHAR(256) UNIQUE ,
      Company_Address NVARCHAR(256) ,
      Company_IsDelete BIT NOT NULL
                           DEFAULT 0 ,
      CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED ( [Company_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE Contact
    (
      Contact_Id UNIQUEIDENTIFIER NOT NULL
                                  DEFAULT ( NEWID() ) ,
      Contact_Title NVARCHAR(256) NOT NULL ,
      Contact_Content NVARCHAR(MAX) ,
      Contact_Name NVARCHAR(256) ,
      Contact_Email NVARCHAR(256) UNIQUE
                                  NOT NULL ,
      Contact_Date SMALLDATETIME NOT NULL ,
      Contact_Status INT NOT NULL ,
      Contact_IsDelete BIT NOT NULL
                           DEFAULT 0 ,
      CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED ( [Contact_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE Customer
    (
      Customer_Id UNIQUEIDENTIFIER NOT NULL
                                   DEFAULT ( NEWID() ) ,
      Customer_FulName NVARCHAR(256) NOT NULL ,
      Customer_Phone NVARCHAR(16) ,
      Customer_Address NVARCHAR(256) ,
      Customer_IsDelete BIT NOT NULL
                            DEFAULT 0 ,
      CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED ( [Customer_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE CustomerOfCompany
    (
      Customer_Id UNIQUEIDENTIFIER NOT NULL ,
      Company_Id UNIQUEIDENTIFIER NOT NULL ,
      CustomerOfCompany_IsDelete BIT NOT NULL
                                     DEFAULT 0 ,
      CONSTRAINT [PK_CustomerOfCompany] PRIMARY KEY CLUSTERED
        ( [Customer_Id] ASC, [Company_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE Dealer
    (
      Dealer_Id UNIQUEIDENTIFIER NOT NULL
                                 DEFAULT ( NEWID() ) ,
      Company_Id UNIQUEIDENTIFIER NOT NULL ,
      Dealer_Name NVARCHAR(256) NOT NULL ,
      Dealer_Address NVARCHAR(256) ,
      Dealer_Phone NVARCHAR(16) ,
      Dealer_Email NVARCHAR(256) ,
      Dealer_IsDelete BIT NOT NULL
                          DEFAULT 0 ,
      CONSTRAINT [PK_Dealer] PRIMARY KEY CLUSTERED ( [Dealer_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE Department
    (
      Department_Id UNIQUEIDENTIFIER NOT NULL
                                     DEFAULT ( NEWID() ) ,
      Department_Name NVARCHAR(256) UNIQUE
                                    NOT NULL ,
      Department_Description NVARCHAR(MAX) ,
      Department_IsDelete BIT NOT NULL
                              DEFAULT 0 ,
      CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED ( [Department_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE Employee
    (
      Employee_Id UNIQUEIDENTIFIER NOT NULL
                                   DEFAULT ( NEWID() ) ,
      Department_Id UNIQUEIDENTIFIER NOT NULL ,
      Employee_FirtName NVARCHAR(256) ,
      Employee_LastName NVARCHAR(256) ,
      Employee_Gender BIT ,
      Employee_DateOfBirth SMALLDATETIME ,
      Employee_Address NVARCHAR(256) ,
      Employee_PhoneNumber NVARCHAR(16) ,
      Employee_Email NVARCHAR(256) NOT NULL ,
      Employee_Avatar NVARCHAR(MAX) ,
      Employee_IsDelete BIT NOT NULL
                            DEFAULT 0 ,
      CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED ( [Employee_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE News
    (
      News_Id UNIQUEIDENTIFIER NOT NULL
                               DEFAULT ( NEWID() ) ,
      News_Title NVARCHAR(256) NOT NULL ,
      News_Content NVARCHAR(MAX) ,
      News_Date SMALLDATETIME NOT NULL ,
      News_IsDelete BIT NOT NULL
                        DEFAULT 0 ,
      CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED ( [News_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE OrderOfService
    (
      OrderOfService_Id UNIQUEIDENTIFIER NOT NULL
                                         DEFAULT ( NEWID() ) ,
      Company_Id UNIQUEIDENTIFIER NOT NULL ,
      Employee_Id UNIQUEIDENTIFIER NOT NULL ,
      OrderService_TotalServices INT NOT NULL ,
      OrderService_TotalCharges NVARCHAR(256) NOT NULL ,
      OrderService_Description NVARCHAR(MAX) ,
      OrderService_PaymentMethod NVARCHAR(256) NOT NULL ,
      OrderService_PaymentDate SMALLDATETIME NOT NULL ,
      OrderService_BillDate SMALLDATETIME NOT NULL ,
      OrderService_Status INT NOT NULL ,
      OrderService_IsDelete BIT NOT NULL
                                DEFAULT 0 ,
      CONSTRAINT [PK_OrderOfService] PRIMARY KEY CLUSTERED
        ( [OrderOfService_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE OrderOfServiceDetail
    (
      OrderService_Id UNIQUEIDENTIFIER NOT NULL ,
      Servive_Id UNIQUEIDENTIFIER NOT NULL ,
      OrderServiceDetail_FromDate SMALLDATETIME NOT NULL ,
      OrderServiceDetail_ToDate SMALLDATETIME NOT NULL ,
      OrderServiceDetail_NumberOfEmployee INT NOT NULL ,
      OrderServiceDetail_Price NVARCHAR(256) NOT NULL ,
      OrderServiceDetail_IsDelete BIT NOT NULL
                                      DEFAULT 0 ,
      CONSTRAINT [PK_OrderServiceDetail] PRIMARY KEY CLUSTERED
        ( [OrderService_Id] ASC, [Servive_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE Problem
    (
      Problem_Id UNIQUEIDENTIFIER NOT NULL
                                  DEFAULT ( NEWID() ) ,
      Problem_Title NVARCHAR(256) NOT NULL ,
      Problem_Content NVARCHAR(MAX) ,
      Problem_IsDelete BIT NOT NULL
                           DEFAULT 0 ,
      CONSTRAINT [PK_Problem] PRIMARY KEY CLUSTERED ( [Problem_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE ProblemOfCustomer
    (
      ProblemOfCustomer_Id UNIQUEIDENTIFIER NOT NULL
                                            DEFAULT ( NEWID() ) ,
      Customer_Id UNIQUEIDENTIFIER NOT NULL ,
      Company_Id UNIQUEIDENTIFIER NOT NULL ,
      Problem_Id UNIQUEIDENTIFIER NOT NULL ,
      ProblemOfCustomer_Date SMALLDATETIME NOT NULL ,
      ProblemOfCustomer_IsDelete BIT NOT NULL
                                     DEFAULT 0 ,
      CONSTRAINT [PK_ProblemOfCustomer] PRIMARY KEY CLUSTERED
        ( [ProblemOfCustomer_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE Product
    (
      Product_Id UNIQUEIDENTIFIER NOT NULL
                                  DEFAULT ( NEWID() ) ,
      Company_Id UNIQUEIDENTIFIER NOT NULL ,
      Category_Id UNIQUEIDENTIFIER NOT NULL ,
      Product_Name NVARCHAR(256) NOT NULL ,
      Product_Type NVARCHAR(256) NOT NULL ,
      Product_Price NVARCHAR(256) NOT NULL ,
      Product_Description NVARCHAR(MAX) ,
      Product_Image NVARCHAR(MAX) ,
      Product_ManufactureDate SMALLDATETIME ,
      Product_ExpiryDate SMALLDATETIME ,
      Product_IsDelete BIT NOT NULL
                           DEFAULT 0 ,
      CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED ( [Product_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
Go
CREATE TABLE [Role]
    (
      Role_Name NVARCHAR(256) NOT NULL ,
      Role_IsDelete BIT NOT NULL
                        DEFAULT 0 ,
      CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED ( [Role_Name] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO
CREATE TABLE [Service]
    (
      Service_Id UNIQUEIDENTIFIER NOT NULL
                                  DEFAULT ( NEWID() ) ,
      [Service_Name] NVARCHAR(256) UNIQUE
                                   NOT NULL ,
      Service_Image NVARCHAR(MAX) ,
      Service_Description NVARCHAR(MAX) ,
      Service_Charge NVARCHAR(256) NOT NULL ,
      Service_IsDelete BIT NOT NULL
                           DEFAULT 0 ,
      CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED ( [Service_Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
GO

/*
* 3. CREATE CONSTRAINT
* */
/*------------------------------TABLE ACCOUNT------------------------------*/
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Employee] FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[Employee] ([Employee_Id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Employee]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([Role_Name])
REFERENCES [dbo].[Role] ([Role_Name])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
/*------------------------------#END TABLE ACCOUNT------------------------------*/
GO
/*------------------------------TABLE CUSTOMER OF COMPANY------------------------------*/
ALTER TABLE [dbo].[CustomerOfCompany]  WITH CHECK ADD  CONSTRAINT [FK_CustomerOfCompany_Company] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Company] ([Company_Id])
GO
ALTER TABLE [dbo].[CustomerOfCompany] CHECK CONSTRAINT [FK_CustomerOfCompany_Company]
GO
ALTER TABLE [dbo].[CustomerOfCompany]  WITH CHECK ADD  CONSTRAINT [FK_CustomerOfCompany_Customer] FOREIGN KEY([Customer_Id])
REFERENCES [dbo].[Customer] ([Customer_Id])
GO
ALTER TABLE [dbo].[CustomerOfCompany] CHECK CONSTRAINT [FK_CustomerOfCompany_Customer]
/*------------------------------#END TABLE CUSTOMER OF COMPANY------------------------------*/
GO
/*------------------------------TABLE DEALER------------------------------*/
ALTER TABLE [dbo].[Dealer]  WITH CHECK ADD  CONSTRAINT [FK_Dealer_Company] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Company] ([Company_Id])
GO
ALTER TABLE [dbo].[Dealer] CHECK CONSTRAINT [FK_Dealer_Company]
/*------------------------------#END TABLE DEALER------------------------------*/
GO
/*------------------------------TABLE EMPLOYEE------------------------------*/
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([Department_Id])
REFERENCES [dbo].[Department] ([Department_Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
/*------------------------------#END TABLE EMPLOYEE------------------------------*/
GO
/*------------------------------TABLE ORDER SERVICE------------------------------*/
ALTER TABLE [dbo].[OrderOfService]  WITH CHECK ADD  CONSTRAINT [FK_OrderOfService_Company] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Company] ([Company_Id])
GO
ALTER TABLE [dbo].[OrderOfService] CHECK CONSTRAINT [FK_OrderOfService_Company]
GO
ALTER TABLE [dbo].[OrderOfService]  WITH CHECK ADD  CONSTRAINT [FK_OrderOfService_Employee] FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[Employee] ([Employee_Id])
GO
ALTER TABLE [dbo].[OrderOfService] CHECK CONSTRAINT [FK_OrderOfService_Employee]
/*------------------------------#END TABLE ORDER SERVICE------------------------------*/
GO
/*------------------------------TABLE ORDER SERVICE DETAIL------------------------------*/
ALTER TABLE [dbo].[OrderOfServiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderOfServiceDetail_OrderOfService] FOREIGN KEY([OrderService_Id])
REFERENCES [dbo].[OrderOfService] ([OrderOfService_Id])
GO
ALTER TABLE [dbo].[OrderOfServiceDetail] CHECK CONSTRAINT [FK_OrderOfServiceDetail_OrderOfService]
GO
ALTER TABLE [dbo].[OrderOfServiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderOfServiceDetail_Service] FOREIGN KEY([Servive_Id])
REFERENCES [dbo].[Service] ([Service_Id])
GO
ALTER TABLE [dbo].[OrderOfServiceDetail] CHECK CONSTRAINT [FK_OrderOfServiceDetail_Service]
/*------------------------------#END TABLE ORDER SERVICE DETAIL------------------------------*/
GO
/*------------------------------TABLE PROBLEM------------------------------*/
ALTER TABLE [dbo].[ProblemOfCustomer]  WITH CHECK ADD  CONSTRAINT [FK_ProblemOfCustomer_Company] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Company] ([Company_Id])
GO
ALTER TABLE [dbo].[ProblemOfCustomer] CHECK CONSTRAINT [FK_ProblemOfCustomer_Company]
GO
ALTER TABLE [dbo].[ProblemOfCustomer]  WITH CHECK ADD  CONSTRAINT [FK_ProblemOfCustomer_Customer] FOREIGN KEY([Customer_Id])
REFERENCES [dbo].[Customer] ([Customer_Id])
GO
ALTER TABLE [dbo].[ProblemOfCustomer] CHECK CONSTRAINT [FK_ProblemOfCustomer_Customer]
GO
ALTER TABLE [dbo].[ProblemOfCustomer]  WITH CHECK ADD  CONSTRAINT [FK_ProblemOfCustomer_Problem] FOREIGN KEY([Problem_Id])
REFERENCES [dbo].[Problem] ([Problem_Id])
GO
ALTER TABLE [dbo].[ProblemOfCustomer] CHECK CONSTRAINT [FK_ProblemOfCustomer_Problem]
/*------------------------------#END TABLE PROBLEM------------------------------*/
GO
/*------------------------------TABLE PRODUCT------------------------------*/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category] ([Category_Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Company] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Company] ([Company_Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Company]
/*------------------------------#END TABLE PRODUCT------------------------------*/
GO
/*
* Task: Insert data to database
* Author: cuongph_c00034
* Start Date: 03.07.2011
* */

/*
* Insert into table DEPARTMENT
* */
INSERT  INTO Department
VALUES  ( '42a8d8d1-eaa0-4a4f-a623-01b82bb20729', 'HR Management', '', 'False' ) ;
GO
INSERT  INTO Department
VALUES  ( '3aaa7421-439c-4bca-a370-353df83f5bb3', 'Administration', '',
          'False' ) ;
GO
INSERT  INTO Department
VALUES  ( 'd5e6196d-c293-4378-bc20-842f7f8a6de0', 'Service', N'', 'False' ) ;
GO
INSERT  INTO Department
VALUES  ( '90671226-5e6d-4a53-aa11-9ad07999e1b6', 'Training', N'', 'False' ) ;
GO
INSERT  INTO Department
VALUES  ( '0e17cd07-266f-4528-86fa-cd4eda254743', 'Internet Security', N'',
          'False' ) ;
GO
INSERT  INTO Department
VALUES  ( '3a0891fa-6dd9-4bd0-a0f9-d0fbd1b3a031', 'Auditors', N'', 'False' ) ;
GO

/*
* Insert into table EMPLOYEE
* */
INSERT  INTO Employee
VALUES  ( '71801c3f-5a51-45c4-a6db-0b3220677b85',
          '42a8d8d1-eaa0-4a4f-a623-01b82bb20729', N'', N'', 'True', '', N'',
          N'', N'huydk@Exellon.com',
          N'iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAYAAADDPmHLAAAABGdBTUEAALGOfPtRkwAAACBjSFJNAACHDwAAjA8AAP1SAACBQAAAfXkAAOmLAAA85QAAGcxzPIV3AAAKOWlDQ1BQaG90b3Nob3AgSUNDIHByb2ZpbGUAAEjHnZZ3VFTXFofPvXd6oc0wAlKG3rvAANJ7k15FYZgZYCgDDjM0sSGiAhFFRJoiSFDEgNFQJFZEsRAUVLAHJAgoMRhFVCxvRtaLrqy89/Ly++Osb+2z97n77L3PWhcAkqcvl5cGSwGQyhPwgzyc6RGRUXTsAIABHmCAKQBMVka6X7B7CBDJy82FniFyAl8EAfB6WLwCcNPQM4BOB/+fpFnpfIHomAARm7M5GSwRF4g4JUuQLrbPipgalyxmGCVmvihBEcuJOWGRDT77LLKjmNmpPLaIxTmns1PZYu4V8bZMIUfEiK+ICzO5nCwR3xKxRoowlSviN+LYVA4zAwAUSWwXcFiJIjYRMYkfEuQi4uUA4EgJX3HcVyzgZAvEl3JJS8/hcxMSBXQdli7d1NqaQffkZKVwBALDACYrmcln013SUtOZvBwAFu/8WTLi2tJFRbY0tba0NDQzMv2qUP91829K3NtFehn4uWcQrf+L7a/80hoAYMyJarPziy2uCoDOLQDI3fti0zgAgKSobx3Xv7oPTTwviQJBuo2xcVZWlhGXwzISF/QP/U+Hv6GvvmckPu6P8tBdOfFMYYqALq4bKy0lTcinZ6QzWRy64Z+H+B8H/nUeBkGceA6fwxNFhImmjMtLELWbx+YKuGk8Opf3n5r4D8P+pMW5FonS+BFQY4yA1HUqQH7tBygKESDR+8Vd/6NvvvgwIH554SqTi3P/7zf9Z8Gl4iWDm/A5ziUohM4S8jMX98TPEqABAUgCKpAHykAd6ABDYAasgC1wBG7AG/iDEBAJVgMWSASpgA+yQB7YBApBMdgJ9oBqUAcaQTNoBcdBJzgFzoNL4Bq4AW6D+2AUTIBnYBa8BgsQBGEhMkSB5CEVSBPSh8wgBmQPuUG+UBAUCcVCCRAPEkJ50GaoGCqDqqF6qBn6HjoJnYeuQIPQXWgMmoZ+h97BCEyCqbASrAUbwwzYCfaBQ+BVcAK8Bs6FC+AdcCXcAB+FO+Dz8DX4NjwKP4PnEIAQERqiihgiDMQF8UeikHiEj6xHipAKpAFpRbqRPuQmMorMIG9RGBQFRUcZomxRnqhQFAu1BrUeVYKqRh1GdaB6UTdRY6hZ1Ec0Ga2I1kfboL3QEegEdBa6EF2BbkK3oy+ib6Mn0K8xGAwNo42xwnhiIjFJmLWYEsw+TBvmHGYQM46Zw2Kx8lh9rB3WH8vECrCF2CrsUexZ7BB2AvsGR8Sp4Mxw7rgoHA+Xj6vAHcGdwQ3hJnELeCm8Jt4G749n43PwpfhGfDf+On4Cv0CQJmgT7AghhCTCJkIloZVwkfCA8JJIJKoRrYmBRC5xI7GSeIx4mThGfEuSIemRXEjRJCFpB+kQ6RzpLuklmUzWIjuSo8gC8g5yM/kC+RH5jQRFwkjCS4ItsUGiRqJDYkjiuSReUlPSSXK1ZK5kheQJyeuSM1J4KS0pFymm1HqpGqmTUiNSc9IUaVNpf+lU6RLpI9JXpKdksDJaMm4ybJkCmYMyF2TGKQhFneJCYVE2UxopFykTVAxVm+pFTaIWU7+jDlBnZWVkl8mGyWbL1sielh2lITQtmhcthVZKO04bpr1borTEaQlnyfYlrUuGlszLLZVzlOPIFcm1yd2WeydPl3eTT5bfJd8p/1ABpaCnEKiQpbBf4aLCzFLqUtulrKVFS48vvacIK+opBimuVTyo2K84p6Ss5KGUrlSldEFpRpmm7KicpFyufEZ5WoWiYq/CVSlXOavylC5Ld6Kn0CvpvfRZVUVVT1Whar3qgOqCmrZaqFq+WpvaQ3WCOkM9Xr1cvUd9VkNFw08jT6NF454mXpOhmai5V7NPc15LWytca6tWp9aUtpy2l3audov2Ax2yjoPOGp0GnVu6GF2GbrLuPt0berCehV6iXo3edX1Y31Kfq79Pf9AAbWBtwDNoMBgxJBk6GWYathiOGdGMfI3yjTqNnhtrGEcZ7zLuM/5oYmGSYtJoct9UxtTbNN+02/R3Mz0zllmN2S1zsrm7+QbzLvMXy/SXcZbtX3bHgmLhZ7HVosfig6WVJd+y1XLaSsMq1qrWaoRBZQQwShiXrdHWztYbrE9Zv7WxtBHYHLf5zdbQNtn2iO3Ucu3lnOWNy8ft1OyYdvV2o/Z0+1j7A/ajDqoOTIcGh8eO6o5sxybHSSddpySno07PnU2c+c7tzvMuNi7rXM65Iq4erkWuA24ybqFu1W6P3NXcE9xb3Gc9LDzWepzzRHv6eO7yHPFS8mJ5NXvNelt5r/Pu9SH5BPtU+zz21fPl+3b7wX7efrv9HqzQXMFb0ekP/L38d/s/DNAOWBPwYyAmMCCwJvBJkGlQXlBfMCU4JvhI8OsQ55DSkPuhOqHC0J4wybDosOaw+XDX8LLw0QjjiHUR1yIVIrmRXVHYqLCopqi5lW4r96yciLaILoweXqW9KnvVldUKq1NWn46RjGHGnIhFx4bHHol9z/RnNjDn4rziauNmWS6svaxnbEd2OXuaY8cp40zG28WXxU8l2CXsTphOdEisSJzhunCruS+SPJPqkuaT/ZMPJX9KCU9pS8Wlxqae5Mnwknm9acpp2WmD6frphemja2zW7Fkzy/fhN2VAGasyugRU0c9Uv1BHuEU4lmmfWZP5Jiss60S2dDYvuz9HL2d7zmSue+63a1FrWWt78lTzNuWNrXNaV78eWh+3vmeD+oaCDRMbPTYe3kTYlLzpp3yT/LL8V5vDN3cXKBVsLBjf4rGlpVCikF84stV2a9021DbutoHt5turtn8sYhddLTYprih+X8IqufqN6TeV33zaEb9joNSydP9OzE7ezuFdDrsOl0mX5ZaN7/bb3VFOLy8qf7UnZs+VimUVdXsJe4V7Ryt9K7uqNKp2Vr2vTqy+XeNc01arWLu9dn4fe9/Qfsf9rXVKdcV17w5wD9yp96jvaNBqqDiIOZh58EljWGPft4xvm5sUmoqbPhziHRo9HHS4t9mqufmI4pHSFrhF2DJ9NProje9cv+tqNWytb6O1FR8Dx4THnn4f+/3wcZ/jPScYJ1p/0Pyhtp3SXtQBdeR0zHYmdo52RXYNnvQ+2dNt293+o9GPh06pnqo5LXu69AzhTMGZT2dzz86dSz83cz7h/HhPTM/9CxEXbvUG9g5c9Ll4+ZL7pQt9Tn1nL9tdPnXF5srJq4yrndcsr3X0W/S3/2TxU/uA5UDHdavrXTesb3QPLh88M+QwdP6m681Lt7xuXbu94vbgcOjwnZHokdE77DtTd1PuvriXeW/h/sYH6AdFD6UeVjxSfNTws+7PbaOWo6fHXMf6Hwc/vj/OGn/2S8Yv7ycKnpCfVEyqTDZPmU2dmnafvvF05dOJZ+nPFmYKf5X+tfa5zvMffnP8rX82YnbiBf/Fp99LXsq/PPRq2aueuYC5R69TXy/MF72Rf3P4LeNt37vwd5MLWe+x7ys/6H7o/ujz8cGn1E+f/gUDmPP8usTo0wAAAAlwSFlzAAALEgAACxIB0t1+/AAABjdJREFUeF7tnXtPFTEQxfn+n0tjouKbSJQoXgGB8AoC8l49N1lyXe6y92477TntNPEfL/vozq/Tmel0uvJsdbPxf/V+gxUXfr3Ch+wdgMo1oAPgANStAmufAl0DuAZwDVCzFnAN4BrANYBrgMpHQR8Az9/8aFbXtpu1jb3m6+ZBszE5bL5vHRUVOPMpYAb+lx9+TgV9eHLRXF7dNHd390237R+dOQClqMxXH7ea9W/7ze7B70eCnvcfk52TooRfZSTw9aetZnvvtLm4vF5I6O0fHZ/+KU741QDwfv3XVOghDbZAKZpvth9F2wAw2pYd6X2Q4F4OgIi3gLnaor39vFMcBEVpABh0t7d3FrJ/uCeeUZImKAIAuG9n51emgp+9eUmuoDwAmJtzNMQJXrybyGsDaQAQsMndECVUnhIkAcDIu7q+zS37h+crh4flAEAgh7Gp2gVSAMANY26K0UIZABC3V2hqmkAGgHkrc6xAYEVRxTCUAMAqsmcJEHIJFCCQAMBSUFb3Vlk6pgcgV6AnBhiuASIsHsGyVm0KS8j0GoAp4LMsiAoBImoAsMij3BRcQmoA2AM/Q3Cenl3SewLUAGChRblhiZrdEHQADAm7+Zec4gAEeAIwopQbspPYA0LUGkAxAjgLLDSAAxCgARwA+32brgEM5xjXAAGjH8aTawDXAIbj0/7WrgECNYC6F+AABALw6cuu/TA1fIK7gYEAqEcCsXfAA0EBEKgD4KHgAOFj5KhPAQ5AIACsewAWNRscgEAA1JeDD47P3QYIMYKQUqXcHIBADYA9gEr7AbqwOgCVA4C6RCEaMMW11ItB+ADWFT8spxiFHUK0AGAdHR/w/nGtRkuZRb036hfAk0kxksc+gxIAzP2Io5fSmDUBJQDq/n8XXGZbgBIAdeu/CwDzBhFKADCfKe8I6gLAXEeIFoCUZd+sbQ0UtxhrpFlfRwsAtlWV0qyFGHJ/WgDUs4FaeBHHCBGQ9bW0AKjnArQAsBeOogVApSjU0DTF7ALSnxcw9HEVfmcvM0+rAUCnchi4hRNZTdbzeMj9qQGIddhDTk3BXiaGGgDlAlGADsGskNGZ4lpqAPABkFSh2JDIonDCCD0AgEAxKoiDqlKM4NBnSAAQeuJXDg2icpiEBABqQSEYr6EjM9X1EgColYtTKA/XAiYBAF5WySVUOllMBgAlOyCV+o7xHBkAYFUrNKX5n34toEu4QmiYOQF0nsaQ0QB4+UWPec+pKVTcPzkjEC/MvldQoTZwVwtIaQB2b4A5+bPPYJQDAC4WY1MoByNvA7QdgKpla+zLvsVoAHQE+waZPAL2tK+n4gVyU0DbGabAUIyATK57yALAYgtg3T+X8GI8VxYAlsigous3C44DEGhNqoV+5eMAbQdYpgAYozFUca57yGoAlq1jDkBgIaix5DN5AezHwhTpBjLtHmavA1QkAEzRQPbdP0UCgNg7S1PLAZB3Az0UHO8sIUkvAEkXTE0pC1g6DgDBw/9H0QWmhiogcEsVtoJJA8Dk+vUB6ClhhnEBtpE/DwI1LSBlAyiUjlfaFCKVFg7LX6Ehc3lsdDPHdTIaQGWDqEJRCMk4gMKegFZDKa0NyGgApfLx7JXB5DSA2ulhCsfFyewMglWtWDkc0UHmItH0AECNKrh9Q54Jjo1hjg1Q2QCIok12Toa+qeTvWL5m3DpGAQASKjBSamgwZpmMxKwAYH5nSuxIDSC0XW47IQsA6LiSW2cNBtY4ctkJyQBAB5ny+KyFOub+2GOQ+oApcwCg5pUqfI0RXOxrkGqOwYLyeNbrAyYAYKt0qdZ8bGEP3Q82kuUKY1QAkB1bs1E3JMyQ32EzISEmdsJJMAB4IcxbJQRtQgSU8lq4zLFS0UcDADVfi++eUrjLPAup8aFG49IA1O67LyOglH8Lm2uM0bgwANj8oLgok1IIDM9a9sj6QQAgeKZ6PAwfWeEdFgWhFwAsXPiIVxD10+84lKP4CACkMymkX+uLJm0P+mIJ/wGgkniZ9tOV8zRMC707gzxyV46gn+oJAkqzSatTDaCw5aoO8aTpJYJ2LQQrsPK91fcFoAmmO4Pq67r3uP0CWHF0ACrnwQFwACr/ApV33zWAA1D5F6i8+38BKtHG0vVrjZ8AAAAASUVORK5CYII=',
          'False' ) ;
GO
INSERT  INTO [Employee]
VALUES  ( '37a61117-f2c5-46f5-a7bc-218310c9c2b1',
          '3a0891fa-6dd9-4bd0-a0f9-d0fbd1b3a031', N'', N'', 'True', '', N'',
          N'', N'kientm@Exellon.com',
          N'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',
          'False' ) ;
GO
INSERT  INTO [Employee]
VALUES  ( 'b557074f-2612-4e86-b208-297f75922d86',
          'd5e6196d-c293-4378-bc20-842f7f8a6de0', N'', N'', 'False', '', N'',
          N'', N'hienth@Exellon.com',
          N'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',
          'False' ) ;
GO
INSERT  INTO [Employee]
VALUES  ( '9363c012-b4e3-473d-8848-2b114bca188c',
          '3aaa7421-439c-4bca-a370-353df83f5bb3', N'', N'', 'True', '', N'',
          N'', N'dungqn@Exellon.com',
          N'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',
          'False' ) ;
GO
INSERT  INTO [Employee]
VALUES  ( 'd0cfcbdc-8e28-4368-aa05-36eb22f80608',
          'd5e6196d-c293-4378-bc20-842f7f8a6de0', N'', N'', 'True', '', N'',
          N'', N'tungvm@Exellon.com',
          N'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',
          'False' ) ;
GO
INSERT  INTO [Employee]
VALUES  ( 'efb8e475-9cc0-4854-bff3-3e1d4e8a91a5',
          'd5e6196d-c293-4378-bc20-842f7f8a6de0', N'', N'', 'True', '', N'',
          N'', N'hoangqm@Exellon.com',
          N'iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAMAAAAp4XiDAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAABgUExURfP1+dzh7eXp8tHY58jR4s3V5O7x9vn6/Oru9NTa6Pz9/uns8/b4+vX2+v7+//b3+trg7MvT5MfQ4vj5+9fd6t7k7uPn8MbO4czT5PHz+NXc6dbc6dLZ6MbP4f///8TN4BBFKZQAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAFYSURBVEhLrZVtc4JADIRBKFKo9QVRxHL3//9lD7VCdkOAmd4XHceH3VySJepWn2g10UV+9flnJKmz6sgmplTS+ObCiRXbOtJG/f/DSRYizf4FhI/DImP1AIRvOTFsrBSEc3tkCNkAwQwiRyKoHkRYxLmdtIbIoxtwvm3kS0GcjWw1pBMMGlORq4lU61VGszLAdi1/8yjE1l9yYSM4Yb1aZSIf6o3drRvTRHAwoS8H7Y5daakkKiITAFROKvJjdl9FZDLhjGnFyFI8LbIik9qt9LxjsGGsEpNMBhFDxq6EfM4hPgMGhtKzMe8BoVhWYhwuYEHAetiyJQjMv4yX8ADFGNTSzMa4x8lsZ5GU+oIMGWsJ2cy1kqMfgp/LL3iU4UUujXUXdcVyAY2RJleB/sfbaJcH5K5m6/sh23dmvJDTRakBNctnVx9IggM/ZXB3fiJn9Z0yQRW1/wWi4CPCygNUYQAAAABJRU5ErkJggg==',
          'False' ) ;
GO
INSERT  INTO [Employee]
VALUES  ( '5edbc3de-f4d7-407f-a879-4055d79aa823',
          'd5e6196d-c293-4378-bc20-842f7f8a6de0', N'', N'', 'True', '', N'',
          N'', N'tienpm@Exellon.com',
          N'iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAMAAAAp4XiDAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAABgUExURfP1+dzh7eXp8tHY58jR4s3V5O7x9vn6/Oru9NTa6Pz9/uns8/b4+vX2+v7+//b3+trg7MvT5MfQ4vj5+9fd6t7k7uPn8MbO4czT5PHz+NXc6dbc6dLZ6MbP4f///8TN4BBFKZQAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAFYSURBVEhLrZVtc4JADIRBKFKo9QVRxHL3//9lD7VCdkOAmd4XHceH3VySJepWn2g10UV+9flnJKmz6sgmplTS+ObCiRXbOtJG/f/DSRYizf4FhI/DImP1AIRvOTFsrBSEc3tkCNkAwQwiRyKoHkRYxLmdtIbIoxtwvm3kS0GcjWw1pBMMGlORq4lU61VGszLAdi1/8yjE1l9yYSM4Yb1aZSIf6o3drRvTRHAwoS8H7Y5daakkKiITAFROKvJjdl9FZDLhjGnFyFI8LbIik9qt9LxjsGGsEpNMBhFDxq6EfM4hPgMGhtKzMe8BoVhWYhwuYEHAetiyJQjMv4yX8ADFGNTSzMa4x8lsZ5GU+oIMGWsJ2cy1kqMfgp/LL3iU4UUujXUXdcVyAY2RJleB/sfbaJcH5K5m6/sh23dmvJDTRakBNctnVx9IggM/ZXB3fiJn9Z0yQRW1/wWi4CPCygNUYQAAAABJRU5ErkJggg==',
          'False' ) ;
GO
INSERT  INTO [Employee]
VALUES  ( '68680e64-cb0e-4e29-bfad-4a074d616399',
          'd5e6196d-c293-4378-bc20-842f7f8a6de0', N'', N'', 'False', '', N'',
          N'', N'quynhma@Exellon.com',
          N'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',
          'False' ) ;
GO
INSERT  INTO [Employee]
VALUES  ( '09ee85c6-e47a-499c-8118-4e4459110db1',
          'd5e6196d-c293-4378-bc20-842f7f8a6de0', N'', N'', 'True', '', N'',
          N'', N'minhlt@Exellon.com',
          N'iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAYAAADDPmHLAAAABGdBTUEAALGOfPtRkwAAACBjSFJNAACHDwAAjA8AAP1SAACBQAAAfXkAAOmLAAA85QAAGcxzPIV3AAAKOWlDQ1BQaG90b3Nob3AgSUNDIHByb2ZpbGUAAEjHnZZ3VFTXFofPvXd6oc0wAlKG3rvAANJ7k15FYZgZYCgDDjM0sSGiAhFFRJoiSFDEgNFQJFZEsRAUVLAHJAgoMRhFVCxvRtaLrqy89/Ly++Osb+2z97n77L3PWhcAkqcvl5cGSwGQyhPwgzyc6RGRUXTsAIABHmCAKQBMVka6X7B7CBDJy82FniFyAl8EAfB6WLwCcNPQM4BOB/+fpFnpfIHomAARm7M5GSwRF4g4JUuQLrbPipgalyxmGCVmvihBEcuJOWGRDT77LLKjmNmpPLaIxTmns1PZYu4V8bZMIUfEiK+ICzO5nCwR3xKxRoowlSviN+LYVA4zAwAUSWwXcFiJIjYRMYkfEuQi4uUA4EgJX3HcVyzgZAvEl3JJS8/hcxMSBXQdli7d1NqaQffkZKVwBALDACYrmcln013SUtOZvBwAFu/8WTLi2tJFRbY0tba0NDQzMv2qUP91829K3NtFehn4uWcQrf+L7a/80hoAYMyJarPziy2uCoDOLQDI3fti0zgAgKSobx3Xv7oPTTwviQJBuo2xcVZWlhGXwzISF/QP/U+Hv6GvvmckPu6P8tBdOfFMYYqALq4bKy0lTcinZ6QzWRy64Z+H+B8H/nUeBkGceA6fwxNFhImmjMtLELWbx+YKuGk8Opf3n5r4D8P+pMW5FonS+BFQY4yA1HUqQH7tBygKESDR+8Vd/6NvvvgwIH554SqTi3P/7zf9Z8Gl4iWDm/A5ziUohM4S8jMX98TPEqABAUgCKpAHykAd6ABDYAasgC1wBG7AG/iDEBAJVgMWSASpgA+yQB7YBApBMdgJ9oBqUAcaQTNoBcdBJzgFzoNL4Bq4AW6D+2AUTIBnYBa8BgsQBGEhMkSB5CEVSBPSh8wgBmQPuUG+UBAUCcVCCRAPEkJ50GaoGCqDqqF6qBn6HjoJnYeuQIPQXWgMmoZ+h97BCEyCqbASrAUbwwzYCfaBQ+BVcAK8Bs6FC+AdcCXcAB+FO+Dz8DX4NjwKP4PnEIAQERqiihgiDMQF8UeikHiEj6xHipAKpAFpRbqRPuQmMorMIG9RGBQFRUcZomxRnqhQFAu1BrUeVYKqRh1GdaB6UTdRY6hZ1Ec0Ga2I1kfboL3QEegEdBa6EF2BbkK3oy+ib6Mn0K8xGAwNo42xwnhiIjFJmLWYEsw+TBvmHGYQM46Zw2Kx8lh9rB3WH8vECrCF2CrsUexZ7BB2AvsGR8Sp4Mxw7rgoHA+Xj6vAHcGdwQ3hJnELeCm8Jt4G749n43PwpfhGfDf+On4Cv0CQJmgT7AghhCTCJkIloZVwkfCA8JJIJKoRrYmBRC5xI7GSeIx4mThGfEuSIemRXEjRJCFpB+kQ6RzpLuklmUzWIjuSo8gC8g5yM/kC+RH5jQRFwkjCS4ItsUGiRqJDYkjiuSReUlPSSXK1ZK5kheQJyeuSM1J4KS0pFymm1HqpGqmTUiNSc9IUaVNpf+lU6RLpI9JXpKdksDJaMm4ybJkCmYMyF2TGKQhFneJCYVE2UxopFykTVAxVm+pFTaIWU7+jDlBnZWVkl8mGyWbL1sielh2lITQtmhcthVZKO04bpr1borTEaQlnyfYlrUuGlszLLZVzlOPIFcm1yd2WeydPl3eTT5bfJd8p/1ABpaCnEKiQpbBf4aLCzFLqUtulrKVFS48vvacIK+opBimuVTyo2K84p6Ss5KGUrlSldEFpRpmm7KicpFyufEZ5WoWiYq/CVSlXOavylC5Ld6Kn0CvpvfRZVUVVT1Whar3qgOqCmrZaqFq+WpvaQ3WCOkM9Xr1cvUd9VkNFw08jT6NF454mXpOhmai5V7NPc15LWytca6tWp9aUtpy2l3audov2Ax2yjoPOGp0GnVu6GF2GbrLuPt0berCehV6iXo3edX1Y31Kfq79Pf9AAbWBtwDNoMBgxJBk6GWYathiOGdGMfI3yjTqNnhtrGEcZ7zLuM/5oYmGSYtJoct9UxtTbNN+02/R3Mz0zllmN2S1zsrm7+QbzLvMXy/SXcZbtX3bHgmLhZ7HVosfig6WVJd+y1XLaSsMq1qrWaoRBZQQwShiXrdHWztYbrE9Zv7WxtBHYHLf5zdbQNtn2iO3Ucu3lnOWNy8ft1OyYdvV2o/Z0+1j7A/ajDqoOTIcGh8eO6o5sxybHSSddpySno07PnU2c+c7tzvMuNi7rXM65Iq4erkWuA24ybqFu1W6P3NXcE9xb3Gc9LDzWepzzRHv6eO7yHPFS8mJ5NXvNelt5r/Pu9SH5BPtU+zz21fPl+3b7wX7efrv9HqzQXMFb0ekP/L38d/s/DNAOWBPwYyAmMCCwJvBJkGlQXlBfMCU4JvhI8OsQ55DSkPuhOqHC0J4wybDosOaw+XDX8LLw0QjjiHUR1yIVIrmRXVHYqLCopqi5lW4r96yciLaILoweXqW9KnvVldUKq1NWn46RjGHGnIhFx4bHHol9z/RnNjDn4rziauNmWS6svaxnbEd2OXuaY8cp40zG28WXxU8l2CXsTphOdEisSJzhunCruS+SPJPqkuaT/ZMPJX9KCU9pS8Wlxqae5Mnwknm9acpp2WmD6frphemja2zW7Fkzy/fhN2VAGasyugRU0c9Uv1BHuEU4lmmfWZP5Jiss60S2dDYvuz9HL2d7zmSue+63a1FrWWt78lTzNuWNrXNaV78eWh+3vmeD+oaCDRMbPTYe3kTYlLzpp3yT/LL8V5vDN3cXKBVsLBjf4rGlpVCikF84stV2a9021DbutoHt5turtn8sYhddLTYprih+X8IqufqN6TeV33zaEb9joNSydP9OzE7ezuFdDrsOl0mX5ZaN7/bb3VFOLy8qf7UnZs+VimUVdXsJe4V7Ryt9K7uqNKp2Vr2vTqy+XeNc01arWLu9dn4fe9/Qfsf9rXVKdcV17w5wD9yp96jvaNBqqDiIOZh58EljWGPft4xvm5sUmoqbPhziHRo9HHS4t9mqufmI4pHSFrhF2DJ9NProje9cv+tqNWytb6O1FR8Dx4THnn4f+/3wcZ/jPScYJ1p/0Pyhtp3SXtQBdeR0zHYmdo52RXYNnvQ+2dNt293+o9GPh06pnqo5LXu69AzhTMGZT2dzz86dSz83cz7h/HhPTM/9CxEXbvUG9g5c9Ll4+ZL7pQt9Tn1nL9tdPnXF5srJq4yrndcsr3X0W/S3/2TxU/uA5UDHdavrXTesb3QPLh88M+QwdP6m681Lt7xuXbu94vbgcOjwnZHokdE77DtTd1PuvriXeW/h/sYH6AdFD6UeVjxSfNTws+7PbaOWo6fHXMf6Hwc/vj/OGn/2S8Yv7ycKnpCfVEyqTDZPmU2dmnafvvF05dOJZ+nPFmYKf5X+tfa5zvMffnP8rX82YnbiBf/Fp99LXsq/PPRq2aueuYC5R69TXy/MF72Rf3P4LeNt37vwd5MLWe+x7ys/6H7o/ujz8cGn1E+f/gUDmPP8usTo0wAAAAlwSFlzAAALEgAACxIB0t1+/AAABjdJREFUeF7tnXtPFTEQxfn+n0tjouKbSJQoXgGB8AoC8l49N1lyXe6y92477TntNPEfL/vozq/Tmel0uvJsdbPxf/V+gxUXfr3Ch+wdgMo1oAPgANStAmufAl0DuAZwDVCzFnAN4BrANYBrgMpHQR8Az9/8aFbXtpu1jb3m6+ZBszE5bL5vHRUVOPMpYAb+lx9+TgV9eHLRXF7dNHd390237R+dOQClqMxXH7ea9W/7ze7B70eCnvcfk52TooRfZSTw9aetZnvvtLm4vF5I6O0fHZ/+KU741QDwfv3XVOghDbZAKZpvth9F2wAw2pYd6X2Q4F4OgIi3gLnaor39vFMcBEVpABh0t7d3FrJ/uCeeUZImKAIAuG9n51emgp+9eUmuoDwAmJtzNMQJXrybyGsDaQAQsMndECVUnhIkAcDIu7q+zS37h+crh4flAEAgh7Gp2gVSAMANY26K0UIZABC3V2hqmkAGgHkrc6xAYEVRxTCUAMAqsmcJEHIJFCCQAMBSUFb3Vlk6pgcgV6AnBhiuASIsHsGyVm0KS8j0GoAp4LMsiAoBImoAsMij3BRcQmoA2AM/Q3Cenl3SewLUAGChRblhiZrdEHQADAm7+Zec4gAEeAIwopQbspPYA0LUGkAxAjgLLDSAAxCgARwA+32brgEM5xjXAAGjH8aTawDXAIbj0/7WrgECNYC6F+AABALw6cuu/TA1fIK7gYEAqEcCsXfAA0EBEKgD4KHgAOFj5KhPAQ5AIACsewAWNRscgEAA1JeDD47P3QYIMYKQUqXcHIBADYA9gEr7AbqwOgCVA4C6RCEaMMW11ItB+ADWFT8spxiFHUK0AGAdHR/w/nGtRkuZRb036hfAk0kxksc+gxIAzP2Io5fSmDUBJQDq/n8XXGZbgBIAdeu/CwDzBhFKADCfKe8I6gLAXEeIFoCUZd+sbQ0UtxhrpFlfRwsAtlWV0qyFGHJ/WgDUs4FaeBHHCBGQ9bW0AKjnArQAsBeOogVApSjU0DTF7ALSnxcw9HEVfmcvM0+rAUCnchi4hRNZTdbzeMj9qQGIddhDTk3BXiaGGgDlAlGADsGskNGZ4lpqAPABkFSh2JDIonDCCD0AgEAxKoiDqlKM4NBnSAAQeuJXDg2icpiEBABqQSEYr6EjM9X1EgColYtTKA/XAiYBAF5WySVUOllMBgAlOyCV+o7xHBkAYFUrNKX5n34toEu4QmiYOQF0nsaQ0QB4+UWPec+pKVTcPzkjEC/MvldQoTZwVwtIaQB2b4A5+bPPYJQDAC4WY1MoByNvA7QdgKpla+zLvsVoAHQE+waZPAL2tK+n4gVyU0DbGabAUIyATK57yALAYgtg3T+X8GI8VxYAlsigous3C44DEGhNqoV+5eMAbQdYpgAYozFUca57yGoAlq1jDkBgIaix5DN5AezHwhTpBjLtHmavA1QkAEzRQPbdP0UCgNg7S1PLAZB3Az0UHO8sIUkvAEkXTE0pC1g6DgDBw/9H0QWmhiogcEsVtoJJA8Dk+vUB6ClhhnEBtpE/DwI1LSBlAyiUjlfaFCKVFg7LX6Ehc3lsdDPHdTIaQGWDqEJRCMk4gMKegFZDKa0NyGgApfLx7JXB5DSA2ulhCsfFyewMglWtWDkc0UHmItH0AECNKrh9Q54Jjo1hjg1Q2QCIok12Toa+qeTvWL5m3DpGAQASKjBSamgwZpmMxKwAYH5nSuxIDSC0XW47IQsA6LiSW2cNBtY4ctkJyQBAB5ny+KyFOub+2GOQ+oApcwCg5pUqfI0RXOxrkGqOwYLyeNbrAyYAYKt0qdZ8bGEP3Q82kuUKY1QAkB1bs1E3JMyQ32EzISEmdsJJMAB4IcxbJQRtQgSU8lq4zLFS0UcDADVfi++eUrjLPAup8aFG49IA1O67LyOglH8Lm2uM0bgwANj8oLgok1IIDM9a9sj6QQAgeKZ6PAwfWeEdFgWhFwAsXPiIVxD10+84lKP4CACkMymkX+uLJm0P+mIJ/wGgkniZ9tOV8zRMC707gzxyV46gn+oJAkqzSatTDaCw5aoO8aTpJYJ2LQQrsPK91fcFoAmmO4Pq67r3uP0CWHF0ACrnwQFwACr/ApV33zWAA1D5F6i8+38BKtHG0vVrjZ8AAAAASUVORK5CYII=',
          'False' ) ;
GO
INSERT  INTO [Employee]
VALUES  ( '990fe281-b507-4a11-af85-a83175a8d344',
          'd5e6196d-c293-4378-bc20-842f7f8a6de0', N'', N'', 'True', '', N'',
          N'', N'haihn@gmail.com',
          N'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',
          'False' ) ;
GO
INSERT  INTO [Employee]
VALUES  ( 'e02ee6b8-8d06-4d94-9ce2-aa7a33fa454e',
          'd5e6196d-c293-4378-bc20-842f7f8a6de0', N'Vũ Thế', N'Quang',
          'true', '12/04/1985', N'79 đê La Thành Hà Nội', N'0969218337',
          N'quangvt@Exellon.com.vn',
          N'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',
          'False' ) ;
GO
INSERT  INTO [Employee]
VALUES  ( 'f076b848-a7fd-4df5-8a75-b4d269f15344',
          'd5e6196d-c293-4378-bc20-842f7f8a6de0', N'Trương Vĩnh', N'Tâm',
          'true', '06/14/1984', N'27 Lê Đại Hành Hà Nội', N'0948418811',
          N'tamtv@Exellon.com.vn',
          N'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',
          'False' ) ;
GO
INSERT  INTO [Employee]
VALUES  ( '754f0733-b860-46ec-94a1-d9c0102c32c2',
          'd5e6196d-c293-4378-bc20-842f7f8a6de0', N'Nguyễn Tiến', N'Anh',
          'true', N'06/04/1986', N'213 Kim Ngưu Hà Nội', N'0946447821',
          N'anhnt@Exellon.com.vn',
          N'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',
          'False' ) ;
 GO
INSERT  INTO [Employee]
VALUES  ( '26ec8d80-5cae-4c1c-9456-dff1e5148b2c',
          'd5e6196d-c293-4378-bc20-842f7f8a6de0', N'Đỗ Phú', N'Hoàng',
          'true', '06/08/1989', N'211 trương Định Hà Nội', N'0916114275',
          N'admin@Exellon.com.vn',
          N'iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAYAAADDPmHLAAAABGdBTUEAALGOfPtRkwAAACBjSFJNAACHDwAAjA8AAP1SAACBQAAAfXkAAOmLAAA85QAAGcxzPIV3AAAKOWlDQ1BQaG90b3Nob3AgSUNDIHByb2ZpbGUAAEjHnZZ3VFTXFofPvXd6oc0wAlKG3rvAANJ7k15FYZgZYCgDDjM0sSGiAhFFRJoiSFDEgNFQJFZEsRAUVLAHJAgoMRhFVCxvRtaLrqy89/Ly++Osb+2z97n77L3PWhcAkqcvl5cGSwGQyhPwgzyc6RGRUXTsAIABHmCAKQBMVka6X7B7CBDJy82FniFyAl8EAfB6WLwCcNPQM4BOB/+fpFnpfIHomAARm7M5GSwRF4g4JUuQLrbPipgalyxmGCVmvihBEcuJOWGRDT77LLKjmNmpPLaIxTmns1PZYu4V8bZMIUfEiK+ICzO5nCwR3xKxRoowlSviN+LYVA4zAwAUSWwXcFiJIjYRMYkfEuQi4uUA4EgJX3HcVyzgZAvEl3JJS8/hcxMSBXQdli7d1NqaQffkZKVwBALDACYrmcln013SUtOZvBwAFu/8WTLi2tJFRbY0tba0NDQzMv2qUP91829K3NtFehn4uWcQrf+L7a/80hoAYMyJarPziy2uCoDOLQDI3fti0zgAgKSobx3Xv7oPTTwviQJBuo2xcVZWlhGXwzISF/QP/U+Hv6GvvmckPu6P8tBdOfFMYYqALq4bKy0lTcinZ6QzWRy64Z+H+B8H/nUeBkGceA6fwxNFhImmjMtLELWbx+YKuGk8Opf3n5r4D8P+pMW5FonS+BFQY4yA1HUqQH7tBygKESDR+8Vd/6NvvvgwIH554SqTi3P/7zf9Z8Gl4iWDm/A5ziUohM4S8jMX98TPEqABAUgCKpAHykAd6ABDYAasgC1wBG7AG/iDEBAJVgMWSASpgA+yQB7YBApBMdgJ9oBqUAcaQTNoBcdBJzgFzoNL4Bq4AW6D+2AUTIBnYBa8BgsQBGEhMkSB5CEVSBPSh8wgBmQPuUG+UBAUCcVCCRAPEkJ50GaoGCqDqqF6qBn6HjoJnYeuQIPQXWgMmoZ+h97BCEyCqbASrAUbwwzYCfaBQ+BVcAK8Bs6FC+AdcCXcAB+FO+Dz8DX4NjwKP4PnEIAQERqiihgiDMQF8UeikHiEj6xHipAKpAFpRbqRPuQmMorMIG9RGBQFRUcZomxRnqhQFAu1BrUeVYKqRh1GdaB6UTdRY6hZ1Ec0Ga2I1kfboL3QEegEdBa6EF2BbkK3oy+ib6Mn0K8xGAwNo42xwnhiIjFJmLWYEsw+TBvmHGYQM46Zw2Kx8lh9rB3WH8vECrCF2CrsUexZ7BB2AvsGR8Sp4Mxw7rgoHA+Xj6vAHcGdwQ3hJnELeCm8Jt4G749n43PwpfhGfDf+On4Cv0CQJmgT7AghhCTCJkIloZVwkfCA8JJIJKoRrYmBRC5xI7GSeIx4mThGfEuSIemRXEjRJCFpB+kQ6RzpLuklmUzWIjuSo8gC8g5yM/kC+RH5jQRFwkjCS4ItsUGiRqJDYkjiuSReUlPSSXK1ZK5kheQJyeuSM1J4KS0pFymm1HqpGqmTUiNSc9IUaVNpf+lU6RLpI9JXpKdksDJaMm4ybJkCmYMyF2TGKQhFneJCYVE2UxopFykTVAxVm+pFTaIWU7+jDlBnZWVkl8mGyWbL1sielh2lITQtmhcthVZKO04bpr1borTEaQlnyfYlrUuGlszLLZVzlOPIFcm1yd2WeydPl3eTT5bfJd8p/1ABpaCnEKiQpbBf4aLCzFLqUtulrKVFS48vvacIK+opBimuVTyo2K84p6Ss5KGUrlSldEFpRpmm7KicpFyufEZ5WoWiYq/CVSlXOavylC5Ld6Kn0CvpvfRZVUVVT1Whar3qgOqCmrZaqFq+WpvaQ3WCOkM9Xr1cvUd9VkNFw08jT6NF454mXpOhmai5V7NPc15LWytca6tWp9aUtpy2l3audov2Ax2yjoPOGp0GnVu6GF2GbrLuPt0berCehV6iXo3edX1Y31Kfq79Pf9AAbWBtwDNoMBgxJBk6GWYathiOGdGMfI3yjTqNnhtrGEcZ7zLuM/5oYmGSYtJoct9UxtTbNN+02/R3Mz0zllmN2S1zsrm7+QbzLvMXy/SXcZbtX3bHgmLhZ7HVosfig6WVJd+y1XLaSsMq1qrWaoRBZQQwShiXrdHWztYbrE9Zv7WxtBHYHLf5zdbQNtn2iO3Ucu3lnOWNy8ft1OyYdvV2o/Z0+1j7A/ajDqoOTIcGh8eO6o5sxybHSSddpySno07PnU2c+c7tzvMuNi7rXM65Iq4erkWuA24ybqFu1W6P3NXcE9xb3Gc9LDzWepzzRHv6eO7yHPFS8mJ5NXvNelt5r/Pu9SH5BPtU+zz21fPl+3b7wX7efrv9HqzQXMFb0ekP/L38d/s/DNAOWBPwYyAmMCCwJvBJkGlQXlBfMCU4JvhI8OsQ55DSkPuhOqHC0J4wybDosOaw+XDX8LLw0QjjiHUR1yIVIrmRXVHYqLCopqi5lW4r96yciLaILoweXqW9KnvVldUKq1NWn46RjGHGnIhFx4bHHol9z/RnNjDn4rziauNmWS6svaxnbEd2OXuaY8cp40zG28WXxU8l2CXsTphOdEisSJzhunCruS+SPJPqkuaT/ZMPJX9KCU9pS8Wlxqae5Mnwknm9acpp2WmD6frphemja2zW7Fkzy/fhN2VAGasyugRU0c9Uv1BHuEU4lmmfWZP5Jiss60S2dDYvuz9HL2d7zmSue+63a1FrWWt78lTzNuWNrXNaV78eWh+3vmeD+oaCDRMbPTYe3kTYlLzpp3yT/LL8V5vDN3cXKBVsLBjf4rGlpVCikF84stV2a9021DbutoHt5turtn8sYhddLTYprih+X8IqufqN6TeV33zaEb9joNSydP9OzE7ezuFdDrsOl0mX5ZaN7/bb3VFOLy8qf7UnZs+VimUVdXsJe4V7Ryt9K7uqNKp2Vr2vTqy+XeNc01arWLu9dn4fe9/Qfsf9rXVKdcV17w5wD9yp96jvaNBqqDiIOZh58EljWGPft4xvm5sUmoqbPhziHRo9HHS4t9mqufmI4pHSFrhF2DJ9NProje9cv+tqNWytb6O1FR8Dx4THnn4f+/3wcZ/jPScYJ1p/0Pyhtp3SXtQBdeR0zHYmdo52RXYNnvQ+2dNt293+o9GPh06pnqo5LXu69AzhTMGZT2dzz86dSz83cz7h/HhPTM/9CxEXbvUG9g5c9Ll4+ZL7pQt9Tn1nL9tdPnXF5srJq4yrndcsr3X0W/S3/2TxU/uA5UDHdavrXTesb3QPLh88M+QwdP6m681Lt7xuXbu94vbgcOjwnZHokdE77DtTd1PuvriXeW/h/sYH6AdFD6UeVjxSfNTws+7PbaOWo6fHXMf6Hwc/vj/OGn/2S8Yv7ycKnpCfVEyqTDZPmU2dmnafvvF05dOJZ+nPFmYKf5X+tfa5zvMffnP8rX82YnbiBf/Fp99LXsq/PPRq2aueuYC5R69TXy/MF72Rf3P4LeNt37vwd5MLWe+x7ys/6H7o/ujz8cGn1E+f/gUDmPP8usTo0wAAAAlwSFlzAAALEgAACxIB0t1+/AAABjdJREFUeF7tnXtPFTEQxfn+n0tjouKbSJQoXgGB8AoC8l49N1lyXe6y92477TntNPEfL/vozq/Tmel0uvJsdbPxf/V+gxUXfr3Ch+wdgMo1oAPgANStAmufAl0DuAZwDVCzFnAN4BrANYBrgMpHQR8Az9/8aFbXtpu1jb3m6+ZBszE5bL5vHRUVOPMpYAb+lx9+TgV9eHLRXF7dNHd390237R+dOQClqMxXH7ea9W/7ze7B70eCnvcfk52TooRfZSTw9aetZnvvtLm4vF5I6O0fHZ/+KU741QDwfv3XVOghDbZAKZpvth9F2wAw2pYd6X2Q4F4OgIi3gLnaor39vFMcBEVpABh0t7d3FrJ/uCeeUZImKAIAuG9n51emgp+9eUmuoDwAmJtzNMQJXrybyGsDaQAQsMndECVUnhIkAcDIu7q+zS37h+crh4flAEAgh7Gp2gVSAMANY26K0UIZABC3V2hqmkAGgHkrc6xAYEVRxTCUAMAqsmcJEHIJFCCQAMBSUFb3Vlk6pgcgV6AnBhiuASIsHsGyVm0KS8j0GoAp4LMsiAoBImoAsMij3BRcQmoA2AM/Q3Cenl3SewLUAGChRblhiZrdEHQADAm7+Zec4gAEeAIwopQbspPYA0LUGkAxAjgLLDSAAxCgARwA+32brgEM5xjXAAGjH8aTawDXAIbj0/7WrgECNYC6F+AABALw6cuu/TA1fIK7gYEAqEcCsXfAA0EBEKgD4KHgAOFj5KhPAQ5AIACsewAWNRscgEAA1JeDD47P3QYIMYKQUqXcHIBADYA9gEr7AbqwOgCVA4C6RCEaMMW11ItB+ADWFT8spxiFHUK0AGAdHR/w/nGtRkuZRb036hfAk0kxksc+gxIAzP2Io5fSmDUBJQDq/n8XXGZbgBIAdeu/CwDzBhFKADCfKe8I6gLAXEeIFoCUZd+sbQ0UtxhrpFlfRwsAtlWV0qyFGHJ/WgDUs4FaeBHHCBGQ9bW0AKjnArQAsBeOogVApSjU0DTF7ALSnxcw9HEVfmcvM0+rAUCnchi4hRNZTdbzeMj9qQGIddhDTk3BXiaGGgDlAlGADsGskNGZ4lpqAPABkFSh2JDIonDCCD0AgEAxKoiDqlKM4NBnSAAQeuJXDg2icpiEBABqQSEYr6EjM9X1EgColYtTKA/XAiYBAF5WySVUOllMBgAlOyCV+o7xHBkAYFUrNKX5n34toEu4QmiYOQF0nsaQ0QB4+UWPec+pKVTcPzkjEC/MvldQoTZwVwtIaQB2b4A5+bPPYJQDAC4WY1MoByNvA7QdgKpla+zLvsVoAHQE+waZPAL2tK+n4gVyU0DbGabAUIyATK57yALAYgtg3T+X8GI8VxYAlsigous3C44DEGhNqoV+5eMAbQdYpgAYozFUca57yGoAlq1jDkBgIaix5DN5AezHwhTpBjLtHmavA1QkAEzRQPbdP0UCgNg7S1PLAZB3Az0UHO8sIUkvAEkXTE0pC1g6DgDBw/9H0QWmhiogcEsVtoJJA8Dk+vUB6ClhhnEBtpE/DwI1LSBlAyiUjlfaFCKVFg7LX6Ehc3lsdDPHdTIaQGWDqEJRCMk4gMKegFZDKa0NyGgApfLx7JXB5DSA2ulhCsfFyewMglWtWDkc0UHmItH0AECNKrh9Q54Jjo1hjg1Q2QCIok12Toa+qeTvWL5m3DpGAQASKjBSamgwZpmMxKwAYH5nSuxIDSC0XW47IQsA6LiSW2cNBtY4ctkJyQBAB5ny+KyFOub+2GOQ+oApcwCg5pUqfI0RXOxrkGqOwYLyeNbrAyYAYKt0qdZ8bGEP3Q82kuUKY1QAkB1bs1E3JMyQ32EzISEmdsJJMAB4IcxbJQRtQgSU8lq4zLFS0UcDADVfi++eUrjLPAup8aFG49IA1O67LyOglH8Lm2uM0bgwANj8oLgok1IIDM9a9sj6QQAgeKZ6PAwfWeEdFgWhFwAsXPiIVxD10+84lKP4CACkMymkX+uLJm0P+mIJ/wGgkniZ9tOV8zRMC707gzxyV46gn+oJAkqzSatTDaCw5aoO8aTpJYJ2LQQrsPK91fcFoAmmO4Pq67r3uP0CWHF0ACrnwQFwACr/ApV33zWAA1D5F6i8+38BKtHG0vVrjZ8AAAAASUVORK5CYII=',
          'False' ) ;
GO
INSERT  INTO [Employee]
VALUES  ( '97200740-f4d1-4820-b089-f7a545367aaf',
          'd5e6196d-c293-4378-bc20-842f7f8a6de0', N'Nguyễn Minh', N'Châu',
          'true', '06/04/1981', N'218 Phan Đình Phùng Hà Nội',
          N'0989219779', N'info@Exellon.com.vn',
          N'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',
          'False' ) ;
GO

/*
* Insert into table ROLE
* */ 
INSERT  INTO [Role]
VALUES  ( 'Administrator', 'False' ) ;
GO
INSERT  INTO [Role]
VALUES  ( 'HR Manager', 'False' ) ;
GO
INSERT  INTO [Role]
VALUES  ( 'Service Manager', 'False' ) ;
GO
INSERT  INTO [Role]
VALUES  ( 'Service Employee', 'False' ) ;
GO
INSERT  INTO [Role]
VALUES  ( 'Employee', 'False' ) ;
GO

/*
* Insert into table ACCOUNT
* */
INSERT  INTO Account
VALUES  ( 'f6bd432d-e1b8-469f-91fd-3ac2de9cb704',
          '754f0733-b860-46ec-94a1-d9c0102c32c2', 'Administrator', 'admin',
          'e10adc3949ba59abbe56e057f20f883e', 'False', 'False' ) ;
GO
INSERT  INTO Account
VALUES  ( 'eeca2cef-7ffb-433f-a442-615d8858f966',
          'e02ee6b8-8d06-4d94-9ce2-aa7a33fa454e', 'HR Manager', 'hr',
          'e10adc3949ba59abbe56e057f20f883e', 'False', 'False' ) ;
GO
INSERT  INTO Account
VALUES  ( 'c26e159c-9216-4b3a-895f-695492e09540',
          '990fe281-b507-4a11-af85-a83175a8d344', 'Service Manager', 'sm',
          'e10adc3949ba59abbe56e057f20f883e', 'False', 'False' ) ;
GO
INSERT  INTO Account
VALUES  ( 'cc8341e3-fc81-407d-934c-7d6889d50324',
          '97200740-f4d1-4820-b089-f7a545367aaf', 'Service Employee', 'se',
          'e10adc3949ba59abbe56e057f20f883e', 'False', 'False' ) ;
GO
INSERT  INTO Account
VALUES  ( '20e9ffbc-7f5b-4c5b-9c15-d1735d1a01ea',
          'f076b848-a7fd-4df5-8a75-b4d269f15344', 'Employee', 'employee',
          'e10adc3949ba59abbe56e057f20f883e', 'False', 'False' ) ;
GO

/*
* Insert into table COMPANY
* */ 
INSERT  INTO Company
VALUES  ( 'd4d232b2-8986-4ac0-b7e6-0a591f465fa6', N'Công ty TNHH Simply', '',
          N'công ty cung ứng dầu ăn.chất lượng', N'043 2146614',
          N'info@simply.com.vn', N'118 Lạc Trung Hà Nội', 'False' ) ;
GO
INSERT  INTO Company
VALUES  ( '18713451-f569-4778-afa6-af0fce1bc1e0',
          N'Công ty TNHH Ngôi Sao Việt', '',
          N'công ty cung cấp dịch vụ du lịch', N'0432155166',
          N'info@vietstar.com.vn', N'816 đê La Thành Hà Nội', 'False' ) ;
GO
INSERT  INTO Company
VALUES  ( '125ab0d6-4b35-4dda-80f7-fa744aff3045', N'Công ty TNHH Toàn Thắng',
          '', N'công ty sản xuất và nhập khẩu thiết bị điện máy ',
          N'0436144412', N'info@toanthang.com.vn',
          N'81 Đường Thành Hà Nội', 'False' ) ;
 GO
 
 /*
* Insert into table ORDER OF SERVICE
* */ 
INSERT  INTO OrderOfService
VALUES  ( 'a673f36e-e792-4176-be90-16415c426ecc',
          '125ab0d6-4b35-4dda-80f7-fa744aff3045',
          '97200740-f4d1-4820-b089-f7a545367aaf', 1,
          'RygFXr+5lUIKk6f66A7K5g==', N'hợp đồng 6 tháng',
          N'chuyển khoản 100%', '6/6/2011', '6/6/2011', 1, 'False' ) ;
GO
INSERT  INTO OrderOfService
VALUES  ( '01cfe750-6ea8-419d-8da9-b954c196b042',
          '18713451-f569-4778-afa6-af0fce1bc1e0',
          '26ec8d80-5cae-4c1c-9456-dff1e5148b2c', 1,
          '8NrwBcyAk9sKk6f66A7K5g==', N'hợp đồng 12 tháng',
          N'chuyển khoản 100%', '6/16/2011', '6/16/2011', 1, 'False' ) ;
GO
INSERT  INTO OrderOfService
VALUES  ( '2de09cae-a842-4561-9ae2-c7662ca5e474',
          'd4d232b2-8986-4ac0-b7e6-0a591f465fa6',
          '754f0733-b860-46ec-94a1-d9c0102c32c2', 1,
          '8NrwBcyAk9sKk6f66A7K5g==', N'hợp đồng 12 tháng',
          N'chuyển khoản 100%', '7/1/2011', '7/3/2011', 1, 'False' ) ;
GO

/*
* Insert into table SERVICE
* */
INSERT  INTO [Service]
VALUES  ( '51b24177-da84-4a18-8637-16c93656c0ca', N'In-bound Services', '',
          N'The In-bound service is a service in which one can only receive the calls from the customers. These call centers provide 24 hours service to all customers. The primary goal of these call centers are to receive product orders, help customers both technically and non-technically, to find dealer location',
          '9Mt3y2TYg2A=', 'False' ) ;
GO
INSERT  INTO [Service]
VALUES  ( 'f40d7f1d-637e-4d55-a811-37579da818db', N'Out-bound Services', '',
          N'The Out-bound service is a service in which the employees of Excell-on call the customers for product promotions, for checking with the customer satisfaction on the services they provide, and for the telemarketing. Outbound Call Centers depends on the technological solutions, extensive experience, quality assurance programs and commitment to customer service excellence that further ensures maximum results from the direct marketing efforts for its success',
          'GFK+dee7Q28=', 'False' ) ;
GO
INSERT  INTO [Service]
VALUES  ( 'e0d8cc13-18a9-4c13-88a5-5beeb124986a', N'Tele Marketing Services',
          '',
          N'The Tele Marketing service is a service which is purely for the promotion of marketing or sales of the products and services',
          'G3Ww0DMWCOk=', 'False' ) ;
GO

/*
* Insert into table ORDER OF SERVICE DETAIL
* */
INSERT  INTO OrderOfServiceDetail
VALUES  ( 'a673f36e-e792-4176-be90-16415c426ecc',
          '51b24177-da84-4a18-8637-16c93656c0ca', '6/12/2011', '12/12/2011', 1,
          'G3Ww0DMWCOk=', 'False' ) ;
GO
INSERT  INTO OrderOfServiceDetail
VALUES  ( '01cfe750-6ea8-419d-8da9-b954c196b042',
          'f40d7f1d-637e-4d55-a811-37579da818db', '7/1/2011', '7/1/2012', 1,
          '5izHju+kgoM=', 'False' ) ;
GO
INSERT  INTO OrderOfServiceDetail
VALUES  ( '01cfe750-6ea8-419d-8da9-b954c196b042',
          'e0d8cc13-18a9-4c13-88a5-5beeb124986a', '6/12/2011', '11/12/2011', 1,
          'wQC2vA8FVDc=', 'False' ) ;
GO

/*
* Insert into table CATEGORY
* */
INSERT  INTO Category
VALUES  ( '2e18d6f7-3187-4a1d-b3bd-6a89e858fcd2', N'Food', 'False' ) ;
GO
INSERT  INTO Category
VALUES  ( 'e3639a41-39be-4fb4-ae18-80d384f818e1', N'Travel', 'False' ) ;
GO

/*
* Insert into table PRODUCT
* */
INSERT  INTO Product
VALUES  ( '1bc3d5e0-b1c4-4967-bdd4-88d567e6271f',
          'd4d232b2-8986-4ac0-b7e6-0a591f465fa6',
          '2e18d6f7-3187-4a1d-b3bd-6a89e858fcd2',
          N'dầu ăn tinh chế đậu nành', 'Product', 'WimEXHocBME=',
          N'sản xuất tại VN Ngon bổ rẻ', '', '4/24/2011', '4/24/2014',
          'False' ) ;
GO
INSERT  INTO Product
VALUES  ( '34f7272e-0181-4874-a387-7f9e8f57d2f6',
          '18713451-f569-4778-afa6-af0fce1bc1e0',
          '2e18d6f7-3187-4a1d-b3bd-6a89e858fcd2', N'sữa đậu nành',
          'Product', 'TNc/MRe1r2A=', N'sản xuất tại VN Ngon bổ rẻ', '',
          '6/21/2011', '12/21/2011', 'False' ) ;
GO
INSERT  INTO Product
VALUES  ( '33b29288-2181-44d3-b10d-736d5d694095',
          '125ab0d6-4b35-4dda-80f7-fa744aff3045',
          'e3639a41-39be-4fb4-ae18-80d384f818e1', N'gói du lịch nha trang',
          'Service', 'byqSFKAq5fk=',
          N'đảm bảo đầy đủ.an toàn trong 3 ngày', '', '1/1/2011',
          '1/1/2015', 'False' ) ;
GO
INSERT  INTO Product
VALUES  ( '13ce7b43-c0f5-4784-955f-430a0a503286',
          '125ab0d6-4b35-4dda-80f7-fa744aff3045',
          'e3639a41-39be-4fb4-ae18-80d384f818e1', N'gói du lịch Cát Bà',
          'Service', 'VVLjuk8zYwg=',
          N'đảm bảo đầy đủ.an toàn trong 3 ngày', '', '1/1/2011',
          '1/1/2015', 'False' ) ;
GO

/*
* Insert into table CUSTOMER
* */
INSERT  INTO Customer
VALUES  ( 'abb10eda-13cf-47ae-a0e7-0a7d472763e3', N'Hoàng Mạnh',
          N'0914551112', N'1129 Láng  Hà Nội', 'False' ) ;
GO
INSERT  INTO Customer
VALUES  ( '01cb9816-8339-4e1f-8818-3179527a30c3', N'Nguyễn Minh',
          N'0912 561 552', N'14 Thái Thịnh Đống Đa Hà Nội', 'False' ) ;
GO
INSERT  INTO Customer
VALUES  ( '12777dc2-6da1-4f8c-a5e9-7bb947e6a88b', N'Lê Thông', N'0944214442',
          N'145 Đại Cồ Việt-Hai Bà Trưng-Hà Nội', 'False' ) ;
GO
INSERT  INTO Customer
VALUES  ( '25d7e88e-109b-4b8e-853a-db9aba955cd2', N'Trần Giang',
          N'0123776776', N'212-Lê Duẩn-Hà Nội', 'False' ) ;
GO

/*
* Insert into table CUSTOMER OF COMPANY
* */
INSERT  INTO CustomerOfCompany
VALUES  ( '12777dc2-6da1-4f8c-a5e9-7bb947e6a88b',
          'd4d232b2-8986-4ac0-b7e6-0a591f465fa6', 'False' ) ;
GO
INSERT  INTO CustomerOfCompany
VALUES  ( '01cb9816-8339-4e1f-8818-3179527a30c3',
          '18713451-f569-4778-afa6-af0fce1bc1e0', 'False' ) ;
GO
INSERT  INTO CustomerOfCompany
VALUES  ( '25d7e88e-109b-4b8e-853a-db9aba955cd2',
          '125ab0d6-4b35-4dda-80f7-fa744aff3045', 'False' ) ;
GO

/*
* Insert into table PROBLEM
* */
INSERT  INTO Problem
VALUES  ( 'c08c0081-789b-42d8-81d6-11dd98cbe09d', N'giá cả',
          N'giá cao quá đi', 'False' ) ;
GO
INSERT  INTO Problem
VALUES  ( '36bae9b9-4743-47b3-a33f-61a27aee6351', N'chất lượng',
          N'không ngon', 'False' ) ;
GO
INSERT  INTO Problem
VALUES  ( '2d48455b-e449-4637-aa77-bf0b10602f54', N'chất lượng',
          N'Phục vụ tour tốt', 'False' ) ;
GO

/*
* Insert into table PROBLEM OF CUSTOMER
* */
INSERT  INTO ProblemOfCustomer
VALUES  ( '11dc56cd-733d-42e0-a89b-1b5dfa353c17',
          '01cb9816-8339-4e1f-8818-3179527a30c3',
          '18713451-f569-4778-afa6-af0fce1bc1e0',
          'c08c0081-789b-42d8-81d6-11dd98cbe09d', '7/1/2011', 'False' ) ;
GO
INSERT  INTO ProblemOfCustomer
VALUES  ( 'a6f82f9f-e179-41ab-bf8c-41aed64dc7fe',
          '12777dc2-6da1-4f8c-a5e9-7bb947e6a88b',
          'd4d232b2-8986-4ac0-b7e6-0a591f465fa6',
          '36bae9b9-4743-47b3-a33f-61a27aee6351', '7/15/2011', 'False' ) ;
GO
INSERT  INTO ProblemOfCustomer
VALUES  ( '447a589f-740a-417a-9220-cf5329130599',
          '25d7e88e-109b-4b8e-853a-db9aba955cd2',
          '125ab0d6-4b35-4dda-80f7-fa744aff3045',
          '2d48455b-e449-4637-aa77-bf0b10602f54', '7/18/2011', 'False' ) ;
GO

/*
* Insert into table DEALER
* */
INSERT  INTO Dealer
VALUES  ( 'f7fd0e02-30be-4e0a-826f-1f9c6b0711e6',
          '125ab0d6-4b35-4dda-80f7-fa744aff3045',
          N'cửa hàng bách hóa Hướng Dương',
          N'310 Tôn Thất Tùng-Hà Nội', N'0432141156',
          N'bachhoahuongduong@gmail.com', 'False' ) ;

/*
* Task: Create Procerdure
* Author: anhlt_c00177
* Start Date: 03.07.2011
* */
GO

CREATE PROC [dbo].[Category_Update]
    @Category_Id UNIQUEIDENTIFIER ,
    @Category_Name NVARCHAR(50) ,
    @Category_IsDelete BIT
AS 
    UPDATE  dbo.Category
    SET     Category_Name = @Category_Name ,
            Category_IsDelete = @Category_IsDelete
    WHERE   Category_Id = @Category_Id

GO
CREATE PROC [dbo].[Category_UpdateStatus]
    @Category_Id UNIQUEIDENTIFIER ,
    @Category_IsDelete BIT
AS 
    UPDATE  dbo.Category
    SET     Category_IsDelete = @Category_IsDelete
    WHERE   Category_Id = @Category_Id

go

CREATE PROC [dbo].[Category_ShowOnewDisplay]
    @Category_Id UNIQUEIDENTIFIER
AS 
    SELECT  *
    FROM    dbo.Category
    WHERE   Category_Id = @Category_Id
            AND Category_IsDelete = 0
go

CREATE PROC [dbo].[Category_ShowAllDisplay]
AS 
    SELECT  *
    FROM    dbo.Category
    WHERE   Category_IsDelete = 0
go
CREATE PROC [dbo].[Category_Insert]
    @Category_Id UNIQUEIDENTIFIER ,
    @Category_Name NVARCHAR(50)
AS 
    INSERT  INTO dbo.Category
            ( Category_Id, Category_Name )
    VALUES  ( @Category_Id, @Category_Name )
    GO

CREATE PROC [dbo].[Category_Delete]
    @Category_Id UNIQUEIDENTIFIER
AS 
    DELETE  FROM dbo.Category
    WHERE   Category_Id = @Category_Id
    go

CREATE PROC [dbo].[Category_CheckName]
    @Category_Name NVARCHAR(50)
AS 
    SELECT  *
    FROM    dbo.Category
    WHERE   Category_Name = @Category_Name
    go
CREATE PROC [dbo].[Category_Check]
    @Category_Id UNIQUEIDENTIFIER
AS 
    SELECT  *
    FROM    dbo.Category
    WHERE   Category_Id = @Category_Id
            AND Category_IsDelete = 0
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
go


CREATE PROC [dbo].[Company_UpdateStatus]
    @Company_Id UNIQUEIDENTIFIER
AS 
    UPDATE  dbo.Company
    SET     Company_IsDelete = 0
    WHERE   Company_Id = @Company_Id
    UPDATE  dbo.Product
    SET     Product_IsDelete = 0
    WHERE   Company_Id = @Company_Id
    UPDATE  dbo.ProblemOfCustomer
    SET     ProblemOfCustomer_IsDelete = 0
    WHERE   Company_Id = @Company_Id
    UPDATE  dbo.CustomerOfCompany
    SET     CustomerOfCompany_IsDelete = 0
    WHERE   Company_Id = @Company_Id
    UPDATE  dbo.Dealer
    SET     Dealer_IsDelete = 0
    WHERE   Company_Id = @Company_Id
GO
CREATE PROC [dbo].[Company_UpdateStatusRemove]
    @Company_Id UNIQUEIDENTIFIER
AS 
    UPDATE  dbo.Company
    SET     Company_IsDelete = 1
    WHERE   Company_Id = @Company_Id
    UPDATE  dbo.Product
    SET     Product_IsDelete = 1
    WHERE   Company_Id = @Company_Id
    UPDATE  dbo.ProblemOfCustomer
    SET     ProblemOfCustomer_IsDelete = 1
    WHERE   Company_Id = @Company_Id
    UPDATE  dbo.CustomerOfCompany
    SET     CustomerOfCompany_IsDelete = 1
    WHERE   Company_Id = @Company_Id
    UPDATE  dbo.Dealer
    SET     Dealer_IsDelete = 1
    WHERE   Company_Id = @Company_Id
    GO
CREATE PROC [dbo].[Company_Update]
    @Company_Id UNIQUEIDENTIFIER ,
    @Company_Name NVARCHAR(256) ,
    @Company_Logo NVARCHAR(MAX) ,
    @Company_Description NVARCHAR(MAX) ,
    @Company_Phone NVARCHAR(16) ,
    @Company_Email NVARCHAR(256) ,
    @Company_Address NVARCHAR(256) ,
    @Company_IsDelete BIT
AS 
    UPDATE  Company
    SET     Company_Name = @Company_Name ,
            Company_Logo = @Company_Logo ,
            Company_Description = @Company_Description ,
            Company_Phone = @Company_Phone ,
            Company_Email = @Company_Email ,
            Company_Address = @Company_Address ,
            Company_IsDelete = @Company_IsDelete
    WHERE   Company_Id = @Company_Id
GO
CREATE PROC [dbo].[Company_ShowOnewDisplay]
    @Company_Id UNIQUEIDENTIFIER
AS 
    SELECT  *
    FROM    dbo.Company
    WHERE   Company_Id = @Company_Id
            AND Company_IsDelete = 0
GO
CREATE PROC [dbo].[Company_ShowAllDisplayRemove]
    @SearchKey NVARCHAR(MAX)
AS 
    SELECT  *
    FROM    dbo.Company
    WHERE   Company_IsDelete = 1
            AND ( Company_Address LIKE N'%' + @SearchKey + '%'
                  OR Company_Email LIKE N'%' + @SearchKey + '%'
                  OR Company_Name LIKE N'%' + @SearchKey + '%'
                  OR Company_Phone LIKE N'%' + @SearchKey + '%'
                )   
GO
CREATE PROC [dbo].[Company_ShowAllDisplay]
    @SearchKey NVARCHAR(MAX)
AS 
    SELECT  *
    FROM    dbo.Company
    WHERE   Company_IsDelete = 0
            AND ( Company_Address LIKE N'%' + @SearchKey + '%'
                  OR Company_Email LIKE N'%' + @SearchKey + '%'
                  OR Company_Name LIKE N'%' + @SearchKey + '%'
                  OR Company_Phone LIKE N'%' + @SearchKey + '%'
                )
GO
CREATE PROC [dbo].[Company_Insert]
    @Company_Name NVARCHAR(256) ,
    @Company_Logo NVARCHAR(MAX) ,
    @Company_Description NVARCHAR(MAX) ,
    @Company_Phone NVARCHAR(16) ,
    @Company_Email NVARCHAR(256) ,
    @Company_Address NVARCHAR(256)
AS 
    INSERT  INTO dbo.Company
            ( Company_Name ,
              Company_Logo ,
              Company_Description ,
              Company_Phone ,
              Company_Email ,
              Company_Address           
            )
    VALUES  ( @Company_Name ,
              @Company_Logo ,
              @Company_Description ,
              @Company_Phone ,
              @Company_Email ,
              @Company_Address
            )
GO
CREATE PROCEDURE [dbo].[Company_Delete]
    @Company_Id UNIQUEIDENTIFIER
AS 
    DECLARE @isCheck INT
    SET @isCheck = 0
    SELECT  @isCheck = COUNT(Company_Id)
    FROM    OrderOfService
    WHERE   Company_Id = @Company_Id
    IF ( @isCheck = 0 ) 
        BEGIN
            DELETE  FROM dbo.Product
            WHERE   Company_Id = @Company_Id

            DELETE  FROM [dbo].ProblemOfCustomer
            WHERE   Company_Id = @Company_Id
            
            DELETE  FROM [dbo].CustomerOfCompany
            WHERE   Company_Id = @Company_Id
            
            DELETE  FROM dbo.Dealer
            WHERE   Company_Id = @Company_Id

            DELETE  FROM dbo.Company
            WHERE   Company_Id = @Company_Id
                    AND Company_Id NOT IN ( SELECT  Company_Id
                                            FROM    dbo.OrderOfService )
        END    
GO
CREATE PROC [dbo].[Company_CheckName]
    @Company_Name NVARCHAR(50)
AS 
    SELECT  *
    FROM    dbo.Company
    WHERE   Company_Name = @Company_Name
GO
CREATE PROC [dbo].[Company_CheckEmail]
    @Company_Email NVARCHAR(256)
AS 
    SELECT  *
    FROM    dbo.Company
    WHERE   Company_Email = @Company_Email   
go
       
CREATE PROC [dbo].[Customer_Insert]
    @Customer_FulName NVARCHAR(256) ,
    @Customer_Phone NVARCHAR(16) ,
    @Customer_Address NVARCHAR(256)
AS 
    INSERT  INTO dbo.Customer
            ( Customer_FulName ,
              Customer_Phone ,
              Customer_Address             
            )
    VALUES  ( @Customer_FulName , -- Customer_FulName - nvarchar(256)
              @Customer_Phone , -- Customer_Phone - nvarchar(16)
              @Customer_Address
            )
 Go
CREATE PROC [dbo].[CustomerOfCompany_Check]
    @Customer_Id UNIQUEIDENTIFIER ,
    @Company_Id UNIQUEIDENTIFIER
AS 
    SELECT  *
    FROM    dbo.CustomerOfCompany
    WHERE   Company_Id = @Company_Id
            AND Customer_Id = @Customer_Id
GO            
CREATE PROC [dbo].[CustomerOfCompany_Insert]
    @Customer_Id UNIQUEIDENTIFIER ,
    @Company_Id UNIQUEIDENTIFIER
AS 
    INSERT  INTO dbo.CustomerOfCompany
            ( Customer_Id, Company_Id )
    VALUES  ( @Customer_Id, -- Customer_Id - uniqueidentifier
              @Company_Id  -- Company_Id - uniqueidentifier              
              )

Go
CREATE PROC [dbo].[Dealer_Insert]
    @Company_Id UNIQUEIDENTIFIER ,
    @Dealer_Name NVARCHAR(256) ,
    @Dealer_Address NVARCHAR(256) ,
    @Dealer_Phone NVARCHAR(16) ,
    @Dealer_Email NVARCHAR(256)
AS 
    INSERT  INTO dbo.Dealer
            ( Company_Id ,
              Dealer_Name ,
              Dealer_Address ,
              Dealer_Phone ,
              Dealer_Email               
            )
    VALUES  ( @Company_Id ,
              @Dealer_Name ,
              @Dealer_Address ,
              @Dealer_Phone ,
              @Dealer_Email         
            )
GO

-------Problem
CREATE PROC [dbo].[Problem_Update]
    @Problem_Id UNIQUEIDENTIFIER ,
    @Problem_Title NVARCHAR(256) ,
    @Problem_Content NVARCHAR(MAX) ,
    @Problem_IsDelete BIT
AS 
    UPDATE  dbo.Problem
    SET     Problem_Title = @Problem_Title ,
            Problem_Content = @Problem_Content ,
            Problem_IsDelete = @Problem_IsDelete
    WHERE   Problem_Id = @Problem_Id
Go
CREATE PROC [dbo].[Problem_UpdateStatus]
    @Problem_Id UNIQUEIDENTIFIER
AS 
    UPDATE  dbo.Problem
    SET     Problem_IsDelete = 0
    WHERE   Problem_Id = @Problem_Id
Go
CREATE PROC [dbo].[Problem_ShowOnewDisplay]
    @Problem_Id UNIQUEIDENTIFIER
AS 
    SELECT  A.Problem_Id ,
            A.Problem_Title ,
            A.Problem_Content ,
            B.Customer_FulName ,
            D.Company_Name
    FROM    dbo.Problem AS A
            INNER JOIN dbo.ProblemOfCustomer AS C ON C.Problem_Id = A.Problem_Id
            INNER JOIN dbo.Customer AS B ON B.Customer_Id = C.Customer_Id
            INNER JOIN dbo.Company AS D ON C.Company_Id = D.Company_Id
    WHERE   A.Problem_Id = @Problem_Id
    
Go
CREATE PROC [dbo].[Problem_ShowAllDisplayRemove]
    @SearchKey NVARCHAR(MAX)
AS 
    SELECT  A.Problem_Id ,
            A.Problem_Title ,
            A.Problem_Content ,
            B.Customer_FulName ,
            C.ProblemOfCustomer_Date ,
            D.Company_Name
    FROM    dbo.Problem AS A
            INNER JOIN dbo.ProblemOfCustomer AS C ON C.Problem_Id = A.Problem_Id
            INNER JOIN dbo.Customer AS B ON B.Customer_Id = C.Customer_Id
            INNER JOIN dbo.Company AS D ON D.Company_Id = C.Company_Id
    WHERE   A.Problem_IsDelete = 1
            AND ( A.Problem_Title LIKE '%' + @SearchKey + '%'
                  OR A.Problem_Content LIKE '%' + @SearchKey + '%'
                  OR B.Customer_FulName LIKE '%' + @SearchKey + '%'
                )
go
CREATE PROC [dbo].[Problem_ShowAllDisplay]
    @SearchKey NVARCHAR(MAX)
AS 
    SELECT  A.Problem_Id ,
            A.Problem_Title ,
            A.Problem_Content ,
            B.Customer_FulName ,
            C.ProblemOfCustomer_Date ,
            D.Company_Name
    FROM    dbo.Problem AS A
            INNER JOIN dbo.ProblemOfCustomer AS C ON C.Problem_Id = A.Problem_Id
            INNER JOIN dbo.Customer AS B ON B.Customer_Id = C.Customer_Id
            INNER JOIN dbo.Company AS D ON D.Company_Id = C.Company_Id
    WHERE   A.Problem_IsDelete = 0
            AND ( A.Problem_Title LIKE '%' + @SearchKey + '%'
                  OR A.Problem_Content LIKE '%' + @SearchKey + '%'
                  OR B.Customer_FulName LIKE '%' + @SearchKey + '%'
                )
go
CREATE PROC [dbo].[Problem_Insert]
    @Problem_Id UNIQUEIDENTIFIER ,
    @Problem_Title NVARCHAR(256) ,
    @Problem_Content NVARCHAR(MAX)
AS 
    INSERT  INTO dbo.Problem
            ( Problem_Id ,
              Problem_Title ,
              Problem_Content           
            )
    VALUES  ( @Problem_Id ,
              @Problem_Title , -- Problem_Title - nvarchar(256)
              @Problem_Content  -- Problem_Content - nvarchar(max)
          
            )
go
CREATE PROC [dbo].[Problem_DeleteRemove]
    @Problem_Id UNIQUEIDENTIFIER
AS 
    BEGIN
        UPDATE  dbo.Problem
        SET     Problem_IsDelete = 1
        WHERE   Problem_Id = @Problem_Id
     
        UPDATE  dbo.ProblemOfCustomer
        SET     ProblemOfCustomer_IsDelete = 1
        WHERE   Problem_Id = @Problem_Id

    END
go
CREATE PROC [dbo].[Problem_Delete]
    @Problem_Id UNIQUEIDENTIFIER
AS 
    BEGIN
        DELETE  FROM dbo.ProblemOfCustomer
        WHERE   Problem_Id = @Problem_Id

        DELETE  FROM dbo.Problem
        WHERE   Problem_Id = @Problem_Id
    END
    
go
-------ProblemOfCustomer
CREATE PROC [dbo].[ProblemOfCustomer_Update]
    @ProblemOfCustomer_Id UNIQUEIDENTIFIER ,
    @Customer_Id UNIQUEIDENTIFIER ,
    @Company_Id UNIQUEIDENTIFIER ,
    @Problem_Id UNIQUEIDENTIFIER ,
    @ProblemOfCustomer_Date SMALLDATETIME ,
    @ProblemOfCustomer_IsDelete BIT
AS 
    UPDATE  dbo.ProblemOfCustomer
    SET     Customer_Id = @Customer_Id ,
            Company_Id = @Company_Id ,
            Problem_Id = @Problem_Id ,
            ProblemOfCustomer_Date = @ProblemOfCustomer_Date ,
            ProblemOfCustomer_IsDelete = @ProblemOfCustomer_IsDelete
    WHERE   ProblemOfCustomer_Id = @ProblemOfCustomer_Id
GO

CREATE PROC [dbo].[ProblemOfCustomer_Insert]
    @Customer_Id UNIQUEIDENTIFIER ,
    @Company_Id UNIQUEIDENTIFIER ,
    @Problem_Id UNIQUEIDENTIFIER ,
    @ProblemOfCustomer_Date SMALLDATETIME
AS 
    INSERT  INTO dbo.ProblemOfCustomer
            ( Customer_Id ,
              Company_Id ,
              Problem_Id ,
              ProblemOfCustomer_Date 
              
            )
    VALUES  ( @Customer_Id , -- Customer_Id - uniqueidentifier
              @Company_Id , -- Company_Id - uniqueidentifier
              @Problem_Id , -- Problem_Id - uniqueidentifier
              @ProblemOfCustomer_Date  -- ProblemOfCustomer_Date - smalldatetime             
            )


    CREATE PROC [dbo].[ProblemOfCustomer_Delete]
        @ProblemOfCustomer_Id UNIQUEIDENTIFIER
    AS 
        DELETE  FROM dbo.ProblemOfCustomer
        WHERE   ProblemOfCustomer_Id = @ProblemOfCustomer_Id   

Go
CREATE PROC [dbo].[Product_Insert]
    @Company_Id UNIQUEIDENTIFIER ,
    @Category_Id UNIQUEIDENTIFIER ,
    @Product_Name NVARCHAR(256) ,
    @Product_Type NVARCHAR(256) ,
    @Product_Price NVARCHAR(MAX) ,
    @Product_Description NVARCHAR(MAX) ,
    @Product_Image NVARCHAR(MAX) ,
    @Product_ManufactureDate SMALLDATETIME ,
    @Product_ExpiryDate SMALLDATETIME
AS 
    INSERT  INTO dbo.Product
            ( Company_Id ,
              Category_Id ,
              Product_Name ,
              Product_Type ,
              Product_Price ,
              Product_Description ,
              Product_Image ,
              Product_ManufactureDate ,
              Product_ExpiryDate               
            )
    VALUES  ( @Company_Id , -- Company_Id - uniqueidentifier
              @Category_Id , -- Category_Id - uniqueidentifier
              @Product_Name , -- Product_Name - nvarchar(256)
              @Product_Type , -- Product_Type - nvarchar(256)
              @Product_Price , -- Product_Price - nvarchar(256)
              @Product_Description , -- Product_Description - nvarchar(max)
              @Product_Image , -- Product_Image - nvarchar(max)
              @Product_ManufactureDate , -- Product_ManufactureDate - smalldatetime
              @Product_ExpiryDate  -- Product_ExpiryDate - smalldatetime              
            )

                
    
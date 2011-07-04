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
IF EXISTS (SELECT * FROM sys.databases WHERE NAME = 'DBExcellOnConsultingServices')
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
	Account_Id UNIQUEIDENTIFIER NOT NULL DEFAULT (NEWID ()),
	Employee_Id UNIQUEIDENTIFIER UNIQUE NOT NULL,
	Role_Name NVARCHAR(256) UNIQUE NOT NULL,
	Account_UserName NVARCHAR(256) UNIQUE NOT NULL,
	Account_Password NVARCHAR(128) NOT NULL,
	Account_IsDelete BIT NOT NULL DEFAULT 0,
	CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
	(
		[Account_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

)
GO
CREATE TABLE Category
(
	Category_Id UNIQUEIDENTIFIER NOT NULL DEFAULT (NEWID ()),
	Category_Name NVARCHAR(256) UNIQUE NOT NULL,
	Category_IsDelete BIT NOT NULL DEFAULT 0,
	CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
	(
		[Category_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE Company
(
	Company_Id UNIQUEIDENTIFIER NOT NULL DEFAULT (NEWID ()),
	Company_Name NVARCHAR(256) UNIQUE NOT NULL,
	Company_Logo NVARCHAR(MAX),
	Company_Description NVARCHAR(MAX),
	Company_Phone NVARCHAR(16),
	Company_Email NVARCHAR(256) UNIQUE,
	Company_Address NVARCHAR(256),
	Company_IsDelete BIT NOT NULL DEFAULT 0,
	CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
	(
		[Company_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE Contact
(
	Contact_Id UNIQUEIDENTIFIER NOT NULL DEFAULT (NEWID ()),
	Contact_Title NVARCHAR(256) NOT NULL,
	Contact_Content NVARCHAR(MAX),
	Contact_Name NVARCHAR(256),
	Contact_Email NVARCHAR(256) UNIQUE NOT NULL,
	Contact_Date SMALLDATETIME NOT NULL,
	Contact_Status INT NOT NULL,
	Contact_IsDelete BIT NOT NULL DEFAULT 0,
	CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
	(
		[Contact_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE Customer
(
	Customer_Id UNIQUEIDENTIFIER NOT NULL DEFAULT (NEWID ()),
	Customer_FulName NVARCHAR(256) NOT NULL,
	Customer_Phone NVARCHAR(16),
	Customer_Address NVARCHAR(256),
	Customer_IsDelete BIT NOT NULL DEFAULT 0,
	CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
	(
		[Customer_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE CustomerOfCompany
(
	Customer_Id UNIQUEIDENTIFIER NOT NULL,
	Company_Id UNIQUEIDENTIFIER NOT NULL,
	CustomerOfCompany_IsDelete BIT NOT NULL DEFAULT 0,
	CONSTRAINT [PK_CustomerOfCompany] PRIMARY KEY CLUSTERED 
	(
		[Customer_Id] ASC,
		[Company_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE Dealer
(
	Dealer_Id UNIQUEIDENTIFIER NOT NULL DEFAULT (NEWID ()),
	Company_Id UNIQUEIDENTIFIER NOT NULL,
	Dealer_Name NVARCHAR(256) NOT NULL,
	Dealer_Address NVARCHAR(256),
	Dealer_Phone NVARCHAR(16),
	Dealer_Email NVARCHAR(256),
	Dealer_IsDelete	BIT NOT NULL DEFAULT 0,
	CONSTRAINT [PK_Dealer] PRIMARY KEY CLUSTERED 
	(
		[Dealer_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE Department
(
	Department_Id UNIQUEIDENTIFIER NOT NULL DEFAULT (NEWID ()),
	Department_Name NVARCHAR(256) UNIQUE NOT NULL,
	Department_Description NVARCHAR(MAX),
	Department_IsDelete BIT NOT NULL DEFAULT 0,
	CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
	(
		[Department_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE Employee
(
	Employee_Id UNIQUEIDENTIFIER NOT NULL DEFAULT (NEWID ()),
	Department_Id UNIQUEIDENTIFIER NOT NULL,
	Employee_IsDelete BIT NOT NULL DEFAULT 0,
	CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
	(
		[Employee_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE News
(
	News_Id UNIQUEIDENTIFIER NOT NULL DEFAULT (NEWID ()),
	News_Title NVARCHAR(256) NOT NULL,
	News_Content NVARCHAR(MAX),
	News_Date SMALLDATETIME NOT NULL,
	News_IsDelete BIT NOT NULL DEFAULT 0,
	CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
	(
		[News_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE OrderOfService
(
	OrderOfService_Id UNIQUEIDENTIFIER NOT NULL DEFAULT (NEWID ()),
	Company_Id UNIQUEIDENTIFIER NOT NULL,
	Employee_Id UNIQUEIDENTIFIER NOT NULL,
	OrderService_TotalServices INT NOT NULL,
	OrderService_TotalCharges NVARCHAR(256) NOT NULL,
	OrderService_Description NVARCHAR(MAX),
	OrderService_PaymentMethod NVARCHAR(256) NOT NULL,
	OrderService_PaymentDate SMALLDATETIME NOT NULL,
	OrderService_BillDate SMALLDATETIME NOT NULL,
	OrderService_Status INT NOT NULL,
	OrderService_IsDelete BIT NOT NULL DEFAULT 0,
	CONSTRAINT [PK_OrderOfService] PRIMARY KEY CLUSTERED 
	(
		[OrderOfService_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE OrderOfServiceDetail
(
	OrderService_Id UNIQUEIDENTIFIER NOT NULL,
	Servive_Id UNIQUEIDENTIFIER NOT NULL,
	OrderServiceDetail_FromDate SMALLDATETIME NOT NULL,
	OrderServiceDetail_ToDate SMALLDATETIME NOT NULL,
	OrderServiceDetail_NumberOfEmployee INT NOT NULL,
	OrderServiceDetail_Price NVARCHAR(256) NOT NULL,
	OrderServiceDetail_IsDelete BIT NOT NULL DEFAULT 0,
	CONSTRAINT [PK_OrderServiceDetail] PRIMARY KEY CLUSTERED 
	(
		[OrderService_Id] ASC,
		[Servive_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE Problem
(
	Problem_Id UNIQUEIDENTIFIER NOT NULL DEFAULT (NEWID ()),
	Customer_Id UNIQUEIDENTIFIER NOT NULL,
	Problem_Title NVARCHAR(256) NOT NULL,
	Problem_Content NVARCHAR(MAX),
	Problem_IsDelete BIT NOT NULL DEFAULT 0,
	CONSTRAINT [PK_Problem] PRIMARY KEY CLUSTERED 
	(
		[Problem_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE ProblemOfCustomer
(
	ProblemOfCustomer_Id UNIQUEIDENTIFIER NOT NULL DEFAULT (NEWID ()),
	Customer_Id UNIQUEIDENTIFIER NOT NULL,
	Company_Id UNIQUEIDENTIFIER NOT NULL,
	Problem_Id UNIQUEIDENTIFIER NOT NULL,
	ProblemOfCustomer_Date SMALLDATETIME NOT NULL,
	ProblemOfCustomer_IsDelete BIT NOT NULL DEFAULT 0,
	CONSTRAINT [PK_ProblemOfCustomer] PRIMARY KEY CLUSTERED 
	(
		[ProblemOfCustomer_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE Product
(
	Product_Id UNIQUEIDENTIFIER NOT NULL DEFAULT (NEWID ()),
	Company_Id UNIQUEIDENTIFIER NOT NULL,
	Category_Id UNIQUEIDENTIFIER NOT NULL,
	Product_Name NVARCHAR(256) NOT NULL,
	Product_Type NVARCHAR(256) NOT NULL,
	Product_Price NVARCHAR(256) NOT NULL,
	Product_Description NVARCHAR(MAX),
	Product_Image NVARCHAR(MAX),
	Product_ManufactureDate SMALLDATETIME,
	Product_ExpiryDate SMALLDATETIME,
	Product_IsDelete BIT NOT NULL DEFAULT 0,
	CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
	(
		[Product_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE [Profile]
(
	Profile_Id UNIQUEIDENTIFIER NOT NULL DEFAULT (NEWID ()),
	Employee_Id UNIQUEIDENTIFIER UNIQUE NOT NULL,
	Profile_FirtName NVARCHAR(256),
	Profile_LastName NVARCHAR(256),
	Profile_Gender BIT,
	Profile_DateOfBirth SMALLDATETIME,
	Profile_Address NVARCHAR(256),
	Profile_PhoneNumber NVARCHAR(16),
	Profile_Email NVARCHAR(256),
	Profile_Avatar NVARCHAR(MAX),
	Profile_IsDelete BIT NOT NULL DEFAULT 0,
	CONSTRAINT [PK_Profile] PRIMARY KEY CLUSTERED 
	(
		[Profile_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE [Role]
(
	Role_Name NVARCHAR(256) NOT NULL,
	Role_IsDelete BIT NOT NULL DEFAULT 0,
	CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
	(
		[Role_Name] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
CREATE TABLE [Service]
(
	Service_Id UNIQUEIDENTIFIER NOT NULL DEFAULT (NEWID ()),
	[Service_Name] NVARCHAR(256) UNIQUE NOT NULL,
	Service_Image NVARCHAR(MAX),
	Service_Description NVARCHAR(MAX),
	Service_Charge NVARCHAR(256) NOT NULL,
	Service_IsDelete BIT NOT NULL DEFAULT 0,
	CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
	(
		[Service_Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
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
/*------------------------------TABLE PROFILE------------------------------*/
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_Employee] FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[Employee] ([Employee_Id])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_Employee]
/*------------------------------#END TABLE PROFILE------------------------------*/
GO
/*
* Task: Insert data to database
* Author: cuongph_c00034
* Start Date: 03.07.2011
* */

/*
* Insert into table DEPARTMENT
* */
INSERT INTO Department
VALUES ('42a8d8d1-eaa0-4a4f-a623-01b82bb20729','HR Management','','False');
GO
INSERT INTO Department
VALUES ('3aaa7421-439c-4bca-a370-353df83f5bb3','Administration','','False');
GO
INSERT INTO Department
VALUES ('d5e6196d-c293-4378-bc20-842f7f8a6de0','Service',N'','False');
GO
INSERT INTO Department
VALUES ('90671226-5e6d-4a53-aa11-9ad07999e1b6','Training',N'','False');
GO
INSERT INTO Department
VALUES ('0e17cd07-266f-4528-86fa-cd4eda254743','Internet Security',N'','False');
GO
INSERT INTO Department
VALUES ('3a0891fa-6dd9-4bd0-a0f9-d0fbd1b3a031','Auditors',N'','False');
GO

/*
* Insert into table EMPLOYEE
* */
INSERT INTO Employee
VALUES ('71801c3f-5a51-45c4-a6db-0b3220677b85','42a8d8d1-eaa0-4a4f-a623-01b82bb20729','False');
GO
INSERT INTO [Employee]
VALUES ('37a61117-f2c5-46f5-a7bc-218310c9c2b1','3a0891fa-6dd9-4bd0-a0f9-d0fbd1b3a031','False');
GO
INSERT INTO [Employee]
VALUES ('b557074f-2612-4e86-b208-297f75922d86','d5e6196d-c293-4378-bc20-842f7f8a6de0','False');
GO
INSERT INTO [Employee]
VALUES ('9363c012-b4e3-473d-8848-2b114bca188c','3aaa7421-439c-4bca-a370-353df83f5bb3','False');
GO
INSERT INTO [Employee]
VALUES ('d0cfcbdc-8e28-4368-aa05-36eb22f80608','d5e6196d-c293-4378-bc20-842f7f8a6de0','False');
GO
INSERT INTO [Employee]
VALUES ('efb8e475-9cc0-4854-bff3-3e1d4e8a91a5','d5e6196d-c293-4378-bc20-842f7f8a6de0','False');
GO
INSERT INTO [Employee]
VALUES ('5edbc3de-f4d7-407f-a879-4055d79aa823','d5e6196d-c293-4378-bc20-842f7f8a6de0','False');
GO
INSERT INTO [Employee]
VALUES ('68680e64-cb0e-4e29-bfad-4a074d616399','d5e6196d-c293-4378-bc20-842f7f8a6de0','False');
GO
INSERT INTO [Employee]
VALUES ('09ee85c6-e47a-499c-8118-4e4459110db1','d5e6196d-c293-4378-bc20-842f7f8a6de0','False');
GO
INSERT INTO [Employee]
VALUES ('990fe281-b507-4a11-af85-a83175a8d344','d5e6196d-c293-4378-bc20-842f7f8a6de0','False');
GO
INSERT INTO [Employee]
VALUES ('e02ee6b8-8d06-4d94-9ce2-aa7a33fa454e','d5e6196d-c293-4378-bc20-842f7f8a6de0','false');
GO
INSERT INTO [Employee]
VALUES ('f076b848-a7fd-4df5-8a75-b4d269f15344','d5e6196d-c293-4378-bc20-842f7f8a6de0','False');
GO
INSERT INTO [Employee]
VALUES ('754f0733-b860-46ec-94a1-d9c0102c32c2','d5e6196d-c293-4378-bc20-842f7f8a6de0','False');
 GO
INSERT INTO [Employee]
VALUES ('26ec8d80-5cae-4c1c-9456-dff1e5148b2c','d5e6196d-c293-4378-bc20-842f7f8a6de0','False');
GO
INSERT INTO [Employee]
VALUES ('97200740-f4d1-4820-b089-f7a545367aaf','d5e6196d-c293-4378-bc20-842f7f8a6de0','False');
GO

/*
* Insert into table PROFILE
* */ 
INSERT INTO [Profile]
VALUES ( '90a449cf-5589-44b0-8123-13d7974fec37',
'97200740-f4d1-4820-b089-f7a545367aaf',
N'Nguyễn Minh',
N'Châu',
'true',
'06/04/1981',
N'218 Phan Đình Phùng Hà Nội',
N'0989219779',
N'info@Exellon.com.vn',
N'',
'False'
 );
 GO
INSERT INTO [Profile]
VALUES ( 'cf22ad7a-e75a-45ea-ae2c-4b9f1e187181',
'26ec8d80-5cae-4c1c-9456-dff1e5148b2c',
N'Đỗ Phú',
N'Hoàng',
'true',
'06/08/1989',
N'211 trương Định Hà Nội',
N'0916114275',
N'admin@Exellon.com.vn',
N'',
'False'
 );
GO
INSERT INTO [Profile]
VALUES ( '0163beda-775e-4631-a7f6-637dd74e8a47',
'754f0733-b860-46ec-94a1-d9c0102c32c2',
N'Nguyễn Tiến',
N'Anh',
'true',
N'06/04/1986',
N'213 Kim Ngưu Hà Nội',
N'0946447821',
N'anhnt@Exellon.com.vn',
N'',
'false'
);
GO
INSERT INTO [Profile]
VALUES ( 'b17bc50c-9847-46a5-b567-c7960afeca97',
'f076b848-a7fd-4df5-8a75-b4d269f15344',
N'Trương Vĩnh',
N'Tâm',
'true',
'06/14/1984',
N'27 Lê Đại Hành Hà Nội',
N'0948418811',
N'tamtv@Exellon.com.vn',
N'',
'False'
 );
GO
INSERT INTO [Profile]
VALUES ( 'dbbe7a58-6f66-436a-92fa-efc13c4268cb',
'e02ee6b8-8d06-4d94-9ce2-aa7a33fa454e',
N'Vũ Thế',
N'Quang',
'true',
'12/04/1985',
N'79 đê La Thành Hà Nội',
N'0969218337',
N'quangvt@Exellon.com.vn',
N'',
'False'
);
GO
INSERT INTO [Profile]
VALUES ( '116899b7-0cca-4af1-b077-12cf33863778',
'71801c3f-5a51-45c4-a6db-0b3220677b85',
N'',
N'',
'',
'',
N'',
N'',
N'',
N'',
'False'
);
GO
INSERT INTO [Profile]
VALUES ( 'b691545a-0cb7-48fa-91ac-7414940ae784',
'990fe281-b507-4a11-af85-a83175a8d344',
N'',
N'',
'',
'',
N'',
N'',
N'',
N'',
'False'
);
GO
INSERT INTO [Profile]
VALUES ( '011c7cfc-5dc9-4700-9d41-a72bc0e20f0d',
'68680e64-cb0e-4e29-bfad-4a074d616399',
N'',
N'',
'',
'',
N'',
N'',
N'',
N'',
'False'
);
GO
INSERT INTO [Profile]
VALUES ( 'ea4332dd-32bc-475c-9e2c-afa504d0b2e0',
'09ee85c6-e47a-499c-8118-4e4459110db1',
N'',
N'',
'',
'',
N'',
N'',
N'',
N'',
'False'
);
GO
INSERT INTO [Profile]
VALUES ( 'ff7b0066-2651-40a3-817c-c6743db2d579',
'd0cfcbdc-8e28-4368-aa05-36eb22f80608',
N'',
N'',
'',
'',
N'',
N'',
N'',
N'',
'False'
);
GO
INSERT INTO [Profile]
VALUES ( 'c35c3728-c2e3-4afd-ba46-cb9eb7c67f87',
'9363c012-b4e3-473d-8848-2b114bca188c',
N'',
N'',
'',
'',
N'',
N'',
N'',
N'',
'False'
);
GO
INSERT INTO [Profile]
VALUES ( '76df72fc-62e1-4404-bf89-d0148528896e',
'b557074f-2612-4e86-b208-297f75922d86',
N'',
N'',
'',
'',
N'',
N'',
N'',
N'',
'False'
);
GO
INSERT INTO [Profile]
VALUES ( '5fd4c5ca-a379-44fe-ab39-e5014ce74d75',
'5edbc3de-f4d7-407f-a879-4055d79aa823',
N'',
N'',
'',
'',
N'',
N'',
N'',
N'',
'False'
);
GO
INSERT INTO [Profile]
VALUES ( '9b9373a4-38db-4960-a6cc-e9d304ccf1a7',
'37a61117-f2c5-46f5-a7bc-218310c9c2b1',
N'',
N'',
'',
'',
N'',
N'',
N'',
N'',
'False'
);
GO
INSERT INTO [Profile]
VALUES ( '6f476236-0040-4253-bae2-ec7bd0233462',
'efb8e475-9cc0-4854-bff3-3e1d4e8a91a5',
N'',
N'',
'',
'',
N'',
N'',
N'',
N'',
'False'
);
GO

/*
* Insert into table ROLE
* */ 
INSERT INTO [Role]
VALUES ('Administrator','False');
GO
INSERT INTO [Role]
VALUES ('HR Manager','False');
GO
INSERT INTO [Role]
VALUES ('Service Manager','False');
GO
INSERT INTO [Role]
VALUES ('Service Employee','False');
GO
INSERT INTO [Role]
VALUES ('Employee','False');
GO

/*
* Insert into table ACCOUNT
* */
INSERT INTO Account
VALUES('f6bd432d-e1b8-469f-91fd-3ac2de9cb704','754f0733-b860-46ec-94a1-d9c0102c32c2','Administrator','admin','e10adc3949ba59abbe56e057f20f883e','False');
GO
INSERT INTO Account
VALUES('eeca2cef-7ffb-433f-a442-615d8858f966','e02ee6b8-8d06-4d94-9ce2-aa7a33fa454e','HR Manager','hr','e10adc3949ba59abbe56e057f20f883e','False');
GO
INSERT INTO Account
VALUES('c26e159c-9216-4b3a-895f-695492e09540','990fe281-b507-4a11-af85-a83175a8d344','Service Manager','sm','e10adc3949ba59abbe56e057f20f883e','False');
GO
INSERT INTO Account
VALUES('cc8341e3-fc81-407d-934c-7d6889d50324','97200740-f4d1-4820-b089-f7a545367aaf','Service Employee','se','e10adc3949ba59abbe56e057f20f883e','False');
GO
INSERT INTO Account
VALUES('20e9ffbc-7f5b-4c5b-9c15-d1735d1a01ea','f076b848-a7fd-4df5-8a75-b4d269f15344','Employee','employee','e10adc3949ba59abbe56e057f20f883e','False');
GO

/*
* Insert into table COMPANY
* */ 
INSERT INTO Company
VALUES ('d4d232b2-8986-4ac0-b7e6-0a591f465fa6',
N'Công ty TNHH Simply',
'',
N'công ty cung ứng dầu ăn.chất lượng',
N'043 2146614',
N'info@simply.com.vn',
N'118 Lạc Trung Hà Nội',
'False'
 );
GO
INSERT INTO Company
VALUES ('18713451-f569-4778-afa6-af0fce1bc1e0',
N'Công ty TNHH Ngôi Sao Việt',
'',
N'công ty cung cấp dịch vụ du lịch',
N'0432155166',
N'info@vietstar.com.vn',
N'816 đê La Thành Hà Nội',
'False'
 );
GO
INSERT INTO Company
VALUES ('125ab0d6-4b35-4dda-80f7-fa744aff3045',
N'Công ty TNHH Toàn Thắng',
'',
N'công ty sản xuất và nhập khẩu thiết bị điện máy ',
N'0436144412',
N'info@toanthang.com.vn',
N'81 Đường Thành Hà Nội',
'False'
 );
 GO
 
 /*
* Insert into table ORDER OF SERVICE
* */ 
INSERT INTO OrderOfService
VALUES(
'a673f36e-e792-4176-be90-16415c426ecc',
'125ab0d6-4b35-4dda-80f7-fa744aff3045',
'97200740-f4d1-4820-b089-f7a545367aaf',
1,
'RygFXr+5lUIKk6f66A7K5g==',
N'hợp đồng 6 tháng',
N'chuyển khoản 100%',
'6/6/2011',
'6/6/2011',
1,
'False'
);
GO
INSERT INTO OrderOfService
VALUES(
'01cfe750-6ea8-419d-8da9-b954c196b042',
'18713451-f569-4778-afa6-af0fce1bc1e0',
'26ec8d80-5cae-4c1c-9456-dff1e5148b2c',
1,
'8NrwBcyAk9sKk6f66A7K5g==',
N'hợp đồng 12 tháng',
N'chuyển khoản 100%',
'6/16/2011',
'6/16/2011',
1,
'False'
);
GO
INSERT INTO OrderOfService
VALUES(
'2de09cae-a842-4561-9ae2-c7662ca5e474',
'd4d232b2-8986-4ac0-b7e6-0a591f465fa6',
'754f0733-b860-46ec-94a1-d9c0102c32c2',
1,
'8NrwBcyAk9sKk6f66A7K5g==',
N'hợp đồng 12 tháng',
N'chuyển khoản 100%',
'7/1/2011',
'7/3/2011',
1,
'False'
);
GO

/*
* Insert into table SERVICE
* */
INSERT INTO [Service]
VALUES( '51b24177-da84-4a18-8637-16c93656c0ca',
N'In-bound Services',
'',
N'The In-bound service is a service in which one can only receive the calls from the customers. These call centers provide 24 hours service to all customers. The primary goal of these call centers are to receive product orders, help customers both technically and non-technically, to find dealer location',
'9Mt3y2TYg2A=',
'False');
GO
INSERT INTO [Service]
VALUES( 'f40d7f1d-637e-4d55-a811-37579da818db',
N'Out-bound Services',
'',
N'The Out-bound service is a service in which the employees of Excell-on call the customers for product promotions, for checking with the customer satisfaction on the services they provide, and for the telemarketing. Outbound Call Centers depends on the technological solutions, extensive experience, quality assurance programs and commitment to customer service excellence that further ensures maximum results from the direct marketing efforts for its success',
'GFK+dee7Q28=',
'False');
GO
INSERT INTO [Service]
VALUES( 'e0d8cc13-18a9-4c13-88a5-5beeb124986a',
N'Tele Marketing Services',
'',
N'The Tele Marketing service is a service which is purely for the promotion of marketing or sales of the products and services',
'G3Ww0DMWCOk=',
'False');
GO

/*
* Insert into table ORDER OF SERVICE DETAIL
* */
INSERT INTO OrderOfServiceDetail
VALUES('a673f36e-e792-4176-be90-16415c426ecc','51b24177-da84-4a18-8637-16c93656c0ca','6/12/2011','12/12/2011',1,'G3Ww0DMWCOk=','False');
GO
INSERT INTO OrderOfServiceDetail
VALUES('01cfe750-6ea8-419d-8da9-b954c196b042','f40d7f1d-637e-4d55-a811-37579da818db','7/1/2011','7/1/2012',1,'5izHju+kgoM=','False');
GO
INSERT INTO OrderOfServiceDetail
VALUES('01cfe750-6ea8-419d-8da9-b954c196b042','e0d8cc13-18a9-4c13-88a5-5beeb124986a','6/12/2011','11/12/2011',1,'wQC2vA8FVDc=','False');
GO

/*
* Insert into table CATEGORY
* */
INSERT INTO Category
VALUES('2e18d6f7-3187-4a1d-b3bd-6a89e858fcd2',N'Food','False');
GO
INSERT INTO Category
VALUES('e3639a41-39be-4fb4-ae18-80d384f818e1',N'Travel','False');
GO

/*
* Insert into table PRODUCT
* */
INSERT INTO Product
VALUES 
('1bc3d5e0-b1c4-4967-bdd4-88d567e6271f',
'd4d232b2-8986-4ac0-b7e6-0a591f465fa6',
'2e18d6f7-3187-4a1d-b3bd-6a89e858fcd2',
N'dầu ăn tinh chế đậu nành',
'Product',
'WimEXHocBME=',
N'sản xuất tại VN Ngon bổ rẻ',
'',
'4/24/2011',
'4/24/2014',
'False'
);
GO
INSERT INTO Product
VALUES 
('34f7272e-0181-4874-a387-7f9e8f57d2f6',
'18713451-f569-4778-afa6-af0fce1bc1e0',
'2e18d6f7-3187-4a1d-b3bd-6a89e858fcd2',
N'sữa đậu nành',
'Product',
'TNc/MRe1r2A=',
N'sản xuất tại VN Ngon bổ rẻ',
'',
'6/21/2011',
'12/21/2011',
'False'
);
GO
INSERT INTO Product
VALUES 
('33b29288-2181-44d3-b10d-736d5d694095',
'125ab0d6-4b35-4dda-80f7-fa744aff3045',
'e3639a41-39be-4fb4-ae18-80d384f818e1',
N'gói du lịch nha trang',
'Service',
'byqSFKAq5fk=',
N'đảm bảo đầy đủ.an toàn trong 3 ngày',
'',
'1/1/2011',
'1/1/2015',
'False'
);
GO
INSERT INTO Product
VALUES
('13ce7b43-c0f5-4784-955f-430a0a503286',
'125ab0d6-4b35-4dda-80f7-fa744aff3045',
'e3639a41-39be-4fb4-ae18-80d384f818e1',
N'gói du lịch Cát Bà',
'Service',
'VVLjuk8zYwg=',
N'đảm bảo đầy đủ.an toàn trong 3 ngày',
'',
'1/1/2011',
'1/1/2015',
'False'
);
GO

/*
* Insert into table CUSTOMER
* */
INSERT INTO Customer
VALUES 
(
'abb10eda-13cf-47ae-a0e7-0a7d472763e3',
N'Hoàng Mạnh',
N'0914551112',
N'1129 Láng  Hà Nội',
'False'
);
GO
INSERT INTO Customer
VALUES 
(
'01cb9816-8339-4e1f-8818-3179527a30c3',
N'Nguyễn Minh',
N'0912 561 552',
N'14 Thái Thịnh Đống Đa Hà Nội',
'False'
);
GO
INSERT INTO Customer
VALUES 
(
'12777dc2-6da1-4f8c-a5e9-7bb947e6a88b',
N'Lê Thông',
N'0944214442',
N'145 Đại Cồ Việt-Hai Bà Trưng-Hà Nội',
'False'
);
GO
INSERT INTO Customer
VALUES 
(
'25d7e88e-109b-4b8e-853a-db9aba955cd2',
N'Trần Giang',
N'0123776776',
N'212-Lê Duẩn-Hà Nội',
'False'
);
GO

/*
* Insert into table CUSTOMER OF COMPANY
* */
INSERT INTO CustomerOfCompany
VALUES( '12777dc2-6da1-4f8c-a5e9-7bb947e6a88b','d4d232b2-8986-4ac0-b7e6-0a591f465fa6','False');
GO
INSERT INTO CustomerOfCompany
VALUES( '01cb9816-8339-4e1f-8818-3179527a30c3','18713451-f569-4778-afa6-af0fce1bc1e0','False');
GO
INSERT INTO CustomerOfCompany
VALUES( '25d7e88e-109b-4b8e-853a-db9aba955cd2','125ab0d6-4b35-4dda-80f7-fa744aff3045','False');
GO

/*
* Insert into table PROBLEM
* */
INSERT INTO Problem
VALUES('c08c0081-789b-42d8-81d6-11dd98cbe09d','01cb9816-8339-4e1f-8818-3179527a30c3',N'giá cả',N'giá cao quá đi','False' );
GO
INSERT INTO Problem
VALUES('36bae9b9-4743-47b3-a33f-61a27aee6351','12777dc2-6da1-4f8c-a5e9-7bb947e6a88b',N'chất lượng',N'không ngon','False' );
GO
INSERT INTO Problem
VALUES('2d48455b-e449-4637-aa77-bf0b10602f54','25d7e88e-109b-4b8e-853a-db9aba955cd2',N'chất lượng',N'Phục vụ tour tốt','False' );
GO

/*
* Insert into table PROBLEM OF CUSTOMER
* */
INSERT INTO ProblemOfCustomer
VALUES('11dc56cd-733d-42e0-a89b-1b5dfa353c17','01cb9816-8339-4e1f-8818-3179527a30c3','18713451-f569-4778-afa6-af0fce1bc1e0','c08c0081-789b-42d8-81d6-11dd98cbe09d','7/1/2011','False');
GO
INSERT INTO ProblemOfCustomer
VALUES('a6f82f9f-e179-41ab-bf8c-41aed64dc7fe','12777dc2-6da1-4f8c-a5e9-7bb947e6a88b','d4d232b2-8986-4ac0-b7e6-0a591f465fa6','36bae9b9-4743-47b3-a33f-61a27aee6351','7/15/2011','False');
GO
INSERT INTO ProblemOfCustomer
VALUES('447a589f-740a-417a-9220-cf5329130599','25d7e88e-109b-4b8e-853a-db9aba955cd2','125ab0d6-4b35-4dda-80f7-fa744aff3045','2d48455b-e449-4637-aa77-bf0b10602f54','7/18/2011','False');
GO

/*
* Insert into table DEALER
* */
INSERT INTO Dealer
VALUES('f7fd0e02-30be-4e0a-826f-1f9c6b0711e6','125ab0d6-4b35-4dda-80f7-fa744aff3045',N'cửa hàng bách hóa Hướng Dương',N'310 Tôn Thất Tùng-Hà Nội',N'0432141156',N'bachhoahuongduong@gmail.com','False');

----Category
CREATE PROC [dbo].[Category_UpdateStatus]
    @Category_Id UNIQUEIDENTIFIER ,
    @Category_IsDelete BIT
AS 
    UPDATE  dbo.Category
    SET     Category_IsDelete = @Category_IsDelete
    WHERE   Category_Id = @Category_Id
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
    go

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

--ALTER PROC [dbo].[Category_Check]
--    @Category_Id UNIQUEIDENTIFIER
--AS 
--    SELECT  *
--    FROM    dbo.Category
--    WHERE   Category_Id = @Category_Id
--            AND Category_IsDelete = 0
--go

---Company
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

go

CREATE PROC [dbo].[Company_UpdateStatus]
    @Company_Id UNIQUEIDENTIFIER ,
    @Company_IsDelete BIT
AS 
    UPDATE  dbo.Company
    SET     Company_IsDelete = @Company_IsDelete
    WHERE   Company_Id = @Company_Id
go

CREATE PROC [dbo].[Company_ShowOnewDisplay]
    @Company_Id UNIQUEIDENTIFIER
AS 
    SELECT  *
    FROM    dbo.Company
    WHERE   Company_Id = @Company_Id
            AND Company_IsDelete = 0
    go

CREATE PROC [dbo].[Company_ShowAllDisplay]
AS 
    SELECT  *
    FROM    dbo.Company
    WHERE   Company_IsDelete = 0
    go

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
go

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

            DELETE  FROM dbo.Company
            WHERE   Company_Id = @Company_Id
                    AND Company_Id NOT IN ( SELECT  Company_Id
                                            FROM    dbo.OrderOfService )
        END

go
CREATE PROC [dbo].[Company_CheckEmail]
    @Company_Email NVARCHAR(256)
AS 
    SELECT  *
    FROM    dbo.Company
    WHERE   Company_Email = @Company_Email
go

CREATE PROC [dbo].[Company_CheckName]
    @Company_Name NVARCHAR(50)
AS 
    SELECT  *
    FROM    dbo.Company
    WHERE   Company_Name = @Company_Name
go
--ALTER PROC [dbo].[Company_Check]
--    @Company_Id UNIQUEIDENTIFIER
--AS 
--    SELECT  *
--    FROM    dbo.Company
--    WHERE   Company_Id = @Company_Id
--            AND Company_IsDelete = 0
--
--Go

    
    -----Customer
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
 

go

CREATE PROCEDURE [dbo].[Customer_ShowAllDisplay]
AS 
    SELECT  *
    FROM    dbo.Customer
    WHERE   Customer_IsDelete = 0
    
go

CREATE PROCEDURE [dbo].[Customer_ShowOnewDisplay]
    @Customer_Id UNIQUEIDENTIFIER
AS 
    SELECT  *
    FROM    dbo.Customer
    WHERE   Customer_Id = @Customer_Id
            AND Customer_IsDelete = 0

go
 
CREATE PROC [dbo].[Customer_Update]
    @Customer_Id UNIQUEIDENTIFIER ,
    @Customer_FulName NVARCHAR(256) ,
    @Customer_Phone NVARCHAR(16) ,
    @Customer_Address NVARCHAR(256) ,
    @Customer_IsDelete BIT
AS 
    UPDATE  dbo.Customer
    SET     Customer_Address = @Customer_Address ,
            Customer_FulName = @Customer_FulName ,
            Customer_Phone = @Customer_Phone ,
            Customer_IsDelete = @Customer_IsDelete
    WHERE   Customer_Id = @Customer_Id    
    
go

CREATE PROC [dbo].[Customer_UpdateStatus]
    @Customer_Id UNIQUEIDENTIFIER ,
    @Customer_IsDelete BIT
AS 
    UPDATE  dbo.Customer
    SET     Customer_IsDelete = @Customer_IsDelete
    WHERE   Customer_Id = @Customer_Id



go

CREATE PROCEDURE [dbo].[Customer_Delete]
    @Customer_Id UNIQUEIDENTIFIER
AS 
    DELETE  FROM dbo.Customer
    WHERE   Customer_Id = @Customer_Id
    

go

-----CustomerOfCompany---------------------
CREATE PROC [dbo].[CustomerOfCompany_Check]
    @Customer_Id UNIQUEIDENTIFIER ,
    @Company_Id UNIQUEIDENTIFIER
AS 
    SELECT  *
    FROM    dbo.CustomerOfCompany
    WHERE   Company_Id = @Company_Id
            AND Customer_Id = @Customer_Id
            

go

CREATE PROC [dbo].[CustomerOfCompany_Delete]
    @Company_Id UNIQUEIDENTIFIER ,
    @Customer_Id UNIQUEIDENTIFIER
AS 
    DELETE  FROM dbo.CustomerOfCompany
    WHERE   Company_Id = @Company_Id
            AND Customer_Id = @Customer_Id
            
go

CREATE PROC [dbo].[CustomerOfCompany_Insert]
    @Customer_Id UNIQUEIDENTIFIER ,
    @Company_Id UNIQUEIDENTIFIER
AS 
    INSERT  INTO dbo.CustomerOfCompany
            ( Customer_Id, Company_Id )
    VALUES  ( @Customer_Id, -- Customer_Id - uniqueidentifier
              @Company_Id  -- Company_Id - uniqueidentifier              
              )

go

CREATE PROC [dbo].[CustomerOfCompany_ShowAllDisplay]
AS 
    SELECT  *
    FROM    dbo.CustomerOfCompany
    WHERE   CustomerOfCompany_IsDelete = 0


go

CREATE PROC [dbo].[CustomerOfCompany_ShowOnewDisplay]
    @Company_Id UNIQUEIDENTIFIER ,
    @Customer_Id UNIQUEIDENTIFIER
AS 
    SELECT  *
    FROM    dbo.CustomerOfCompany
    WHERE   Company_Id = @Company_Id
            AND Customer_Id = @Customer_Id
            AND CustomerOfCompany_IsDelete = 0

go

CREATE PROC [dbo].[CustomerOfCompany_Update]
    @Company_Id UNIQUEIDENTIFIER ,
    @Customer_Id UNIQUEIDENTIFIER ,
    @CustomerOfCompany_IsDelete BIT
AS 
    UPDATE  dbo.CustomerOfCompany
    SET     CustomerOfCompany_IsDelete = @CustomerOfCompany_IsDelete
    WHERE   Company_Id = @Company_Id
            AND Customer_Id = @Customer_Id
            
go

CREATE PROC [dbo].[CustomerOfCompany_UpdateStatus]
    @Customer_Id UNIQUEIDENTIFIER ,
    @Company_Id UNIQUEIDENTIFIER ,
    @CustomerOfCompany_IsDelete BIT
AS 
    UPDATE  dbo.CustomerOfCompany
    SET     CustomerOfCompany_IsDelete = @CustomerOfCompany_IsDelete
    WHERE   Company_Id = @Company_Id
            AND Customer_Id = @Customer_Id

go

------------Dealer
CREATE PROC [dbo].[Dealer_Update]
    @Dealer_Id UNIQUEIDENTIFIER ,
    @Company_Id UNIQUEIDENTIFIER ,
    @Dealer_Name NVARCHAR(256) ,
    @Dealer_Address NVARCHAR(256) ,
    @Dealer_Phone NVARCHAR(16) ,
    @Dealer_Email NVARCHAR(256) ,
    @Dealer_IsDelete BIT
AS 
    UPDATE  dbo.Dealer
    SET     Company_Id = @Company_Id ,
            Dealer_Name = @Dealer_Name ,
            Dealer_Address = @Dealer_Address ,
            Dealer_Phone = @Dealer_Phone ,
            Dealer_Email = @Dealer_Email ,
            Dealer_IsDelete = @Dealer_IsDelete
    WHERE   Dealer_Id = @Dealer_Id

go

CREATE PROC [dbo].[Dealer_UpdateStatus]
    @Dealer_Id UNIQUEIDENTIFIER ,
    @Dealer_IsDelete BIT
AS 
    UPDATE  dbo.Dealer
    SET     Dealer_IsDelete = @Dealer_IsDelete
    WHERE   Dealer_Id = @Dealer_Id
go

CREATE PROC [dbo].[Dealer_ShowOnewDisplay]
    @Dealer_Id UNIQUEIDENTIFIER
AS 
    SELECT  *
    FROM    dbo.Dealer
    WHERE   Dealer_Id = @Dealer_Id
            AND Dealer_IsDelete = 0
    go

CREATE PROC [dbo].[Dealer_ShowAllDisplay]
AS 
    SELECT  *
    FROM    dbo.Dealer
    WHERE   Dealer_IsDelete = 0
    go

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
go

CREATE PROC [dbo].[Dealer_Delete]
    @Dealer_Id UNIQUEIDENTIFIER
AS 
    DELETE  FROM dbo.Dealer
    WHERE   Dealer_Id = @Dealer_Id
    GO
--CREATE PROC [dbo].[Dealer_Check]
--    @Dealer_Id UNIQUEIDENTIFIER
--AS 
--    SELECT  *
--    FROM    dbo.Dealer
--    WHERE   Dealer_Id = @Dealer_Id    
--    go

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
    
go

CREATE PROC [dbo].[Problem_UpdateStatus]
    @Problem_Id UNIQUEIDENTIFIER ,
    @Problem_IsDelete BIT
AS 
    UPDATE  dbo.Problem
    SET     Problem_IsDelete = @Problem_IsDelete
    WHERE   Problem_Id = @Problem_Id
    go

CREATE PROC [dbo].[Problem_ShowOnewDisplay]
    @Problem_Id UNIQUEIDENTIFIER
AS 
    SELECT  *
    FROM    dbo.Problem
    WHERE   Problem_Id = @Problem_Id
            AND Problem_IsDelete = 0
    go

CREATE PROC [dbo].[Problem_ShowAllDisplay]
AS 
    SELECT  *
    FROM    dbo.Problem
    WHERE   Problem_IsDelete = 0

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

CREATE PROC [dbo].[Problem_Delete]
    @Problem_Id UNIQUEIDENTIFIER
AS 
    BEGIN
        DELETE  FROM dbo.ProblemOfCustomer
        WHERE   Problem_Id = @Problem_Id

        DELETE  FROM dbo.Problem
        WHERE   Problem_Id = @Problem_Id
    END
--GO
--
--CREATE PROC [dbo].[Problem_Check]
--    @Problem_Id UNIQUEIDENTIFIER
--AS 
--    SELECT  *
--    FROM    dbo.Problem
--    WHERE   Problem_Id = @Problem_Id
--            

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

go

CREATE PROC [dbo].[ProblemOfCustomer_UpdateStatus]
    @ProblemOfCustomer_Id UNIQUEIDENTIFIER ,
    @ProblemOfCustomer_IsDelete BIT
AS 
    UPDATE  dbo.ProblemOfCustomer
    SET     ProblemOfCustomer_IsDelete = @ProblemOfCustomer_IsDelete
    WHERE   ProblemOfCustomer_Id = @ProblemOfCustomer_Id
go

CREATE PROC [dbo].[ProblemOfCustomer_ShowOnewDisplay]
    @ProblemOfCustomer_Id UNIQUEIDENTIFIER
AS 
    SELECT  *
    FROM    dbo.ProblemOfCustomer
    WHERE   ProblemOfCustomer_Id = @ProblemOfCustomer_Id
            AND ProblemOfCustomer_IsDelete = 0
    go

CREATE PROC [dbo].[ProblemOfCustomer_ShowAllDisplay]
AS 
    SELECT  *
    FROM    dbo.ProblemOfCustomer
    WHERE   ProblemOfCustomer_IsDelete = 0
    go

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

go

CREATE PROC [dbo].[ProblemOfCustomer_Delete]
    @ProblemOfCustomer_Id UNIQUEIDENTIFIER
AS 
    DELETE  FROM dbo.ProblemOfCustomer
    WHERE   ProblemOfCustomer_Id = @ProblemOfCustomer_Id
go

    
CREATE PROC [dbo].[ProblemOfCustomer_Check]
    @ProblemOfCustomer_Id UNIQUEIDENTIFIER
AS 
    SELECT  *
    FROM    dbo.ProblemOfCustomer
    WHERE   ProblemOfCustomer_Id = @ProblemOfCustomer_Id
    
    ------Product
    
go

CREATE PROC [dbo].[Product_ShowAllDisplay]
AS 
    SELECT  *
    FROM    dbo.Product
    WHERE   Product_IsDelete = 0


go

--CREATE PROC [dbo].[Product_Check]
--    @Product_Id UNIQUEIDENTIFIER
--AS 
--    SELECT  *
--    FROM    dbo.Product
--    WHERE   Product_Id = @Product_Id
--
--
--go

CREATE PROC [dbo].[Product_Delete]
    @Product_Id UNIQUEIDENTIFIER
AS 
    DELETE  FROM dbo.Product
    WHERE   Product_Id = @Product_Id

go

CREATE PROC [dbo].[Product_ShowOnewDisplay]
    @Product_Id UNIQUEIDENTIFIER
AS 
    SELECT  *
    FROM    dbo.Product
    WHERE   Product_Id = @Product_Id
            AND Product_IsDelete = 0

GO

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

go

CREATE PROC [dbo].[Product_Update]
    @Product_Id UNIQUEIDENTIFIER ,
    @Company_Id UNIQUEIDENTIFIER ,
    @Category_Id UNIQUEIDENTIFIER ,
    @Product_Name NVARCHAR(256) ,
    @Product_Type NVARCHAR(256) ,
    @Product_Price NVARCHAR(MAX) ,
    @Product_Description NVARCHAR(MAX) ,
    @Product_Image NVARCHAR(MAX) ,
    @Product_ManufactureDate SMALLDATETIME ,
    @Product_ExpiryDate SMALLDATETIME ,
    @Product_IsDelete BIT
AS 
    UPDATE  dbo.Product
    SET     Company_Id = @Company_Id ,
            Category_Id = @Category_Id ,
            Product_Name = @Product_Name ,
            Product_Type = @Product_Type ,
            Product_Price = @Product_Price ,
            Product_Description = @Product_Description ,
            Product_Image = @Product_Image ,
            Product_ManufactureDate = @Product_ManufactureDate ,
            Product_ExpiryDate = @Product_ExpiryDate ,
            Product_IsDelete = @Product_IsDelete
    WHERE   Product_Id = @Product_Id
go

CREATE PROC [dbo].[Product_UpdateStatus]
    @Product_Id UNIQUEIDENTIFIER ,
    @Product_IsDelete BIT
AS 
    UPDATE  dbo.Product
    SET     Product_IsDelete = @Product_IsDelete
    WHERE   Product_Id = @Product_Id







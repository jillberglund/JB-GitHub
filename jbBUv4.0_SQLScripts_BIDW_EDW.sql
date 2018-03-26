/**************************************************
v4.0_SQLScripts_DW

****************************************************/

/****** Object:  Table [dbo].[FactSales]    Script Date: 11/15/2017 9:29:44 PM ******/

if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME ='FactSales' AND TABLE_SCHEMA = 'dbo' AND COLUMN_NAME = 'PONumber')
ALTER TABLE [dbo].[FactSales]
ADD	[PONumber] [nvarchar](50) NULL
GO

/****** Object:  Table [dbo].[FactSales]    Script Date: 11/15/2017 9:29:44 PM ******/


ALTER TABLE [dbo].[FactSales]
alter column
	[SalesDetailTypeCode] [varchar](2) NOT NULL

GO

ALTER TABLE [dbo].[FactSales]
alter column
	[SalesTypeCode] [varchar](2) NOT NULL

GO

ALTER TABLE [dbo].[FactSales]
alter column
	[OrderType] [varchar](2) NOT NULL

GO

ALTER TABLE [stage].[erms_SalesDetail]
alter column
	[SalesTypeCode] [varchar](2) NOT NULL

GO

ALTER TABLE [stage].[erms_SalesDetail]
alter column
	[SalesDetailTypeCode] [varchar](2) NOT NULL

GO

/****** Object:  Table [stage].[erms_SalesDetail]    Script Date: 11/15/2017 10:13:01 PM ******/

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'erms_SalesDetail' AND TABLE_SCHEMA = 'STAGE' AND COLUMN_NAME = 'PONumber')
ALTER TABLE [stage].[erms_SalesDetail]
ADD	[PONumber] [nvarchar](50) NULL

GO

/****** Object:  Table [dbo].[FactOrders]    Script Date: 11/15/2017 10:13:01 PM ******/

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'FactOrders' AND TABLE_SCHEMA = 'dbo' AND COLUMN_NAME = 'OrderStatus')
ALTER TABLE [dbo].[FactOrders]
ADD	[OrderStatus] [int] NULL,
    [BoxFactor] [decimal] (9,2) NULL

GO


/****** Object:  View [dbo].[Sales]    Script Date: 11/17/2017 12:35:02 PM ******/
DROP VIEW [dbo].[Sales]
GO

/****** Object:  View [dbo].[Sales]    Script Date: 11/17/2017 12:35:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Sales]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Sales] AS SELECT 
	   [SalesNumber]			AS [Sales Number]
      ,[SalesSeq]				AS [Sales Seq]
      ,[SalesDetailTypeCode]	AS [Sales Detail Type Code]
	  ,[SalesTypeCode]			AS [Sales Type Code]
      ,[TicketNumber]			AS [Ticket Number]
      ,[OrderNumber]			AS [Order Number]
      ,[OrderType]				AS [Order Type]
      ,[SalesDeliveryDate]		AS [Sales Delivery Date]
      ,[GLDate]					AS [GL Date]
      ,[LoadDate]				AS [Load Date]
      ,[CustomerDimKey]			AS [Customer Dim Key]
      ,[ItemDimKey]				AS [Item Dim Key]
      ,[DriverDimKey]			AS [Driver Dim Key]
      ,[CreditReasonDimKey]		AS [Credit Reason Dim Key]
      ,[RouteDimKey]			AS [Route Dim Key]
      ,[SubRouteDimKey]			AS [Sub Route Dim Key]
      ,[Units]					AS [Units]
      ,[UnitPrice]				AS [Unit Price]
      ,[SalesAmount]			AS [Sales Amount]
      ,[DiscountAmount]			AS [Discount Amount]
      ,[UnitDiscount]			AS [Unit Discount] 
      ,[DistCenterNumber]		AS [Dist Center Number]
      ,[PointsFactor]			AS [Points Factor]
      ,[CaseFactor]				AS [Case Factor]
      ,[UnitCost]				AS [Unit Cost]      
      ,[RebateAmount]			AS [RebateAmount]	
	  ,[PriceGroup]				AS [Price Group]  
	  ,[PriceGroupDimKey]		AS [Price Group Dim Key]  
	  ,CONVERT(money, [UnitCost] * [Units]) AS [Cost] -- unit cost x number of units sold
	  ,CASE WHEN SalesDetailTypeCode IN (''1'', ''2'', ''C3'', ''CP'', ''SO'', ''SZ'', ''SP'', ''SB'', ''C7'') and SalesTypeCode IN (''0'',''2'',''3'', ''7'')
				THEN CONVERT(money, [UnitCost] * [Units]) ELSE 0 END AS [GrossCost] -- unit cost x number of units sold
	  ,PointsFactor * [Units] AS [Points] -- number of points x number of units sold
	  ,CASE WHEN SalesDetailTypeCode IN (''1'', ''2'', ''C3'', ''CP'', ''SO'', ''SZ'', ''SP'', ''SB'', ''C7'') 
				--and SalesTypeCode IN (''0'',''2'',''3'') 
				THEN [Units] ELSE 0 END AS [GrossUnits]
	  ,CASE WHEN SalesDetailTypeCode IN (''3'', ''C6'') THEN [Units] * -1 ELSE 0 END AS [CreditUnits]
	  ,CASE WHEN SalesDetailTypeCode IN (''1'', ''2'', ''C3'', ''CP'', ''SO'', ''SZ'', ''SP'', ''SB'', ''C7'') and SalesTypeCode IN (''0'',''2'',''3'', ''7'') THEN [SalesAmount] ELSE 0 END AS [GrossDollars]
	  ,CASE WHEN SalesDetailTypeCode IN (''3'', ''C6'') THEN ([SalesAmount] - isnull([DiscountAmount], 0)) * -1   ELSE 0 END AS [CreditDollars] 
	  ,CASE WHEN SalesDetailTypeCode IN (''1'', ''2'', ''C3'', ''CP'', ''SO'', ''SZ'', ''SP'', ''SB'', ''C7'') 
				--and SalesTypeCode IN (''0'',''2'',''3'') 
				THEN  PointsFactor * [Units] ELSE 0 END AS [GrossPoints]
	  ,CASE WHEN SalesDetailTypeCode IN (''3'', ''C6'') THEN  (PointsFactor * [Units]) * -1 ELSE 0 END AS [CreditPoints]
	  ,CASE WHEN isnull([DiscountAmount], 0) <> 0 THEN  PointsFactor * [Units] ELSE 0 END AS [Off-InvoicePoints]
	  ,CASE WHEN isnull([DiscountAmount], 0) <> 0 THEN [Units] ELSE 0 END AS [Off-InvoiceUnits]
	  ,CASE WHEN CaseFactor <> 0 THEN  Units/CaseFactor ELSE 0 END AS Cases	
	  ,CASE WHEN SalesDetailTypeCode IN (''1'', ''2'', ''C3'', ''CP'', ''SO'', ''SZ'', ''SP'', ''SB'', ''C7'') --and SalesTypeCode IN (''0'',''2'',''3'') 
				THEN Units/CaseFactor ELSE 0 END AS GrossCases	
	  ,CASE WHEN SalesDetailTypeCode = ''1'' THEN 
				GrossLBFactor * Units 
				END AS GrossLB 
	  ,[HistBusinessUnit] AS [Hist Business Unit ID]
	  ,[PONumber]				AS [PO Number]
      ,[ETLDateInserted]		AS [ETLDateInserted]
      ,[SourceSystem]			AS [SourceSystem]
	  ,[SLDCHGDTE]
	  ,[SDUPMJ]
  FROM [dbo].[FactSales];' 
GO

/****** Object:  DW View [dbo].[Orders]    Script Date: 11/20/2017 12:55:22 PM ******/

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'factOrders' AND TABLE_SCHEMA = 'dbo')
ALTER TABLE [dbo].[factorders]

alter column    
	  [PONumber] nvarchar(50) NULL
go


/****** Object:  Table [stage].[jde_Item]    Script Date: 11/15/2017 10:13:01 PM ******/

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'jde_item' AND TABLE_SCHEMA = 'STAGE')
ALTER TABLE [stage].[jde_item]

ADD    
      [BrandCode] [nvarchar](3) NULL
      ,[ProductClassCode] [nvarchar] (4) NULL
      ,[Sub-CategoryCode] [nvarchar] (3) NULL
      ,[SegmentCode] [nvarchar] (3) NULL
      ,[ParentBrandCode] [nvarchar] (3) NULL
	  ,[ProductBrandCode] [nvarchar] (3) NULL
      ,[TypeCode] [nvarchar] (3) NULL
      ,[Type] [nvarchar] (50) NULL
      ,[SizeCode] [nvarchar] (3) NULL
      ,[PricingSize] [nvarchar] (50) NULL
      ,[PromoGroupCode] [nvarchar] (3) NULL
      ,[PromoGroup] [nvarchar] (50) NULL
      ,[ItemDimGroupCode] [nvarchar] (3) NULL
      ,[ProductBrandDimGroup] [nvarchar] (3) NULL
      ,[ProductionSize] [nvarchar] (3) NULL

GO

/****** Object:  Table [stage].[jde_Item]    Script Date: 11/15/2017 10:13:01 PM ******/

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'dimitem' AND TABLE_SCHEMA = 'dbo' AND COLUMN_NAME = 'BrandCode')
ALTER TABLE [dbo].[dimitem]

ADD    
      [BrandCode] [nvarchar](3) NULL
      ,[ProductClassCode] [nvarchar] (4) NULL
      ,[Sub-CategoryCode] [nvarchar] (3) NULL
      ,[SegmentCode] [nvarchar] (3) NULL
      ,[ParentBrandCode] [nvarchar] (3) NULL
	  ,[ProductBrandCode] [nvarchar] (3) NULL
      ,[TypeCode] [nvarchar] (3) NULL
      ,[Type] [nvarchar] (50) NULL
      ,[SizeCode] [nvarchar] (3) NULL
      ,[PricingSize] [nvarchar] (50) NULL
      ,[PromoGroupCode] [nvarchar] (3) NULL
      ,[PromoGroup] [nvarchar] (50) NULL
      ,[ItemDimGroupCode] [nvarchar] (3) NULL
      ,[ProductBrandDimGroup] [nvarchar] (3) NULL
      ,[ProductionSize] [nvarchar] (3) NULL

GO

/****** Object:  View [dbo].[Item]    Script Date: 11/20/2017 6:16:14 PM ******/
DROP VIEW [dbo].[Item]
GO

/****** Object:  View [dbo].[Item]    Script Date: 11/20/2017 6:16:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Item]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Item] AS SELECT [ItemDimKey]				AS [Item Dim Key]
      ,[IMITM]					AS [IMITM]
      ,[ItemNumber]				AS [Item Number]
      ,[ItemDesc]				AS [Item Desc]
	  ,[ItemNumber] + '' - '' + [ItemDesc] AS [ItemNumber Desc]
      ,[UPC]					AS [UPC]
      ,[SubBrandCode]			AS [Sub Brand Code]
      ,[SubBrandName]			AS [Sub Brand]
      ,[CategoryCode]			AS [Category Code]
      ,[CategoryName]			AS [Category Name]
      ,[PointsFactor]			AS [Points Factor]
      ,[CaseFactor]				AS [Case Factor]
      ,[GrossLBFactor]			AS [Gross LB Factor]
      ,[PalletFactor]			AS [Pallet Factor]
      ,[PCAT2Code]				AS [PCAT2 Code]
      ,[PCAT2]					AS [PCAT2]
	  ,[BrandCode]				AS [Brand Code]
      ,[Brand]					AS [Brand]
	  ,[ProductClassCode]		AS [Product Class Code]
      ,[ProductClass]			AS [Product Class]
      ,[Sub-CategoryCode]		AS [Sub-Category Code]
	  ,[Sub-CategoryName]		AS [Sub-Category Name]
	  ,[SegmentCode]			AS [Segment Code]
      ,[SegmentName]			AS [Segment Name]
	  ,[ParentBrandCode]		AS [Parent Brand Code]
      ,[Brand2]					AS [Parent Brand]
      ,[FatLevel]				AS [Fat Level]
      ,[Style]					AS [Style]
      ,[Flavor]					AS [Flavor]
      ,[PackageType]			AS [Package Type]
      ,[ProductSizeByOunce]		AS [Product Size by Ounce]
      ,[ContainerType]			AS [ContainerType]
      ,[SellingUnits]			AS [Selling Units]
      ,[ManufacturingProcess]	AS [Manufacturing Process]
      ,[Pre-PackagedUnits]		AS [Pre-Packaged Units]
	  ,[ProductBrandCode]		AS [Product Brand Code]
      ,[ProductBrand]			AS [Brand Group]
      ,[ProductOrigin]			AS [Product Origin]
      ,[ETLDateInserted]		AS [ETLDateInserted]
	  ,[BoxFactor]				AS [Box Factor]
	  ,[Class]					AS [Federal Market Class]
	  ,[StockingType]			AS [Stocking Type]
	  ,[SellingUnitOfMeasure]	AS [Selling Unit of Measure]
	  ,[TypeCode]				AS [Type Code]
	  ,[Type]					AS [Type]
	  ,[SizeCode]				AS [[Pricing Size Code]
	  ,[PricingSize]			AS [Pricing Size]
	  ,[PromoGroupCode]			AS [Promo Group Code]
	  ,[PromoGroup]				AS [Promotion Group]
	  ,[ItemDimGroupCode]		AS [Product Brand Dim Group Code]
	  ,[ProductBrandDimGroup]	AS [Product Brand Dim Group]
	  ,[ProductionSize]			AS [Production Size]
  FROM [dbo].[DimItem];' 
GO




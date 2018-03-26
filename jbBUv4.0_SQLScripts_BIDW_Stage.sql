/**************************************************
v4.0_SQLScripts_BIDW_Stage
****************************************************/
USE [BIDW_STAGE]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ERMS].[RMSLHP]') AND type in (N'U'))
ALTER TABLE [ERMS].[RMSLHP] DROP CONSTRAINT IF EXISTS [DF_ERMS_RMSLHP_ETLDateInserted]
GO

/****** Object:  Table [ERMS].[RMSLHP]    Script Date: 11/16/2017 2:40:30 PM ******/
DROP TABLE IF EXISTS [ERMS].[RMSLHP]
GO

/****** Object:  Table [ERMS].[RMSLHP]    Script Date: 11/16/2017 2:40:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ERMS].[RMSLHP]') AND type in (N'U'))
BEGIN
CREATE TABLE [ERMS].[RMSLHP](
	[SLHSLSNBR] [decimal](11, 0) NOT NULL,
	[SLHCUSCHN] [decimal](5, 0) NOT NULL,
	[SLHCUSNUM] [decimal](9, 0) NOT NULL,
	[SLHSUBCUS] [decimal](3, 0) NOT NULL,
	[SLHDELDTE] [decimal](8, 0) NOT NULL,
	[SLHTCKNUM] [decimal](11, 0) NOT NULL,
	[SLHDSTREF] [decimal](11, 0) NULL,
	[SLHCHGREF] [decimal](11, 0) NULL,
	[SLHTCKREF] [decimal](11, 0) NULL,
	[SLHUSRREF] [decimal](11, 0) NULL,
	[SLHDELDAY] [decimal](1, 0) NOT NULL,
	[SLHSLSTYP] [decimal](3, 0) NOT NULL,
	[SLHRTENUM] [decimal](6, 0) NOT NULL,
	[SLHSUBRTE] [decimal](6, 0) NOT NULL,
	[SLHDRVNUM] [decimal](9, 0) NOT NULL,
	[SLHDSTCTR] [decimal](3, 0) NOT NULL,
	[SLHSLMNUM] [decimal](3, 0) NOT NULL,
	[SLHCOMNUM] [decimal](3, 0) NOT NULL,
	[SLHREGNUM] [decimal](5, 0) NOT NULL,
	[SLHSUBREG] [decimal](3, 0) NOT NULL,
	[SLHSLSDIS] [decimal](3, 0) NOT NULL,
	[SLHSLSDIV] [decimal](3, 0) NOT NULL,
	[SLHSUBDIV] [decimal](6, 0) NOT NULL,
	[SLHSECTOR] [decimal](3, 0) NOT NULL,
	[SLHSUBSEC] [decimal](6, 0) NOT NULL,
	[SLHDPTMNT] [decimal](5, 0) NOT NULL,
	[SLHGEOREG] [decimal](3, 0) NOT NULL,
	[SLHGEOSUB] [decimal](6, 0) NOT NULL,
	[SLHSEGMNT] [decimal](6, 0) NOT NULL,
	[SLHSUBSEG] [decimal](6, 0) NOT NULL,
	[SLHPURORD] [nvarchar](50) NULL,
	[SLHORDNUM] [decimal](11, 0) NOT NULL,
	[SLHORDTYP] [varchar](2) NOT NULL,
	[SLHORDDTE] [decimal](8, 0) NOT NULL,
	[SLHREGRTE] [decimal](6, 0) NOT NULL,
	[SLHTOTQTY] [decimal](11, 2) NOT NULL,
	[SLHTOTVAL] [decimal](13, 2) NOT NULL,
	[SLHSLDAMT] [decimal](13, 2) NOT NULL,
	[SLHSLDQTY] [decimal](11, 2) NOT NULL,
	[SLHSLDWQT] [decimal](11, 5) NOT NULL,
	[SLHSLRAMT] [decimal](13, 2) NOT NULL,
	[SLHSLRQTY] [decimal](11, 2) NOT NULL,
	[SLHSLRWQT] [decimal](11, 5) NOT NULL,
	[SLHSLWAMT] [decimal](13, 2) NOT NULL,
	[SLHSLWQTY] [decimal](11, 2) NOT NULL,
	[SLHSLWWQT] [decimal](11, 5) NOT NULL,
	[SLHDSCAMT] [decimal](13, 2) NOT NULL,
	[SLHARRDSC] [decimal](13, 2) NOT NULL,
	[SLHCASCOM] [decimal](13, 2) NOT NULL,
	[SLHBKRCMM] [decimal](13, 2) NULL,
	[SLHBUYDIS] [decimal](13, 2) NULL,
	[SLHFRTCHG] [decimal](13, 2) NULL,
	[SLHRETDIS] [decimal](13, 2) NULL,
	[SLHDSCSWT] [decimal](1, 0) NULL,
	[SLHSELDTE] [decimal](8, 0) NULL,
	[SLHLODDTE] [decimal](8, 0) NOT NULL,
	[SLHNGJUPD] [decimal](1, 0) NOT NULL,
	[SLHIVCNUM] [decimal](11, 0) NOT NULL,
	[SLHARENTD] [decimal](8, 0) NOT NULL,
	[SLHCSHRCV] [decimal](13, 2) NOT NULL,
	[SLHORDSRC] [char](1) NOT NULL,
	[SLHROYCHG] [decimal](13, 2) NOT NULL,
	[SLHADVCHG] [decimal](13, 2) NOT NULL,
	[SLHSUPRTE] [decimal](6, 0) NOT NULL,
	[SLHTAXAMT] [decimal](13, 2) NOT NULL,
	[SLHFSCYER] [decimal](4, 0) NOT NULL,
	[SLHFSCWEK] [decimal](2, 0) NOT NULL,
	[SLHFSCPER] [decimal](2, 0) NOT NULL,
	[SLHCUSTYP] [decimal](4, 0) NOT NULL,
	[SLHTRNTIM] [decimal](6, 0) NOT NULL,
	[SLHSTRTIM] [decimal](6, 0) NOT NULL,
	[SLHENDTIM] [decimal](6, 0) NOT NULL,
	[SLHVNDCOL] [decimal](13, 2) NOT NULL,
	[SLHVNDCOM] [decimal](13, 2) NOT NULL,
	[SLHARCHNN] [decimal](5, 0) NOT NULL,
	[SLHARCUSN] [decimal](9, 0) NOT NULL,
	[SLHARSBCS] [decimal](3, 0) NULL,
	[SLHRTLAMT] [decimal](13, 2) NULL,
	[SLHHQPAMT] [decimal](13, 2) NULL,
	[SLHCOMAMT] [decimal](13, 2) NULL,
	[SLHINVRUN] [decimal](1, 0) NULL,
	[SLHPGMCOD] [char](10) NULL,
	[SLHORGCHN] [decimal](5, 0) NULL,
	[SLHORGCUS] [decimal](9, 0) NULL,
	[SLHREBUPD] [decimal](8, 0) NULL,
	[SLHSLDTYP] [decimal](1, 0) NULL,
	[SLHARRTYP] [decimal](3, 0) NULL,
	[SLHORDDDT] [decimal](8, 0) NULL,
	[SLHCMMUPD] [char](10) NULL,
	[SLHTAXCOL] [decimal](13, 2) NULL,
	[SLHGLSRCD] [char](6) NuLL,
	[SLHSERITM] [decimal](1, 0) NULL,
	[SLHVMITRN] [decimal](1, 0) NULL,
	[SLHSLCQTY] [decimal](11, 2) NULL,
	[SLHSLCAMT] [decimal](13, 2) NULL,
	[SLHSLIQTY] [decimal](11, 2) NULL,
	[SLHSLIAMT] [decimal](13, 2) NULL,
	[SLHREFIDT] [decimal](8, 0) NULL,
	[SLHREFINM] [decimal](11, 0) NULL,
	[SLHHWUPDC] [decimal](4, 0) NULL,
	[SLHHWUPDM] [decimal](2, 0) NULL,
	[SLHHWUPDW] [decimal](2, 0) NULL,
	[SLHHMUPDC] [decimal](4, 0) NULL,
	[SLHHMUPDM] [decimal](2, 0) NULL,
	[SLHUSRFL1] [char](1) NULL,
	[SLHUSRFL2] [char](1) NULL,
	[SLHUSRFL3] [char](1) NULL,
	[SLHUSRFL4] [char](1) NULL,
	[SLHUSRFL5] [char](1) NULL,
	[SLHFOBPNT] [decimal](3, 0) NULL,
	[SLHIFCORD] [char](15) NULL,
	[SLHCRDREF] [decimal](11, 0) NULL,
	[SLHMLTORD] [decimal](1, 0) NULL,
	[SLHMCHAMT] [decimal](13, 2) NULL,
	[SLHMCHTAX] [decimal](13, 2) NULL,
	[SLHSWTCH1] [decimal](15, 0) NULL,
	[SLHSWTCH2] [decimal](15, 0) NULL,
	[SLHSWTCHU] [decimal](15, 0) NULL,
	[SLHCHGUSR] [char](10) NOT NULL,
	[SLHCHGDTE] [decimal](8, 0) NOT NULL,
	[SLHCHGTIM] [decimal](6, 0) NOT NULL,
	[SLHCRTUSR] [char](10) NOT NULL,
	[SLHCRTDTE] [decimal](8, 0) NOT NULL,
	[SLHCRTTIM] [decimal](6, 0) NOT NULL,
	[SLHIVCBCH] [decimal](11, 0) NULL,
	[SLHGLBCH] [decimal](11, 0) NULL,
	[SLHWHSBCH] [decimal](11, 0) NULL,
	[SLHMHSBCH] [decimal](11, 0) NULL,
	[SLHREBBCH] [decimal](11, 0) NULL,
	[SLHMABCH] [decimal](11, 0) NULL,
	[SLHCHGBCH] [decimal](11, 0) NULL,
	[SLHUS1BCH] [decimal](11, 0) NULL,
	[SLHUS2BCH] [decimal](11, 0) NULL,
	[SLHUS3BCH] [decimal](11, 0) NULL,
	[SLHUNBFLG] [decimal](1, 0) NULL,
	[X_UPID] [decimal](7, 0) NOT NULL,
	[X_RRNO] [decimal](15, 0) NOT NULL,
	[ETLDateInserted] [datetime2](0) NOT NULL
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ERMS].[DF_ERMS_RMSLHP_ETLDateInserted]') AND type = 'D')
BEGIN
ALTER TABLE [ERMS].[RMSLHP] ADD  CONSTRAINT [DF_ERMS_RMSLHP_ETLDateInserted]  DEFAULT (sysutcdatetime()) FOR [ETLDateInserted]
END
GO

ALTER TABLE [erms].[rmsldp]
alter column
	[Slddtltyp] [varchar](2) NOT NULL

GO



USE [BIDW_STAGE]
GO

/****** Object:  View [ERMS].[SalesDetail]    Script Date: 11/21/2017 4:26:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER view [ERMS].[SalesDetail]

AS

SELECT [SLDSLSNBR] AS SalesNumber
      ,[SLDSLSSEQ] AS SalesSeq
      ,convert(varchar(2),[SLDDTLTYP]) AS SalesDetailTypeCode
      ,[SLDCUSCHN] AS ChainNumber
      ,[SLDCUSNUM] AS CustomerNumber
      ,[SLDSUBCUS] AS CustomerSubNumber
      ,[SLDDELDTE] AS SalesDeliveryDate
      ,[SLDTCKNUM] AS TicketNumber
      ,LTRIM(RTRIM([SLDITMNUM])) AS ItemNumber
      ,convert(varchar(2),[SLDSLSTYP]) AS SalesTypeCode
      ,[SLDTRNQTY] AS Units
      ,[SLDTRNPRC] AS UnitPrice
      ,[SLDTRNAMT] AS SalesAmount
      --,[SLDTRNDTE] AS SalesTranDate
      --,[SLDORDQTY] AS OrderQuantity
      ,[SLDDSCAMT] AS DiscountAmount
      ,[SLDUNTDSC] AS UnitDiscount
      ,[SLDWGTQTY] AS [GrossLB]
      ,[SLDCASCOM]
      ,[SLDBKRCMM]
      ,[SLDBUYDIS]
      ,[SLDFRTCHG]
      ,[SLDRETDIS]
      ,[SLDIVCDSC]
      ,[SLDARRDSC]
      ,[SLDPRCOVR]
      ,[SLDPRCSRC]
      ,[SLDPRCGRP] AS PriceGroup
      ,[SLDROYCHG]
      ,[SLDADVCHG]
      ,[SLDBASPRC]
      ,[SLDTAXAMT]
      ,[SLDCOMTBL]
      ,[SLDDSCUNT]
      ,[SLDRESCOD] AS CreditReasonCode
      ,[SLDSHPQTY]
      ,[SLDTAXOVR]
      ,[SLDPRCGP1]
      ,[SLDPRCGP2]
      ,[SLDPRCCHN]
      ,[SLDPRCCUS]
      ,[SLDINTSLS]
      ,[SLDUSRSLS]
      ,[SLDCHGUSR]
      ,[SLDCHGDTE] 
      ,[SLDCHGTIM]
      ,[SLDCRTUSR]
      ,[SLDCRTDTE]
      ,[SLDCRTTIM]
      ,[X_UPID]
      ,[X_RRNO]
  FROM [ERMS].[RMSLDP] AS SalesDetail
  --WHERE [SLDDTLTYP] IN (1, 2, 3)
GO





/****** Object:  Table [ERMS].[RMSLDP]    Script Date: 11/21/2017 4:21:14 PM ******/
DROP TABLE IF EXISTS [ERMS].[RMSLDP]
GO

/****** Object:  Table [ERMS].[RMSLDP]    Script Date: 11/21/2017 4:21:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ERMS].[RMSLDP]') AND type in (N'U'))
BEGIN
CREATE TABLE [ERMS].[RMSLDP](
	[SLDSLSNBR] [decimal](11, 0) NOT NULL,
	[SLDSLSSEQ] [decimal](5, 0) NOT NULL,
	[SLDDTLTYP] [decimal](2, 0) NOT NULL,
	[SLDCUSCHN] [decimal](5, 0) NOT NULL,
	[SLDCUSNUM] [decimal](9, 0) NOT NULL,
	[SLDSUBCUS] [decimal](3, 0) NOT NULL,
	[SLDDELDTE] [decimal](8, 0) NOT NULL,
	[SLDTCKNUM] [decimal](11, 0) NOT NULL,
	[SLDITMNUM] [char](9) NOT NULL,
	[SLDSLSTYP] [varchar](2) NOT NULL,
	[SLDTRNQTY] [decimal](11, 2) NOT NULL,
	[SLDTRNPRC] [decimal](13, 5) NOT NULL,
	[SLDTRNAMT] [decimal](13, 2) NOT NULL,
	[SLDTRNDTE] [decimal](8, 0) NOT NULL,
	[SLDORDQTY] [decimal](11, 2) NOT NULL,
	[SLDDSCAMT] [decimal](13, 2) NOT NULL,
	[SLDUNTDSC] [decimal](13, 5) NOT NULL,
	[SLDWGTQTY] [decimal](11, 5) NOT NULL,
	[SLDCASCOM] [decimal](13, 2) NOT NULL,
	[SLDBKRCMM] [decimal](13, 2) NOT NULL,
	[SLDBUYDIS] [decimal](13, 2) NOT NULL,
	[SLDFRTCHG] [decimal](13, 2) NOT NULL,
	[SLDRETDIS] [decimal](13, 2) NOT NULL,
	[SLDIVCDSC] [decimal](13, 2) NOT NULL,
	[SLDARRDSC] [decimal](13, 2) NOT NULL,
	[SLDPRCOVR] [decimal](1, 0) NOT NULL,
	[SLDPRCSRC] [decimal](3, 0) NOT NULL,
	[SLDPRCGRP] [decimal](5, 0) NOT NULL,
	[SLDROYCHG] [decimal](13, 2) NOT NULL,
	[SLDADVCHG] [decimal](13, 2) NOT NULL,
	[SLDBASPRC] [decimal](13, 5) NOT NULL,
	[SLDTAXAMT] [decimal](13, 2) NOT NULL,
	[SLDCOMTBL] [decimal](2, 0) NOT NULL,
	[SLDDSCUNT] [decimal](11, 2) NOT NULL,
	[SLDRESCOD] [decimal](3, 0) NOT NULL,
	[SLDSHPQTY] [decimal](11, 2) NOT NULL,
	[SLDTAXOVR] [decimal](1, 0) NOT NULL,
	[SLDPRCGP1] [decimal](13, 5) NOT NULL,
	[SLDPRCGP2] [decimal](13, 5) NOT NULL,
	[SLDPRCCHN] [decimal](13, 5) NOT NULL,
	[SLDPRCCUS] [decimal](13, 5) NOT NULL,
	[SLDINTSLS] [decimal](3, 0) NOT NULL,
	[SLDUSRSLS] [decimal](3, 0) NOT NULL,
	[SLDCHGUSR] [char](10) NOT NULL,
	[SLDCHGDTE] [decimal](8, 0) NOT NULL,
	[SLDCHGTIM] [decimal](6, 0) NOT NULL,
	[SLDCRTUSR] [char](10) NOT NULL,
	[SLDCRTDTE] [decimal](8, 0) NOT NULL,
	[SLDCRTTIM] [decimal](6, 0) NOT NULL,
	[X_UPID] [decimal](7, 0) NOT NULL,
	[X_RRNO] [decimal](15, 0) NOT NULL,
	[ETLDateInserted] [datetime2](0) NOT NULL
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ERMS].[DF_ERMS_RMSLDP_ETLDateInserted]') AND type = 'D')
BEGIN
ALTER TABLE [ERMS].[RMSLDP] ADD  CONSTRAINT [DF_ERMS_RMSLDP_ETLDateInserted]  DEFAULT (sysutcdatetime()) FOR [ETLDateInserted]
END
GO




USE [BIDW_STAGE]
GO

/****** Object:  View [JDE].[SalesDetail]    Script Date: 11/15/2017 4:42:10 PM ******/
DROP VIEW IF EXISTS [JDE].[SalesDetail]
GO

/****** Object:  View [JDE].[SalesDetail]    Script Date: 11/15/2017 4:42:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[JDE].[SalesDetail]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [JDE].[SalesDetail]
AS

SELECT [SDKCOO] AS [OrderCompany]
      ,[SDDOCO] AS [OrderNumber]
      ,[SDDCTO] AS [OrderDetailType]
      ,[SDLNID] AS [LineNumber]
      ,[SDSFXO] AS [OrderSuffix]
      --,[SDSFX] AS [PayItem]
      ,[SDMCU] AS [DistCenterNumber]
      ,[SDCO] AS [Company]
      ,[SDAN8] AS [AddressNumber]
      ,[SDSHAN] AS [ShipTo]
      ,[SDBTAN] AS [BillToNumber]
      ,[SDPA8] AS [ParentNumber]
	  ,CASE WHEN [SDDRQJ] = 0 THEN NULL
		ELSE dateadd(dd, (cast([SDDRQJ] as int) - ((cast([SDDRQJ] as int)/1000) * 1000)) - 1, dateadd(yy, cast([SDDRQJ] as int)/1000, 0)) END AS RequestedDate
	  ,CASE WHEN [SDTRDJ] = 0 THEN NULL
		ELSE dateadd(dd, (cast([SDTRDJ] as int) - ((cast([SDTRDJ] as int)/1000) * 1000)) - 1, dateadd(yy, cast([SDTRDJ] as int)/1000, 0)) END AS OrderDate
	  ,CASE WHEN SDDGL = 0 THEN NULL
		ELSE dateadd(dd, (cast(SDDGL as int) - ((cast(SDDGL as int)/1000) * 1000)) - 1, dateadd(yy, cast(SDDGL as int)/1000, 0)) END AS GLDate
	  ,CASE WHEN SDIVD = 0 THEN NULL
		ELSE dateadd(dd, (cast(SDIVD as int) - ((cast(SDIVD as int)/1000) * 1000)) - 1, dateadd(yy, cast(SDIVD as int)/1000, 0)) END AS InvoiceDate
	  ,CASE WHEN SDADLJ = 0 THEN NULL
		ELSE dateadd(dd, (cast(SDADLJ as int) - ((cast(SDADLJ as int)/1000) * 1000)) - 1, dateadd(yy, cast(SDADLJ as int)/1000, 0)) END AS ActualDelDate
      ,[SDPDDJ] AS [ActualShipDate]	
	  ,CASE WHEN [SDPPDJ] = 0 THEN NULL
		ELSE dateadd(dd, (cast([SDPPDJ] as int) - ((cast([SDPPDJ] as int)/1000) * 1000)) - 1, dateadd(yy, cast([SDPPDJ] as int)/1000, 0)) END AS LoadDate
	  --,[SDUOM1] AS [UnitOfMeasure]  
	  ,CASE WHEN [SDUNCS]<> 0 THEN [SDUNCS]/10000 END AS [UnitCost]
      ,CASE WHEN [SDUPRC]<> 0 THEN [SDUPRC]/1000 END AS [UnitPrice]
      ,CASE WHEN [SDAEXP] <> 0 THEN [SDAEXP]/100 END AS [SalesAmount]
      ,[SDUORG] AS [QuantityOrdered]
      ,[SDSOQS] AS [QuantityShipped]
	  ,[SDDOC] AS [InvoiceNumber]
	  ,[SDLITM] AS [ItemNumber]
      ,[SDGLC] AS [HistoricalPCAT2]
	  ,[SDEMCU] AS [HistoricalBusinessUnit]
      ,[SDUOM] AS [UnitOfMeasure]
      ,[SDROUT] AS [RouteCode]
      ,[SDASN] AS [AdjustmentSchedule]
      ,[SDNXTR] AS NextStatus
      ,[SDLTTR] AS LastStatus
      ,CONVERT(nvarchar(50), [SDVR01]) AS [PONumber]
     ,[SDMKFR]
      ,[SDOKCO]
      ,[SDOORN]
      ,[SDOCTO]
      ,[SDOGNO]
      ,[SDRKCO]
      ,[SDRORN]
      ,[SDRCTO]
      ,[SDRLLN]
      ,[SDDMCT]
      ,[SDDMCS]
      ,[SDBALU]
      ,[SDOPDJ]
      ,[SDADDJ]
      ,[SDIVD]
      ,[SDCNDJ]
      ,[SDDGL]
      ,[SDRSDJ]
      ,[SDPEFJ]
      ,[SDRQSJ]
      ,[SDADLJ] 
      ,[SDDRQT]
      ,[SDRSDT]
      ,[SDVR02]
      ,[SDVR03]
      ,[SDITM]      
      ,[SDAITM]
      ,[SDMERL]
      ,[SDLOCN]
      ,[SDLOTN]
      ,[SDFRGD]
      ,[SDTHGD]
      ,[SDACGD]
      ,[SDFRMP]
      ,[SDTHRP]
      ,[SDAPOT]
      ,[SDEXDP]
      ,[SDDSC1]
      ,[SDDSC2]
      ,[SDLNTY]
      ,[SDHOLD]      
      ,[SDHDBU]
      ,[SDDMBU]
      ,[SDRLIT]
      ,[SDKTLN]
      ,[SDCPNT]
      ,[SDRKIT]
      ,[SDKTP]
      ,[SDCSID]
      ,[SDSRP1]
      ,[SDSRP2]
      ,[SDSRP3]
      ,[SDSRP4]
      ,[SDSRP5]
      ,[SDPRP1]
      ,[SDPRP2]
      ,[SDPRP3]
      ,[SDPRP4]
      ,[SDPRP5]
      ,[SDDMS1]
      ,[SDDMT1]
      ,[SDSOBK]
      ,[SDSOCN]
      ,[SDSONE]
      ,[SDUOPN]
      ,[SDQTYT]
      ,[SDQRLV]
      ,[SDCOMM]
      ,[SDOTQY]
      ,[SDBCRC]
      ,[SDAOPN]
      ,[SDPROV]
      ,[SDTPC]
      ,[SDAPUM]
      ,[SDLPRC]      
      ,[SDECST]
      ,[SDCSTO]
      ,[SDTCST]
      ,[SDINMG]
      ,[SDPTC]
      ,[SDRYIN]
      ,[SDDTBS]
      ,[SDTRDC]
      ,[SDFUN2]
      ,[SDOSEQ]
      ,[SDPRGR]
      ,[SDCLVL]
      ,[SDDSPR]
      ,[SDDSFT]
      ,[SDFAPP]
      ,[SDCADC]
      ,[SDKCO]      
      ,[SDDCT]
      ,[SDODOC]
      ,[SDODCT]
      ,[SDOKC]
      ,[SDPSN]
      ,[SDDELN]
      ,[SDPTSK]
      ,[SDTAX1]
      ,[SDTXA1]
      ,[SDEXR1]
      ,[SDATXT]
      ,[SDPRIO]
      ,[SDRESL]
      ,[SDBACK]
      ,[SDSBAL]
      ,[SDAPTS]
      ,[SDLOB]
      ,[SDEUSE]
      ,[SDDTYS]
      ,[SDNTR]
      ,[SDVEND]
      ,[SDANBY]
      ,[SDCARS]
      ,[SDMOT]
      ,[SDCOT]
      ,[SDSTOP]
      ,[SDZON]
      ,[SDCNID]
      ,[SDFRTH]
      ,[SDAFT]
      ,[SDFUF1]
      ,[SDFRTC]
      ,[SDFRAT]
      ,[SDRATT]
      ,[SDSHCM]
      ,[SDSHCN]
      ,[SDSHPN]
      ,[SDSERN]
      ,[SDLDNM]
      ,[SDSHMT]
      ,[SDTKNR] 
      ,[SDTKTM]
      ,[SDTKDA]      
      ,[SDPQOR] 
      ,[SDUOM2]
      ,[SDSQOR]
      ,[SDUOM4]
      ,[SDITWT]
	  ,CONVERT(decimal(11,2),[SDITWT]/10000) as [GrossLB]
      ,[SDWTUM]
      ,[SDITVL]
      ,[SDVLUM]
      ,[SDRPRC]
      ,[SDORPR]
      ,[SDORP]
      ,[SDCMGP]
      ,[SDCMGL]
      ,[SDCTRY]
      ,[SDFY]
      ,[SDSTTS]
      ,[SDSO01]
      ,[SDSO02]
      ,[SDSO03]
      ,[SDSO04]
      ,[SDSO05]
      ,[SDSO06]
      ,[SDSO07]
      ,[SDSO08]
      ,[SDSO09]
      ,[SDSO10]
      ,[SDSO11]
      ,[SDSO12]
      ,[SDSO13]
      ,[SDSO14]
      ,[SDSO15]
      ,[SDSO16]
      ,[SDSO17]
      ,[SDSO18]
      ,[SDSO19]
      ,[SDSO20]
      ,[SDSLSM]
      ,[SDSLCM]
      ,[SDSLM2]
      ,[SDSLC2]
      ,[SDACOM]
      ,[SDCMCG]
      ,[SDRCD]
      ,[SDGRWT]
      ,[SDGWUM]
      ,[SDANI]
      ,[SDAID]
      ,[SDOMCU]
      ,[SDOBJ]
      ,[SDSUB]
      ,[SDLT]
      ,[SDSBL]
      ,[SDSBLT]
      ,[SDLCOD]
      ,[SDUPC1]
      ,[SDUPC2]
      ,[SDUPC3]
      ,[SDSWMS]
      ,[SDUNCD]
      ,[SDCRMD]
      ,[SDCRCD]
      ,[SDCRR]
      ,[SDFPRC]
      ,[SDFUP]
      ,[SDFEA]
      ,[SDFUC]
      ,[SDFEC]
      ,[SDURCD]
      ,[SDURDT]
      ,[SDURAT]
      ,[SDURAB]
      ,[SDURRF]
      ,[SDSCPD]
      ,[SDSCPT]
      ,[SDSCPS]
      ,[SDEDCK]
      ,[SDSBCK]
      ,[SDBBCK]
      ,[SDCMDM]
      ,[SDUSC1]
      ,[SDUSC2]
      ,[SDUSC3]
      ,[SDUSC4]
      ,[SDUSC5]
      ,[SDBLNO]
      ,[SDTMUP]
      ,[SDS1DJ]
      ,[SDS2DJ]
      ,[SDWORN]
      ,[SDWCTO]
      ,[SDWKCO]
      ,[SDWGNO]
      ,[SDWCEJ]
      ,[SDWFLG]
      ,[SDTORG]
      ,[SDUSER]
      ,[SDPID]
      ,[SDJOBN]
      ,[SDUPMJ] 
      ,[SDTDAY]
  FROM [JDE].[F42119]
  --WHERE [SDDRQJ] >= 115001


' 
GO

USE [BIDW_STAGE]
GO

/****** Object:  View [ERMS].[SalesHeader]    Script Date: 11/21/2017 2:04:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [ERMS].[SalesHeader]

AS

SELECT [SLHSLSNBR] AS SalesNumber
      ,[SLHCUSCHN]
      ,[SLHCUSNUM]
      ,[SLHSUBCUS]
	  ,CONCAT([SLHCUSCHN], [SLHCUSNUM], [SLHSUBCUS]) AS CustomerDimKey
      ,[SLHDELDTE]
      ,[SLHTCKNUM] 
      ,[SLHDSTREF]
      ,[SLHCHGREF]
      ,[SLHTCKREF]
      ,[SLHUSRREF]
      ,[SLHDELDAY]
      ,[SLHSLSTYP]
      ,[SLHRTENUM] AS RouteNumber
      ,[SLHSUBRTE] AS SubRouteNumber
      ,[SLHDRVNUM] AS DriverNumber
      ,[SLHDSTCTR] AS DistCenterNumber
      ,[SLHSLMNUM]
      ,[SLHCOMNUM]
      ,[SLHREGNUM]
      ,[SLHSUBREG]
      ,[SLHSLSDIS]
      ,[SLHSLSDIV]
      ,[SLHSUBDIV]
      ,[SLHSECTOR]
      ,[SLHSUBSEC]
      ,[SLHDPTMNT]
      ,[SLHGEOREG]
      ,[SLHGEOSUB]
      ,[SLHSEGMNT]
      ,[SLHSUBSEG]
      ,convert(nvarchar(50), [SLHPURORD]) AS PONumber
      ,[SLHORDNUM] AS OrderNumber
      ,[SLHORDTYP] AS OrderType
      ,[SLHORDDTE]
      ,[SLHREGRTE]
      ,[SLHTOTQTY] AS TotalUnits
      ,[SLHTOTVAL] AS TotalValue
      ,[SLHSLDAMT] AS SalesAmount
      ,[SLHSLDQTY]
      ,[SLHSLDWQT]
      ,[SLHSLRAMT]
      ,[SLHSLRQTY]
      ,[SLHSLRWQT]
      ,[SLHSLWAMT]
      ,[SLHSLWQTY]
      ,[SLHSLWWQT]
      ,[SLHDSCAMT] AS DiscountAmount
      ,[SLHARRDSC]
      ,[SLHCASCOM]
      ,[SLHBKRCMM]
      ,[SLHBUYDIS]
      ,[SLHFRTCHG]
      ,[SLHRETDIS]
      ,[SLHDSCSWT]
      ,[SLHSELDTE] AS [GLDate]
      ,[SLHLODDTE] AS LoadDate
      ,[SLHNGJUPD] AS [UpdateStatus]
      ,[SLHIVCNUM]
      ,[SLHARENTD]
      ,[SLHCSHRCV]
      ,[SLHORDSRC]
      ,[SLHROYCHG]
      ,[SLHADVCHG]
      ,[SLHSUPRTE]
      ,[SLHTAXAMT]
      ,[SLHFSCYER]
      ,[SLHFSCWEK]
      ,[SLHFSCPER]
      ,[SLHCUSTYP]
      ,[SLHTRNTIM]
      ,[SLHSTRTIM]
      ,[SLHENDTIM]
      ,[SLHVNDCOL]
      ,[SLHVNDCOM]
      ,[SLHARCHNN]
      ,[SLHARCUSN]
      ,[SLHARSBCS]
      ,[SLHRTLAMT]
      ,[SLHHQPAMT]
      ,[SLHCOMAMT]
      ,[SLHINVRUN]
      ,[SLHPGMCOD]
      ,[SLHORGCHN]
      ,[SLHORGCUS]
      ,[SLHREBUPD]
      ,[SLHSLDTYP]
      ,[SLHARRTYP]
      ,[SLHORDDDT]
      ,[SLHCMMUPD]
      ,[SLHTAXCOL]
      ,[SLHGLSRCD]
      ,[SLHSERITM]
      ,[SLHVMITRN]
      ,[SLHSLCQTY]
      ,[SLHSLCAMT]
      ,[SLHSLIQTY]
      ,[SLHSLIAMT]
      ,[SLHREFIDT]
      ,[SLHREFINM]
      ,[SLHHWUPDC]
      ,[SLHHWUPDM]
      ,[SLHHWUPDW]
      ,[SLHHMUPDC]
      ,[SLHHMUPDM]
      ,[SLHUSRFL1]
      ,[SLHUSRFL2]
      ,[SLHUSRFL3]
      ,[SLHUSRFL4]
      ,[SLHUSRFL5]
      ,[SLHFOBPNT]
      ,[SLHIFCORD]
      ,[SLHCRDREF]
      ,[SLHMLTORD]
      ,[SLHMCHAMT]
      ,[SLHMCHTAX]
      ,[SLHSWTCH1]
      ,[SLHSWTCH2]
      ,[SLHSWTCHU]
      ,[SLHCHGUSR]
      ,[SLHCHGDTE]
      ,[SLHCHGTIM]
      ,[SLHCRTUSR]
      ,[SLHCRTDTE]
      ,[SLHCRTTIM]
      ,[SLHIVCBCH]
      ,[SLHGLBCH]
      ,[SLHWHSBCH]
      ,[SLHMHSBCH]
      ,[SLHREBBCH]
      ,[SLHMABCH]
      ,[SLHCHGBCH]
      ,[SLHUS1BCH]
      ,[SLHUS2BCH]
      ,[SLHUS3BCH]
      ,[SLHUNBFLG]
      ,[X_UPID]
      ,[X_RRNO]
  FROM [ERMS].[RMSLHP]
  --WHERE [SLHSLSTYP] IN (1, 2, 3)
GO

USE [BIDW_STAGE]
GO

/****** Object:  View [ERMS].[SalesDetail]    Script Date: 11/21/2017 2:42:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER view [ERMS].[SalesDetail]

AS

SELECT [SLDSLSNBR] AS SalesNumber
      ,[SLDSLSSEQ] AS SalesSeq
      ,convert(varchar(2),[SLDDTLTYP]) AS SalesDetailTypeCode --changed to varchar from decimal
      ,[SLDCUSCHN] AS ChainNumber
      ,[SLDCUSNUM] AS CustomerNumber
      ,[SLDSUBCUS] AS CustomerSubNumber
      ,[SLDDELDTE] AS SalesDeliveryDate
      ,[SLDTCKNUM] AS TicketNumber
      ,LTRIM(RTRIM([SLDITMNUM])) AS ItemNumber
      ,[SLDSLSTYP] AS SalesTypeCode
      ,[SLDTRNQTY] AS Units
      ,[SLDTRNPRC] AS UnitPrice
      ,[SLDTRNAMT] AS SalesAmount
      --,[SLDTRNDTE] AS SalesTranDate
      --,[SLDORDQTY] AS OrderQuantity
      ,[SLDDSCAMT] AS DiscountAmount
      ,[SLDUNTDSC] AS UnitDiscount
      ,[SLDWGTQTY] AS [GrossLB]
      ,[SLDCASCOM]
      ,[SLDBKRCMM]
      ,[SLDBUYDIS]
      ,[SLDFRTCHG]
      ,[SLDRETDIS]
      ,[SLDIVCDSC]
      ,[SLDARRDSC]
      ,[SLDPRCOVR]
      ,[SLDPRCSRC]
      ,[SLDPRCGRP] AS PriceGroup
      ,[SLDROYCHG]
      ,[SLDADVCHG]
      ,[SLDBASPRC]
      ,[SLDTAXAMT]
      ,[SLDCOMTBL]
      ,[SLDDSCUNT]
      ,[SLDRESCOD] AS CreditReasonCode
      ,[SLDSHPQTY]
      ,[SLDTAXOVR]
      ,[SLDPRCGP1]
      ,[SLDPRCGP2]
      ,[SLDPRCCHN]
      ,[SLDPRCCUS]
      ,[SLDINTSLS]
      ,[SLDUSRSLS]
      ,[SLDCHGUSR]
      ,[SLDCHGDTE] 
      ,[SLDCHGTIM]
      ,[SLDCRTUSR]
      ,[SLDCRTDTE]
      ,[SLDCRTTIM]
      ,[X_UPID]
      ,[X_RRNO]
  FROM [ERMS].[RMSLDP] AS SalesDetail
  --WHERE [SLDDTLTYP] IN (1, 2, 3)
GO



USE [BIDW_STAGE]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[stage].[FactSales]') AND type in (N'U'))
ALTER TABLE [stage].[FactSales] DROP CONSTRAINT IF EXISTS [DF_stage_FactSales_ETLDateInserted]
GO

/****** Object:  Table [stage].[FactSales]    Script Date: 11/15/2017 8:28:07 PM ******/
DROP TABLE IF EXISTS [stage].[FactSales]
GO

/****** Object:  Table [stage].[FactSales]    Script Date: 11/15/2017 8:28:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[stage].[FactSales]') AND type in (N'U'))
BEGIN
CREATE TABLE [stage].[FactSales](
	[SalesNumber] [bigint] NOT NULL,
	[SalesSeq] [int] NOT NULL,
	[SalesDetailTypeCode] [varchar](2) NOT NULL,
	[SalesTypeCode] [varchar](2) NOT NULL,
	[TicketNumber] [bigint] NULL,
	[OrderNumber] [bigint] NOT NULL,
	[OrderType] [varchar](2) NOT NULL,
	[SalesDeliveryDate] [int] NOT NULL,
	[GLDate] [int] NOT NULL,
	[LoadDate] [int] NULL,
	[CustomerDimKey] [int] NOT NULL,
	[ItemDimKey] [int] NOT NULL,
	[DriverDimKey] [int] NOT NULL,
	[CreditReasonDimKey] [int] NOT NULL,
	[RouteDimKey] [int] NOT NULL,
	[SubRouteDimKey] [int] NOT NULL,
	[Units] [decimal](9, 2) NULL,
	[UnitPrice] [money] NULL,
	[SalesAmount] [money] NULL,
	[DiscountAmount] [money] NULL,
	[UnitDiscount] [money] NULL,
	[DistCenterNumber] [int] NULL,
	[PointsFactor] [decimal](9, 5) NULL,
	[CaseFactor] [decimal](9, 2) NULL,
	[UnitCost] [money] NULL,
	[GrossLB] [decimal](11, 5) NULL,
	[RebateAmount] [money] NULL,
	[QuantityShipped] [int] NULL,
	[UnitOfMeasure] [varchar](2) NULL,
	[ETLDateInserted] [datetime2](0) NOT NULL,
	[SourceSystem] [varchar](4) NOT NULL,
	[SLDCHGDTE] [int] NULL,
	[SDUPMJ] [int] NULL,
	[HistBusinessUnit] [int] NULL,
	[PriceGroup] [varchar](30) NULL,
	[PONumber] [nvarchar](50) NULL,
	[SLDCRTDTE] [int] NULL,
	[PriceGroupDimKey] [int] NOT NULL,
	[GrossLBFactor] [decimal](11, 5) NULL
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[stage].[DF_stage_FactSales_ETLDateInserted]') AND type = 'D')
BEGIN
ALTER TABLE [stage].[FactSales] ADD  CONSTRAINT [DF_stage_FactSales_ETLDateInserted]  DEFAULT (sysutcdatetime()) FOR [ETLDateInserted]
END
GO

USE [BIDW_STAGE]
GO

/****** Object:  View [ERMS].[SalesHeader]    Script Date: 11/15/2017 10:09:51 PM ******/
DROP VIEW IF EXISTS [ERMS].[SalesHeader]
GO

/****** Object:  View [ERMS].[SalesHeader]    Script Date: 11/15/2017 10:09:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[ERMS].[SalesHeader]'))
EXEC dbo.sp_executesql @statement = N'









CREATE VIEW [ERMS].[SalesHeader]

AS

SELECT [SLHSLSNBR] AS SalesNumber
      ,[SLHCUSCHN]
      ,[SLHCUSNUM]
      ,[SLHSUBCUS]
	  ,CONCAT([SLHCUSCHN], [SLHCUSNUM], [SLHSUBCUS]) AS CustomerDimKey
      ,[SLHDELDTE]
      ,[SLHTCKNUM] 
      ,[SLHDSTREF]
      ,[SLHCHGREF]
      ,[SLHTCKREF]
      ,[SLHUSRREF]
      ,[SLHDELDAY]
      ,[SLHSLSTYP]
      ,[SLHRTENUM] AS RouteNumber
      ,[SLHSUBRTE] AS SubRouteNumber
      ,[SLHDRVNUM] AS DriverNumber
      ,[SLHDSTCTR] AS DistCenterNumber
      ,[SLHSLMNUM]
      ,[SLHCOMNUM]
      ,[SLHREGNUM]
      ,[SLHSUBREG]
      ,[SLHSLSDIS]
      ,[SLHSLSDIV]
      ,[SLHSUBDIV]
      ,[SLHSECTOR]
      ,[SLHSUBSEC]
      ,[SLHDPTMNT]
      ,[SLHGEOREG]
      ,[SLHGEOSUB]
      ,[SLHSEGMNT]
      ,[SLHSUBSEG]
      ,convert(nvarchar(50), [SLHPURORD]) AS PONumber
      ,[SLHORDNUM] AS OrderNumber
      ,convert(varchar(2), [SLHORDTYP]) AS OrderType
      ,[SLHORDDTE]
      ,[SLHREGRTE]
      ,[SLHTOTQTY] AS TotalUnits
      ,[SLHTOTVAL] AS TotalValue
      ,[SLHSLDAMT] AS SalesAmount
      ,[SLHSLDQTY]
      ,[SLHSLDWQT]
      ,[SLHSLRAMT]
      ,[SLHSLRQTY]
      ,[SLHSLRWQT]
      ,[SLHSLWAMT]
      ,[SLHSLWQTY]
      ,[SLHSLWWQT]
      ,[SLHDSCAMT] AS DiscountAmount
      ,[SLHARRDSC]
      ,[SLHCASCOM]
      ,[SLHBKRCMM]
      ,[SLHBUYDIS]
      ,[SLHFRTCHG]
      ,[SLHRETDIS]
      ,[SLHDSCSWT]
      ,[SLHSELDTE] AS [GLDate]
      ,[SLHLODDTE] AS LoadDate
      ,[SLHNGJUPD] AS [UpdateStatus]
      ,[SLHIVCNUM]
      ,[SLHARENTD]
      ,[SLHCSHRCV]
      ,[SLHORDSRC]
      ,[SLHROYCHG]
      ,[SLHADVCHG]
      ,[SLHSUPRTE]
      ,[SLHTAXAMT]
      ,[SLHFSCYER]
      ,[SLHFSCWEK]
      ,[SLHFSCPER]
      ,[SLHCUSTYP]
      ,[SLHTRNTIM]
      ,[SLHSTRTIM]
      ,[SLHENDTIM]
      ,[SLHVNDCOL]
      ,[SLHVNDCOM]
      ,[SLHARCHNN]
      ,[SLHARCUSN]
      ,[SLHARSBCS]
      ,[SLHRTLAMT]
      ,[SLHHQPAMT]
      ,[SLHCOMAMT]
      ,[SLHINVRUN]
      ,[SLHPGMCOD]
      ,[SLHORGCHN]
      ,[SLHORGCUS]
      ,[SLHREBUPD]
      ,[SLHSLDTYP]
      ,[SLHARRTYP]
      ,[SLHORDDDT]
      ,[SLHCMMUPD]
      ,[SLHTAXCOL]
      ,[SLHGLSRCD]
      ,[SLHSERITM]
      ,[SLHVMITRN]
      ,[SLHSLCQTY]
      ,[SLHSLCAMT]
      ,[SLHSLIQTY]
      ,[SLHSLIAMT]
      ,[SLHREFIDT]
      ,[SLHREFINM]
      ,[SLHHWUPDC]
      ,[SLHHWUPDM]
      ,[SLHHWUPDW]
      ,[SLHHMUPDC]
      ,[SLHHMUPDM]
      ,[SLHUSRFL1]
      ,[SLHUSRFL2]
      ,[SLHUSRFL3]
      ,[SLHUSRFL4]
      ,[SLHUSRFL5]
      ,[SLHFOBPNT]
      ,[SLHIFCORD]
      ,[SLHCRDREF]
      ,[SLHMLTORD]
      ,[SLHMCHAMT]
      ,[SLHMCHTAX]
      ,[SLHSWTCH1]
      ,[SLHSWTCH2]
      ,[SLHSWTCHU]
      ,[SLHCHGUSR]
      ,[SLHCHGDTE]
      ,[SLHCHGTIM]
      ,[SLHCRTUSR]
      ,[SLHCRTDTE]
      ,[SLHCRTTIM]
      ,[SLHIVCBCH]
      ,[SLHGLBCH]
      ,[SLHWHSBCH]
      ,[SLHMHSBCH]
      ,[SLHREBBCH]
      ,[SLHMABCH]
      ,[SLHCHGBCH]
      ,[SLHUS1BCH]
      ,[SLHUS2BCH]
      ,[SLHUS3BCH]
      ,[SLHUNBFLG]
      ,[X_UPID]
      ,[X_RRNO]
  FROM [ERMS].[RMSLHP]
  --WHERE [SLHSLSTYP] IN (1, 2, 3)
' 
GO



USE [BIDW_STAGE]
GO

/****** Object:  View [JDE].[SalesDetail]    Script Date: 11/20/2017 10:57:02 AM ******/
DROP VIEW IF EXISTS [JDE].[SalesDetail]
GO

/****** Object:  View [JDE].[SalesDetail]    Script Date: 11/20/2017 10:57:02 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[JDE].[SalesDetail]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [JDE].[SalesDetail]
AS

SELECT [SDKCOO] AS [OrderCompany]
      ,[SDDOCO] AS [OrderNumber]
      ,[SDDCTO] AS [OrderDetailType]
      ,[SDLNID] AS [LineNumber]
      ,[SDSFXO] AS [OrderSuffix]
      --,[SDSFX] AS [PayItem]
      ,[SDMCU] AS [DistCenterNumber]
      ,[SDCO] AS [Company]
      ,[SDAN8] AS [AddressNumber]
      ,[SDSHAN] AS [ShipTo]
      ,[SDBTAN] AS [BillToNumber]
      ,[SDPA8] AS [ParentNumber]
	  ,CASE WHEN [SDDRQJ] = 0 THEN NULL
		ELSE dateadd(dd, (cast([SDDRQJ] as int) - ((cast([SDDRQJ] as int)/1000) * 1000)) - 1, dateadd(yy, cast([SDDRQJ] as int)/1000, 0)) END AS RequestedDate
	  ,CASE WHEN [SDTRDJ] = 0 THEN NULL
		ELSE dateadd(dd, (cast([SDTRDJ] as int) - ((cast([SDTRDJ] as int)/1000) * 1000)) - 1, dateadd(yy, cast([SDTRDJ] as int)/1000, 0)) END AS OrderDate
	  ,CASE WHEN SDDGL = 0 THEN NULL
		ELSE dateadd(dd, (cast(SDDGL as int) - ((cast(SDDGL as int)/1000) * 1000)) - 1, dateadd(yy, cast(SDDGL as int)/1000, 0)) END AS GLDate
	  ,CASE WHEN SDIVD = 0 THEN NULL
		ELSE dateadd(dd, (cast(SDIVD as int) - ((cast(SDIVD as int)/1000) * 1000)) - 1, dateadd(yy, cast(SDIVD as int)/1000, 0)) END AS InvoiceDate
	  ,CASE WHEN SDADLJ = 0 THEN NULL
		ELSE dateadd(dd, (cast(SDADLJ as int) - ((cast(SDADLJ as int)/1000) * 1000)) - 1, dateadd(yy, cast(SDADLJ as int)/1000, 0)) END AS ActualDelDate
      ,[SDPDDJ] AS [ActualShipDate]	
	  ,CASE WHEN [SDPPDJ] = 0 THEN NULL
		ELSE dateadd(dd, (cast([SDPPDJ] as int) - ((cast([SDPPDJ] as int)/1000) * 1000)) - 1, dateadd(yy, cast([SDPPDJ] as int)/1000, 0)) END AS LoadDate
	  --,[SDUOM1] AS [UnitOfMeasure]  
	  ,CASE WHEN [SDUNCS]<> 0 THEN [SDUNCS]/10000 END AS [UnitCost]
      ,CASE WHEN [SDUPRC]<> 0 THEN [SDUPRC]/1000 END AS [UnitPrice]
      ,CASE WHEN [SDAEXP] <> 0 THEN [SDAEXP]/100 END AS [SalesAmount]
      ,[SDUORG] AS [QuantityOrdered]
      ,[SDSOQS] AS [QuantityShipped]
	  ,[SDDOC] AS [InvoiceNumber]
	  ,[SDLITM] AS [ItemNumber]
      ,[SDGLC] AS [HistoricalPCAT2]
	  ,[SDEMCU] AS [HistoricalBusinessUnit]
      ,[SDUOM] AS [UnitOfMeasure]
      ,[SDROUT] AS [RouteCode]
      ,[SDASN] AS [AdjustmentSchedule]
      ,[SDNXTR] AS NextStatus
      ,[SDLTTR] AS LastStatus
      ,CONVERT(varchar(50), [SDVR01]) AS [PONumber]
     ,[SDMKFR]
      ,[SDOKCO]
      ,[SDOORN]
      ,[SDOCTO]
      ,[SDOGNO]
      ,[SDRKCO]
      ,[SDRORN]
      ,[SDRCTO]
      ,[SDRLLN]
      ,[SDDMCT]
      ,[SDDMCS]
      ,[SDBALU]
      ,[SDOPDJ]
      ,[SDADDJ]
      ,[SDIVD]
      ,[SDCNDJ]
      ,[SDDGL]
      ,[SDRSDJ]
      ,[SDPEFJ]
      ,[SDRQSJ]
      ,[SDADLJ] 
      ,[SDDRQT]
      ,[SDRSDT]
      ,[SDVR02]
      ,[SDVR03]
      ,[SDITM]      
      ,[SDAITM]
      ,[SDMERL]
      ,[SDLOCN]
      ,[SDLOTN]
      ,[SDFRGD]
      ,[SDTHGD]
      ,[SDACGD]
      ,[SDFRMP]
      ,[SDTHRP]
      ,[SDAPOT]
      ,[SDEXDP]
      ,[SDDSC1]
      ,[SDDSC2]
      ,[SDLNTY]
      ,[SDHOLD]      
      ,[SDHDBU]
      ,[SDDMBU]
      ,[SDRLIT]
      ,[SDKTLN]
      ,[SDCPNT]
      ,[SDRKIT]
      ,[SDKTP]
      ,[SDCSID]
      ,[SDSRP1]
      ,[SDSRP2]
      ,[SDSRP3]
      ,[SDSRP4]
      ,[SDSRP5]
      ,[SDPRP1]
      ,[SDPRP2]
      ,[SDPRP3]
      ,[SDPRP4]
      ,[SDPRP5]
      ,[SDDMS1]
      ,[SDDMT1]
      ,[SDSOBK]
      ,[SDSOCN]
      ,[SDSONE]
      ,[SDUOPN]
      ,[SDQTYT]
      ,[SDQRLV]
      ,[SDCOMM]
      ,[SDOTQY]
      ,[SDBCRC]
      ,[SDAOPN]
      ,[SDPROV]
      ,[SDTPC]
      ,[SDAPUM]
      ,[SDLPRC]      
      ,[SDECST]
      ,[SDCSTO]
      ,[SDTCST]
      ,[SDINMG]
      ,[SDPTC]
      ,[SDRYIN]
      ,[SDDTBS]
      ,[SDTRDC]
      ,[SDFUN2]
      ,[SDOSEQ]
      ,[SDPRGR]
      ,[SDCLVL]
      ,[SDDSPR]
      ,[SDDSFT]
      ,[SDFAPP]
      ,[SDCADC]
      ,[SDKCO]      
      ,[SDDCT]
      ,[SDODOC]
      ,[SDODCT]
      ,[SDOKC]
      ,[SDPSN]
      ,[SDDELN]
      ,[SDPTSK]
      ,[SDTAX1]
      ,[SDTXA1]
      ,[SDEXR1]
      ,[SDATXT]
      ,[SDPRIO]
      ,[SDRESL]
      ,[SDBACK]
      ,[SDSBAL]
      ,[SDAPTS]
      ,[SDLOB]
      ,[SDEUSE]
      ,[SDDTYS]
      ,[SDNTR]
      ,[SDVEND]
      ,[SDANBY]
      ,[SDCARS]
      ,[SDMOT]
      ,[SDCOT]
      ,[SDSTOP]
      ,[SDZON]
      ,[SDCNID]
      ,[SDFRTH]
      ,[SDAFT]
      ,[SDFUF1]
      ,[SDFRTC]
      ,[SDFRAT]
      ,[SDRATT]
      ,[SDSHCM]
      ,[SDSHCN]
      ,[SDSHPN]
      ,[SDSERN]
      ,[SDLDNM]
      ,[SDSHMT]
      ,[SDTKNR] 
      ,[SDTKTM]
      ,[SDTKDA]      
      ,[SDPQOR] 
      ,[SDUOM2]
      ,[SDSQOR]
      ,[SDUOM4]
      ,[SDITWT]
	  ,CONVERT(decimal(11,2),[SDITWT]/10000) as [GrossLB]
      ,[SDWTUM]
      ,[SDITVL]
      ,[SDVLUM]
      ,[SDRPRC]
      ,[SDORPR]
      ,[SDORP]
      ,[SDCMGP]
      ,[SDCMGL]
      ,[SDCTRY]
      ,[SDFY]
      ,[SDSTTS]
      ,[SDSO01]
      ,[SDSO02]
      ,[SDSO03]
      ,[SDSO04]
      ,[SDSO05]
      ,[SDSO06]
      ,[SDSO07]
      ,[SDSO08]
      ,[SDSO09]
      ,[SDSO10]
      ,[SDSO11]
      ,[SDSO12]
      ,[SDSO13]
      ,[SDSO14]
      ,[SDSO15]
      ,[SDSO16]
      ,[SDSO17]
      ,[SDSO18]
      ,[SDSO19]
      ,[SDSO20]
      ,[SDSLSM]
      ,[SDSLCM]
      ,[SDSLM2]
      ,[SDSLC2]
      ,[SDACOM]
      ,[SDCMCG]
      ,[SDRCD]
      ,[SDGRWT]
      ,[SDGWUM]
      ,[SDANI]
      ,[SDAID]
      ,[SDOMCU]
      ,[SDOBJ]
      ,[SDSUB]
      ,[SDLT]
      ,[SDSBL]
      ,[SDSBLT]
      ,[SDLCOD]
      ,[SDUPC1]
      ,[SDUPC2]
      ,[SDUPC3]
      ,[SDSWMS]
      ,[SDUNCD]
      ,[SDCRMD]
      ,[SDCRCD]
      ,[SDCRR]
      ,[SDFPRC]
      ,[SDFUP]
      ,[SDFEA]
      ,[SDFUC]
      ,[SDFEC]
      ,[SDURCD]
      ,[SDURDT]
      ,[SDURAT]
      ,[SDURAB]
      ,[SDURRF]
      ,[SDSCPD]
      ,[SDSCPT]
      ,[SDSCPS]
      ,[SDEDCK]
      ,[SDSBCK]
      ,[SDBBCK]
      ,[SDCMDM]
      ,[SDUSC1]
      ,[SDUSC2]
      ,[SDUSC3]
      ,[SDUSC4]
      ,[SDUSC5]
      ,[SDBLNO]
      ,[SDTMUP]
      ,[SDS1DJ]
      ,[SDS2DJ]
      ,[SDWORN]
      ,[SDWCTO]
      ,[SDWKCO]
      ,[SDWGNO]
      ,[SDWCEJ]
      ,[SDWFLG]
      ,[SDTORG]
      ,[SDUSER]
      ,[SDPID]
      ,[SDJOBN]
      ,[SDUPMJ] 
      ,[SDTDAY]
  FROM [JDE].[F42119]
  --WHERE [SDDRQJ] >= 115001


' 
GO

/*****ORDER Changes******/

USE [BIDW_STAGE]
GO

/****** Object:  View [ERMS].[OrderHeader]    Script Date: 11/20/2017 1:09:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER view [ERMS].[OrderHeader]
as


SELECT [ORHORDNUM] AS OrderNumber
      ,[ORHCUSCHN] AS ChainNumber
      ,[ORHCUSNUM] AS CustomerNumber
      ,[ORHSUBCUS] AS CustomerSubNumber
      ,[ORHDELDTE] AS DeliveryDate
      ,[ORHCUSORD]
      ,[ORHDELDAY]
      ,[ORHLODDTE] AS LoadDate
      ,[ORHLODDAY]
      ,[ORHPCKDTE]
      ,[ORHPCKDAY]
      ,[ORHORQNUM]
      ,[ORHRTENUM] AS RouteNumber
      ,[ORHDSTCTR] As DistributionCenter
      ,[ORHSUBRTE] AS SubRouteNumber
      ,[ORHORGAMT]
      ,[ORHORDQTY]
      ,[ORHORWQTY]
      ,[ORHORDAMT]
      ,[ORHORXAMT]
      ,CONVERT(nvarchar (50), [ORHPURORD]) AS PONumber
      ,[ORHORDTYP] AS OrderType
      ,[ORHORDRES]
      ,[ORHIOBORD]
      ,convert(int,[ORHORDSTS]) AS OrderStatus
      ,[ORHDAYSTR]
      ,[ORHDELORD]
      ,[ORHORDSRC]
      ,[ORHLODNUM] As LoadNumber
      ,[ORHSUPRTE]
      ,[ORHRDELSQ]
      ,[ORHDWNDTE]
      ,[ORHORDLOD]
      ,[ORHORDDTE] AS OrderDate
      ,[ORHORGONM]
      ,[ORHORGODT]
      ,[ORHORGRTE]
      ,[ORHORGDST]
      ,[ORHNUMBKO]
      ,[ORHSLSTYP]
      ,[ORHCRDHLD]
      ,[ORHCRDRES]
      ,[ORHARRTYP]
      ,[ORHREFIDT]
      ,[ORHREFINM]
      ,[ORHFOBPNT]
      ,[ORHORDXRF]
      ,[ORHRELORD]
      ,[ORHTCKNUM] AS TicketNumber
      ,[ORHUPUTCK]
      ,[ORHUPDTCK]
      ,[ORHUPTTCK]
      ,[ORHTKGAMT]
      ,[ORHTKDQTY]
      ,[ORHTKWQTY]
      ,[ORHTKDAMT]
      ,[ORHTKXAMT]
      ,[ORHUPUBOL]
      ,[ORHUPDBOL]
      ,[ORHUPTBOL]
      ,[ORHUPULOD]
      ,[ORHUPDLOD]
      ,[ORHUPTLOD]
      ,[ORHUPUPCK]
      ,[ORHUPDPCK]
      ,[ORHUPTPCK]
      ,[ORHUSRFL1]
      ,[ORHUSRFL2]
      ,[ORHUSRFL3]
      ,[ORHUSRFL4]
      ,[ORHUSRFL5]
      ,[ORHPGMCOD]
      ,[ORHTKTPGM]
      ,[ORHRINUSE]
      ,[ORHRINUSR]
      ,[ORHRINDTE]
      ,[ORHRINTIM]
      ,[ORHTAXAMT]
      ,[ORHIFCORD]
      ,[ORHMLTSLS]
      ,[ORHCNTNAM]
      ,[ORHREPTCK]
      ,[ORHSWTCH1]
      ,[ORHSWTCH2]
      ,[ORHSWTCHU]
      ,[ORHCRTUSR]
      ,[ORHCRTDTE]
      ,[ORHCRTTIM]
      ,[ORHCHGUSR]
      ,[ORHCHGDTE]
      ,[ORHCHGTIM]
      ,[X_UPID]
      ,[X_RRNO]
  FROM [ERMS].[RMORHP]
GO

/****** Object:  Table [stage].[FactOrders]    Script Date: 11/21/2017 1:11:21 PM ******/
USE [BIDW_STAGE]
GO

/****** Object:  Table [stage].[FactOrders]    Script Date: 11/21/2017 1:11:21 PM ******/
DROP TABLE IF EXISTS [stage].[FactOrders]
GO

/****** Object:  Table [stage].[FactOrders]    Script Date: 11/21/2017 1:11:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[stage].[FactOrders]') AND type in (N'U'))
BEGIN
CREATE TABLE [stage].[FactOrders](
	[OrderNumber] [bigint] NOT NULL,
	[OrderSeq] [int] NOT NULL,
	[TicketNumber] [bigint] NULL,
	[LoadNumber] [bigint] NULL,
	[PONumber] [nvarchar](50) NULL,
	[OrderStatus] [int] NULL,
	[OrderSalesType] [nvarchar](2) NOT NULL,
	[DeliveryDate] [int] NOT NULL,
	[OrderDate] [int] NOT NULL,
	[LoadDate] [int] NULL,
	[CustomerDimKey] [int] NOT NULL,
	[ItemDimKey] [int] NOT NULL,
	[RouteDimKey] [int] NOT NULL,
	[SubRouteDimKey] [int] NOT NULL,
	[OrderUnits] [decimal](11, 2) NULL,
	[OrderUnitPrice] [money] NULL,
	[OrderAmount] [money] NULL,
	[PointsFactor] [decimal](9, 5) NULL,
	[CaseFactor] [decimal](9, 2) NULL,
	[PalletFactor] [decimal](9, 5) NULL,
	[BossyFactor] [decimal](9, 5) NULL,
	[ToteFactor] [decimal](9, 5) NULL,
	[TrayFactor] [decimal](9, 5) NULL,
	[MilkCaseFactor] [decimal](9, 5) NULL,
	[BoxFactor] [decimal](9, 2) NULL,
	[UnitCost] [money] NULL,
	[GrossLB] [decimal](11, 5) NULL,
	[ORDCRTDTE] [int] NULL,
	[ORDCHGDTE] [int] NULL,
	[SDUPMJ] [int] NULL,
	[HistBusinessUnit] [int] NULL,
	[ETLDateInserted] [datetime2](0) NOT NULL,
	[SourceSystem] [varchar](4) NOT NULL,
	[OrderNumberDimKey] [bigint] NULL
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[stage].[DF_stage_FactOrders_ETLDateInserted]') AND type = 'D')
BEGIN
ALTER TABLE [stage].[FactOrders] ADD  CONSTRAINT [DF_stage_FactOrders_ETLDateInserted]  DEFAULT (sysutcdatetime()) FOR [ETLDateInserted]
END
GO




/****** Object:  View [JDE].[ItemMaster]    Script Date: 11/21/2017 12:14:19 PM ******/

USE [BIDW_STAGE]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [JDE].[ItemMaster] AS

SELECT  ITEM_MASTER.IMITM
		, CONVERT(varchar(20) ,LTRIM(RTRIM(IMLITM))) AS ItemNumber
		--, IMAITM
		,CONVERT(nvarchar(100),  IMDSC1) AS ItemDesc
		,CONVERT(nvarchar(50), IMSRTX) AS IMSRTX
		,CONVERT(nvarchar(50), IMALN) AS IMALN				
		,CONVERT(nvarchar(20), IMUPCN) AS UPC
		,CONVERT(nvarchar(3) ,LTRIM(RTRIM(SUBBRAND.DRKY))) AS SubBrandCode
		,CONVERT(nvarchar(50), SUBBRAND.DRDL01) AS SubBrandName
		,CONVERT(varchar(3) ,LTRIM(RTRIM(CATEGORY.DRKY))) AS CategoryCode
		,CONVERT(nvarchar(50), Category.DRDL02) AS CategoryName
	--	,CONVERT(nvarchar(50), Category.DRDL01) AS CategoryName
		, F.PointsFactor 
		, F.CaseFactor
		, F.GrossLBFactor
		, F.PalletFactor
		, F.BossyFactor
		, F.MilkCaseFactor
		, F.ToteFactor
		, F.TrayFactor
		, F.BoxFactor
		--, LTRIM(RTRIM(IMLITM)) + ' - ' + IMDSC1 AS [ItemNumber Desc]
		,CONVERT(varchar(3) ,LTRIM(RTRIM(PCAT2.DRKY))) AS PCAT2Code
		,CONVERT(nvarchar(50), PCAT2.DRDL01) AS PCAT2
		,convert(nvarchar(3), ltrim(rtrim(QIC06))) AS [BrandCode]
		,CONVERT(nvarchar(50), BRAND.DRDL01) AS [Brand]
	--	,CONVERT(nvarchar(50), BRAND.DRDL01) AS [Brand]
	    ,CONVERT(nvarchar(3), ltrim(rtrim(IMPRP9))) as [ProductClassCode]
		,CONVERT(nvarchar(50), ProductClass.DRDL01) AS [ProductClass]
		,convert(nvarchar(3), ltrim(rtrim(QIC02))) as [Sub-CategoryCode]
		,CONVERT(nvarchar(50), SubCategory.DRDL01) AS [Sub-CategoryName]
		,convert(nvarchar(3), ltrim(rtrim(QIC12))) AS [SegmentCode]
		,CONVERT(nvarchar(50), Segment.DRDL01) AS [SegmentName]
		,CONVERT(nvarchar(3), ltrim(rtrim(QIC22))) as [ParentBrandCode]
		,CONVERT(nvarchar(50), Brand2.DRDL01) AS [Brand2] --CHG was ParentBrand leaving Brand2 and changing name on View
		,CONVERT(nvarchar(50), FatLevel.DRDL01) AS [FatLevel]
		,CONVERT(nvarchar(50), Style.DRDL01) AS Style
		,CONVERT(nvarchar(50), Flavor.DRDL01) AS Flavor
		,CONVERT(nvarchar(50), PackageType.DRDL01) AS [PackageType]
		,CONVERT(nvarchar(50), ProductSizeOz.DRDL01) AS [ProductSizeByOunce]
		,CONVERT(nvarchar(50), ContainerType.DRDL01) AS [ContainerType]
		,CONVERT(nvarchar(50), SellingUnits.DRDL01)  AS [SellingUnits]
		,CONVERT(nvarchar(50), ManfProcess.DRDL01)   AS [ManufacturingProcess] 
		,CONVERT(nvarchar(50), PrePkgUnits.DRDL01)   AS [Pre-PackagedUnits]
		,convert(nvarchar(3), ltrim(rtrim(QIC21))) as [ProductBrandCode]
		,CONVERT(nvarchar(50), ProductBrand.DRDL01)  AS [ProductBrand] --CHG was BrandGroup leaving ProductBrand and changing name on View
		,CONVERT(nvarchar(1), ITEM_MASTER.IMSTKT) AS [ProductOrigin]
		,[IMUOM1] AS UnitOfMeasure
		,[IMSTKT] AS [StockingType]
		,CONVERT(nvarchar(6),[IMSRP7]) AS [Class]
		,CONVERT(nvarchar(3), ltrim(rtrim(IMSRP3))) AS TypeCode
		,CONVERT(nvarchar(50), Type.DRDL01) AS Type
		,CONVERT(nvarchar(3), ltrim(rtrim(IMSRP4))) AS SizeCode
		,CONVERT(nvarchar(50), PRSize.DRDL01) AS PricingSize
		,CONVERT(nvarchar(3), ltrim(rtrim(IMSRP5))) As PromoGroupCode
		,CONVERT(nvarchar(50), PromoGrp.DRDL01) AS PromoGroup
		,CONVERT(nvarchar(3), ltrim(rtrim(IMPRP6))) AS ItemDimGroupCode
		,CONVERT(nvarchar(50), Style.DRDL01) AS ProductBrandDimGroup
        ,CONVERT(nvarchar(10), ltrim(rtrim(IMSRP9))) AS ProductionSize
		,HASHBYTES('SHA1',
		CONVERT(nvarchar(100),  ISNULL(IMDSC1,'0')) --AS ItemDesc
+CONVERT(nvarchar(50), ISNULL(IMSRTX,'0')) --AS IMSRTX
+CONVERT(nvarchar(50), ISNULL(IMALN,'0')) --AS IMALN				
+CONVERT(nvarchar(20), ISNULL(IMUPCN,'0')) --AS UPC
+CONVERT(varchar(3) ,LTRIM(RTRIM(ISNULL(SUBBRAND.DRKY,'0')))) --AS BrandCode CHG to SubBrand
+CONVERT(nvarchar(50), ISNULL(SUBBRAND.DRDL01,'0')) --AS BrandName CHG to SubBrand
+CONVERT(varchar(3) ,LTRIM(RTRIM(ISNULL(CATEGORY.DRKY,'0')))) --AS CategoryCode
+CONVERT(nvarchar(50), ISNULL(Category.DRDL02,'0')) --AS CategoryName
+ CAST(ISNULL(F.PointsFactor,0) as nvarchar(20))
+ CAST(ISNULL(F.CaseFactor,0) as nvarchar(20))
+ CAST(ISNULL(F.GrossLBFactor,0) as nvarchar(20))
+ CAST(ISNULL(F.PalletFactor,'0') as nvarchar(20))
+ CAST(ISNULL(F.BossyFactor,'0') as nvarchar(20))
+ CAST(ISNULL(F.MilkCaseFactor,'0') as nvarchar(20))
+ CAST(ISNULL(F.ToteFactor,'0') as nvarchar(20))
+ CAST(ISNULL(F.TrayFactor,'0') as nvarchar(20))
+ CAST(ISNULL(F.BoxFactor, '0') as nvarchar(20))
--, LTRIM(RTRIM(IMLITM)) + ' - ' + IMDSC1 AS [ItemNumber Desc]
+CONVERT(varchar(3) ,LTRIM(RTRIM(ISNULL(PCAT2.DRKY,'0')))) --AS PCAT2Code
+CONVERT(nvarchar(50), ISNULL(PCAT2.DRDL01,'0')) --AS PCAT2
+CONVERT(nvarchar(50), ISNULL(BRAND.DRDL01,'0')) --AS [SubBrand] CHG to Brand
+CONVERT(nvarchar(50), ISNULL(ProductClass.DRDL01,'0')) --AS [ProductClass]
+CONVERT(nvarchar(50), ISNULL(SubCategory.DRDL01,'0')) --AS [Sub-CategoryName]
+CONVERT(nvarchar(50), ISNULL(Segment.DRDL01,'0')) --AS [SegmentName]
+CONVERT(nvarchar(50), ISNULL(Brand2.DRDL01,'0')) --AS Brand2 CHG to ParentBrand
+CONVERT(nvarchar(50), ISNULL(FatLevel.DRDL01,'0')) --AS [FatLevel]
+CONVERT(nvarchar(50), ISNULL(Style.DRDL01,'0')) --AS Style
+CONVERT(nvarchar(50), ISNULL(Flavor.DRDL01,'0')) --AS Flavor
+CONVERT(nvarchar(50), ISNULL(PackageType.DRDL01,'0')) --AS [PackageType]
+CONVERT(nvarchar(50), ISNULL(ProductSizeOz.DRDL01,'0')) --AS [ProductSizeByOunce]
+CONVERT(nvarchar(50), ISNULL(ContainerType.DRDL01,'0')) --AS [ContainerType]
+CONVERT(nvarchar(50), ISNULL(SellingUnits.DRDL01,'0'))  --AS [SellingUnits]
+CONVERT(nvarchar(50), ISNULL(ManfProcess.DRDL01,'0'))   --AS [ManufacturingProcess] 
+CONVERT(nvarchar(50), ISNULL(PrePkgUnits.DRDL01,'0'))   --AS [Pre-PackagedUnits]
+CONVERT(nvarchar(50), ISNULL(ProductBrand.DRDL01,'0'))  --AS [ProductBrand] CHG to BrandGroup
+CONVERT(nvarchar(10), ISNULL(ITEM_MASTER.IMSTKT,'0')) --AS [ProductOrigin]
+CONVERT(nvarchar(10), ISNULL([IMUOM1],'0')) -- AS UnitOfMeasure

) HASH_DIFF
  FROM JDE.F4101 ITEM_MASTER

  --join with eRMS item table to get points
  --LEFT JOIN ERMS.RMITMP eRMS_ITEM ON LTRIM(RTRIM(eRMS_ITEM.ITMITMNUM)) = LTRIM(RTRIM(IMLITM))

  -- join with ItemFactor (JDE.F41002) to get factors (units of measure)
  LEFT JOIN [JDE].[ItemFactor] F ON ITEM_MASTER.[IMITM] = F.[UMITM]

  --join with supplemental table F41903
  LEFT JOIN [JDE].[F41903] ITEM_SUPPL
  ON LTRIM(RTRIM(ITEM_MASTER.IMLITM)) = LTRIM(RTRIM(ITEM_SUPPL.QILITM))

  -- join to get brand - not yet set up
  LEFT JOIN  JDE.F0005 BRAND -- JOIN on system (DRSY), type (DRRT) and key (DRKY)
	ON LTRIM(RTRIM(ITEM_SUPPL.QIC06)) = LTRIM(RTRIM(BRAND.DRKY))  AND BRAND.DRSY = '41' and BRAND.DRRT = '26'

  --join to get category
  LEFT JOIN  JDE.F0005 CATEGORY
	ON LTRIM(RTRIM(ITEM_MASTER.IMSRP2)) = LTRIM(RTRIM(CATEGORY.DRKY)) AND CATEGORY.DRSY = '41' and CATEGORY.DRRT = 'S2'

  --join to get PCAT2
  LEFT JOIN  JDE.F0005 PCAT2
	ON LTRIM(RTRIM(ITEM_MASTER.IMGLPT)) = LTRIM(RTRIM(PCAT2.DRKY)) AND PCAT2.DRSY = '41' and PCAT2.DRRT = '9'

  --join to get Sub-Brand
  LEFT JOIN  JDE.F0005 SUBBRAND
	ON LTRIM(RTRIM(ITEM_MASTER.IMSRP1)) = LTRIM(RTRIM(SUBBRAND.DRKY)) AND SUBBRAND.DRSY = '41' and SUBBRAND.DRRT = 'S1'

  --join to get ProductClass
  LEFT JOIN  JDE.F0005 ProductClass
	ON LTRIM(RTRIM(ITEM_MASTER.IMPRP9)) = LTRIM(RTRIM(ProductClass.DRKY)) AND ProductClass.DRSY = '5541' and ProductClass.DRRT = 'PC'

  --join to get SubCategory
  LEFT JOIN  JDE.F0005 SubCategory
	ON LTRIM(RTRIM(ITEM_SUPPL.QIC02)) = LTRIM(RTRIM(SubCategory.DRKY)) AND SubCategory.DRSY = '41' and SubCategory.DRRT = '22'

  --join to get Segment
  LEFT JOIN  JDE.F0005 Segment
	ON LTRIM(RTRIM(ITEM_SUPPL.QIC12)) = LTRIM(RTRIM(Segment.DRKY)) AND Segment.DRSY = '41' and Segment.DRRT = '32'

  --join to get Brand2
  LEFT JOIN  JDE.F0005 Brand2
	ON LTRIM(RTRIM(ITEM_SUPPL.QIC22)) = LTRIM(RTRIM(Brand2.DRKY)) AND Brand2.DRSY = '41' and Brand2.DRRT = '42'

  --join to get FatLevel
  LEFT JOIN  JDE.F0005 FatLevel
	ON LTRIM(RTRIM(ITEM_SUPPL.QIC03)) = LTRIM(RTRIM(FatLevel.DRKY)) AND FatLevel.DRSY = '41' and FatLevel.DRRT = '23'

  --join to get Style
  LEFT JOIN  JDE.F0005 Style
	ON LTRIM(RTRIM(ITEM_SUPPL.QIC14)) = LTRIM(RTRIM(Style.DRKY)) AND Style.DRSY = '41' and Style.DRRT = '34'

  --join to get Flavor
  LEFT JOIN  JDE.F0005 Flavor
	ON LTRIM(RTRIM(ITEM_SUPPL.QIC23)) = LTRIM(RTRIM(Flavor.DRKY)) AND Flavor.DRSY = '41' and Flavor.DRRT = '43'

  --join to get PackageType
  LEFT JOIN  JDE.F0005 PackageType
	ON LTRIM(RTRIM(ITEM_SUPPL.QIC04)) = LTRIM(RTRIM(PackageType.DRKY)) AND PackageType.DRSY = '41' and PackageType.DRRT = '24'

  --join to get ProductSizeOz
  LEFT JOIN  JDE.F0005 ProductSizeOz
	ON LTRIM(RTRIM(ITEM_SUPPL.QIC13)) = LTRIM(RTRIM(ProductSizeOz.DRKY)) AND ProductSizeOz.DRSY = '41' and ProductSizeOz.DRRT = '33'

  --join to get ContainerType
  LEFT JOIN  JDE.F0005 ContainerType
	ON LTRIM(RTRIM(ITEM_SUPPL.QIC24)) = LTRIM(RTRIM(ContainerType.DRKY)) AND ContainerType.DRSY = '41' and ContainerType.DRRT = '44'

  --join to get SellingUnits
  LEFT JOIN  JDE.F0005 SellingUnits
	ON LTRIM(RTRIM(ITEM_SUPPL.QIC25)) = LTRIM(RTRIM(SellingUnits.DRKY)) AND SellingUnits.DRSY = '41' and SellingUnits.DRRT = '45'

  --join to get ManfProcess
  LEFT JOIN  JDE.F0005 ManfProcess
	ON LTRIM(RTRIM(ITEM_SUPPL.QIC15)) = LTRIM(RTRIM(ManfProcess.DRKY)) AND ManfProcess.DRSY = '41' and ManfProcess.DRRT = '35'

  --join to get PrePkgUnits
  LEFT JOIN  JDE.F0005 PrePkgUnits
	ON LTRIM(RTRIM(ITEM_SUPPL.QIC05)) = LTRIM(RTRIM(PrePkgUnits.DRKY)) AND PrePkgUnits.DRSY = '41' and PrePkgUnits.DRRT = '25'

  --join to get ProductBrand
  LEFT JOIN  JDE.F0005 ProductBrand
	ON LTRIM(RTRIM(ITEM_SUPPL.QIC21)) = LTRIM(RTRIM(ProductBrand.DRKY)) AND ProductBrand.DRSY = '41' and ProductBrand.DRRT = '41'

  --join to get Old Type Field 
  LEFT JOIN  JDE.F0005 Type
	ON LTRIM(RTRIM(ITEM_MASTER.IMSRP3)) = LTRIM(RTRIM(TYPE.DRKY)) AND TYPE.DRSY = '41' and TYPE.DRRT = 'S3'

  --join to get Pricing Size field
  LEFT JOIN  JDE.F0005 PRSIZE
	ON LTRIM(RTRIM(ITEM_MASTER.IMSRP4)) = LTRIM(RTRIM(PRSIZE.DRKY)) AND PRSIZE.DRSY = '41' and PRSIZE.DRRT = 'S4'

  --join to get Promo Group
  LEFT JOIN  JDE.F0005 PROMOGRP
	ON LTRIM(RTRIM(ITEM_MASTER.IMSRP5)) = LTRIM(RTRIM(PROMOGRP.DRKY)) AND PROMOGRP.DRSY = '41' and PROMOGRP.DRRT = 'S5'

  --join to get Promo Group
  LEFT JOIN  JDE.F0005 ItemDimGrp
	ON LTRIM(RTRIM(ITEM_MASTER.IMPRP6)) = LTRIM(RTRIM(ItemDimGrp.DRKY)) AND ItemDimGrp.DRSY = '41' and PROMOGRP.DRRT = '01'








GO









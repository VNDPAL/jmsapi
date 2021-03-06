USE [JMSDB]
GO
/*** Object:  UserDefinedTableType [dbo].[udtCompanyDetail]    Script Date: 1/16/2020 7:35:22 AM ******/
CREATE TYPE [dbo].[udtCompanyDetail] AS TABLE(
	[CompanyName] [varchar](100) NULL,
	[CompanyCode] [varchar](100) NULL,
	[CompanyType] [int] NULL,
	[FieldType] [int] NULL,
	[GSTNo] [varchar](50) NULL,
	[PANNo] [varchar](50) NULL,
	[AadharNo] [varchar](30) NULL,
	[OwnerName] [varchar](100) NULL,
	[CompanyAddress] [varchar](1000) NULL,
	[MobileNo] [varchar](20) NULL,
	[AltMobileNo] [varchar](20) NULL,
	[EmailId] [varchar](100) NULL,
	[Status] [int] NULL,
	[IP] [varchar](64) NULL
)
GO
/****** Object:  Table [dbo].[CompanyMaster]    Script Date: 1/16/2020 7:35:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyMaster](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](256) NULL,
	[CompanyCode] [varchar](50) NULL,
	[CompanyType] [int] NULL,
	[FieldType] [int] NULL,
	[GSTNo] [varchar](128) NULL,
	[PANNo] [varchar](16) NULL,
	[AadharNo] [varchar](16) NULL,
	[OwnerName] [varchar](256) NULL,
	[CompanyAddress] [varchar](1024) NULL,
	[MobileNo] [varchar](16) NULL,
	[AltMobileNo] [varchar](16) NULL,
	[EmailId] [varchar](256) NULL,
	[Status] [tinyint] NULL,
	[AddedOn] [datetime] NULL,
	[AddedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IP] [varchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOGIN_MST]    Script Date: 1/16/2020 7:35:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOGIN_MST](
	[loginId] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](250) NOT NULL,
	[email] [varchar](250) NULL,
	[mobile] [varchar](12) NULL,
	[RoleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[loginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROLE_MST]    Script Date: 1/16/2020 7:35:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLE_MST](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleKey] [varchar](50) NOT NULL,
	[RoleValue] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CompanyMaster] ON 

INSERT [dbo].[CompanyMaster] ([CompanyId], [CompanyName], [CompanyCode], [CompanyType], [FieldType], [GSTNo], [PANNo], [AadharNo], [OwnerName], [CompanyAddress], [MobileNo], [AltMobileNo], [EmailId], [Status], [AddedOn], [AddedBy], [ModifiedOn], [ModifiedBy], [IP]) VALUES (1, N'VALUE', N'VAL123', 1, 2, N'235ADHXBS895', N'ADHXBS895', N'215498765214', N'Vinod', N'Manpada', N'9876543210', N'8976542593', N'abc@gmail.com', 1, NULL, NULL, NULL, NULL, N'00:101:205:3')
SET IDENTITY_INSERT [dbo].[CompanyMaster] OFF
SET IDENTITY_INSERT [dbo].[LOGIN_MST] ON 

INSERT [dbo].[LOGIN_MST] ([loginId], [username], [password], [email], [mobile], [RoleId]) VALUES (1, N'Jitendra', N'admin@123', N'jiitmaurya@gmail.com', N'8976621585', 1)
SET IDENTITY_INSERT [dbo].[LOGIN_MST] OFF
SET IDENTITY_INSERT [dbo].[ROLE_MST] ON 

INSERT [dbo].[ROLE_MST] ([RoleId], [RoleKey], [RoleValue]) VALUES (1, N'ADMIN', N'ADMIN')
SET IDENTITY_INSERT [dbo].[ROLE_MST] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__LOGIN_MS__F3DBC572C80F6ABC]    Script Date: 1/16/2020 7:35:23 AM ******/
ALTER TABLE [dbo].[LOGIN_MST] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LOGIN_MST]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[ROLE_MST] ([RoleId])
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateCompanyMaster]    Script Date: 1/16/2020 7:35:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertUpdateCompanyMaster]
@CompanyDetail udtCompanyDetail readonly,
@UserId INT = 0
AS
BEGIN

		INSERT INTO CompanyMaster(CompanyName,CompanyCode,CompanyType,FieldType,GSTNo,PANNo,AadharNo,OwnerName,CompanyAddress,MobileNo,AltMobileNo,EmailId,[Status],[IP],AddedOn,AddedBy)
		SELECT CompanyName,CompanyCode,CompanyType,FieldType,GSTNo,PANNo,AadharNo,OwnerName,CompanyAddress,MobileNo,AltMobileNo,EmailId,[Status],[IP],GETDATE(),@UserId
		FROM @CompanyDetail
		
		SELECT 1
END


GO

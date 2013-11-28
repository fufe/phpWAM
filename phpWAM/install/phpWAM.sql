USE [master]
GO

DROP DATABASE phpWAM
GO

CREATE DATABASE phpWAM
GO

USE [phpWAM]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(0,1) PRIMARY KEY CLUSTERED,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ModifiedBy] [int],
	[ModifiedAt] [datetime],
	[DeletedBy] [int],
	[DeletedAt] [datetime],
	[Name] nvarchar(100) UNIQUE NOT NULL,
	[Login] nvarchar(100) UNIQUE NOT NULL,
	[Password] char(32) NULL,
	[EMail] varchar(100) NOT NULL,
	[MaxVacation] int NOT NULL,
	[ActiveFrom] [date] NOT NULL,
	[ActiveTill] [date] NOT NULL,
	[GrpMember] int NOT NULL,
	[IsSubstitute] tinyint NOT NULL,
	[IsEngineer] tinyint NOT NULL
	) 
	ON [PRIMARY] 

GO

CREATE TABLE [dbo].[Groups](
	[ID] [int] IDENTITY(1,1) PRIMARY KEY CLUSTERED,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ModifiedBy] [int],
	[ModifiedAt] [datetime],
	[DeletedBy] [int],
	[DeletedAt] [datetime],
	[Name] nvarchar(100) UNIQUE NOT NULL,
	[DivID] int NOT NULL,
	[Supervisor1] int NOT NULL,
	[Supervisor2] int NULL,
	[Supervisor3] int NULL,
	[Approver1] int NOT NULL,
	[Approver2] int NULL,
	[Approver3] int NULL
	) 
	ON [PRIMARY] 

GO

CREATE TABLE [dbo].[Divisions](
	[ID] [int] IDENTITY(1,1) PRIMARY KEY CLUSTERED,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ModifiedBy] [int],
	[ModifiedAt] [datetime],
	[DeletedBy] [int],
	[DeletedAt] [datetime],
	[Name] nvarchar(100) UNIQUE NOT NULL
	)
	ON [PRIMARY] 

GO

CREATE TABLE [dbo].[Orgs](
	[ID] [int] IDENTITY(0,1) PRIMARY KEY CLUSTERED,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ModifiedBy] [int],
	[ModifiedAt] [datetime],
	[DeletedBy] [int],
	[DeletedAt] [datetime],
	[Name] nvarchar(250) UNIQUE NOT NULL
	)
	ON [PRIMARY]
GO

CREATE TABLE [dbo].[Competencies](
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ModifiedBy] [int],
	[ModifiedAt] [datetime],
	[DeletedBy] [int],
	[DeletedAt] [datetime],
	[OrgID] [int] NOT NULL,
	[EngineerID] [int] NOT NULL,
	[CompLevel] [tinyint] NOT NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[ResourceRequest](
	[ID] [int] IDENTITY(1,1) PRIMARY KEY CLUSTERED,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ModifiedBy] [int],
	[ModifiedAt] [datetime],
	[DeletedBy] [int],
	[DeletedAt] [datetime],
	[RQType] [tinyint] NOT NULL,
	[OrgID] [int],
	[UserID] [int],
	[DateFrom] [date] NOT NULL,
	[DateTill] [date] NOT NULL,
	[IsChecked] [tinyint] NOT NULL,
	[IsApproved] [tinyint] NOT NULL
	) 
	ON [PRIMARY]

GO

CREATE TABLE [dbo].[ResourceFulFill](
	[ID] [int] IDENTITY(1,1) PRIMARY KEY CLUSTERED,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ModifiedBy] [int],
	[ModifiedAt] [datetime],
	[DeletedBy] [int],
	[DeletedAt] [datetime],
	[FFType] [tinyint] NOT NULL,
	[RequestID] [int] NOT NULL,
	[EngineerID] [int] NOT NULL,
	[DateFrom] [date] NOT NULL,
	[DateTill] [date] NOT NULL
	) 
	ON [PRIMARY]

GO

CREATE TABLE [dbo].[Exceptions](
	[ID] [int] IDENTITY(1,1) PRIMARY KEY CLUSTERED,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ModifiedBy] [int],
	[ModifiedAt] [datetime],
	[DeletedBy] [int],
	[DeletedAt] [datetime],
	[OrgID] [int] NOT NULL,
	[ExType] [tinyint] NOT NULL,
	[DateFrom] [date] NOT NULL,
	[DateTill] [date] NOT NULL,
	[Description] nvarchar(250)
	) 
	ON [PRIMARY]

GO

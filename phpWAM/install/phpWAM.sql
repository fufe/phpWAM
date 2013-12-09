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

CREATE TABLE [Users](
	[ID] int IDENTITY(0,1) PRIMARY KEY,
	[Name] nvarchar(255) UNIQUE NOT NULL,
	[Login] nvarchar(255) UNIQUE NOT NULL,
	[DivID] int NOT NULL,
	[MaxVacation] int NOT NULL,
	[ActiveStart] date NOT NULL,
	[ActiveEnd] date NOT NULL,
	[Permissions] int NOT NULL,
	[IsSubstitute] bit NOT NULL,
	[IsEngineer] bit NOT NULL,
	[IsDeleted] bit NOT NULL DEFAULT 0
	) 
GO

CREATE TABLE [Groups](
	[ID] [int] IDENTITY(0,1) PRIMARY KEY,
	[Name] nvarchar(255) UNIQUE NOT NULL,
	[DivID] int NOT NULL,
	[Supervisor1] int NOT NULL,
	[Supervisor2] int NULL,
	[Supervisor3] int NULL,
	[Approver1] int NOT NULL,
	[Approver2] int NULL,
	[Approver3] int NULL
	) 
GO

CREATE TABLE [Divisions](
	[ID] int IDENTITY(0,1) PRIMARY KEY,
	[Name] nvarchar(255) UNIQUE NOT NULL
	)
GO

CREATE TABLE [Orgs](
	[ID] int IDENTITY(0,1) PRIMARY KEY,
	[Name] nvarchar(255) UNIQUE NOT NULL
	)
GO

CREATE TABLE [Competencies](
	[OrgID] int NOT NULL,
	[EngineerID] int NOT NULL,
	[CompLevel] tinyint NOT NULL,
        CONSTRAINT pk_Competency PRIMARY KEY (OrgID, EngineerID)
	)
GO

CREATE TABLE [ResourceRequest](
	[ID] int IDENTITY(0,1) PRIMARY KEY,
	[REQType] tinyint NOT NULL,
	[OrgID] int,
	[UserID] int,
	[DateFrom] date NOT NULL,
	[DateTill] date NOT NULL,
	[IsChecked] bit NOT NULL DEFAULT 0,
	[IsApproved] bit NOT NULL DEFAULT 0
	)
GO

CREATE TABLE [ResourceFulFill](
	[ID] int IDENTITY(0,1) PRIMARY KEY,
	[Type] tinyint NOT NULL,
	[ReqID] int NOT NULL,
	[EngineerID] int NOT NULL,
	[Date] date NOT NULL
	) 
GO

CREATE TABLE [Exceptions](
	[ID] int IDENTITY(0,1) PRIMARY KEY,
	[Date] date NOT NULL,
        [WorkDay] bit NOT NULL,
	[Description] nvarchar(250)
	) 
GO

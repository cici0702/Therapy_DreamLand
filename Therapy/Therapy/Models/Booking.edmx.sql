
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/17/2022 19:53:29
-- Generated from EDMX file: c:\Users\MAC\Desktop\Therapy_DreamLand\Therapy\Therapy\Models\Booking.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [aspnet-Therapy-20220917053637];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [Id] nvarchar(max)  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Date_of_Birth] time  NOT NULL,
    [AdministorId] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Therapists'
CREATE TABLE [dbo].[Therapists] (
    [Id] nvarchar(max)  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [AdministorId] nvarchar(max)  NOT NULL,
    [Category_Id] int  NOT NULL
);
GO

-- Creating table 'Administors'
CREATE TABLE [dbo].[Administors] (
    [Id] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Appointments'
CREATE TABLE [dbo].[Appointments] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Start_date] time  NOT NULL,
    [End_date] time  NOT NULL,
    [IsActivated] nvarchar(max)  NOT NULL,
    [CustomerId] nvarchar(max)  NOT NULL,
    [AdministorId] nvarchar(max)  NOT NULL,
    [TherapistId] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Duration] int  NOT NULL,
    [Price] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Therapists'
ALTER TABLE [dbo].[Therapists]
ADD CONSTRAINT [PK_Therapists]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Administors'
ALTER TABLE [dbo].[Administors]
ADD CONSTRAINT [PK_Administors]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Appointments'
ALTER TABLE [dbo].[Appointments]
ADD CONSTRAINT [PK_Appointments]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [AdministorId] in table 'Therapists'
ALTER TABLE [dbo].[Therapists]
ADD CONSTRAINT [FK_AdministorTherapist]
    FOREIGN KEY ([AdministorId])
    REFERENCES [dbo].[Administors]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AdministorTherapist'
CREATE INDEX [IX_FK_AdministorTherapist]
ON [dbo].[Therapists]
    ([AdministorId]);
GO

-- Creating foreign key on [AdministorId] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [FK_AdministorCustomer]
    FOREIGN KEY ([AdministorId])
    REFERENCES [dbo].[Administors]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AdministorCustomer'
CREATE INDEX [IX_FK_AdministorCustomer]
ON [dbo].[Customers]
    ([AdministorId]);
GO

-- Creating foreign key on [CustomerId] in table 'Appointments'
ALTER TABLE [dbo].[Appointments]
ADD CONSTRAINT [FK_CustomerAppointment]
    FOREIGN KEY ([CustomerId])
    REFERENCES [dbo].[Customers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerAppointment'
CREATE INDEX [IX_FK_CustomerAppointment]
ON [dbo].[Appointments]
    ([CustomerId]);
GO

-- Creating foreign key on [AdministorId] in table 'Appointments'
ALTER TABLE [dbo].[Appointments]
ADD CONSTRAINT [FK_AdministorAppointment]
    FOREIGN KEY ([AdministorId])
    REFERENCES [dbo].[Administors]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AdministorAppointment'
CREATE INDEX [IX_FK_AdministorAppointment]
ON [dbo].[Appointments]
    ([AdministorId]);
GO

-- Creating foreign key on [TherapistId] in table 'Appointments'
ALTER TABLE [dbo].[Appointments]
ADD CONSTRAINT [FK_TherapistAppointment]
    FOREIGN KEY ([TherapistId])
    REFERENCES [dbo].[Therapists]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TherapistAppointment'
CREATE INDEX [IX_FK_TherapistAppointment]
ON [dbo].[Appointments]
    ([TherapistId]);
GO

-- Creating foreign key on [Category_Id] in table 'Therapists'
ALTER TABLE [dbo].[Therapists]
ADD CONSTRAINT [FK_TherapistCategory]
    FOREIGN KEY ([Category_Id])
    REFERENCES [dbo].[Categories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TherapistCategory'
CREATE INDEX [IX_FK_TherapistCategory]
ON [dbo].[Therapists]
    ([Category_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
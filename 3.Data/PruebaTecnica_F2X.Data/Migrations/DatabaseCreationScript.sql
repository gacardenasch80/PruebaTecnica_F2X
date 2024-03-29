USE [master]
GO
/****** Object:  Database [GastonCardenas]    Script Date: 27/06/2023 17:53:22 ******/
CREATE DATABASE [GastonCardenas] 
GO
USE [GastonCardenas]
GO
/****** Object:  Table [dbo].[Recaudo]    Script Date: 27/06/2023 17:53:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Recaudo](
	[Id] [bigint] NOT NULL,
	[Estacion] [nvarchar](100) NOT NULL,
	[Sentido] [nvarchar](100) NOT NULL,
	[Hora] int not null,
	[Categoria] [nvarchar](2) NOT NULL,
	[Cantidad] int not null,
	[ValorTabulado] int not null,
	[Fecha] date not null,
 CONSTRAINT [PK_Recaudo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [master]
GO
ALTER DATABASE [GastonCardenas] SET  READ_WRITE 
GO

/*Application Login and user creation*/
USE [master]
GO

CREATE LOGIN [gastonspruebas] WITH PASSWORD='gastonspruebas', DEFAULT_DATABASE=[GastonCardenas], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

USE [master]
GO
ALTER LOGIN [gastonspruebas] WITH PASSWORD=N'gastonspruebas'
GO
USE [GastonCardenas]
GO
CREATE USER [gastonspruebas] FOR LOGIN [gastonspruebas]
GO
USE [GastonCardenas]
GO
ALTER USER [gastonspruebas] WITH DEFAULT_SCHEMA=[dbo]
GO
USE [GastonCardenas]
GO
ALTER ROLE [db_owner] ADD MEMBER [gastonspruebas]
GO

/*End of script*/

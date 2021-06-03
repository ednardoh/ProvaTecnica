/****** Object:  Table [dbo].[CONTATO]    Script Date: 31/05/2021 01:22:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CONTATO](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Data_nasc] [date] NOT NULL,
	[Idade] [int] NOT NULL,
	[Telefone] [varchar](15) NULL,
	[Id_Cliente] [int] NOT NULL,
 CONSTRAINT [PK_CONTATO] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CONTATO]  WITH CHECK ADD  CONSTRAINT [FK_CONTATO_CLIENTE] FOREIGN KEY([Id_Cliente])
REFERENCES [dbo].[Cliente] ([Id])
GO

ALTER TABLE [dbo].[CONTATO] CHECK CONSTRAINT [FK_CONTATO_CLIENTE]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CONTATO->CLIENTE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CONTATO', @level2type=N'CONSTRAINT',@level2name=N'FK_CONTATO_CLIENTE'
GO



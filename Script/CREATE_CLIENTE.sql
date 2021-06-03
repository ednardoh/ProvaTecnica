
/****** Object:  Table [dbo].[Cliente]    Script Date: 31/05/2021 01:21:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Cliente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Cep] [varchar](8) NOT NULL,
	[Logradouro] [varchar](60) NOT NULL,
	[Numero] [varchar](10) NOT NULL,
	[Complemento] [varchar](40) NULL,
	[Bairro] [varchar](40) NULL,
	[Cidade] [varchar](40) NOT NULL,
	[Ibge_cidade] [varchar](7) NOT NULL,
	[Sigla_uf] [varchar](2) NOT NULL,
	[Ibge_uf] [varchar](2) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



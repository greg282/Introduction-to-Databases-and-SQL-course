USE [u_smigala]
GO
/****** Object:  Table [dbo].[dishes]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dishes](
	[id_dish_name] [int] NOT NULL,
	[dish_name] [nchar](20) NULL,
 CONSTRAINT [PK_dishes] PRIMARY KEY CLUSTERED 
(
	[id_dish_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

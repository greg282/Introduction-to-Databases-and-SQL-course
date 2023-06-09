USE [u_smigala]
GO
/****** Object:  Table [dbo].[warehouse]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[warehouse](
	[id_dish] [int] NOT NULL,
	[units_in_stock] [int] NOT NULL,
	[reorder_level] [int] NOT NULL,
 CONSTRAINT [PK_warehouse] PRIMARY KEY CLUSTERED 
(
	[id_dish] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[warehouse]  WITH CHECK ADD  CONSTRAINT [reorder_level] CHECK  (([reorder_level]>=(0)))
GO
ALTER TABLE [dbo].[warehouse] CHECK CONSTRAINT [reorder_level]
GO
ALTER TABLE [dbo].[warehouse]  WITH CHECK ADD  CONSTRAINT [units_in_stock] CHECK  (([units_in_stock]>=(0)))
GO
ALTER TABLE [dbo].[warehouse] CHECK CONSTRAINT [units_in_stock]
GO

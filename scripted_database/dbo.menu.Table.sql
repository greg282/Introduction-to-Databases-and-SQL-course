USE [u_smigala]
GO
/****** Object:  Table [dbo].[menu]    Script Date: 25.03.2023 23:39:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menu](
	[id_dish] [int] NOT NULL,
	[price] [money] NOT NULL,
	[dish_name] [int] NOT NULL,
	[in_menu] [bit] NOT NULL,
	[in_menu_start] [datetime] NOT NULL,
	[in_menu_end] [datetime] NOT NULL,
	[description] [varchar](100) NOT NULL,
	[is_seafood] [bit] NULL,
 CONSTRAINT [PK_menu] PRIMARY KEY CLUSTERED 
(
	[id_dish] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[menu]  WITH CHECK ADD  CONSTRAINT [FK_menu_dishes] FOREIGN KEY([dish_name])
REFERENCES [dbo].[dishes] ([id_dish_name])
GO
ALTER TABLE [dbo].[menu] CHECK CONSTRAINT [FK_menu_dishes]
GO
ALTER TABLE [dbo].[menu]  WITH CHECK ADD  CONSTRAINT [FK_menu_warehouse] FOREIGN KEY([id_dish])
REFERENCES [dbo].[warehouse] ([id_dish])
GO
ALTER TABLE [dbo].[menu] CHECK CONSTRAINT [FK_menu_warehouse]
GO
ALTER TABLE [dbo].[menu]  WITH CHECK ADD  CONSTRAINT [price] CHECK  (([price]>(0)))
GO
ALTER TABLE [dbo].[menu] CHECK CONSTRAINT [price]
GO

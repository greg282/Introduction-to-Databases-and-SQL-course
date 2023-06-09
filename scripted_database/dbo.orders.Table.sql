USE [u_smigala]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 25.03.2023 23:39:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] NOT NULL,
	[client_id] [int] NULL,
	[order_date] [datetime] NOT NULL,
	[taken_away] [bit] NOT NULL,
	[pref_date_of_seafood] [datetime] NULL,
 CONSTRAINT [PK_orders_1] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_clients] FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([client_id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_clients]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [dates] CHECK  (([order_date]>=getdate()))
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [dates]
GO

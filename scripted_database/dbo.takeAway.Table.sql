USE [u_smigala]
GO
/****** Object:  Table [dbo].[takeAway]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[takeAway](
	[take_away_id] [int] NOT NULL,
	[destination_date] [datetime] NOT NULL,
	[order_adress] [varchar](50) NOT NULL,
	[order_id] [int] NULL,
 CONSTRAINT [PK_takeAway] PRIMARY KEY CLUSTERED 
(
	[take_away_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[takeAway]  WITH CHECK ADD  CONSTRAINT [FK_takeAway_orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[takeAway] CHECK CONSTRAINT [FK_takeAway_orders]
GO
ALTER TABLE [dbo].[takeAway]  WITH CHECK ADD  CONSTRAINT [check_dates] CHECK  (([destination_date]>getdate()))
GO
ALTER TABLE [dbo].[takeAway] CHECK CONSTRAINT [check_dates]
GO

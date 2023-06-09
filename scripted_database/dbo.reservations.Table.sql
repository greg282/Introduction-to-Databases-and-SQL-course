USE [u_smigala]
GO
/****** Object:  Table [dbo].[reservations]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservations](
	[reservation_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NOT NULL,
	[approved] [bit] NOT NULL,
	[amount_people] [int] NOT NULL,
 CONSTRAINT [PK_reservations] PRIMARY KEY CLUSTERED 
(
	[reservation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [orderid_reservations]    Script Date: 25.03.2023 23:39:11 ******/
CREATE UNIQUE NONCLUSTERED INDEX [orderid_reservations] ON [dbo].[reservations]
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[reservations]  WITH CHECK ADD  CONSTRAINT [FK_reservations_orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[reservations] CHECK CONSTRAINT [FK_reservations_orders]
GO
ALTER TABLE [dbo].[reservations]  WITH CHECK ADD  CONSTRAINT [FK_reservations_reservationDetails] FOREIGN KEY([reservation_id])
REFERENCES [dbo].[reservationDetails] ([reservation_id])
GO
ALTER TABLE [dbo].[reservations] CHECK CONSTRAINT [FK_reservations_reservationDetails]
GO
ALTER TABLE [dbo].[reservations]  WITH CHECK ADD  CONSTRAINT [amount_people] CHECK  (([amount_people]>=(1)))
GO
ALTER TABLE [dbo].[reservations] CHECK CONSTRAINT [amount_people]
GO
ALTER TABLE [dbo].[reservations]  WITH CHECK ADD  CONSTRAINT [res_dates] CHECK  (([start_date]<[end_date]))
GO
ALTER TABLE [dbo].[reservations] CHECK CONSTRAINT [res_dates]
GO

USE [u_smigala]
GO
/****** Object:  Table [dbo].[reservationDetails]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservationDetails](
	[reservation_id] [int] NOT NULL,
	[client_id] [int] NOT NULL,
	[table_id] [int] NULL,
 CONSTRAINT [PK_reservationDetails] PRIMARY KEY CLUSTERED 
(
	[reservation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[reservationDetails]  WITH CHECK ADD  CONSTRAINT [FK_reservationDetails_clients] FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([client_id])
GO
ALTER TABLE [dbo].[reservationDetails] CHECK CONSTRAINT [FK_reservationDetails_clients]
GO
ALTER TABLE [dbo].[reservationDetails]  WITH CHECK ADD  CONSTRAINT [FK_reservationDetails_tables] FOREIGN KEY([table_id])
REFERENCES [dbo].[tables] ([table_id])
GO
ALTER TABLE [dbo].[reservationDetails] CHECK CONSTRAINT [FK_reservationDetails_tables]
GO

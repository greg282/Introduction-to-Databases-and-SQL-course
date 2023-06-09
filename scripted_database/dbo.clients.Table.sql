USE [u_smigala]
GO
/****** Object:  Table [dbo].[clients]    Script Date: 25.03.2023 23:39:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clients](
	[client_id] [int] NOT NULL,
	[phone] [varchar](12) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[city] [int] NULL,
	[street] [varchar](255) NULL,
	[postal_code] [int] NULL,
 CONSTRAINT [PK_clients] PRIMARY KEY CLUSTERED 
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_phone] UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[clients]  WITH CHECK ADD  CONSTRAINT [FK_clients_cities] FOREIGN KEY([city])
REFERENCES [dbo].[cities] ([city_id])
GO
ALTER TABLE [dbo].[clients] CHECK CONSTRAINT [FK_clients_cities]
GO
ALTER TABLE [dbo].[clients]  WITH CHECK ADD  CONSTRAINT [FK_clients_postal_codes] FOREIGN KEY([postal_code])
REFERENCES [dbo].[postal_codes] ([postal_code_id])
GO
ALTER TABLE [dbo].[clients] CHECK CONSTRAINT [FK_clients_postal_codes]
GO
ALTER TABLE [dbo].[clients]  WITH CHECK ADD  CONSTRAINT [email] CHECK  (([email] like '%@%'))
GO
ALTER TABLE [dbo].[clients] CHECK CONSTRAINT [email]
GO
ALTER TABLE [dbo].[clients]  WITH CHECK ADD  CONSTRAINT [phone] CHECK  (([phone] like '+[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[clients] CHECK CONSTRAINT [phone]
GO

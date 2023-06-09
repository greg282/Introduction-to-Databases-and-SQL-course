USE [u_smigala]
GO
/****** Object:  Table [dbo].[individualClient]    Script Date: 25.03.2023 23:39:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[individualClient](
	[client_id] [int] NOT NULL,
	[person_id] [int] NOT NULL,
	[first_name] [varchar](100) NOT NULL,
	[last_name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_individualClient] PRIMARY KEY CLUSTERED 
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[individualClient]  WITH CHECK ADD  CONSTRAINT [FK_individualClient_clients1] FOREIGN KEY([person_id])
REFERENCES [dbo].[clients] ([client_id])
GO
ALTER TABLE [dbo].[individualClient] CHECK CONSTRAINT [FK_individualClient_clients1]
GO
ALTER TABLE [dbo].[individualClient]  WITH CHECK ADD  CONSTRAINT [FK_individualClient_discounts] FOREIGN KEY([client_id])
REFERENCES [dbo].[discounts] ([client_id])
GO
ALTER TABLE [dbo].[individualClient] CHECK CONSTRAINT [FK_individualClient_discounts]
GO

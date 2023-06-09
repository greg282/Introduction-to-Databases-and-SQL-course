USE [u_smigala]
GO
/****** Object:  Table [dbo].[discounts]    Script Date: 25.03.2023 23:39:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discounts](
	[client_id] [int] NOT NULL,
	[R2startdate] [datetime] NULL,
	[R2_used] [bit] NULL,
	[R1startdate] [datetime] NULL,
 CONSTRAINT [PK_discounts] PRIMARY KEY CLUSTERED 
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[discounts]  WITH CHECK ADD  CONSTRAINT [CK_discounts] CHECK  (([R1startdate]>=getdate()))
GO
ALTER TABLE [dbo].[discounts] CHECK CONSTRAINT [CK_discounts]
GO

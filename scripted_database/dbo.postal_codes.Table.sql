USE [u_smigala]
GO
/****** Object:  Table [dbo].[postal_codes]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[postal_codes](
	[postal_code_id] [int] NOT NULL,
	[postal_code] [varchar](6) NOT NULL,
	[city_id] [int] NOT NULL,
 CONSTRAINT [PK_postal_codes] PRIMARY KEY CLUSTERED 
(
	[postal_code_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[postal_codes]  WITH CHECK ADD  CONSTRAINT [FK_postal_codes_cities] FOREIGN KEY([city_id])
REFERENCES [dbo].[cities] ([city_id])
GO
ALTER TABLE [dbo].[postal_codes] CHECK CONSTRAINT [FK_postal_codes_cities]
GO
ALTER TABLE [dbo].[postal_codes]  WITH CHECK ADD  CONSTRAINT [CK_postal_codes] CHECK  (([postal_code] like '[0-9][0-9]-[0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[postal_codes] CHECK CONSTRAINT [CK_postal_codes]
GO
ALTER TABLE [dbo].[postal_codes]  WITH CHECK ADD  CONSTRAINT [CK_postal_codes_valid] CHECK  (([postal_code] like '[0-9][0-9]-[0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[postal_codes] CHECK CONSTRAINT [CK_postal_codes_valid]
GO

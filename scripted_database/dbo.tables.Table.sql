USE [u_smigala]
GO
/****** Object:  Table [dbo].[tables]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tables](
	[table_id] [int] NOT NULL,
	[size] [int] NOT NULL,
 CONSTRAINT [PK_tables] PRIMARY KEY CLUSTERED 
(
	[table_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tables]  WITH CHECK ADD  CONSTRAINT [size] CHECK  (([size]>(1)))
GO
ALTER TABLE [dbo].[tables] CHECK CONSTRAINT [size]
GO

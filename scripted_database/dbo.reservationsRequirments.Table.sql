USE [u_smigala]
GO
/****** Object:  Table [dbo].[reservationsRequirments]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservationsRequirments](
	[id] [int] NOT NULL,
	[WK] [int] NOT NULL,
	[WZ] [int] NOT NULL,
 CONSTRAINT [PK_reservationsRequirments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[reservationsRequirments]  WITH CHECK ADD  CONSTRAINT [WK] CHECK  (([WK]>(0)))
GO
ALTER TABLE [dbo].[reservationsRequirments] CHECK CONSTRAINT [WK]
GO
ALTER TABLE [dbo].[reservationsRequirments]  WITH CHECK ADD  CONSTRAINT [WZ] CHECK  (([WZ]>(0)))
GO
ALTER TABLE [dbo].[reservationsRequirments] CHECK CONSTRAINT [WZ]
GO

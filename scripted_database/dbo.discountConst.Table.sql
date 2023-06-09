USE [u_smigala]
GO
/****** Object:  Table [dbo].[discountConst]    Script Date: 25.03.2023 23:39:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discountConst](
	[id] [int] NOT NULL,
	[R1] [int] NOT NULL,
	[global_Z1] [int] NOT NULL,
	[global_K1] [int] NOT NULL,
	[R2] [int] NOT NULL,
	[D2] [int] NOT NULL,
	[K2] [int] NOT NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_discountConst] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[discountConst]  WITH CHECK ADD  CONSTRAINT [correct_dates] CHECK  (([start_date]<[end_date]))
GO
ALTER TABLE [dbo].[discountConst] CHECK CONSTRAINT [correct_dates]
GO
ALTER TABLE [dbo].[discountConst]  WITH CHECK ADD  CONSTRAINT [D2] CHECK  (([D2]>(0)))
GO
ALTER TABLE [dbo].[discountConst] CHECK CONSTRAINT [D2]
GO
ALTER TABLE [dbo].[discountConst]  WITH CHECK ADD  CONSTRAINT [global_K1] CHECK  (([global_K1]>(0)))
GO
ALTER TABLE [dbo].[discountConst] CHECK CONSTRAINT [global_K1]
GO
ALTER TABLE [dbo].[discountConst]  WITH CHECK ADD  CONSTRAINT [global_Z1] CHECK  (([global_Z1]>(0)))
GO
ALTER TABLE [dbo].[discountConst] CHECK CONSTRAINT [global_Z1]
GO
ALTER TABLE [dbo].[discountConst]  WITH CHECK ADD  CONSTRAINT [K2] CHECK  (([K2]>(0)))
GO
ALTER TABLE [dbo].[discountConst] CHECK CONSTRAINT [K2]
GO
ALTER TABLE [dbo].[discountConst]  WITH CHECK ADD  CONSTRAINT [R1] CHECK  (([R1]>(0)))
GO
ALTER TABLE [dbo].[discountConst] CHECK CONSTRAINT [R1]
GO
ALTER TABLE [dbo].[discountConst]  WITH CHECK ADD  CONSTRAINT [R2] CHECK  (([R2]>(0)))
GO
ALTER TABLE [dbo].[discountConst] CHECK CONSTRAINT [R2]
GO

USE [u_smigala]
GO
/****** Object:  UserDefinedFunction [dbo].[priceOverGiven]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[priceOverGiven](@input int)
RETURNS table
AS
	return
	select order_id, TotalPrice from OrdersInfo where TotalPrice > @input
GO

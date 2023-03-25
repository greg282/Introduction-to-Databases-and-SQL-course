USE [u_smigala]
GO
/****** Object:  UserDefinedFunction [dbo].[clientsOrdersPriceOverGiven]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[clientsOrdersPriceOverGiven](@input int)
RETURNS table
AS
	return
	select ClientStats.client_id from ClientStats where @input < ClientStats.Total
GO

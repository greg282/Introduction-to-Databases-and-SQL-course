USE [u_smigala]
GO
/****** Object:  UserDefinedFunction [dbo].[isClientGotDiscount]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[isClientGotDiscount](@input int)
RETURNS table
AS
	return
	(select client_id from ClientDiscountInfo where R2startdate < GETDATE() and
	getdate() < R2enddate and @input = client_id
	union
	select client_id from ClientDiscountInfoR1 where @input = client_id) 
GO

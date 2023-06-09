USE [u_smigala]
GO
/****** Object:  UserDefinedFunction [dbo].[soldMoreThamGiven]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[soldMoreThamGiven](@input int)
RETURNS table
AS
	return
	select menu.dish_name, menu.price, OrderDetails.quantity from menu inner join OrderDetails
	on menu.id_dish = OrderDetails.id_dish where @input < OrderDetails.quantity
GO
